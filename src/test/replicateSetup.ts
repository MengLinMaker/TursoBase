import { execSync } from "child_process"

export const replicateSetup = (databaseDir: string) => {
  try {
    execSync(`mkdir ${databaseDir}_ && touch ${databaseDir}_/data.db`)
  } catch {}
  execSync(`cat sql/setup.sql | sqlite3 ${databaseDir}_/data.db`)
}
