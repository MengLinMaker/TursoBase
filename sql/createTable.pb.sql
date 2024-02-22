CREATE TABLE `_migrations` ( file VARCHAR(255) PRIMARY KEY NOT NULL, applied INTEGER NOT NULL )

CREATE TABLE {{_admins}} (
  [[id]]              TEXT PRIMARY KEY NOT NULL,
  [[avatar]]          INTEGER DEFAULT 0 NOT NULL,
  [[email]]           TEXT UNIQUE NOT NULL,
  [[tokenKey]]        TEXT UNIQUE NOT NULL,
  [[passwordHash]]    TEXT NOT NULL,
  [[lastResetSentAt]] TEXT DEFAULT "" NOT NULL,
  [[created]]         TEXT DEFAULT (strftime ('%Y-%m-%d %H:%M:%fZ')) NOT NULL,
  [[updated]]         TEXT DEFAULT (strftime ('%Y-%m-%d %H:%M:%fZ')) NOT NULL
)