// Only update write commands from SQL
const WRITE_SQL_CMD = Object.freeze([
  "CREATE",
  "DROP",
  "ALTER",
  "TRUNCATE",
  "INSERT",
  "UPDATE",
  "DELETE",
])

export const detectPbWriteQuery = (pbStdout: string) => {
  let pbQuery = ""
  for (const pbQueryChunk of pbStdout.split(/[[.0-9]*ms] /g)) {
    if (WRITE_SQL_CMD.some((cmd) => pbQueryChunk.includes(cmd))) {
      pbQuery += pbQueryChunk + ";"
    }
  }
  return pbQuery
}
