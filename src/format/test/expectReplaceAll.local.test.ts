import { describe, expect, test } from "vitest"
import { expectReplaceAll } from "../expectReplaceAll"

describe("expectReplaceAll", () => {
  test("nothing to replace", () => {
    const original = "original"
    const expected = "original"
    const result = expectReplaceAll(original, "nothing", "new")
    expect(result).toBe(expected)
  })
  test("normally replace", () => {
    const original = "original"
    const expected = "new"
    const result = expectReplaceAll(original, "original", "new")
    expect(result).toBe(expected)
  })
  test("already replaced", () => {
    const original = "new original"
    const expected = "new original"
    const result = expectReplaceAll(original, "original", "new original")
    expect(result).toBe(expected)
  })
})
