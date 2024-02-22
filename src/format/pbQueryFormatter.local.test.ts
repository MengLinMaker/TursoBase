import { describe, expect, test } from "vitest"
import { readFileFormatted } from "../test/readFileFormatted"
import { pbQueryFormatter } from "./pbQueryFormatter"

describe("pbQueryFormatter", () => {
  test("createTable", () => {
    const pbSql = readFileFormatted("sql/createTable.pb.sql")
    const expectedSql = readFileFormatted("sql/createTable.sql")
    const resultSql = pbQueryFormatter(pbSql)
    expect(resultSql).toBe(expectedSql)
  })
  test("insert", () => {
    const pbSql = readFileFormatted("sql/insertRow.pb.sql")
    const expectedSql = readFileFormatted("sql/insertRow.sql")
    const resultSql = pbQueryFormatter(pbSql)
    expect(resultSql).toBe(expectedSql)
  })
})
