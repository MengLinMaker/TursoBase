import { randomUUID } from "crypto"

export const expectReplaceAll = (
  oldString: string,
  replacee: string,
  replacer: string,
) => {
  if (!oldString.includes(replacee)) return oldString
  if (!oldString.includes(replacer))
    return oldString.replaceAll(replacee, replacer)
  // Manage the case where "expected" includes "replace"
  const expectedProxy = randomUUID()
  const proxiedOldString = oldString.replaceAll(replacer, expectedProxy)
  return proxiedOldString
    .replaceAll(replacee, replacer)
    .replaceAll(expectedProxy, replacer)
}
