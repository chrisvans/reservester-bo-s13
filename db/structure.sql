CREATE TABLE "owners" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(128) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "ownername" varchar(255), "username" varchar(255));
CREATE TABLE "restaurants" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "address" varchar(255), "phone" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "photo_file_name" varchar(255), "photo_content_type" varchar(255), "photo_file_size" integer, "photo_updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "index_owners_on_email" ON "owners" ("email");
CREATE UNIQUE INDEX "index_owners_on_reset_password_token" ON "owners" ("reset_password_token");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20130628194509');

INSERT INTO schema_migrations (version) VALUES ('20130628211821');

INSERT INTO schema_migrations (version) VALUES ('20130628211852');

INSERT INTO schema_migrations (version) VALUES ('20130628223622');

INSERT INTO schema_migrations (version) VALUES ('20130628224628');

INSERT INTO schema_migrations (version) VALUES ('20130628234627');

INSERT INTO schema_migrations (version) VALUES ('20130630132536');

INSERT INTO schema_migrations (version) VALUES ('20130630140051');

INSERT INTO schema_migrations (version) VALUES ('20130630181606');

INSERT INTO schema_migrations (version) VALUES ('20130701022836');

INSERT INTO schema_migrations (version) VALUES ('20130701023005');