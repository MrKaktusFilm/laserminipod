BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "route_handle_state" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "route_handle_state" (
    "id" bigserial PRIMARY KEY,
    "routeIdId" bigint NOT NULL,
    "handleId" bigint NOT NULL,
    "state" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "route_handle_state"
    ADD CONSTRAINT "route_handle_state_fk_0"
    FOREIGN KEY("routeIdId")
    REFERENCES "spraywallroute"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "route_handle_state"
    ADD CONSTRAINT "route_handle_state_fk_1"
    FOREIGN KEY("handleId")
    REFERENCES "handle"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR laserminipod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('laserminipod', '20250305115208831', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250305115208831', "timestamp" = now();

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
