import { execSync } from "child_process"

export const replicateSetup = (databaseDir: string) => {
  execSync(`mkdir ${databaseDir} && touch ${databaseDir}/data.db`)
  execSync(`cat sql/setup.sql | sqlite3 ${databaseDir}/data.db`)
}
