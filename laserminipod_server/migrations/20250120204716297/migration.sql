BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "spraywallroute" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "handles" json NOT NULL
);


--
-- MIGRATION VERSION FOR laserminipod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('laserminipod', '20250120204716297', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250120204716297', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
