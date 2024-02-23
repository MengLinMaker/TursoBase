import { spawn } from "node:child_process"
import { delay } from "./delay"

export const getPbSetupLog = async (databaseDir: string, port: number) => {
  let pbStdout = ""
  let pbServed = false // Do not update database before setup

  const pbProcess = spawn("pocketbase", [
    "serve",
    "--dev",
    `--http="localhost:${port}"`,
    `--dir=${databaseDir}`,
  ])
  pbProcess.stdout.on("data", async (stdout: Buffer) => {
    pbStdout += stdout.toString()
    if (pbStdout.includes("http://")) {
      pbServed = true
      spawn("sqlite3", [`${databaseDir}/data.db`, "VACUUM"])
      spawn("sqlite3", [`${databaseDir}/data.db`, "VACUUM"])
      pbProcess.kill()
    }
  })
  while (pbServed == false) await delay(100)
  pbProcess.kill()
  return pbStdout
}
