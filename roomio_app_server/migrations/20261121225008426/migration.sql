BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "property_listing" ADD COLUMN "listingPurpose" text;
ALTER TABLE "property_listing" ADD COLUMN "purchasePrice" bigint;
ALTER TABLE "property_listing" ADD COLUMN "propertySizeSqFt" bigint;
ALTER TABLE "property_listing" ADD COLUMN "tenure" text;
ALTER TABLE "property_listing" ADD COLUMN "furnishingStatus" text;
ALTER TABLE "property_listing" ADD COLUMN "publisherRole" text;
ALTER TABLE "property_listing" ADD COLUMN "agencyName" text;
ALTER TABLE "property_listing" ADD COLUMN "contactPhone" text;
ALTER TABLE "property_listing" ADD COLUMN "contactEmail" text;
ALTER TABLE "property_listing" ADD COLUMN "verificationStatus" text;
ALTER TABLE "property_listing" ALTER COLUMN "roomType" DROP NOT NULL;
ALTER TABLE "property_listing" ALTER COLUMN "monthlyRent" DROP NOT NULL;
ALTER TABLE "property_listing" ALTER COLUMN "securityDeposit" DROP NOT NULL;
ALTER TABLE "property_listing" ALTER COLUMN "availableFrom" DROP NOT NULL;
ALTER TABLE "property_listing" ALTER COLUMN "houseRules" DROP NOT NULL;

--
-- MIGRATION VERSION FOR roomio_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('roomio_app', '20261121225008426', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261121225008426', "timestamp" = now();

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
