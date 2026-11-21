BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "lifestyle_profile" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "sleepSchedule" text NOT NULL,
    "noiseLevel" text NOT NULL,
    "cleanliness" text NOT NULL,
    "budget" bigint NOT NULL
);


--
-- MIGRATION VERSION FOR roomio_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('roomio_app', '20261121193832641', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261121193832641', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20261015164015382', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261015164015382', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260924105232991', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105232991', "timestamp" = now();


COMMIT;
