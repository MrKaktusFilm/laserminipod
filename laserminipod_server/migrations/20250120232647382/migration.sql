BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "handle" (
    "id" bigserial PRIMARY KEY,
    "x" bigint NOT NULL,
    "y" bigint NOT NULL,
    "radius" bigint NOT NULL
);


--
-- MIGRATION VERSION FOR laserminipod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('laserminipod', '20250120232647382', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250120232647382', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
