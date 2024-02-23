import { execSync, spawn } from "child_process"

export const localTurso = (databaseDir: string, port: number) => {
  execSync(`mkdir ${databaseDir}`)
  return spawn("turso", [
    "dev",
    "-p",
    `${port}`,
    "-f",
    `${databaseDir}/data.db`,
  ])
}
