CREATE TABLE IF NOT EXISTS `_migrations` (file VARCHAR(255) PRIMARY KEY NOT NULL, applied INTEGER NOT NULL)
;
			CREATE TABLE IF NOT EXISTS `_admins` (
				`id`              TEXT PRIMARY KEY NOT NULL,
				`avatar`          INTEGER DEFAULT 0 NOT NULL,
				`email`           TEXT UNIQUE NOT NULL,
				`tokenKey`        TEXT UNIQUE NOT NULL,
				`passwordHash`    TEXT NOT NULL,
				`lastResetSentAt` TEXT DEFAULT "" NOT NULL,
				`created`         TEXT DEFAULT (strftime('%Y-%m-%d %H:%M:%fZ')) NOT NULL,
				`updated`         TEXT DEFAULT (strftime('%Y-%m-%d %H:%M:%fZ')) NOT NULL
			);

			CREATE TABLE IF NOT EXISTS `_collections` (
				`id`         TEXT PRIMARY KEY NOT NULL,
				`system`     BOOLEAN DEFAULT FALSE NOT NULL,
				`type`       TEXT DEFAULT "base" NOT NULL,
				`name`       TEXT UNIQUE NOT NULL,
				`schema`     JSON DEFAULT "[]" NOT NULL,
				`indexes`    JSON DEFAULT "[]" NOT NULL,
				`listRule`   TEXT DEFAULT NULL,
				`viewRule`   TEXT DEFAULT NULL,
				`createRule` TEXT DEFAULT NULL,
				`updateRule` TEXT DEFAULT NULL,
				`deleteRule` TEXT DEFAULT NULL,
				`options`    JSON DEFAULT "{}" NOT NULL,
				`created`    TEXT DEFAULT (strftime('%Y-%m-%d %H:%M:%fZ')) NOT NULL,
				`updated`    TEXT DEFAULT (strftime('%Y-%m-%d %H:%M:%fZ')) NOT NULL
			);

			CREATE TABLE IF NOT EXISTS `_params` (
				`id`      TEXT PRIMARY KEY NOT NULL,
				`key`     TEXT UNIQUE NOT NULL,
				`value`   JSON DEFAULT NULL,
				`created` TEXT DEFAULT "" NOT NULL,
				`updated` TEXT DEFAULT "" NOT NULL
			);

			CREATE TABLE IF NOT EXISTS `_externalAuths` (
				`id`           TEXT PRIMARY KEY NOT NULL,
				`collectionId` TEXT NOT NULL,
				`recordId`     TEXT NOT NULL,
				`provider`     TEXT NOT NULL,
				`providerId`   TEXT NOT NULL,
				`created`      TEXT DEFAULT (strftime('%Y-%m-%d %H:%M:%fZ')) NOT NULL,
				`updated`      TEXT DEFAULT (strftime('%Y-%m-%d %H:%M:%fZ')) NOT NULL,
				---
				FOREIGN KEY (`collectionId`) REFERENCES `_collections` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
			);

			CREATE UNIQUE INDEX IF NOT EXISTS _externalAuths_record_provider_idx on `_externalAuths` (`collectionId`, `recordId`, `provider`);
			CREATE UNIQUE INDEX IF NOT EXISTS _externalAuths_collection_provider_idx on `_externalAuths` (`collectionId`, `provider`, `providerId`);
		
;INSERT OR IGNORE INTO `_params` (`created`, `id`, `key`, `updated`, `value`) VALUES ('2024-02-22 23:46:41.564Z', 'petoxtodh5mpg2n', 'settings', '2024-02-22 23:46:41.564Z', '{"meta":{"appName":"Acme","appUrl":"http://localhost:8090","hideControls":false,"senderName":"Support","senderAddress":"support@example.com","verificationTemplate":{"body":"\u003cp\u003eHello,\u003c/p\u003e\n\u003cp\u003eThank you for joining us at {APP_NAME}.\u003c/p\u003e\n\u003cp\u003eClick on the button below to verify your email address.\u003c/p\u003e\n\u003cp\u003e\n  \u003ca class=\"btn\" href=\"{ACTION_URL}\" target=\"_blank\" rel=\"noopener\"\u003eVerify\u003c/a\u003e\n\u003c/p\u003e\n\u003cp\u003e\n  Thanks,\u003cbr/\u003e\n  {APP_NAME} team\n\u003c/p\u003e","subject":"Verify your {APP_NAME} email","actionUrl":"{APP_URL}/_/#/auth/confirm-verification/{TOKEN}","hidden":false},"resetPasswordTemplate":{"body":"\u003cp\u003eHello,\u003c/p\u003e\n\u003cp\u003eClick on the button below to reset your password.\u003c/p\u003e\n\u003cp\u003e\n  \u003ca class=\"btn\" href=\"{ACTION_URL}\" target=\"_blank\" rel=\"noopener\"\u003eReset password\u003c/a\u003e\n\u003c/p\u003e\n\u003cp\u003e\u003ci\u003eIf you didn''t ask to reset your password, you can ignore this email.\u003c/i\u003e\u003c/p\u003e\n\u003cp\u003e\n  Thanks,\u003cbr/\u003e\n  {APP_NAME} team\n\u003c/p\u003e","subject":"Reset your {APP_NAME} password","actionUrl":"{APP_URL}/_/#/auth/confirm-password-reset/{TOKEN}","hidden":false},"confirmEmailChangeTemplate":{"body":"\u003cp\u003eHello,\u003c/p\u003e\n\u003cp\u003eClick on the button below to confirm your new email address.\u003c/p\u003e\n\u003cp\u003e\n  \u003ca class=\"btn\" href=\"{ACTION_URL}\" target=\"_blank\" rel=\"noopener\"\u003eConfirm new email\u003c/a\u003e\n\u003c/p\u003e\n\u003cp\u003e\u003ci\u003eIf you didn''t ask to change your email address, you can ignore this email.\u003c/i\u003e\u003c/p\u003e\n\u003cp\u003e\n  Thanks,\u003cbr/\u003e\n  {APP_NAME} team\n\u003c/p\u003e","subject":"Confirm your {APP_NAME} new email address","actionUrl":"{APP_URL}/_/#/auth/confirm-email-change/{TOKEN}","hidden":false}},"logs":{"maxDays":5,"minLevel":0,"logIp":true},"smtp":{"enabled":false,"host":"smtp.example.com","port":587,"username":"","password":"","authMethod":"","tls":false,"localName":""},"s3":{"enabled":false,"bucket":"","region":"","endpoint":"","accessKey":"","secret":"","forcePathStyle":false},"backups":{"cron":"","cronMaxKeep":3,"s3":{"enabled":false,"bucket":"","region":"","endpoint":"","accessKey":"","secret":"","forcePathStyle":false}},"adminAuthToken":{"secret":"65kgUm2iQ78IhdTA3w3t2fiiVZajVQQ13sM7dl5FWbsgyeCVSS","duration":1209600},"adminPasswordResetToken":{"secret":"T1klgkrHwAT17tDNPSK493BO83r7k4jHGHEtb2L4gGQjqpl3iL","duration":1800},"adminFileToken":{"secret":"EytZHZ8oHYGPdTDOKtIdQIvjxyokO248Yylxv8STSFl4ypNFT8","duration":120},"recordAuthToken":{"secret":"njJBA3Xtgz0G1mNedwDNf19TyNhWffrUb3l0QYctNb1LlfD0XV","duration":1209600},"recordPasswordResetToken":{"secret":"bWx4P1NgGt6BpSb5NT5iRr797XtY6NFTXONOEJglMJOGzfc8pB","duration":1800},"recordEmailChangeToken":{"secret":"FQUrD88YWQu2G6pbHoOV5G9ynknldjbXt0K4iVZomyaPmVkiEf","duration":1800},"recordVerificationToken":{"secret":"xcFdY73VncflV5ORbiKBKixkFh7qsIvJJWI1z5RRvpI2B9jXLB","duration":604800},"recordFileToken":{"secret":"0y2H3nYtesARcOIlsQV1o0l32TGFiqaYwbolb2iZez1aCElpLT","duration":120},"emailAuth":{"enabled":false,"exceptDomains":null,"onlyDomains":null,"minPasswordLength":0},"googleAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"facebookAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"githubAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"gitlabAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"discordAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"twitterAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"microsoftAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"spotifyAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"kakaoAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"twitchAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"stravaAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"giteeAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"livechatAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"giteaAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"oidcAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"oidc2Auth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"oidc3Auth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"appleAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"instagramAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"vkAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"yandexAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"patreonAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"mailcowAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null},"bitbucketAuth":{"enabled":false,"clientId":"","clientSecret":"","authUrl":"","tokenUrl":"","userApiUrl":"","displayName":"","pkce":null}}')
;INSERT OR IGNORE INTO `_collections` (`createRule`, `created`, `deleteRule`, `id`, `indexes`, `listRule`, `name`, `options`, `schema`, `system`, `type`, `updateRule`, `updated`, `viewRule`) VALUES ('', '2024-02-22 23:46:41.564Z', 'id = @request.auth.id', '_pb_users_auth_', '[]', 'id = @request.auth.id', 'users', '{"allowEmailAuth":true,"allowOAuth2Auth":true,"allowUsernameAuth":true,"exceptEmailDomains":null,"manageRule":null,"minPasswordLength":8,"onlyEmailDomains":null,"onlyVerified":false,"requireEmail":false}', '[{"system":false,"id":"users_name","name":"name","type":"text","required":false,"presentable":false,"unique":false,"options":{"min":null,"max":null,"pattern":""}},{"system":false,"id":"users_avatar","name":"avatar","type":"file","required":false,"presentable":false,"unique":false,"options":{"mimeTypes":["image/jpeg","image/png","image/svg+xml","image/gif","image/webp"],"thumbs":null,"maxSelect":1,"maxSize":5242880,"protected":false}}]', false, 'auth', 'id = @request.auth.id', '2024-02-22 23:46:41.564Z', 'id = @request.auth.id')
;CREATE TABLE IF NOT EXISTS `users` (`avatar` TEXT DEFAULT '' NOT NULL, `created` TEXT DEFAULT (strftime('%Y-%m-%d %H:%M:%fZ')) NOT NULL, `email` TEXT DEFAULT '' NOT NULL, `emailVisibility` BOOLEAN DEFAULT FALSE NOT NULL, `id` TEXT PRIMARY KEY DEFAULT ('r'||lower(hex(randomblob(7)))) NOT NULL, `lastResetSentAt` TEXT DEFAULT '' NOT NULL, `lastVerificationSentAt` TEXT DEFAULT '' NOT NULL, `name` TEXT DEFAULT '' NOT NULL, `passwordHash` TEXT NOT NULL, `tokenKey` TEXT NOT NULL, `updated` TEXT DEFAULT (strftime('%Y-%m-%d %H:%M:%fZ')) NOT NULL, `username` TEXT NOT NULL, `verified` BOOLEAN DEFAULT FALSE NOT NULL)
;
					CREATE UNIQUE INDEX IF NOT EXISTS __pb_users_auth__username_idx ON `users` (`username`);
					CREATE UNIQUE INDEX IF NOT EXISTS __pb_users_auth__email_idx ON `users` (`email`) WHERE `email` != '';
					CREATE UNIQUE INDEX IF NOT EXISTS __pb_users_auth__tokenKey_idx ON `users` (`tokenKey`);
					
;INSERT OR IGNORE INTO `_migrations` (`applied`, `file`) VALUES (1708645601564480, '1640988000_init.go')
;UPDATE `_collections` SET `createRule`='', `created`='2024-02-22 23:46:41.564Z', `deleteRule`='id = @request.auth.id', `indexes`='[]', `listRule`='id = @request.auth.id', `name`='users', `options`='{"allowEmailAuth":true,"allowOAuth2Auth":true,"allowUsernameAuth":true,"exceptEmailDomains":null,"manageRule":null,"minPasswordLength":8,"onlyEmailDomains":null,"onlyVerified":false,"requireEmail":false}', `schema`='[{"system":false,"id":"users_name","name":"name","type":"text","required":false,"presentable":false,"unique":false,"options":{"min":null,"max":null,"pattern":""}},{"system":false,"id":"users_avatar","name":"avatar","type":"file","required":false,"presentable":false,"unique":false,"options":{"mimeTypes":["image/jpeg","image/png","image/svg+xml","image/gif","image/webp"],"thumbs":null,"maxSelect":1,"maxSize":5242880,"protected":false}}]', `system`=false, `type`='auth', `updateRule`='id = @request.auth.id', `updated`='2024-02-22 23:46:41.564Z', `viewRule`='id = @request.auth.id' WHERE `id`='_pb_users_auth_'
;INSERT OR IGNORE INTO `_migrations` (`applied`, `file`) VALUES (1708645601564788, '1673167670_multi_match_migrate.go')
;
			UPDATE `_params`
			SET `value` = replace(`value`, '"authentikAuth":', '"oidcAuth":')
			WHERE `key` = 'settings'
		
;INSERT OR IGNORE INTO `_migrations` (`applied`, `file`) VALUES (1708645601564867, '1677152688_rename_authentik_to_oidc.go')
;UPDATE `users` set `avatar` = (
						CASE
							WHEN COALESCE(`avatar`, '[]') = '[]'
							THEN ''
							ELSE (
								CASE
									WHEN json_valid(`avatar`) AND json_type(`avatar`) == 'array'
									THEN COALESCE(json_extract(`avatar`, '$[#-1]'), '')
									ELSE `avatar`
								END
							)
						END
					)
;INSERT OR IGNORE INTO `_migrations` (`applied`, `file`) VALUES (1708645601564988, '1679943780_normalize_single_multiple_values.go')
;INSERT OR IGNORE INTO `_migrations` (`applied`, `file`) VALUES (1708645601565187, '1679943781_add_indexes_column.go')
;
			DELETE FROM `_externalAuths`
			WHERE `collectionId` NOT IN (SELECT `id` FROM `_collections`)
		
;INSERT OR IGNORE INTO `_migrations` (`applied`, `file`) VALUES (1708645601565232, '1685164450_check_fk.go')
;UPDATE `users` set `avatar` = (
						CASE
							WHEN COALESCE(`avatar`, '[]') = '[]'
							THEN ''
							ELSE (
								CASE
									WHEN json_valid(`avatar`) AND json_type(`avatar`) == 'array'
									THEN COALESCE(json_extract(`avatar`, '$[#-1]'), '')
									ELSE `avatar`
								END
							)
						END
					)
;INSERT OR IGNORE INTO `_migrations` (`applied`, `file`) VALUES (1708645601565339, '1689579878_renormalize_single_multiple_values.go')
;UPDATE `users` SET `name` = '' WHERE `name` IS NULL
;UPDATE `users` SET `avatar` = '' WHERE `avatar` IS NULL
;INSERT OR IGNORE INTO `_migrations` (`applied`, `file`) VALUES (1708645601565446, '1690319366_reset_null_values.go')
;INSERT OR IGNORE INTO `_migrations` (`applied`, `file`) VALUES (1708645601565502, '1690454337_transform_relations_to_views.go')
;INSERT OR IGNORE INTO `_migrations` (`applied`, `file`) VALUES (1708645601565554, '1691747913_resave_views.go')
;INSERT OR IGNORE INTO `_migrations` (`applied`, `file`) VALUES (1708645601565636, '1692609521_copy_display_fields.go')
;CREATE UNIQUE INDEX IF NOT EXISTS _externalAuths_collection_provider_idx on `_externalAuths` (`collectionId`, `provider`, `providerId`)
;DROP INDEX IF EXISTS _externalAuths_provider_providerId_idx
;INSERT OR IGNORE INTO `_migrations` (`applied`, `file`) VALUES (1708645601565677, '1701496825_allow_single_oauth2_provider_in_multiple_auth_collections.go')
;INSERT OR IGNORE INTO `_migrations` (`applied`, `file`) VALUES (1708645601565743, '1702134272_set_default_json_max_size.go')
;