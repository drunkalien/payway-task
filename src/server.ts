import express, { Request, Response } from "express";
import { Server } from "socket.io";
import http from "http";
import dotenv from "dotenv";
import cors from "cors";
import { CronJob } from "cron";

import prisma from "../prisma/prismaClient";
import backupScript from "./backupScript";

dotenv.config();

export const app = express();
const server = http.createServer(app);
const io = new Server(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"],
  },
});

app.use(express.json());
app.use(cors());

app.get("/", async (req: Request, res: Response) => {
  const chats = await prisma.chat.findMany();
  res.json(chats);
});

io.on("connection", async (socket) => {
  console.log("a user connected");

  socket.on(
    "send-message-to-operator",
    async (messageFromClient: { userName: string; content: string }) => {
      // creating chat if it doesn't exist when the message is sent from client. I could've done this during the connection, but the chat requires username and as there is no authentication I am getting the username from the message.
      let chat = await prisma.chat.findFirst({
        where: {
          name: messageFromClient.userName,
        },
      });

      if (!chat) {
        chat = await prisma.chat.create({
          data: {
            name: messageFromClient.userName,
          },
        });
      }

      socket.join(chat.id);

      const message = await prisma.message.create({
        data: {
          content: messageFromClient.content,
          chatId: chat.id,
          userName: messageFromClient.userName,
        },
      });

      socket.to("operator").emit("message-to-operator", message);
    }
  );

  // I am using this event for operator to join the room and receive messages from clients.
  socket.on("join-as-operator", () => {
    socket.join("operator");
  });

  socket.on(
    "send-message-to-client",
    async (message: { chatId: string; content: string }) => {
      const messageToClient = await prisma.message.create({
        data: {
          content: message.content,
          chatId: message.chatId,
          userName: "operator",
        },
      });

      socket.to(message.chatId).emit("message-to-client", messageToClient);
    }
  );

  socket.on("get-chats", async () => {
    const chats = await prisma.chat.findMany({
      include: {
        messages: true,
      },
    });
    socket.emit("chats", chats);
  });
});

// backups every day at midnight
// const job = new CronJob("0 1 * * *", backupScript, null, true);
// job.start();
backupScript();

const PORT = process.env.PORT;

server.listen(PORT, () => {
  console.log("listening on *:" + PORT);
});
