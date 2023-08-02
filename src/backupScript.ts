import { spawnSync } from "child_process";
import { cwd } from "process";
import path from "path";

import prisma from "../prisma/prismaClient";

async function backupScript() {
  try {
    await prisma.$connect();
    const DB_USER = process.env.DB_USER;
    const DB_PASSWORD = process.env.DB_PASSWORD;
    const DB_NAME = process.env.DB_NAME;
    const DB_HOST = process.env.DB_HOST;
    const DB_PORT = process.env.DB_PORT;
    const BACKUP_PATH = path.join(cwd(), `backups/${Date.now()}_backup.sql`);
    const command = `pg_dump --dbname=postgresql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME} > ${BACKUP_PATH}`;

    spawnSync(command, { shell: true, stdio: "inherit" });
  } catch (error) {
    console.log("Error connecting database");
  } finally {
    await prisma.$disconnect();
  }
}

export default backupScript;
