BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "app_notification" (
    "id" bigserial PRIMARY KEY,
    "recipientUserId" text NOT NULL,
    "senderUserId" text,
    "title" text NOT NULL,
    "body" text NOT NULL,
    "type" text NOT NULL,
    "relatedEntityId" bigint,
    "isRead" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "app_notification_recipient_idx" ON "app_notification" USING btree ("recipientUserId");

--
-- ACTION DROP TABLE
--
DROP TABLE "lifestyle_profile" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "lifestyle_profile" (
    "id" bigserial PRIMARY KEY,
    "userId" text NOT NULL,
    "name" text NOT NULL,
    "minBudget" bigint NOT NULL,
    "maxBudget" bigint NOT NULL,
    "preferredCity" text NOT NULL,
    "sleepSchedule" text NOT NULL,
    "cleanliness" text NOT NULL,
    "foodHabit" text NOT NULL,
    "socialHabit" text NOT NULL,
    "smokingHabit" text NOT NULL,
    "petHabit" text NOT NULL,
    "hardFilterNoSmoking" boolean NOT NULL,
    "hardFilterPetFriendly" boolean NOT NULL,
    "hardFilterSameGender" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "lifestyle_user_id_idx" ON "lifestyle_profile" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "matching_room" (
    "id" bigserial PRIMARY KEY,
    "creatorUserId" text NOT NULL,
    "name" text NOT NULL,
    "inviteCode" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "matching_room_code_idx" ON "matching_room" USING btree ("inviteCode");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "property_listing" (
    "id" bigserial PRIMARY KEY,
    "ownerUserId" text NOT NULL,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "propertyType" text NOT NULL,
    "roomType" text NOT NULL,
    "monthlyRent" bigint NOT NULL,
    "securityDeposit" bigint NOT NULL,
    "city" text NOT NULL,
    "neighborhood" text NOT NULL,
    "approximateAddress" text NOT NULL,
    "totalBedrooms" bigint NOT NULL,
    "totalBathrooms" bigint NOT NULL,
    "availableFrom" timestamp without time zone NOT NULL,
    "imageUrls" json NOT NULL,
    "amenities" json NOT NULL,
    "houseRules" json NOT NULL,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "listing_owner_idx" ON "property_listing" USING btree ("ownerUserId");
CREATE INDEX "listing_city_idx" ON "property_listing" USING btree ("city");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "room_member" (
    "id" bigserial PRIMARY KEY,
    "roomId" bigint NOT NULL,
    "userId" text NOT NULL,
    "userName" text NOT NULL,
    "joinedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "room_member_idx" ON "room_member" USING btree ("roomId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "room_shortlist_item" (
    "id" bigserial PRIMARY KEY,
    "roomId" bigint NOT NULL,
    "listingId" bigint NOT NULL,
    "addedByUserId" text NOT NULL,
    "addedByName" text NOT NULL,
    "addedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "room_shortlist_idx" ON "room_shortlist_item" USING btree ("roomId", "listingId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "room_vote" (
    "id" bigserial PRIMARY KEY,
    "shortlistItemId" bigint NOT NULL,
    "userId" text NOT NULL,
    "voteType" text NOT NULL,
    "votedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "room_vote_idx" ON "room_vote" USING btree ("shortlistItemId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "saved_flatmate" (
    "id" bigserial PRIMARY KEY,
    "userId" text NOT NULL,
    "targetUserId" text NOT NULL,
    "savedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "saved_flatmate_user_idx" ON "saved_flatmate" USING btree ("userId", "targetUserId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "saved_listing" (
    "id" bigserial PRIMARY KEY,
    "userId" text NOT NULL,
    "listingId" bigint NOT NULL,
    "savedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "saved_listing_user_idx" ON "saved_listing" USING btree ("userId", "listingId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_block" (
    "id" bigserial PRIMARY KEY,
    "blockerUserId" text NOT NULL,
    "blockedUserId" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_block_idx" ON "user_block" USING btree ("blockerUserId", "blockedUserId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_profile" (
    "id" bigserial PRIMARY KEY,
    "userId" text NOT NULL,
    "displayName" text NOT NULL,
    "bio" text,
    "age" bigint NOT NULL,
    "gender" text NOT NULL,
    "occupation" text,
    "city" text NOT NULL,
    "avatarUrl" text,
    "isLookingForFlatmates" boolean NOT NULL,
    "isLookingForRoom" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_profile_user_id_idx" ON "user_profile" USING btree ("userId");
CREATE INDEX "user_profile_city_idx" ON "user_profile" USING btree ("city");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_report" (
    "id" bigserial PRIMARY KEY,
    "reporterUserId" text NOT NULL,
    "targetEntity" text NOT NULL,
    "targetId" text NOT NULL,
    "reason" text NOT NULL,
    "details" text,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR roomio_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('roomio_app', '20261121212537323', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261121212537323', "timestamp" = now();

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
