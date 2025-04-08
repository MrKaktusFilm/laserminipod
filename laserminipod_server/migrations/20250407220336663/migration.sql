BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "spraywall_name" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL
);


--
-- MIGRATION VERSION FOR laserminipod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('laserminipod', '20250407220336663', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250407220336663', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
