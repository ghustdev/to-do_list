CREATE TABLE "tasks" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "title" varchar,
  "description" text,
  "status" enum,
  "time_execution" datetime,
  "priority" enum,
  "alert" boolean,
  "created_at" timestamp
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "role" varchar,
  "created_at" timestamp
);

ALTER TABLE "tasks" ADD FOREIGN KEY ("id") REFERENCES "users" ("id") DEFERRABLE INITIALLY IMMEDIATE;

-- Defer constraint checking for INSERT
BEGIN;
SET CONSTRAINTS ALL DEFERRED;

INSERT INTO "users" ("id", "name", "role")
VALUES
  (0, 'Alice', 'admin'),
  (1, 'Bob', 'moderator'),
  (2, 'Candice', 'moderator'),
  (3, 'David', 'member');

SET CONSTRAINTS ALL IMMEDIATE;
COMMIT;