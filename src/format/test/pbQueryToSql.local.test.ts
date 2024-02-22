import { describe, expect, test } from "vitest"
import { readFileFormatted } from "../../test/readFileFormatted"
import { pbQueryToSql } from "../pbQueryToSql"

describe("pbQueryFormatter", () => {
  test("createTable", () => {
    const pbQuery = readFileFormatted("sql/createTable.pb.sql")
    const expectedSql = readFileFormatted("sql/createTable.sql")
    const resultSql = pbQueryToSql(pbQuery)
    expect(resultSql).toBe(expectedSql)
  })
  test("insert", () => {
    const pbQuery = readFileFormatted("sql/insertRow.pb.sql")
    const expectedSql = readFileFormatted("sql/insertRow.sql")
    const resultSql = pbQueryToSql(pbQuery)
    expect(resultSql).toBe(expectedSql)
  })
})
