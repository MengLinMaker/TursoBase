import { randomUUID } from "crypto"

export const expectReplaceAll = (
  oldString: string,
  replace: string,
  expected: string,
) => {
  if (!oldString.includes(replace)) return oldString
  if (!oldString.includes(expected))
    return oldString.replaceAll(replace, expected)
  // Manage the case where "expected" includes "replace"
  const expectedProxy = randomUUID()
  const proxiedOldString = oldString.replaceAll(expected, expectedProxy)
  return proxiedOldString
    .replaceAll(replace, expected)
    .replaceAll(expectedProxy, expected)
}
