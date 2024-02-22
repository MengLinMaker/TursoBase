import { execSync } from "child_process"

export const replicateSetup = (databaseDir: string) => {
  try {
    execSync(`mkdir ${databaseDir}_ && touch ${databaseDir}_manual/data.db`)
  } catch {}
  execSync(`cat sql/setup.sql | sqlite3 ${databaseDir}_manual/data.db`)
}
