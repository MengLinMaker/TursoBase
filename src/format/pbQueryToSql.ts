import { expectReplaceAll } from "./expectReplaceAll"

export const pbQueryToSql = (pbQuery: string) => {
  // Remove PocketBase brackets [[]] {{}} in SQL
  let rawSql = pbQuery
    .replace(/\[\[([_a-z]+)\]\]/gi, "$1")
    .replace(/ \{\{([_a-z]+)\}\}/gi, " $1")
  // Avoid SQL errors with "IF NOT EXISTS"
  rawSql = expectReplaceAll(
    rawSql,
    "CREATE TABLE",
    "CREATE TABLE IF NOT EXISTS",
  )
  rawSql = expectReplaceAll(
    rawSql,
    "CREATE UNIQUE INDEX",
    "CREATE UNIQUE INDEX IF NOT EXISTS",
  )
  rawSql = expectReplaceAll(rawSql, "INSERT INTO", "INSERT OR IGNORE INTO")
  return rawSql
}
