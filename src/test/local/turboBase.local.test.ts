import { rmSync, writeFileSync } from "fs"
import { createClient } from "@libsql/client"
import { describe, expect, test } from "vitest"
import { tursoBase } from "../.."
import { getPbSetupLog } from "../getPbSetupLog"
import { detectPbWriteQuery } from "../../format/detectPbWriteQuery"
import { pbQueryToSql } from "../../format/pbQueryToSql"
import { compareDb } from "../compareDb"
import { replicateSetup } from "../replicateSetup"
import { localTurso } from "../localTurso"
import { delay } from "../delay"
import { execSync } from "child_process"

describe("TurboBase Local Setup", async () => {
  const databaseDir = ".local"
  rmSync(databaseDir, { recursive: true, force: true })
  execSync(`mkdir ${databaseDir}`)

  test("Compare setup dump: Setup vs Manual", async () => {
    const setupLog = await getPbSetupLog(databaseDir + "/setup", 5000)
    writeFileSync("sql/setup.pb.sql", setupLog)
    const setupSql = pbQueryToSql(detectPbWriteQuery(setupLog))
    writeFileSync("sql/setup.sql", setupSql)
    replicateSetup(databaseDir + "/manual")

    const hashSetup = compareDb(databaseDir + "/setup")
    const manualHashSetup = compareDb(databaseDir + "/manual")

    expect(hashSetup).toBe(manualHashSetup)
  })

  test("Compare setup dump: PocketBase vs Local Turso", async () => {
    const tursoProcess = localTurso(databaseDir + "/turso", 5101)
    const tursoClient = createClient({
      url: `file:${databaseDir}/pb/data.db`,
      syncUrl: `http://localhost:${5101}`,
    })
    const pbProcess = tursoBase(databaseDir + "/pb", 5100, tursoClient)
    await delay(100)

    const localHashSetup = compareDb(databaseDir + "/pb")
    const tursoHashSetup = compareDb(databaseDir + "/turso")
    pbProcess.kill()
    tursoProcess.kill()

    expect(localHashSetup).toBe(tursoHashSetup)
  })
})
