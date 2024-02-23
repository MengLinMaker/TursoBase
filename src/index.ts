import { spawn } from "node:child_process"
import { Client } from "@libsql/client"
import { pbQueryToSql } from "./format/pbQueryToSql.js"
import { detectPbWriteQuery } from "./format/detectPbWriteQuery.js"

export const tursoBase = (
  databaseDir: string,
  port: number,
  tursoClient: Client,
) => {
  const pbUrl = `http://localhost:${port}`
  let pbStdout = ""
  let pbServed = false // Do not update database before setup

  const pbProcess = spawn("pocketbase", [
    "serve",
    "--dev",
    `--http=localhost:${port}`,
    `--dir=${databaseDir}`,
  ])
  pbProcess.stderr.on("data", async (stderr: Buffer) =>
    console.error("\x1B[31m" + stderr.toString()),
  )
  pbProcess.stdout.on("data", async (stdout: Buffer) => {
    pbStdout += stdout.toString()
    if (pbServed == true) {
      const sql = pbQueryToSql(detectPbWriteQuery(pbStdout))
      await tursoClient.executeMultiple(sql)
      pbStdout = ""
    } else if (pbStdout.includes("http://")) {
      console.info("\x1B[32mPocketBase served at:", pbUrl)
      pbServed = true
    }
  })
  return pbProcess
}
