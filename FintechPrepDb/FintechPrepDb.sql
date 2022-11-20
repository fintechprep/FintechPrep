USE [master]
GO

/****** Object:  Database [FintechPrepDb]    Script Date: 11/15/2022 4:06:15 PM ******/
CREATE DATABASE [FintechPrepDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FintechPrepDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FintechPrepDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FintechPrepDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FintechPrepDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FintechPrepDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [FintechPrepDb] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [FintechPrepDb] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [FintechPrepDb] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [FintechPrepDb] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [FintechPrepDb] SET ARITHABORT OFF 
GO

ALTER DATABASE [FintechPrepDb] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [FintechPrepDb] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [FintechPrepDb] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [FintechPrepDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [FintechPrepDb] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [FintechPrepDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [FintechPrepDb] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [FintechPrepDb] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [FintechPrepDb] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [FintechPrepDb] SET  DISABLE_BROKER 
GO

ALTER DATABASE [FintechPrepDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [FintechPrepDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [FintechPrepDb] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [FintechPrepDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [FintechPrepDb] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [FintechPrepDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [FintechPrepDb] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [FintechPrepDb] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [FintechPrepDb] SET  MULTI_USER 
GO

ALTER DATABASE [FintechPrepDb] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [FintechPrepDb] SET DB_CHAINING OFF 
GO

ALTER DATABASE [FintechPrepDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [FintechPrepDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [FintechPrepDb] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [FintechPrepDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [FintechPrepDb] SET QUERY_STORE = OFF
GO

ALTER DATABASE [FintechPrepDb] SET  READ_WRITE 
GO

