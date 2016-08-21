
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/20/2016 14:28:30
-- Generated from EDMX file: C:\Users\Ben\Source\Repos\Cultuurhuis\Cultuurhuis\Models\CultuurHuisModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CultuurHuisMVC];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_Reservaties_Klanten]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reservaties] DROP CONSTRAINT [FK_Reservaties_Klanten];
GO
IF OBJECT_ID(N'[dbo].[FK_Reservaties_Voorstellingen]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reservaties] DROP CONSTRAINT [FK_Reservaties_Voorstellingen];
GO
IF OBJECT_ID(N'[dbo].[FK_Users_Klanten]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Klanten] DROP CONSTRAINT [FK_Users_Klanten];
GO
IF OBJECT_ID(N'[dbo].[FK_Voorstellingen_Genres]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Voorstellingen] DROP CONSTRAINT [FK_Voorstellingen_Genres];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[__MigrationHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[__MigrationHistory];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[Genres]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Genres];
GO
IF OBJECT_ID(N'[dbo].[Klanten]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Klanten];
GO
IF OBJECT_ID(N'[dbo].[Reservaties]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reservaties];
GO
IF OBJECT_ID(N'[dbo].[Voorstellingen]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Voorstellingen];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'C__MigrationHistory'
CREATE TABLE [dbo].[C__MigrationHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'Genres'
CREATE TABLE [dbo].[Genres] (
    [GenreId] int  NOT NULL,
    [Naam] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Klanten'
CREATE TABLE [dbo].[Klanten] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Voornaam] nvarchar(50)  NOT NULL,
    [Familienaam] nvarchar(50)  NOT NULL,
    [Straat] nvarchar(50)  NOT NULL,
    [HuisNr] nvarchar(50)  NOT NULL,
    [Postcode] nvarchar(50)  NOT NULL,
    [Gemeente] nvarchar(50)  NOT NULL,
    [GebruikersNaam] nvarchar(50)  NOT NULL,
    [User_id] nvarchar(128)  NULL
);
GO

-- Creating table 'Reservaties'
CREATE TABLE [dbo].[Reservaties] (
    [ReservatieId] int IDENTITY(1,1) NOT NULL,
    [KlantNr] int  NOT NULL,
    [VoorstellingsNr] int  NOT NULL,
    [Plaatsen] smallint  NOT NULL
);
GO

-- Creating table 'Voorstellingen'
CREATE TABLE [dbo].[Voorstellingen] (
    [VoorstellingId] int  NOT NULL,
    [Titel] nvarchar(50)  NOT NULL,
    [Uitvoerders] nvarchar(50)  NOT NULL,
    [Datum] datetime  NOT NULL,
    [GenreNr] int  NOT NULL,
    [Prijs] decimal(19,4)  NOT NULL,
    [VrijePlaatsen] smallint  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory'
ALTER TABLE [dbo].[C__MigrationHistory]
ADD CONSTRAINT [PK_C__MigrationHistory]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [GenreId] in table 'Genres'
ALTER TABLE [dbo].[Genres]
ADD CONSTRAINT [PK_Genres]
    PRIMARY KEY CLUSTERED ([GenreId] ASC);
GO

-- Creating primary key on [Id] in table 'Klanten'
ALTER TABLE [dbo].[Klanten]
ADD CONSTRAINT [PK_Klanten]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ReservatieId] in table 'Reservaties'
ALTER TABLE [dbo].[Reservaties]
ADD CONSTRAINT [PK_Reservaties]
    PRIMARY KEY CLUSTERED ([ReservatieId] ASC);
GO

-- Creating primary key on [VoorstellingId] in table 'Voorstellingen'
ALTER TABLE [dbo].[Voorstellingen]
ADD CONSTRAINT [PK_Voorstellingen]
    PRIMARY KEY CLUSTERED ([VoorstellingId] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [User_id] in table 'Klanten'
ALTER TABLE [dbo].[Klanten]
ADD CONSTRAINT [FK_Users_Klanten]
    FOREIGN KEY ([User_id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_Klanten'
CREATE INDEX [IX_FK_Users_Klanten]
ON [dbo].[Klanten]
    ([User_id]);
GO

-- Creating foreign key on [GenreNr] in table 'Voorstellingen'
ALTER TABLE [dbo].[Voorstellingen]
ADD CONSTRAINT [FK_Voorstellingen_Genres]
    FOREIGN KEY ([GenreNr])
    REFERENCES [dbo].[Genres]
        ([GenreId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Voorstellingen_Genres'
CREATE INDEX [IX_FK_Voorstellingen_Genres]
ON [dbo].[Voorstellingen]
    ([GenreNr]);
GO

-- Creating foreign key on [KlantNr] in table 'Reservaties'
ALTER TABLE [dbo].[Reservaties]
ADD CONSTRAINT [FK_Reservaties_Klanten]
    FOREIGN KEY ([KlantNr])
    REFERENCES [dbo].[Klanten]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Reservaties_Klanten'
CREATE INDEX [IX_FK_Reservaties_Klanten]
ON [dbo].[Reservaties]
    ([KlantNr]);
GO

-- Creating foreign key on [VoorstellingsNr] in table 'Reservaties'
ALTER TABLE [dbo].[Reservaties]
ADD CONSTRAINT [FK_Reservaties_Voorstellingen]
    FOREIGN KEY ([VoorstellingsNr])
    REFERENCES [dbo].[Voorstellingen]
        ([VoorstellingId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Reservaties_Voorstellingen'
CREATE INDEX [IX_FK_Reservaties_Voorstellingen]
ON [dbo].[Reservaties]
    ([VoorstellingsNr]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUsers'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUsers]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------