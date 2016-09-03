/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/****** Object:  Table [dbo].[Authors]    Script Date: 9/2/2016 12:06:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[DateBirth] [date] NULL,
	[CreationDate] [datetime] NULL,
	[LastModificationDate] [datetime] NULL,
 CONSTRAINT [PK_Autors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books]    Script Date: 9/2/2016 12:06:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [varbinary](max) null,
	[PagesCount] [int] NULL,
	[CreationDate] [datetime] NULL,
	[LastModificationDate] [datetime] NULL,
	[AuthorsId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
	[CountryPublishedId] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CountryPublished]    Script Date: 9/2/2016 12:06:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryPublished](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsoCode] [nvarchar](3) NULL,
	[CreationDate] [datetime] NULL,
	[LastModificationDate] [datetime] NULL,
 CONSTRAINT [PK_CountryPublished] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genres]    Script Date: 9/2/2016 12:06:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NULL,
	[LastModificationDate] [datetime] NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhoneCodes]    Script Date: 9/2/2016 12:06:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneCodes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NOT NULL,
	[CountryPublishedId] [int] NOT NULL,
	[CreationDate] [datetime] NULL,
	[LastModificationDate] [datetime] NULL,
 CONSTRAINT [PK_PhoneCodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/2/2016 12:06:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[UserPass] [nvarchar](16) NOT NULL,
	[CreationDate] [datetime] NULL,
	[LastModificationDate] [datetime] NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--SET IDENTITY_INSERT [dbo].[Authors] ON
INSERT [dbo].[Authors]([Name],[Surname],[DateBirth]) VALUES(N'Paulo',N'Coelho',N'1947-08-24')
INSERT [dbo].[Authors]([Name],[Surname],[DateBirth]) VALUES(N'Jane',N'Austen',N'1775-12-16')
--SET IDENTITY_INSERT [dbo].[Authors] OFF

--SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users]([UserName],[UserPass]) VALUES('User','User')
INSERT [dbo].[Users]([UserName],[UserPass]) VALUES('Admin','Admin')
--SET IDENTITY_INSERT [dbo].[Users] ON

--SET IDENTITY_INSERT [dbo].[CountryPublished] ON
INSERT [dbo].[CountryPublished]([Name],[IsoCode]) VALUES(N'Armenia','ARM')
INSERT [dbo].[CountryPublished]([Name],[IsoCode]) VALUES(N'Artsakh','ARC')
--SET IDENTITY_INSERT [dbo].[CountryPublished] OFF

--SET IDENTITY_INSERT [dbo].[Genres] ON
INSERT [dbo].[Genres]([Name]) VALUES('Comedy')
INSERT [dbo].[Genres]([Name]) VALUES('Drama')
INSERT [dbo].[Genres]([Name]) VALUES('Romance novel')
INSERT [dbo].[Genres]([Name]) VALUES('Tragedy')
--SET IDENTITY_INSERT [dbo].[Genres] OFF

--SET IDENTITY_INSERT [dbo].[Books] ON
INSERT [Books]([Name],[Price],[Description],[PagesCount],[AuthorsId],[GenreId],[CountryPublishedId]) VALUES('Alhimik',1500,'Interesed book',350,1,2,1)
--SET IDENTITY_INSERT [dbo].[Books] OFF

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_Authors]    Script Date: 9/2/2016 12:06:00 PM ******/
CREATE NONCLUSTERED INDEX [NCI_Authors] ON [dbo].[Authors]
(
	[Name] ASC,
	[Surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_Books]    Script Date: 9/2/2016 12:06:00 PM ******/
CREATE NONCLUSTERED INDEX [NCI_Books] ON [dbo].[Books]
(
	[Name] ASC,
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_CountryPublished]    Script Date: 9/2/2016 12:06:00 PM ******/
CREATE NONCLUSTERED INDEX [NCI_CountryPublished] ON [dbo].[CountryPublished]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_Genres]    Script Date: 9/2/2016 12:06:00 PM ******/
CREATE NONCLUSTERED INDEX [NCI_Genres] ON [dbo].[Genres]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NCI_PhoneCodes]    Script Date: 9/2/2016 12:06:00 PM ******/
CREATE NONCLUSTERED INDEX [NCI_PhoneCodes] ON [dbo].[PhoneCodes]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [NCI_Users]    Script Date: 9/2/2016 12:06:00 PM ******/
CREATE NONCLUSTERED INDEX [NCI_Users] ON [dbo].[Users]
(
	[UserName] ASC,
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors] FOREIGN KEY([AuthorsId])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Genres] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Genres]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_PublishedCountry] FOREIGN KEY([CountryPublishedId])
REFERENCES [dbo].[CountryPublished] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_PublishedCountry]
GO
ALTER TABLE [dbo].[PhoneCodes]  WITH CHECK ADD  CONSTRAINT [FK_PhoneCodes_CountryPublished] FOREIGN KEY([CountryPublishedId])
REFERENCES [dbo].[CountryPublished] ([Id])
GO
ALTER TABLE [dbo].[PhoneCodes] CHECK CONSTRAINT [FK_PhoneCodes_CountryPublished]
GO

