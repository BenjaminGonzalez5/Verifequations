CREATE TABLE [utilisateur] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [pseudo] nvarchar(255),
  [nom] nvarchar(255),
  [age] int,
  [email] nvarchar(255),
  [predilection] nvarchar(255),
  [created_at] timestamp,
  [avatar] int,
  [role] int,
  [etude] int,
  [niveau] int
)
GO

CREATE TABLE [voter] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [votant] int,
  [vote] int
)
GO

CREATE TABLE [avatar] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [chemin] nvarchar(255)
)
GO

CREATE TABLE [role] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [libelle] nvarchar(255)
)
GO

CREATE TABLE [message] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [libelle] nvarchar(255),
  [contenu] text,
  [lu] boolean,
  [created_at] timestamp,
  [emmeteur] int,
  [recepteur] int
)
GO

CREATE TABLE [etude] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [domaine] nvarchar(255)
)
GO

CREATE TABLE [niveau] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [libelle] nvarchar(255)
)
GO

CREATE TABLE [cours] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [titre] nvarchar(255),
  [created_at] timestamp,
  [niveau] int,
  [auteur] int
)
GO

CREATE TABLE [chapitre] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [titre] nvarchar(255),
  [numero] int,
  [contenu] longtext,
  [cours] int
)
GO

ALTER TABLE [utilisateur] ADD FOREIGN KEY ([id]) REFERENCES [voter] ([votant])
GO

ALTER TABLE [voter] ADD FOREIGN KEY ([vote]) REFERENCES [utilisateur] ([id])
GO

ALTER TABLE [utilisateur] ADD FOREIGN KEY ([avatar]) REFERENCES [avatar] ([id])
GO

ALTER TABLE [utilisateur] ADD FOREIGN KEY ([role]) REFERENCES [role] ([id])
GO

ALTER TABLE [message] ADD FOREIGN KEY ([emmeteur]) REFERENCES [utilisateur] ([id])
GO

ALTER TABLE [message] ADD FOREIGN KEY ([recepteur]) REFERENCES [utilisateur] ([id])
GO

ALTER TABLE [utilisateur] ADD FOREIGN KEY ([etude]) REFERENCES [etude] ([id])
GO

ALTER TABLE [utilisateur] ADD FOREIGN KEY ([niveau]) REFERENCES [niveau] ([id])
GO

ALTER TABLE [cours] ADD FOREIGN KEY ([niveau]) REFERENCES [niveau] ([id])
GO

ALTER TABLE [cours] ADD FOREIGN KEY ([auteur]) REFERENCES [utilisateur] ([id])
GO

ALTER TABLE [chapitre] ADD FOREIGN KEY ([cours]) REFERENCES [cours] ([id])
GO
