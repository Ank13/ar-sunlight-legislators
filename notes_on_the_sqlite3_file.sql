CREATE TABLE "politicians" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "first_name" varchar(255), "last_name" varchar(255), "name_suffix" varchar(255), "gender" varchar(255), "birthday" date, "email" varchar(255), "phone" varchar(255), "party" varchar(255), "state" varchar(255), "in_office" varchar(255), "fax" varchar(255), "website" varchar(255), "twitter_id" varchar(255));
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");

sqlite> SELECT * FROM politicians LIMIT 10;


sqlite> SELECT COUNT(*) FROM politicians;
-- COUNT(*)  
-- ----------
-- 743    


SELECT * FROM politicians WHERE state = 'CA';
