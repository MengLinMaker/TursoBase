import { readFileSync } from "fs"

export const readFileFormatted = (filePath: string) => {
  return readFileSync(filePath)
    .toString()
    .replaceAll(/[\n ]+/g, " ")
}
