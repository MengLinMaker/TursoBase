import { execSync } from "child_process"
import { createHash } from "crypto"
import { readFileSync } from "fs"

export const compareDb = (databaseDir: string) => {
  execSync(`sqlite3 ${databaseDir}/data.db .dump > ${databaseDir}/setup.sql`)
  const data = readFileSync(`${databaseDir}/setup.sql`)
  return createHash("sha512").update(data).digest("hex")
}
