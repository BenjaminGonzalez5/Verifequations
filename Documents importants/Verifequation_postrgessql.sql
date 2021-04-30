CREATE TABLE "utilisateur" (
  "id" SERIAL PRIMARY KEY,
  "pseudo" varchar,
  "nom" varchar,
  "age" int,
  "email" email,
  "predilection" varchar,
  "created_at" timestamp,
  "avatar" int,
  "role" int,
  "etude" int,
  "niveau" int
);

CREATE TABLE "voter" (
  "id" SERIAL PRIMARY KEY,
  "votant" int,
  "vote" int
);

CREATE TABLE "avatar" (
  "id" SERIAL PRIMARY KEY,
  "chemin" varchar
);

CREATE TABLE "role" (
  "id" SERIAL PRIMARY KEY,
  "libelle" varchar
);

CREATE TABLE "message" (
  "id" SERIAL PRIMARY KEY,
  "libelle" varchar,
  "contenu" text,
  "lu" boolean,
  "created_at" timestamp,
  "emmeteur" int,
  "recepteur" int
);

CREATE TABLE "etude" (
  "id" SERIAL PRIMARY KEY,
  "domaine" varchar
);

CREATE TABLE "niveau" (
  "id" SERIAL PRIMARY KEY,
  "libelle" varchar
);

CREATE TABLE "cours" (
  "id" SERIAL PRIMARY KEY,
  "titre" varchar,
  "created_at" timestamp,
  "niveau" int,
  "auteur" int
);

CREATE TABLE "chapitre" (
  "id" SERIAL PRIMARY KEY,
  "titre" varchar,
  "numero" int,
  "contenu" longtext,
  "cours" int
);

ALTER TABLE "utilisateur" ADD FOREIGN KEY ("id") REFERENCES "voter" ("votant");

ALTER TABLE "voter" ADD FOREIGN KEY ("vote") REFERENCES "utilisateur" ("id");

ALTER TABLE "utilisateur" ADD FOREIGN KEY ("avatar") REFERENCES "avatar" ("id");

ALTER TABLE "utilisateur" ADD FOREIGN KEY ("role") REFERENCES "role" ("id");

ALTER TABLE "message" ADD FOREIGN KEY ("emmeteur") REFERENCES "utilisateur" ("id");

ALTER TABLE "message" ADD FOREIGN KEY ("recepteur") REFERENCES "utilisateur" ("id");

ALTER TABLE "utilisateur" ADD FOREIGN KEY ("etude") REFERENCES "etude" ("id");

ALTER TABLE "utilisateur" ADD FOREIGN KEY ("niveau") REFERENCES "niveau" ("id");

ALTER TABLE "cours" ADD FOREIGN KEY ("niveau") REFERENCES "niveau" ("id");

ALTER TABLE "cours" ADD FOREIGN KEY ("auteur") REFERENCES "utilisateur" ("id");

ALTER TABLE "chapitre" ADD FOREIGN KEY ("cours") REFERENCES "cours" ("id");
