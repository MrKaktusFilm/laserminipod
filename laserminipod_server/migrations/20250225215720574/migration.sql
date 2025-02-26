BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "spraywallroute" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "spraywallroute" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text,
    "difficulty" bigint NOT NULL,
    "handles" json NOT NULL,
    "userInfoId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "spraywallroute"
    ADD CONSTRAINT "spraywallroute_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR laserminipod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('laserminipod', '20250225215720574', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250225215720574', "timestamp" = now();

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
