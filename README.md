# TursoBase

Sync your PocketBase data with Turso. This library enables distributed PocketBase with Turso primary database as master.

Note: PocketBase is not designed to be distributed.
This test package is highly experimental.

## Motivation

I intend to use PocketBase only for oauth2 and require app scalability. Turso enables replicas.

## Usage

Install node package
`npm i tursobase`


```
import { tursoBase } from "tursobase"

const tursoClient = createClient({
  url: "file:pb_data/data.db",
  syncUrl: process.env.TURSO_SYNC_URL,
  authToken: process.env.TURSO_AUTH_TOKEN,
})

const pbProcess = await tursoBase("pb_data", 8090, tursoClient)
```

Stopping process
```
const pbProcess = await tursoBase("pb_data", 8090, tursoClient)
pbProcess.kill()
```