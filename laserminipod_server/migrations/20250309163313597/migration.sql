BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "route_user_projects" (
    "id" bigserial PRIMARY KEY,
    "routeId" bigint NOT NULL,
    "userId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "route_user_unique_idx" ON "route_user_projects" USING btree ("routeId", "userId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "route_user_projects"
    ADD CONSTRAINT "route_user_projects_fk_0"
    FOREIGN KEY("routeId")
    REFERENCES "spraywallroute"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "route_user_projects"
    ADD CONSTRAINT "route_user_projects_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR laserminipod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('laserminipod', '20250309163313597', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250309163313597', "timestamp" = now();

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
