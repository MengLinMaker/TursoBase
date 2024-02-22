INSERT INTO
  _collections (
    createRule,
    created,
    deleteRule,
    id,
    indexes,
    listRule,
    name,
    options,
    schema,
    system,
    type,
    updateRule,
    updated,
    viewRule
  )
VALUES
  (
    '',
    '2024-02-20 15:14:25.687Z',
    'id = @request.auth.id',
    '_pb_users_auth_',
    '[]',
    'id = @request.auth.id',
    'users',
    '{"allowEmailAuth":true,"allowOAuth2Auth":true,"allowUsernameAuth":true,"exceptEmailDomains":null,"manageRule":null,"minPasswordLength":8,"onlyEmailDomains":null,"onlyVerified":false,"requireEmail":false}',
    '[{"system":false,"id":"users_name","name":"name","type":"text","required":false,"presentable":false,"unique":false,"options":{"min":null,"max":null,"pattern":""}},{"system":false,"id":"users_avatar","name":"avatar","type":"file","required":false,"presentable":false,"unique":false,"options":{"mimeTypes":["image/jpeg","image/png","image/svg+xml","image/gif","image/webp"],"thumbs":null,"maxSelect":1,"maxSize":5242880,"protected":false}}]',
    false,
    'auth',
    'id = @request.auth.id',
    '2024-02-20 15:14:25.687Z',
    'id = @request.auth.id'
  )
