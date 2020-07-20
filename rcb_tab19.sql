--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Ubuntu 12.3-1.pgdg18.04+1)
-- Dumped by pg_dump version 12.3 (Ubuntu 12.3-1.pgdg18.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: dbo; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dbo;


ALTER SCHEMA dbo OWNER TO postgres;

CREATE COLLATION IF NOT EXISTS dbo.case_insensitive (provider = icu, locale = 'und-u-ks-level2', deterministic = false); 

--
-- Name: plpython3u; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpython3u WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpython3u; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpython3u IS 'PL/Python3U untrusted procedural language';


--
-- Name: case_insensitive; Type: COLLATION; Schema: dbo; Owner: postgres
--

CREATE COLLATION dbo.case_insensitive (provider = icu, deterministic = false, locale = 'und-u-ks-level2');


ALTER COLLATION dbo.case_insensitive OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ATPAlertMalware; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ATPAlertMalware" (
    "AlertId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "UseDefault" boolean NOT NULL,
    "InboundNoRecipientOops" boolean NOT NULL,
    "OutboundNoSenderOops" boolean NOT NULL,
    "InboundNoAdminOops" boolean NOT NULL,
    "OutboundNoAdminOops" boolean NOT NULL,
    "LocaleId" character varying(20) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ATPAlertMalware" OWNER TO postgres;

--
-- Name: ATPDMASRegion; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ATPDMASRegion" (
    "ATPDMASRegionId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "DMASRegions" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "UseDefault" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ATPDMASRegion" OWNER TO postgres;

--
-- Name: ATPService; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ATPService" (
    "ATPServiceId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DMASEnabled" boolean NOT NULL,
    "DMASWaitThresholdPeriod" integer NOT NULL,
    "UseDefault" character(1) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ATPService" OWNER TO postgres;

--
-- Name: AllDomains; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."AllDomains" (
    "DomainId" integer NOT NULL,
    "Domain" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "CustomerId" integer NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone,
    "DateDeleted" timestamp(3) without time zone,
    "whoAmended_nt_username" character varying(255) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) COLLATE dbo.case_insensitive,
    "IsBulkMail" character(1) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."AllDomains" OWNER TO postgres;

--
-- Name: BlacklistMessage; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."BlacklistMessage" (
    "CustomerId" integer,
    "DomainId" integer,
    "BlacklistType" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "Message" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "RowId" integer NOT NULL
);


ALTER TABLE dbo."BlacklistMessage" OWNER TO postgres;

--
-- Name: BulkMailSender; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."BulkMailSender" (
    "UserId" integer NOT NULL
);


ALTER TABLE dbo."BulkMailSender" OWNER TO postgres;

--
-- Name: Cluster; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Cluster" (
    "ClusterId" integer NOT NULL,
    "ClusterName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."Cluster" OWNER TO postgres;

--
-- Name: ClusterServer; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ClusterServer" (
    "ClusterId" integer NOT NULL,
    "ServerId" integer NOT NULL,
    "TowerId" smallint NOT NULL,
    "ServerName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DisplayName" character varying(30) NOT NULL COLLATE dbo.case_insensitive,
    "ServerTypeId" integer NOT NULL,
    "MaxRecommendedUsers" integer NOT NULL,
    "ActiveServerConfigId" integer NOT NULL,
    "ServerSpecification" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "ServerSoftware" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "IPAddress_Mail" character(15) NOT NULL COLLATE dbo.case_insensitive,
    "IPAddress_Services" character(15) NOT NULL COLLATE dbo.case_insensitive,
    "SubNet" character(15) NOT NULL COLLATE dbo.case_insensitive,
    "IPAddress_Private" character(15) NOT NULL COLLATE dbo.case_insensitive,
    "SubNet_Private" character(15) NOT NULL COLLATE dbo.case_insensitive,
    "internalDomainName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "SQLNamePrefix" character(8) NOT NULL COLLATE dbo.case_insensitive,
    "Status" character varying(30) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ClusterServer" OWNER TO postgres;

--
-- Name: ClusterServerConfig; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ClusterServerConfig" (
    "ClusterServerConfigId" integer NOT NULL,
    "ClusterId" integer NOT NULL,
    "ServerId" integer NOT NULL,
    "ServerConfigId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer NOT NULL,
    "DomainRole" character varying(20) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ClusterServerConfig" OWNER TO postgres;

--
-- Name: ClusterServerConfigType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ClusterServerConfigType" (
    "ServerConfigId" integer NOT NULL,
    "Description" character varying(100) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ClusterServerConfigType" OWNER TO postgres;

--
-- Name: ClusterServerType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ClusterServerType" (
    "ServerTypeId" integer NOT NULL,
    "ServerType" character varying(100) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ClusterServerType" OWNER TO postgres;

--
-- Name: ClusterServer_CheckUsAddIns; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ClusterServer_CheckUsAddIns" (
    "CS_CheckUsAddInsId" integer NOT NULL,
    "ClusterId" integer NOT NULL,
    "ServerId" integer NOT NULL,
    "PseudoDomainName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "AppendCheckedTitle" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "AppendCheckedBody" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "CheckVirus" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "WarnOutbound" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "BannerOnOutbound" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "Banner" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "BannerText" character varying(1500) NOT NULL COLLATE dbo.case_insensitive,
    "BannerOnInbound" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InBoundBanner" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "InBoundBannerText" character varying(1500) NOT NULL COLLATE dbo.case_insensitive,
    "Email" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "StopWordMacro" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ClusterServer_CheckUsAddIns" OWNER TO postgres;

--
-- Name: ClusterServer_OtherAddIns; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ClusterServer_OtherAddIns" (
    "CS_OtherAddInsId" integer NOT NULL,
    "ClusterId" integer NOT NULL,
    "ServerId" integer NOT NULL,
    "configFileTypeId" integer NOT NULL,
    "AddInText" character varying(510) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ClusterServer_OtherAddIns" OWNER TO postgres;

--
-- Name: ClusterSuperServer; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ClusterSuperServer" (
    "MasterServer_ClusterId" integer NOT NULL,
    "MasterServer_ServerId" integer NOT NULL,
    "Clone_ClusterId" integer NOT NULL,
    "Clone_ServerId" integer NOT NULL,
    "RowId" integer NOT NULL
);


ALTER TABLE dbo."ClusterSuperServer" OWNER TO postgres;

--
-- Name: ConfigChangeApplied; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ConfigChangeApplied" (
    "ConfigChangeAppliedId" uuid NOT NULL,
    "ConfigBuilderHostname" character varying(255) DEFAULT host(inet_server_addr()) NOT NULL COLLATE dbo.case_insensitive,
    "ClusterId" integer NOT NULL,
    "ServerId" integer NOT NULL,
    "configFileTypeId" integer NOT NULL,
    "CCRRequestId" double precision NOT NULL,
    "CCRDate" timestamp(3) without time zone NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ConfigChangeApplied" OWNER TO postgres;

--
-- Name: ConfigChangeApplied_DelRequest; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ConfigChangeApplied_DelRequest" (
    "DelRequestId" uuid NOT NULL,
    "ServerId" integer NOT NULL,
    "DateRequested" timestamp(3) without time zone NOT NULL
);


ALTER TABLE dbo."ConfigChangeApplied_DelRequest" OWNER TO postgres;

--
-- Name: ConfigChangeRequest; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ConfigChangeRequest" (
    "ConfigChangeRequestId" integer NOT NULL,
    "ClusterId" integer NOT NULL,
    "ServerId" integer NOT NULL,
    "configFileTypeId" integer NOT NULL,
    "CCRRequestId" double precision NOT NULL,
    "CCRDate" timestamp(3) without time zone NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ConfigChangeRequest" OWNER TO postgres;

--
-- Name: ConfigFileType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ConfigFileType" (
    "configFileTypeId" integer NOT NULL,
    "configFileDescription" character varying(32) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ConfigFileType" OWNER TO postgres;

--
-- Name: CustomMessage; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomMessage" (
    "CustomMessageKey" integer NOT NULL,
    "ResellerId" integer,
    "CustomerId" integer,
    "DomainId" integer,
    "CustomMessageGroupId" integer NOT NULL,
    "CustomMessageTypeId" integer NOT NULL,
    "CustomMessageStateId" integer NOT NULL,
    "MessageUId" uuid,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone,
    "DateDeleted" timestamp(3) without time zone,
    "whoAmended_nt_username" character varying(50) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."CustomMessage" OWNER TO postgres;

--
-- Name: CustomMessageEmail; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomMessageEmail" (
    "MessageUId" uuid NOT NULL,
    "MessageLanguageId" integer NOT NULL,
    "MessageFrom" character varying(50) COLLATE dbo.case_insensitive,
    "MessageSubject" character varying(255) COLLATE dbo.case_insensitive,
    "MessageBody" character varying(5000) COLLATE dbo.case_insensitive,
    "MessageMeta" character varying(255) COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone,
    "DateDeleted" timestamp(3) without time zone,
    "whoAmended_nt_username" character varying(50) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) COLLATE dbo.case_insensitive,
    "SequenceNumber" integer
);


ALTER TABLE dbo."CustomMessageEmail" OWNER TO postgres;

--
-- Name: CustomMessageLookup; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomMessageLookup" (
    "CustomMessageLookupId" integer NOT NULL,
    "TypeId" integer NOT NULL,
    "ParentTypeId" integer,
    "Description" character varying(50) COLLATE dbo.case_insensitive,
    "fxName" character varying(50) COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone,
    "DateDeleted" timestamp(3) without time zone,
    "whoAmended_nt_username" character varying(30) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(30) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."CustomMessageLookup" OWNER TO postgres;

--
-- Name: CustomMessageText; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomMessageText" (
    "MessageUId" uuid NOT NULL,
    "MessageLanguageTypeId" integer NOT NULL,
    "Description" character varying(50) COLLATE dbo.case_insensitive,
    "Contents" character varying(3800) COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone,
    "DateDeleted" timestamp(3) without time zone,
    "whoAmended_nt_username" character varying(50) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."CustomMessageText" OWNER TO postgres;

--
-- Name: CustomTextContent; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomTextContent" (
    "CustomTextContentId" uuid NOT NULL,
    "TargetLocaleId" character varying(20) NOT NULL COLLATE dbo.case_insensitive,
    "CustomTextContentLocaleId" uuid NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "VersionNumber" integer NOT NULL
);


ALTER TABLE dbo."CustomTextContent" OWNER TO postgres;

--
-- Name: CustomTextContentLine; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomTextContentLine" (
    "CustomTextContentLocaleId" uuid NOT NULL,
    "CustomTextContentLineNo" integer NOT NULL,
    "CustomTextContentLine" character varying(1500) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."CustomTextContentLine" OWNER TO postgres;

--
-- Name: CustomTextHierarchy; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomTextHierarchy" (
    "CustomTextId" uuid NOT NULL,
    "CustomTextTypeId" smallint NOT NULL,
    "OwnerTypeId" smallint NOT NULL,
    "OwnerId" integer NOT NULL,
    "ForUseByChildren" smallint NOT NULL,
    "State" smallint NOT NULL,
    "CustomTextContentId" uuid,
    "ParentCustomTextId" uuid
);


ALTER TABLE dbo."CustomTextHierarchy" OWNER TO postgres;

--
-- Name: CustomerConfig; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomerConfig" (
    "CustomerConfigId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer NOT NULL,
    "DomainNumberOfUsers" integer NOT NULL,
    "CheckUs_BrandMe" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_AppendCheckedTitle" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_CheckVirus" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_WarnOutbound" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_BannerOnOutbound" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_Banner" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "BannerText" character varying(1500) NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_BannerOnInbound" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_InBoundBanner" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "InBoundBannerText" character varying(1500) NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_Email" text NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_StopWordMacro" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "smtproutes_wildCard" smallint NOT NULL,
    "CheckUs_AppendDisclaimer" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_Disclaimer" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "disclaimerText" character varying(1500) NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_customMessageDir" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DaysToRetry" integer NOT NULL,
    "MaxRetryWarnings" integer NOT NULL,
    "HoursBetweenWarnings" integer NOT NULL,
    "InboundNoSenderOops" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundNoRecipientOops" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundNoSenderOops" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundOopsEmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "InboundNoAdminOops" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundNoAdminOops" character(1) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."CustomerConfig" OWNER TO postgres;

--
-- Name: CustomerConfigDefault; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomerConfigDefault" (
    "CustomerId" integer NOT NULL,
    "CheckUs_Email" text NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_BannerOnOutbound" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutBoundBannerText" character varying(1500) NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_BannerOnInbound" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InBoundBannerText" character varying(1500) NOT NULL COLLATE dbo.case_insensitive,
    "smtproutes_wildCard" smallint NOT NULL,
    "CheckUs_AppendDisclaimer" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "disclaimerText" character varying(1500) NOT NULL COLLATE dbo.case_insensitive,
    "primaryServerId" integer NOT NULL,
    "backupServerId" integer NOT NULL,
    "backupServerId1" integer,
    "backupServerId2" integer,
    "DaysToRetry" integer NOT NULL,
    "MaxRetryWarnings" integer NOT NULL,
    "HoursBetweenWarnings" integer NOT NULL,
    "InboundNoSenderOops" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundNoRecipientOops" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundNoSenderOops" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundOopsEmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "InboundNoAdminOops" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundNoAdminOops" character(1) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."CustomerConfigDefault" OWNER TO postgres;

--
-- Name: CustomerConfigHosts; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomerConfigHosts" (
    "CustomerConfigHostsId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DataType" integer NOT NULL,
    "HostIPAddress" character(15) NOT NULL COLLATE dbo.case_insensitive,
    "HostSubNet" character(15) NOT NULL COLLATE dbo.case_insensitive,
    "FirstIPNumeric" numeric(20,0),
    "LastIPNumeric" numeric(20,0),
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "AuditInfoId" integer,
    "ActiveState" smallint NOT NULL,
    "BlacklistExpiryDate" timestamp(3) without time zone,
    "TechChecksState" smallint NOT NULL,
    "TechChecksTestDate" timestamp(3) without time zone,
    "TechChecksCalledByUserId" integer
);


ALTER TABLE dbo."CustomerConfigHosts" OWNER TO postgres;

--
-- Name: CustomerHostedMailProvider; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomerHostedMailProvider" (
    "CustomerHostedMailProviderId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "HostedMailProviderId" integer NOT NULL,
    "DomainId" integer,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "AuditInfoId" integer
);


ALTER TABLE dbo."CustomerHostedMailProvider" OWNER TO postgres;

--
-- Name: CustomerNamedRoute; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomerNamedRoute" (
    "NamedRouteId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "NamedRoute" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "LockingTimestamp" bytea NOT NULL
);


ALTER TABLE dbo."CustomerNamedRoute" OWNER TO postgres;

--
-- Name: CustomerNamedRouteIPAddress; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomerNamedRouteIPAddress" (
    "NamedRouteIPAddressId" integer NOT NULL,
    "NamedRouteId" integer NOT NULL,
    "IPAddressId" integer NOT NULL,
    "IPAddressOrder" integer NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL
);


ALTER TABLE dbo."CustomerNamedRouteIPAddress" OWNER TO postgres;

--
-- Name: CustomerService; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomerService" (
    "CustomerId" integer NOT NULL,
    "ServiceTypeId" integer NOT NULL,
    "Enabled" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."CustomerService" OWNER TO postgres;

--
-- Name: CustomerServiceCode; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomerServiceCode" (
    "CustomerServiceCodeTypeId" integer NOT NULL,
    "CodeId" integer NOT NULL,
    "Code" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "QmailReason" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DisplayText" character varying(80) NOT NULL COLLATE dbo.case_insensitive,
    "DisplaySortOrderUI" integer NOT NULL,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."CustomerServiceCode" OWNER TO postgres;

--
-- Name: CustomerServiceType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."CustomerServiceType" (
    "TypeId" integer NOT NULL,
    "ParentTypeId" integer,
    "Description" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "DisplaySequence" integer NOT NULL,
    "TimesUsed" integer,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) COLLATE dbo.case_insensitive,
    "MinApiVersion" integer
);


ALTER TABLE dbo."CustomerServiceType" OWNER TO postgres;

--
-- Name: Customers; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Customers" (
    "CustomerId" integer NOT NULL,
    "ActiveState" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateSuspended" timestamp(3) without time zone,
    "ParentResellerId" integer,
    "CustomerName" character varying(52) NOT NULL COLLATE dbo.case_insensitive,
    "MincRef" character(7) COLLATE dbo.case_insensitive,
    "ActualNumberUsers" integer NOT NULL,
    "CustomerExtRef" character varying(50) COLLATE dbo.case_insensitive,
    "AdminName" character varying(7) COLLATE dbo.case_insensitive,
    "AdminPassword" character varying(32) COLLATE dbo.case_insensitive,
    "ContactEmail" character varying(255) COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone,
    "DateDeleted" timestamp(3) without time zone,
    "whoAmended_nt_username" character varying(255) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) COLLATE dbo.case_insensitive,
    "IsBulkMail" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "HighVolumeInd" smallint NOT NULL,
    "PreferredLocaleId" character varying(20) NOT NULL COLLATE dbo.case_insensitive,
    "EnterpriseLicenceKey" uuid NOT NULL
);


ALTER TABLE dbo."Customers" OWNER TO postgres;

--
-- Name: DLP; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLP" (
    "DLPId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "ServiceTypeId" integer NOT NULL,
    "UseDefault" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "AdminEmailAddress" character varying(255) COLLATE dbo.case_insensitive,
    "PreventSubDomainInheritance" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DefaultTimeZoneId" integer NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "InternalNotificationFromAddress" character varying(255) COLLATE dbo.case_insensitive,
    "ExternalNotificationFromAddress" character varying(255) COLLATE dbo.case_insensitive,
    "SubjectTagPosition" character(1) COLLATE dbo.case_insensitive,
    "SubjectTag" character varying(150) COLLATE dbo.case_insensitive,
    "EndUserNotifyFlag" boolean NOT NULL,
    "RptShowMatchedContentFlag" boolean NOT NULL,
    "RptShowSurroundTextFlag" boolean NOT NULL,
    "AdminNotificationTypeId" integer,
    "UserNotificationTypeId" integer,
    "IsCustomNotification" boolean
);


ALTER TABLE dbo."DLP" OWNER TO postgres;

--
-- Name: DLPActionParamCategory; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPActionParamCategory" (
    "ParamCategory" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPActionParamCategory" OWNER TO postgres;

--
-- Name: DLPActionParamType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPActionParamType" (
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "ParamCategory" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "XMLSchemaElement" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPActionParamType" OWNER TO postgres;

--
-- Name: DLPActionScalarParam; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPActionScalarParam" (
    "ScalarParamId" integer NOT NULL,
    "PolicyId" integer NOT NULL,
    "ScalarValue" character varying(500) COLLATE dbo.case_insensitive,
    "ScalarValueBinary" bytea,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPActionScalarParam" OWNER TO postgres;

--
-- Name: DLPActionType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPActionType" (
    "ActionType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "XMLSchemaElement" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "ActionCategory" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPActionType" OWNER TO postgres;

--
-- Name: DLPActionValidParamType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPActionValidParamType" (
    "ActionType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPActionValidParamType" OWNER TO postgres;

--
-- Name: DLPCondition; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPCondition" (
    "ConditionId" integer NOT NULL,
    "RuleId" integer NOT NULL,
    "ConditionType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "JoinType" character(1) COLLATE dbo.case_insensitive,
    "ConditionScopeBody" boolean NOT NULL,
    "ConditionScopeSubject" boolean NOT NULL,
    "ConditionScopeAttachment" boolean NOT NULL,
    "ConditionScopeHeader" boolean NOT NULL,
    "ConditionScopeMetadata" boolean NOT NULL,
    "ScanOfficeDocs" boolean NOT NULL,
    "MatchCaseFlag" boolean NOT NULL,
    "MatchCountFlag" boolean NOT NULL,
    "MatchCount" integer NOT NULL,
    "MatchUniqueCountFlag" boolean NOT NULL,
    "ExceptionFlag" boolean NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DataObfuscationType" smallint NOT NULL
);


ALTER TABLE dbo."DLPCondition" OWNER TO postgres;

--
-- Name: DLPConditionAddressParam; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPConditionAddressParam" (
    "AddressParamId" integer NOT NULL,
    "ConditionId" integer NOT NULL,
    "GroupId" integer NOT NULL,
    "GroupType" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPConditionAddressParam" OWNER TO postgres;

--
-- Name: DLPConditionGroup; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPConditionGroup" (
    "ConditionGroupId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "Name" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Scope" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "IsSuper" boolean NOT NULL,
    "ConditionGroupCategoryId" integer NOT NULL
);


ALTER TABLE dbo."DLPConditionGroup" OWNER TO postgres;

--
-- Name: DLPConditionGroupCategory; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPConditionGroupCategory" (
    "ConditionGroupCategoryId" integer NOT NULL,
    "CategoryName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPConditionGroupCategory" OWNER TO postgres;

--
-- Name: DLPConditionGroupData; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPConditionGroupData" (
    "ConditionGroupDataId" integer NOT NULL,
    "ConditionGroupId" integer NOT NULL,
    "ConditionGroupData" character varying(3000) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPConditionGroupData" OWNER TO postgres;

--
-- Name: DLPConditionGroupParam; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPConditionGroupParam" (
    "GroupParamId" integer NOT NULL,
    "ConditionId" integer NOT NULL,
    "ConditionGroupId" integer NOT NULL,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPConditionGroupParam" OWNER TO postgres;

--
-- Name: DLPConditionParamCategory; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPConditionParamCategory" (
    "ParamCategory" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPConditionParamCategory" OWNER TO postgres;

--
-- Name: DLPConditionParamType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPConditionParamType" (
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "ParamCategory" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "XMLSchemaElement" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPConditionParamType" OWNER TO postgres;

--
-- Name: DLPConditionScalarParam; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPConditionScalarParam" (
    "ScalarParamId" integer NOT NULL,
    "ConditionId" integer NOT NULL,
    "ScalarValue" character varying(500) NOT NULL COLLATE dbo.case_insensitive,
    "ScalarValueOperator" character(7) NOT NULL COLLATE dbo.case_insensitive,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPConditionScalarParam" OWNER TO postgres;

--
-- Name: DLPConditionTimeParam; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPConditionTimeParam" (
    "TimeParamId" integer NOT NULL,
    "ConditionId" integer NOT NULL,
    "TimezoneId" integer NOT NULL,
    "Monday" boolean NOT NULL,
    "Tuesday" boolean NOT NULL,
    "Wednesday" boolean NOT NULL,
    "Thursday" boolean NOT NULL,
    "Friday" boolean NOT NULL,
    "Saturday" boolean NOT NULL,
    "Sunday" boolean NOT NULL,
    "FromTime" character varying(20) NOT NULL COLLATE dbo.case_insensitive,
    "ToTime" character varying(20) NOT NULL COLLATE dbo.case_insensitive,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPConditionTimeParam" OWNER TO postgres;

--
-- Name: DLPConditionType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPConditionType" (
    "ConditionType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "ValidJoinTypes" character varying(10) COLLATE dbo.case_insensitive,
    "XMLSchemaElement" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "HasDataObfuscation" boolean NOT NULL
);


ALTER TABLE dbo."DLPConditionType" OWNER TO postgres;

--
-- Name: DLPConditionValidParamType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPConditionValidParamType" (
    "ConditionType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPConditionValidParamType" OWNER TO postgres;

--
-- Name: DLPCustomerExclusionAddress; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPCustomerExclusionAddress" (
    "RowId" uuid NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer NOT NULL,
    "EmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPCustomerExclusionAddress" OWNER TO postgres;

--
-- Name: DLPGlobalExclusionAddress; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPGlobalExclusionAddress" (
    "AddressId" integer NOT NULL,
    "EmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPGlobalExclusionAddress" OWNER TO postgres;

--
-- Name: DLPPolicy; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPPolicy" (
    "PolicyId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "PolicyName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "PolicyDescription" character varying(500) NOT NULL COLLATE dbo.case_insensitive,
    "Sequence" integer NOT NULL,
    "Active" boolean NOT NULL,
    "Template" boolean NOT NULL,
    "AdminEmailAddress" character varying(255) COLLATE dbo.case_insensitive,
    "SendToEmailAddress" character varying(255) COLLATE dbo.case_insensitive,
    "PolicyRuleOperator" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "PolicyActionTypeId" integer NOT NULL,
    "PolicyActionExit" boolean NOT NULL,
    "PolicyAdminNotificationTypeId" integer NOT NULL,
    "PolicyUserNotificationTypeId" integer NOT NULL,
    "PolicyDirection" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "ServiceTypeId" integer NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "IsTestPolicy" boolean NOT NULL,
    "IsCustomPolicyNotification" boolean
);


ALTER TABLE dbo."DLPPolicy" OWNER TO postgres;

--
-- Name: DLPPolicyActionType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPPolicyActionType" (
    "PolicyActionTypeId" integer NOT NULL,
    "PolicyActionType" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "ActionCategory" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "IsAvailableToAll" boolean NOT NULL,
    "IsExitAction" boolean NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPPolicyActionType" OWNER TO postgres;

--
-- Name: DLPPolicyActionTypeMapping; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPPolicyActionTypeMapping" (
    "PolicyActionTypeId" integer NOT NULL,
    "ActionType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPPolicyActionTypeMapping" OWNER TO postgres;

--
-- Name: DLPPolicyServiceType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPPolicyServiceType" (
    "DLPPolicyServiceTypeId" integer NOT NULL,
    "DLPPolicyId" integer NOT NULL,
    "PolicyServiceTypeId" smallint NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPPolicyServiceType" OWNER TO postgres;

--
-- Name: DLPRule; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPRule" (
    "RuleId" integer NOT NULL,
    "PolicyId" integer NOT NULL,
    "RuleConditionOperator" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "RuleName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPRule" OWNER TO postgres;

--
-- Name: DLPSuperConditionGroup; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DLPSuperConditionGroup" (
    "SuperConditionGroupId" integer NOT NULL,
    "SuperConditionGroupDataId" integer NOT NULL,
    "ExclusionFlag" boolean NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DLPSuperConditionGroup" OWNER TO postgres;

--
-- Name: DMASGlobalControl; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DMASGlobalControl" (
    "DMASGlobalControlId" integer NOT NULL,
    "DMASGlobalEnable" boolean NOT NULL,
    "DateCreated" timestamp(3) without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
    "DateAmended" timestamp(3) without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
    "whoAmended_nt_username" character varying(255) DEFAULT CURRENT_USER NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) DEFAULT inet_client_addr() NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DMASGlobalControl" OWNER TO postgres;

--
-- Name: Disclaimer; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Disclaimer" (
    "DisclaimerId" integer NOT NULL,
    "DisclaimerName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "CustomerId" integer NOT NULL,
    "Priority" integer NOT NULL,
    "IsDefault" boolean NOT NULL,
    "IsEnabled" boolean NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "whoAmended_nt_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea NOT NULL
);


ALTER TABLE dbo."Disclaimer" OWNER TO postgres;

--
-- Name: DisclaimerGroup; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DisclaimerGroup" (
    "DisclaimerId" integer NOT NULL,
    "GroupId" integer NOT NULL,
    "GroupType" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "whoAmended_nt_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DisclaimerGroup" OWNER TO postgres;

--
-- Name: DomainConfigDefault; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."DomainConfigDefault" (
    "DomainId" integer NOT NULL,
    "useBannerDefaults" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "useSpamDefaults" character(1) COLLATE dbo.case_insensitive,
    "useInboundServerDefaults" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "AuditInfoId" integer,
    "UseEmailDefaults" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseVirusDefaults" character(1) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."DomainConfigDefault" OWNER TO postgres;

--
-- Name: EICService; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."EICService" (
    "EICServiceId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "UseDefault" boolean NOT NULL,
    "IPWhitelistConditionGroupId" integer,
    "DomainWhitelistConditionGroupId" integer,
    "EmailWhitelistServiceUserGroupId" integer,
    "EICDomainSettingsId" integer,
    "EICUserSettingsId" integer,
    "EICMismatchSettingsid" integer,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."EICService" OWNER TO postgres;

--
-- Name: EmailServerActiveState; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."EmailServerActiveState" (
    "ActiveState" smallint NOT NULL,
    "Description" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."EmailServerActiveState" OWNER TO postgres;

--
-- Name: EmailServerTechChecksState; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."EmailServerTechChecksState" (
    "TechChecksState" smallint NOT NULL,
    "Description" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."EmailServerTechChecksState" OWNER TO postgres;

--
-- Name: HostedMailProvider; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."HostedMailProvider" (
    "HostedMailProviderId" integer NOT NULL,
    "ProviderName" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."HostedMailProvider" OWNER TO postgres;

--
-- Name: HostedMailProviderCheck; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."HostedMailProviderCheck" (
    "HostedMailProviderCheckId" integer NOT NULL,
    "HostedMailProviderId" integer NOT NULL,
    "CheckType" character varying(5) NOT NULL COLLATE dbo.case_insensitive,
    "CheckAddress" character varying(100) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."HostedMailProviderCheck" OWNER TO postgres;

--
-- Name: IMCustomer; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."IMCustomer" (
    "CustomerId" integer NOT NULL,
    "EmailFormatID" integer,
    "ArchiveFormatID" integer,
    "AdminEmailAddress" character varying(255) COLLATE dbo.case_insensitive,
    "ArchiveEmailAddress" character varying(255) COLLATE dbo.case_insensitive,
    "ArchiveEmailFrequency" integer,
    "ArchiveEmailStartDate" timestamp(3) without time zone,
    "ArchiveEmailEnabled" boolean DEFAULT false NOT NULL,
    "CCDomainName" character varying(100) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
    "DateAmended" timestamp(3) without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
    "DateDeleted" timestamp(3) without time zone DEFAULT '9999-12-31 23:59:59'::timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) DEFAULT CURRENT_USER NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) DEFAULT inet_client_addr() NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."IMCustomer" OWNER TO postgres;

--
-- Name: InterfaceUQPrivacyUserSettings; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."InterfaceUQPrivacyUserSettings" (
    "OwnerId" integer NOT NULL,
    "OwnerTypeId" smallint NOT NULL,
    "NotificationFrequencyId" smallint NOT NULL,
    "NotificationDefaultLang" character varying(25) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."InterfaceUQPrivacyUserSettings" OWNER TO postgres;

--
-- Name: LDAPGroup; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."LDAPGroup" (
    "LDAPGroupId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "GroupName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateDeleted" timestamp(3) without time zone
);


ALTER TABLE dbo."LDAPGroup" OWNER TO postgres;

--
-- Name: LDAPUser; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."LDAPUser" (
    "LDAPUserId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "PrimaryEmailAddress" character varying(255) COLLATE dbo.case_insensitive,
    "DateDeleted" timestamp(3) without time zone,
    "ReplRegionId" smallint NOT NULL
);


ALTER TABLE dbo."LDAPUser" OWNER TO postgres;

--
-- Name: LDAPUserGroupMembership; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."LDAPUserGroupMembership" (
    "LDAPUserGroupMembershipId" integer NOT NULL,
    "LDAPUserId" integer NOT NULL,
    "LDAPGroupId" integer,
    "IsDirectMembership" boolean,
    "DateDeleted" timestamp(3) without time zone
);


ALTER TABLE dbo."LDAPUserGroupMembership" OWNER TO postgres;

--
-- Name: Locale; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Locale" (
    "LocaleId" character varying(20) NOT NULL COLLATE dbo.case_insensitive,
    "LocaleName" character varying(100) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."Locale" OWNER TO postgres;

--
-- Name: LocaleDataTable; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."LocaleDataTable" (
    "LocaleDataTableId" integer NOT NULL,
    "LocaleDataTableName" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."LocaleDataTable" OWNER TO postgres;

--
-- Name: LocaleDataTableStrings; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."LocaleDataTableStrings" (
    "LocaleDataTableStringId" bigint NOT NULL,
    "LocaleDataTableId" integer NOT NULL,
    "LocaleDataTableKeyId" bigint NOT NULL,
    "LocaleId" character varying(20) NOT NULL COLLATE dbo.case_insensitive,
    "LocaleDataTableString" character varying(1000) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "LocaleDataTableStringDesc" character varying(1000) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."LocaleDataTableStrings" OWNER TO postgres;

--
-- Name: Pen; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Pen" (
    "PenId" integer NOT NULL,
    "PenTypeId" integer NOT NULL,
    "DisplayName" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "PenHostName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "IPAddress" character varying(15) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."Pen" OWNER TO postgres;

--
-- Name: PenType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."PenType" (
    "PenTypeId" integer NOT NULL,
    "PenType" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."PenType" OWNER TO postgres;

--
-- Name: PolicyServiceType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."PolicyServiceType" (
    "PolicyServiceTypeId" smallint NOT NULL,
    "ParentTypeId" smallint,
    "Description" character varying(255) COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."PolicyServiceType" OWNER TO postgres;

--
-- Name: PublicBlacklist; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."PublicBlacklist" (
    "PublicBlacklistId" integer NOT NULL,
    "CodeId" integer NOT NULL,
    "Status" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "RetiredDate" timestamp(3) without time zone,
    "ActiveList" smallint NOT NULL,
    "HomePageURL" character varying(100) NOT NULL COLLATE dbo.case_insensitive,
    "SpamDNSUserName" character varying(64) COLLATE dbo.case_insensitive,
    "SpamDNSLookupURL" character varying(256) NOT NULL COLLATE dbo.case_insensitive,
    "SpamDNSErrorText" character varying(512) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."PublicBlacklist" OWNER TO postgres;

--
-- Name: Reseller; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."Reseller" (
    "CustomerId" integer NOT NULL,
    "BannerOnOutbound" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutBoundBanner" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "OutBoundBannerText" character varying(1500) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundOopsEmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "BannerOnInbound" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InBoundBanner" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "InBoundBannerText" character varying(1500) NOT NULL COLLATE dbo.case_insensitive,
    "isTrial" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "CheckUs_Email" text NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."Reseller" OWNER TO postgres;

--
-- Name: SMTPRoutes; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."SMTPRoutes" (
    "SMTPRoutesId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "smtproutes_DeliveryAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "smtpRoutes_Order" integer NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "AuditInfoId" integer,
    "ActiveState" smallint NOT NULL,
    "BlacklistExpiryDate" timestamp(3) without time zone,
    "TechChecksState" smallint NOT NULL,
    "TechChecksTestDate" timestamp(3) without time zone,
    "TechChecksCalledByUserId" integer
);


ALTER TABLE dbo."SMTPRoutes" OWNER TO postgres;

--
-- Name: ServiceCF; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCF" (
    "ServiceCFId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "UseDefault" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "AdminEmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "PreventSubDomainInheritance" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DefaultTimeZoneId" integer NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea,
    "InternalNotificationFromAddress" character varying(255) COLLATE dbo.case_insensitive,
    "ExternalNotificationFromAddress" character varying(255) COLLATE dbo.case_insensitive,
    "SubjectTagPosition" character(1) COLLATE dbo.case_insensitive,
    "SubjectTag" character varying(150) COLLATE dbo.case_insensitive,
    "SubjectTagCharSet" character varying(15) COLLATE dbo.case_insensitive,
    "CCPenNumber" integer NOT NULL
);


ALTER TABLE dbo."ServiceCF" OWNER TO postgres;

--
-- Name: ServiceCFAction; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFAction" (
    "ActionId" integer NOT NULL,
    "RuleId" integer NOT NULL,
    "ActionType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFAction" OWNER TO postgres;

--
-- Name: ServiceCFActionParamCategory; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFActionParamCategory" (
    "ParamCategory" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFActionParamCategory" OWNER TO postgres;

--
-- Name: ServiceCFActionParamType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFActionParamType" (
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "ParamCategory" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "XMLSchemaElement" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFActionParamType" OWNER TO postgres;

--
-- Name: ServiceCFActionScalarParam; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFActionScalarParam" (
    "ScalarParamId" integer NOT NULL,
    "ActionId" integer NOT NULL,
    "ScalarValue" character varying(255) COLLATE dbo.case_insensitive,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea,
    "ScalarValueBinary" bytea
);


ALTER TABLE dbo."ServiceCFActionScalarParam" OWNER TO postgres;

--
-- Name: ServiceCFActionType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFActionType" (
    "ActionType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "XMLSchemaElement" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea,
    "ActionValue" integer NOT NULL,
    "ActionCategory" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceCFActionType" OWNER TO postgres;

--
-- Name: ServiceCFActionValidParamType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFActionValidParamType" (
    "ActionType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFActionValidParamType" OWNER TO postgres;

--
-- Name: ServiceCFCondition; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFCondition" (
    "ConditionId" integer NOT NULL,
    "RuleId" integer NOT NULL,
    "ConditionType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "JoinType" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFCondition" OWNER TO postgres;

--
-- Name: ServiceCFConditionAddressParam; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFConditionAddressParam" (
    "AddressParamId" integer NOT NULL,
    "ConditionId" integer NOT NULL,
    "UserGroupId" integer,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea,
    "LDAPGroupId" integer,
    "IMSSUserGroupId" integer,
    "IMSSUserGroupType" character varying(100) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceCFConditionAddressParam" OWNER TO postgres;

--
-- Name: ServiceCFConditionGroup; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFConditionGroup" (
    "ConditionGroupId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "Name" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "Scope" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea,
    "Description" character varying(255) COLLATE dbo.case_insensitive,
    "IsSuper" boolean NOT NULL,
    "ServiceTypeId" integer NOT NULL
);


ALTER TABLE dbo."ServiceCFConditionGroup" OWNER TO postgres;

--
-- Name: ServiceCFConditionGroupEntryCategory; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFConditionGroupEntryCategory" (
    "EntryCategory" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFConditionGroupEntryCategory" OWNER TO postgres;

--
-- Name: ServiceCFConditionGroupParam; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFConditionGroupParam" (
    "GroupParamId" integer NOT NULL,
    "ConditionId" integer NOT NULL,
    "ConditionGroupId" integer NOT NULL,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea,
    "Threshold" integer
);


ALTER TABLE dbo."ServiceCFConditionGroupParam" OWNER TO postgres;

--
-- Name: ServiceCFConditionGroupValidEntryCategory; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFConditionGroupValidEntryCategory" (
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "EntryCategory" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFConditionGroupValidEntryCategory" OWNER TO postgres;

--
-- Name: ServiceCFConditionParamCategory; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFConditionParamCategory" (
    "ParamCategory" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFConditionParamCategory" OWNER TO postgres;

--
-- Name: ServiceCFConditionParamType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFConditionParamType" (
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "ParamCategory" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "XMLSchemaElement" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFConditionParamType" OWNER TO postgres;

--
-- Name: ServiceCFConditionScalarParam; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFConditionScalarParam" (
    "ScalarParamId" integer NOT NULL,
    "ConditionId" integer NOT NULL,
    "ScalarValue" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFConditionScalarParam" OWNER TO postgres;

--
-- Name: ServiceCFConditionType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFConditionType" (
    "ConditionType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "ValidJoinTypes" character varying(10) COLLATE dbo.case_insensitive,
    "XMLSchemaElement" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFConditionType" OWNER TO postgres;

--
-- Name: ServiceCFConditionValidParamType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFConditionValidParamType" (
    "ConditionType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "ParamType" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFConditionValidParamType" OWNER TO postgres;

--
-- Name: ServiceCFCustomerExclusionAddress; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFCustomerExclusionAddress" (
    "RowId" uuid NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer NOT NULL,
    "EmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceCFCustomerExclusionAddress" OWNER TO postgres;

--
-- Name: ServiceCFDomain; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFDomain" (
    "CFDomainId" integer NOT NULL,
    "ConditionGroupId" integer NOT NULL,
    "DomainName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFDomain" OWNER TO postgres;

--
-- Name: ServiceCFGlobalExclusionAddress; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFGlobalExclusionAddress" (
    "AddressId" integer NOT NULL,
    "EmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceCFGlobalExclusionAddress" OWNER TO postgres;

--
-- Name: ServiceCFLexExpression; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFLexExpression" (
    "LexExpressionId" integer NOT NULL,
    "ConditionGroupId" integer NOT NULL,
    "LexicalExpression" character varying(3500) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFLexExpression" OWNER TO postgres;

--
-- Name: ServiceCFRegExpression; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFRegExpression" (
    "RegExpressionId" integer NOT NULL,
    "ConditionGroupId" integer NOT NULL,
    "RegularExpression" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea,
    "Name" character varying(50) COLLATE dbo.case_insensitive,
    "Description" character varying(255) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceCFRegExpression" OWNER TO postgres;

--
-- Name: ServiceCFRegExpressionTemplateReference; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFRegExpressionTemplateReference" (
    "RegExpReferenceId" integer NOT NULL,
    "ConditionGroupId" integer NOT NULL,
    "RegExpressionId" integer NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFRegExpressionTemplateReference" OWNER TO postgres;

--
-- Name: ServiceCFRule; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFRule" (
    "RuleId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "RuleName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Sequence" integer NOT NULL,
    "Active" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "Template" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "AdminEmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea,
    "ScanOfficeDocs" boolean NOT NULL,
    "UseDefaultSubjectTag" boolean,
    "SubjectTagPosition" character(1) COLLATE dbo.case_insensitive,
    "SubjectTag" character varying(150) COLLATE dbo.case_insensitive,
    "SubjectTagCharSet" character varying(15) COLLATE dbo.case_insensitive,
    "UseDefaultSendToEmailAddress" boolean NOT NULL,
    "SendToEmailAddress" character varying(255) COLLATE dbo.case_insensitive,
    "ConditionScopeBody" boolean NOT NULL,
    "ConditionScopeSubject" boolean NOT NULL,
    "ConditionScopeAttachment" boolean NOT NULL,
    "ConditionScopeHeader" boolean NOT NULL,
    "SenderConditionsOperator" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "RecipientConditionsOperator" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "EmailContentConditionsOperator" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "AttachmentConditionsOperator" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "RuleOperator" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "ServiceTypeId" integer NOT NULL
);


ALTER TABLE dbo."ServiceCFRule" OWNER TO postgres;

--
-- Name: ServiceCFSuperGroupEntry; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFSuperGroupEntry" (
    "EntryId" integer NOT NULL,
    "SuperConditionGroupId" integer NOT NULL,
    "EntryConditionGroupId" integer NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFSuperGroupEntry" OWNER TO postgres;

--
-- Name: ServiceCFTimeRestrictionDayPart; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFTimeRestrictionDayPart" (
    "DayPartId" integer NOT NULL,
    "ConditionGroupId" integer NOT NULL,
    "Monday" boolean NOT NULL,
    "Tuesday" boolean NOT NULL,
    "Wednesday" boolean NOT NULL,
    "Thursday" boolean NOT NULL,
    "Friday" boolean NOT NULL,
    "Saturday" boolean NOT NULL,
    "Sunday" boolean NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFTimeRestrictionDayPart" OWNER TO postgres;

--
-- Name: ServiceCFTimeRestrictionTimePart; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFTimeRestrictionTimePart" (
    "TimePartId" integer NOT NULL,
    "ConditionGroupId" integer NOT NULL,
    "FromTime" character varying(20) NOT NULL COLLATE dbo.case_insensitive,
    "ToTime" character varying(20) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFTimeRestrictionTimePart" OWNER TO postgres;

--
-- Name: ServiceCFTimeRestrictionTimeZonePart; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFTimeRestrictionTimeZonePart" (
    "TimezonePartId" integer NOT NULL,
    "ConditionGroupId" integer NOT NULL,
    "TimezoneId" integer NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFTimeRestrictionTimeZonePart" OWNER TO postgres;

--
-- Name: ServiceCFTimeZone; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceCFTimeZone" (
    "TimezoneId" integer NOT NULL,
    "ZoneKey" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "RawOffset" integer NOT NULL,
    "SystemDefault" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "ShowInUI" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UsesDaylightTime" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "NormalShortName" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "NormalLongName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DaylightShortName" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "DaylightLongName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceCFTimeZone" OWNER TO postgres;

--
-- Name: ServiceGoodRcptTo; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceGoodRcptTo" (
    "RowId" uuid NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "UseDefault" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "ReceiveAction" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "IsClientManaged" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "LastUploadTime" timestamp(3) without time zone,
    "LastUploadApp" character varying(50) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceGoodRcptTo" OWNER TO postgres;

--
-- Name: ServicePorn; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePorn" (
    "RowId" uuid NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "UseDefault" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "EmailAddresses" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LogAll" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundAntiPorn" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundSensitivity" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundAction" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundAdminSend" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundSenderSend" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundRecipientSend" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundAntiPorn" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundSensitivity" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundAction" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundAdminSend" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundSenderSend" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundRecipientSend" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundOopsEmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "SubjectTagPosition" character(1) COLLATE dbo.case_insensitive,
    "SubjectTag" character varying(150) COLLATE dbo.case_insensitive,
    "SubjectTagCharSet" character varying(15) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePorn" OWNER TO postgres;

--
-- Name: ServicePornActionType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornActionType" (
    "ActionType" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornActionType" OWNER TO postgres;

--
-- Name: ServicePornDirectionType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornDirectionType" (
    "DirectionTypeId" smallint NOT NULL,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornDirectionType" OWNER TO postgres;

--
-- Name: ServicePornGlobalImage; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornGlobalImage" (
    "ImageId" integer NOT NULL,
    "ClientName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornGlobalImage" OWNER TO postgres;

--
-- Name: ServicePornImage; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornImage" (
    "ImageId" integer NOT NULL,
    "OwnerTypeId" smallint NOT NULL,
    "OwnerId" integer NOT NULL,
    "SignatureId" uuid NOT NULL,
    "ImageType" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "CreatedByUserName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornImage" OWNER TO postgres;

--
-- Name: ServicePornImageSignature; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornImageSignature" (
    "SignatureId" uuid NOT NULL,
    "Signature" character varying(32) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornImageSignature" OWNER TO postgres;

--
-- Name: ServicePornImageType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornImageType" (
    "ImageType" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornImageType" OWNER TO postgres;

--
-- Name: ServicePornListLimit; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornListLimit" (
    "ListLimitId" uuid NOT NULL,
    "OwnerTypeId" smallint NOT NULL,
    "OwnerId" integer NOT NULL,
    "ListTypeId" smallint NOT NULL,
    "Limit" integer NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornListLimit" OWNER TO postgres;

--
-- Name: ServicePornListType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornListType" (
    "ListTypeId" smallint NOT NULL,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornListType" OWNER TO postgres;

--
-- Name: ServicePornOwnerType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornOwnerType" (
    "OwnerTypeId" smallint NOT NULL,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornOwnerType" OWNER TO postgres;

--
-- Name: ServicePornRule; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornRule" (
    "PornRuleId" uuid NOT NULL,
    "OwnerTypeId" smallint NOT NULL,
    "OwnerId" integer NOT NULL,
    "RuleTypeId" smallint NOT NULL,
    "DirectionTypeId" smallint NOT NULL,
    "Enabled" boolean NOT NULL,
    "ActionType" character(1) COLLATE dbo.case_insensitive,
    "SensitivityType" character(1) COLLATE dbo.case_insensitive,
    "UseServiceNotifications" boolean,
    "NotifyAdmin" boolean,
    "NotifySender" boolean,
    "NotifyRecipient" boolean,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornRule" OWNER TO postgres;

--
-- Name: ServicePornRuleType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornRuleType" (
    "RuleTypeId" smallint NOT NULL,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "ActionRequired" boolean NOT NULL,
    "SensitivityRequired" boolean NOT NULL,
    "NotificationRequired" boolean NOT NULL,
    "XmlTemplate" character varying(1000) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornRuleType" OWNER TO postgres;

--
-- Name: ServicePornSensitivityType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornSensitivityType" (
    "SensitivityType" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornSensitivityType" OWNER TO postgres;

--
-- Name: ServicePornTrustedEmail; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornTrustedEmail" (
    "TrustedEmailId" uuid NOT NULL,
    "OwnerTypeId" smallint NOT NULL,
    "OwnerId" integer NOT NULL,
    "TrustedEmailTypeId" smallint NOT NULL,
    "TrustedValue" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "CreatedByUserName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornTrustedEmail" OWNER TO postgres;

--
-- Name: ServicePornTrustedEmailType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornTrustedEmailType" (
    "TrustedEmailTypeId" smallint NOT NULL,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornTrustedEmailType" OWNER TO postgres;

--
-- Name: ServicePornUser; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServicePornUser" (
    "RowId" uuid NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer NOT NULL,
    "EmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LogAll" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundAntiPorn" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundSensitivity" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundAction" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundAdminSend" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundSenderSend" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InboundRecipientSend" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundAntiPorn" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundSensitivity" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundAction" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundAdminSend" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundSenderSend" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundRecipientSend" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "OutboundOopsEmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServicePornUser" OWNER TO postgres;

--
-- Name: ServiceSpam; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceSpam" (
    "RowId" uuid NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "UseDefault" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "EmailAddresses" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "UseMessageLabsWhitelistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseMessageLabsWhitelistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseMessageLabsBlacklistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseMessageLabsBlacklistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseWhitelistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritWhitelistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseWhitelistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritWhitelistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseBlacklistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritBlacklistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseBlacklistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritBlacklistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseORBS" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseRBL" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseRSS" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseDUL" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseEnvelopeFromEmpty" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseIPDomainHeloMismatch" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseInvalidEnvelopeFrom" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseKnownSpam" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseHeuristics" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseMailContainerMatching" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseObfuscatedText" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseLikeKnownSpam" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseTrafficAnalysis" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritToSubDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "HasSpamQuarantine" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseH7" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseH8" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseH9" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseH10" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "PenNotification" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "SpamPenNumber" integer NOT NULL,
    "RetentionPeriod" integer NOT NULL,
    "UserConfigurableNotification" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "NotificationPeriod" integer NOT NULL,
    "QuarantineAdministratorEmail" character varying(2000) NOT NULL COLLATE dbo.case_insensitive,
    "QuarantineFallbackAction" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "SubjectTag" character varying(150) NOT NULL COLLATE dbo.case_insensitive,
    "SubjectTagPosition" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "SubjectTagCharSet" character varying(15) NOT NULL COLLATE dbo.case_insensitive,
    "WhitelistRequest" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "WhitelistRequestRecipient" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "QuarantineReportFrequency" integer NOT NULL,
    "SpamAliasAcknowledgement" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "QuarantineLocaleCode" character varying(20) NOT NULL COLLATE dbo.case_insensitive,
    "UseSig" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "HasADULS" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "HasSUDULS" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "HasADULSMergeOption" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "HasSUDULSMergeOption" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseNewsletterDetection" boolean NOT NULL,
    "UseSPF" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseDMARC" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "NewsLettersAction" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "NewsLettersSubjectTag" character varying(150) NOT NULL COLLATE dbo.case_insensitive,
    "NewsLettersSubjectTagPosition" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "NewsLettersSubjectTagCharSet" character varying(15) NOT NULL COLLATE dbo.case_insensitive,
    "DMARCSubjectTag" character varying(150) NOT NULL COLLATE dbo.case_insensitive,
    "DMARCSubjectTagPosition" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DMARCSubjectTagCharSet" character varying(15) NOT NULL COLLATE dbo.case_insensitive,
    "SPFSubjectTag" character varying(150) NOT NULL COLLATE dbo.case_insensitive,
    "SPFSubjectTagPosition" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "SPFSubjectTagCharSet" character varying(15) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceSpam" OWNER TO postgres;

--
-- Name: ServiceSpamGlobalWBList; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceSpamGlobalWBList" (
    "RowId" uuid NOT NULL,
    "WhiteORBlack" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "IpORDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "ListValue" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceSpamGlobalWBList" OWNER TO postgres;

--
-- Name: ServiceSpamGroup; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceSpamGroup" (
    "SpamGroupId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer NOT NULL,
    "Name" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceSpamGroup" OWNER TO postgres;

--
-- Name: ServiceSpamHierarchy; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceSpamHierarchy" (
    "OwnerTypeId" smallint NOT NULL,
    "OwnerId" integer NOT NULL,
    "InheritDetection" boolean NOT NULL,
    "InheritApprovedList" boolean NOT NULL,
    "InheritBlockedList" boolean NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceSpamHierarchy" OWNER TO postgres;

--
-- Name: ServiceSpamOwnerType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceSpamOwnerType" (
    "OwnerTypeId" smallint NOT NULL,
    "Description" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceSpamOwnerType" OWNER TO postgres;

--
-- Name: ServiceSpamRecipient; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceSpamRecipient" (
    "SpamRecipientId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer NOT NULL,
    "EmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "SpamGroupId" integer,
    "Excluded" boolean NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceSpamRecipient" OWNER TO postgres;

--
-- Name: ServiceSpamRecipientAlias; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceSpamRecipientAlias" (
    "RecipientAliasId" integer NOT NULL,
    "SpamRecipientId" integer NOT NULL,
    "AliasEmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceSpamRecipientAlias" OWNER TO postgres;

--
-- Name: ServiceSpamSettings; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceSpamSettings" (
    "OwnerTypeId" smallint NOT NULL,
    "OwnerId" integer NOT NULL,
    "BulkMailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "UseMessageLabsWhitelistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseMessageLabsWhitelistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseMessageLabsBlacklistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseMessageLabsBlacklistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseWhitelistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritWhitelistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseWhitelistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritWhitelistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseBlacklistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritBlacklistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseBlacklistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritBlacklistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseORBS" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseRBL" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseRSS" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseDUL" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseEnvelopeFromEmpty" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseIPDomainHeloMismatch" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseInvalidEnvelopeFrom" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseKnownSpam" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseHeuristics" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseMailContainerMatching" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseObfuscatedText" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseLikeKnownSpam" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseTrafficAnalysis" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritToSubDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "HasSpamQuarantine" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseH7" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseH8" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseH9" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseH10" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "PenNotification" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "SpamPenNumber" integer NOT NULL,
    "RetentionPeriod" integer NOT NULL,
    "UserConfigurableNotification" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "NotificationPeriod" integer NOT NULL,
    "QuarantineAdministratorEmail" character varying(2000) NOT NULL COLLATE dbo.case_insensitive,
    "QuarantineFallbackAction" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "SubjectTag" character varying(150) NOT NULL COLLATE dbo.case_insensitive,
    "SubjectTagPosition" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "SubjectTagCharSet" character varying(15) NOT NULL COLLATE dbo.case_insensitive,
    "WhitelistRequest" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "WhitelistRequestRecipient" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "QuarantineReportFrequency" integer NOT NULL,
    "SpamAliasAcknowledgement" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "QuarantineLocaleCode" character varying(20) NOT NULL COLLATE dbo.case_insensitive,
    "UseSig" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseNewsletterDetection" boolean NOT NULL,
    "UseSPF" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseDMARC" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "NewsLettersAction" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "NewsLettersSubjectTag" character varying(150) NOT NULL COLLATE dbo.case_insensitive,
    "NewsLettersSubjectTagPosition" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "NewsLettersSubjectTagCharSet" character varying(15) NOT NULL COLLATE dbo.case_insensitive,
    "DMARCSubjectTag" character varying(150) NOT NULL COLLATE dbo.case_insensitive,
    "DMARCSubjectTagPosition" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DMARCSubjectTagCharSet" character varying(15) NOT NULL COLLATE dbo.case_insensitive,
    "SPFSubjectTag" character varying(150) NOT NULL COLLATE dbo.case_insensitive,
    "SPFSubjectTagPosition" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "SPFSubjectTagCharSet" character varying(15) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceSpamSettings" OWNER TO postgres;

--
-- Name: ServiceSpamUser; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceSpamUser" (
    "RowId" uuid NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer NOT NULL,
    "EmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "UseMessageLabsWhitelistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseMessageLabsWhitelistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseMessageLabsBlacklistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseMessageLabsBlacklistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseWhitelistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritWhitelistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseWhitelistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritWhitelistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseBlacklistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritBlacklistIP" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseBlacklistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritBlacklistDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseORBS" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseRBL" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseRSS" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseDUL" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseEnvelopeFromEmpty" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseIPDomainHeloMismatch" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseInvalidEnvelopeFrom" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseKnownSpam" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseHeuristics" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseMailContainerMatching" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseObfuscatedText" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseLikeKnownSpam" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseTrafficAnalysis" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InheritToSubDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "HasSpamQuarantine" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseH7" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseH8" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseH9" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseH10" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "PenNotification" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "SpamPenNumber" integer NOT NULL,
    "RetentionPeriod" integer NOT NULL,
    "UserConfigurableNotification" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "NotificationPeriod" integer NOT NULL,
    "QuarantineAdministratorEmail" character varying(2000) NOT NULL COLLATE dbo.case_insensitive,
    "QuarantineFallbackAction" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "SubjectTag" character varying(150) NOT NULL COLLATE dbo.case_insensitive,
    "SubjectTagPosition" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "SubjectTagCharSet" character varying(15) NOT NULL COLLATE dbo.case_insensitive,
    "WhitelistRequest" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "WhitelistRequestRecipient" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "QuarantineReportFrequency" integer NOT NULL,
    "SpamAliasAcknowledgement" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "QuarantineLocaleCode" character varying(20) NOT NULL COLLATE dbo.case_insensitive,
    "UseSig" character(1) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceSpamUser" OWNER TO postgres;

--
-- Name: ServiceSpamWBItem; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceSpamWBItem" (
    "RowId" uuid NOT NULL,
    "OwnerTypeId" smallint NOT NULL,
    "OwnerId" integer NOT NULL,
    "WhiteORBlack" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "IpORDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "ListValue" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceSpamWBItem" OWNER TO postgres;

--
-- Name: ServiceSpamWBList; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceSpamWBList" (
    "RowId" uuid NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "ResellerDefault" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "WhiteORBlack" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "IpORDomain" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "ListValue" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceSpamWBList" OWNER TO postgres;

--
-- Name: ServiceSpamWBSettings; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceSpamWBSettings" (
    "WBSettingsId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer NOT NULL,
    "WBSettingsTypeId" smallint NOT NULL,
    "ListsEnabledByDefault" boolean NOT NULL,
    "MergeWithParentList" boolean NOT NULL,
    "ListPriority" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceSpamWBSettings" OWNER TO postgres;

--
-- Name: ServiceSpamWBSettingsType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceSpamWBSettingsType" (
    "WBSettingsTypeId" smallint NOT NULL,
    "Description" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceSpamWBSettingsType" OWNER TO postgres;

--
-- Name: ServiceUQ; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceUQ" (
    "UQId" uuid NOT NULL,
    "OwnerId" integer NOT NULL,
    "OwnerTypeId" smallint NOT NULL,
    "UseProvisionDefault" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "QPenId" integer NOT NULL,
    "QPeriodDays" integer NOT NULL,
    "HasPrivacyUsers" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "QuarantineFallbackAction" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceUQ" OWNER TO postgres;

--
-- Name: ServiceUQOwnerService; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceUQOwnerService" (
    "UQId" uuid NOT NULL,
    "ServiceTypeId" integer NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceUQOwnerService" OWNER TO postgres;

--
-- Name: ServiceUQOwnerType; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceUQOwnerType" (
    "OwnerTypeId" smallint NOT NULL,
    "Description" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceUQOwnerType" OWNER TO postgres;

--
-- Name: ServiceUQPrivacyUserSettings; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceUQPrivacyUserSettings" (
    "UQId" uuid NOT NULL,
    "QPeriodDays" integer NOT NULL,
    "HasPairedAdmin" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "HasOptability" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "InitialStatus" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceUQPrivacyUserSettings" OWNER TO postgres;

--
-- Name: ServiceUQUser; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceUQUser" (
    "UserId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer NOT NULL,
    "EmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "RegisteredUser" boolean NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceUQUser" OWNER TO postgres;

--
-- Name: ServiceUQUserExtendedProperties; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceUQUserExtendedProperties" (
    "UserId" integer NOT NULL,
    "IsUQPrivacyUser" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "IsUQAdministrator" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "IsUQGlobalAdministrator" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceUQUserExtendedProperties" OWNER TO postgres;

--
-- Name: ServiceUQUserOptability; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceUQUserOptability" (
    "UserId" integer NOT NULL,
    "ServiceTypeId" integer NOT NULL,
    "HasInbound" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "HasOutbound" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceUQUserOptability" OWNER TO postgres;

--
-- Name: ServiceUser; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceUser" (
    "UserId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "EmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "RegisteredUser" boolean NOT NULL
);


ALTER TABLE dbo."ServiceUser" OWNER TO postgres;

--
-- Name: ServiceUserGroup; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceUserGroup" (
    "UserGroupId" integer NOT NULL,
    "UserGroupName" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "DateDeleted" timestamp(3) without time zone NOT NULL
);


ALTER TABLE dbo."ServiceUserGroup" OWNER TO postgres;

--
-- Name: ServiceUserGroupSpecial; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceUserGroupSpecial" (
    "UserGroupName" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "UserGroupType" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "LockingTimestamp" bytea
);


ALTER TABLE dbo."ServiceUserGroupSpecial" OWNER TO postgres;

--
-- Name: ServiceVirusUser; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."ServiceVirusUser" (
    "RowId" uuid NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer NOT NULL,
    "EmailAddress" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(50) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."ServiceVirusUser" OWNER TO postgres;

--
-- Name: SpamPen; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."SpamPen" (
    "SpamPenNumber" integer NOT NULL,
    "DisplayName" character varying(30) NOT NULL COLLATE dbo.case_insensitive,
    "Description" character varying(255) COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "DateDeleted" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."SpamPen" OWNER TO postgres;

--
-- Name: TLS; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TLS" (
    "TLSId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "TLSToMTA" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "TLSFromMTA" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "UseDefault" boolean NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."TLS" OWNER TO postgres;

--
-- Name: TLSCNOverride; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TLSCNOverride" (
    "TLSCNOverrideId" integer NOT NULL,
    "DomainId" integer NOT NULL,
    "CertificateCommonName" character varying(64) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."TLSCNOverride" OWNER TO postgres;

--
-- Name: TLSDomainLevelConfig; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TLSDomainLevelConfig" (
    "DomainId" integer NOT NULL,
    "TLSStaticRoute" character varying(261) COLLATE dbo.case_insensitive,
    "ConfigPath" character varying(100) COLLATE dbo.case_insensitive,
    "UseConfigPath" boolean NOT NULL,
    "TLSCertValidationId" smallint NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."TLSDomainLevelConfig" OWNER TO postgres;

--
-- Name: TLSEnforcement; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TLSEnforcement" (
    "TLSEnforcementId" integer NOT NULL,
    "TLSId" integer NOT NULL,
    "IsEnabled" boolean NOT NULL,
    "EnforceInbound" smallint NOT NULL,
    "EnforceOutbound" smallint NOT NULL,
    "TLSEnforcementTypeId" smallint NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."TLSEnforcement" OWNER TO postgres;

--
-- Name: TLSEnforcementDomainGroup; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TLSEnforcementDomainGroup" (
    "TLSEnforcementId" integer NOT NULL,
    "TLSPartnerDomainGroupId" integer NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."TLSEnforcementDomainGroup" OWNER TO postgres;

--
-- Name: TLSPartnerCNOverride; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TLSPartnerCNOverride" (
    "TLSPartnerCNOverrideId" integer NOT NULL,
    "TLSPartnerDomainId" integer NOT NULL,
    "CertificateCommonName" character varying(64) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."TLSPartnerCNOverride" OWNER TO postgres;

--
-- Name: TLSPartnerDomain; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TLSPartnerDomain" (
    "TLSPartnerDomainId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "TLSStaticRoute" character varying(261) COLLATE dbo.case_insensitive,
    "IsEnabled" boolean NOT NULL,
    "TLSPartnerDomainGroupId" integer NOT NULL,
    "DisableTLSFromMTA" boolean NOT NULL,
    "TLSCertValidationId" smallint NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."TLSPartnerDomain" OWNER TO postgres;

--
-- Name: TLSPartnerDomainGroup; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TLSPartnerDomainGroup" (
    "TLSPartnerDomainGroupId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainGroupName" character varying(100) NOT NULL COLLATE dbo.case_insensitive,
    "IsSharedWithChildCustomers" boolean NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."TLSPartnerDomainGroup" OWNER TO postgres;

--
-- Name: TLSPartnerSubdomainExclusion; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TLSPartnerSubdomainExclusion" (
    "TLSPartnerSubdomainExclusionId" integer NOT NULL,
    "TLSPartnerDomainId" integer NOT NULL,
    "SubdomainName" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."TLSPartnerSubdomainExclusion" OWNER TO postgres;

--
-- Name: TLSServiceConfig; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TLSServiceConfig" (
    "TLSServiceConfigId" integer NOT NULL,
    "ConfigKey" character varying(50) NOT NULL COLLATE dbo.case_insensitive,
    "ConfigValue" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."TLSServiceConfig" OWNER TO postgres;

--
-- Name: TLSSubdomainExclusion; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TLSSubdomainExclusion" (
    "TLSSubdomainExclusionId" integer NOT NULL,
    "DomainId" integer NOT NULL,
    "SubdomainName" character varying(261) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."TLSSubdomainExclusion" OWNER TO postgres;

--
-- Name: TimeZone; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TimeZone" (
    "TimezoneId" integer NOT NULL,
    "TimeZoneName" character varying(128) NOT NULL COLLATE dbo.case_insensitive,
    "InternalTimeZoneName" character varying(128) NOT NULL COLLATE dbo.case_insensitive,
    "STDAbbr" character varying(12) NOT NULL COLLATE dbo.case_insensitive,
    "STDName" character varying(25) NOT NULL COLLATE dbo.case_insensitive,
    "DSTAbbr" character varying(12) NOT NULL COLLATE dbo.case_insensitive,
    "DSTName" character varying(25) NOT NULL COLLATE dbo.case_insensitive,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "Enabled" boolean NOT NULL
);


ALTER TABLE dbo."TimeZone" OWNER TO postgres;

--
-- Name: TimeZoneOffset; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TimeZoneOffset" (
    "TimezoneId" integer NOT NULL,
    "GMTOffset" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DSTAdjust" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DSTStartDate" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DSTStartTime" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DSTEndDate" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "DSTEndTime" character varying(10) NOT NULL COLLATE dbo.case_insensitive,
    "StartDate" timestamp(3) without time zone NOT NULL,
    "EndDate" timestamp(3) without time zone NOT NULL,
    "DateCreated" timestamp(3) without time zone NOT NULL,
    "DateAmended" timestamp(3) without time zone NOT NULL,
    "whoAmended_nt_username" character varying(255) NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."TimeZoneOffset" OWNER TO postgres;

--
-- Name: TooBig; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."TooBig" (
    "TooBigId" integer NOT NULL,
    "CustomerId" integer NOT NULL,
    "DomainId" integer,
    "UseDefault" boolean DEFAULT true NOT NULL,
    "CheckUs_maxEmailSize" integer DEFAULT 0 NOT NULL,
    "IsReseller" boolean DEFAULT false NOT NULL,
    "DateCreated" timestamp(3) without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
    "DateAmended" timestamp(3) without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
    "whoAmended_nt_username" character varying(255) DEFAULT CURRENT_USER NOT NULL COLLATE dbo.case_insensitive,
    "WhoAmended_hostname" character varying(255) DEFAULT inet_client_addr() NOT NULL COLLATE dbo.case_insensitive
);


ALTER TABLE dbo."TooBig" OWNER TO postgres;

--
-- Name: UserGroupMembership; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo."UserGroupMembership" (
    "GroupId" integer NOT NULL,
    "MemberId" integer NOT NULL,
    "MemberType" character(1) NOT NULL COLLATE dbo.case_insensitive,
    "DateDeleted" timestamp(3) without time zone NOT NULL
);


ALTER TABLE dbo."UserGroupMembership" OWNER TO postgres;

--
-- Name: dbrelease_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.dbrelease_seq
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.dbrelease_seq OWNER TO postgres;

--
-- Name: dbreleasechangelog_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.dbreleasechangelog_seq
    START WITH 3306
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.dbreleasechangelog_seq OWNER TO postgres;

--
-- Name: hkindexmaintenancelog_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.hkindexmaintenancelog_seq
    START WITH 405
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.hkindexmaintenancelog_seq OWNER TO postgres;

--
-- Name: mspeer_lsns_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.mspeer_lsns_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.mspeer_lsns_seq OWNER TO postgres;

--
-- Data for Name: ATPAlertMalware; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ATPAlertMalware" ("AlertId", "CustomerId", "DomainId", "UseDefault", "InboundNoRecipientOops", "OutboundNoSenderOops", "InboundNoAdminOops", "OutboundNoAdminOops", "LocaleId", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ATPDMASRegion; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ATPDMASRegion" ("ATPDMASRegionId", "CustomerId", "DomainId", "DMASRegions", "UseDefault", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ATPService; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ATPService" ("ATPServiceId", "CustomerId", "DomainId", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname", "DMASEnabled", "DMASWaitThresholdPeriod", "UseDefault") FROM stdin;
\.


--
-- Data for Name: AllDomains; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."AllDomains" ("DomainId", "Domain", "CustomerId", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "IsBulkMail") FROM stdin;
\.


--
-- Data for Name: BlacklistMessage; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."BlacklistMessage" ("CustomerId", "DomainId", "BlacklistType", "Message", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "RowId") FROM stdin;
\.


--
-- Data for Name: BulkMailSender; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."BulkMailSender" ("UserId") FROM stdin;
\.


--
-- Data for Name: Cluster; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Cluster" ("ClusterId", "ClusterName", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ClusterServer; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ClusterServer" ("ClusterId", "ServerId", "TowerId", "ServerName", "DisplayName", "ServerTypeId", "MaxRecommendedUsers", "ActiveServerConfigId", "ServerSpecification", "ServerSoftware", "IPAddress_Mail", "IPAddress_Services", "SubNet", "IPAddress_Private", "SubNet_Private", "internalDomainName", "SQLNamePrefix", "Status", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ClusterServerConfig; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ClusterServerConfig" ("ClusterServerConfigId", "ClusterId", "ServerId", "ServerConfigId", "CustomerId", "DomainId", "DomainRole", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ClusterServerConfigType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ClusterServerConfigType" ("ServerConfigId", "Description", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ClusterServerType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ClusterServerType" ("ServerTypeId", "ServerType", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ClusterServer_CheckUsAddIns; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ClusterServer_CheckUsAddIns" ("CS_CheckUsAddInsId", "ClusterId", "ServerId", "PseudoDomainName", "AppendCheckedTitle", "AppendCheckedBody", "CheckVirus", "WarnOutbound", "BannerOnOutbound", "Banner", "BannerText", "BannerOnInbound", "InBoundBanner", "InBoundBannerText", "Email", "StopWordMacro", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ClusterServer_OtherAddIns; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ClusterServer_OtherAddIns" ("CS_OtherAddInsId", "ClusterId", "ServerId", "configFileTypeId", "AddInText", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ClusterSuperServer; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ClusterSuperServer" ("MasterServer_ClusterId", "MasterServer_ServerId", "Clone_ClusterId", "Clone_ServerId", "RowId") FROM stdin;
\.


--
-- Data for Name: ConfigChangeApplied; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ConfigChangeApplied" ("ConfigChangeAppliedId", "ConfigBuilderHostname", "ClusterId", "ServerId", "configFileTypeId", "CCRRequestId", "CCRDate", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ConfigChangeApplied_DelRequest; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ConfigChangeApplied_DelRequest" ("DelRequestId", "ServerId", "DateRequested") FROM stdin;
\.


--
-- Data for Name: ConfigChangeRequest; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ConfigChangeRequest" ("ConfigChangeRequestId", "ClusterId", "ServerId", "configFileTypeId", "CCRRequestId", "CCRDate", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ConfigFileType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ConfigFileType" ("configFileTypeId", "configFileDescription") FROM stdin;
\.


--
-- Data for Name: CustomMessage; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomMessage" ("CustomMessageKey", "ResellerId", "CustomerId", "DomainId", "CustomMessageGroupId", "CustomMessageTypeId", "CustomMessageStateId", "MessageUId", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: CustomMessageEmail; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomMessageEmail" ("MessageUId", "MessageLanguageId", "MessageFrom", "MessageSubject", "MessageBody", "MessageMeta", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "SequenceNumber") FROM stdin;
\.


--
-- Data for Name: CustomMessageLookup; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomMessageLookup" ("CustomMessageLookupId", "TypeId", "ParentTypeId", "Description", "fxName", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: CustomMessageText; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomMessageText" ("MessageUId", "MessageLanguageTypeId", "Description", "Contents", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: CustomTextContent; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomTextContent" ("CustomTextContentId", "TargetLocaleId", "CustomTextContentLocaleId", "DateAmended", "whoAmended_nt_username", "VersionNumber") FROM stdin;
\.


--
-- Data for Name: CustomTextContentLine; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomTextContentLine" ("CustomTextContentLocaleId", "CustomTextContentLineNo", "CustomTextContentLine") FROM stdin;
\.


--
-- Data for Name: CustomTextHierarchy; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomTextHierarchy" ("CustomTextId", "CustomTextTypeId", "OwnerTypeId", "OwnerId", "ForUseByChildren", "State", "CustomTextContentId", "ParentCustomTextId") FROM stdin;
\.


--
-- Data for Name: CustomerConfig; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomerConfig" ("CustomerConfigId", "CustomerId", "DomainId", "DomainNumberOfUsers", "CheckUs_BrandMe", "CheckUs_AppendCheckedTitle", "CheckUs_CheckVirus", "CheckUs_WarnOutbound", "CheckUs_BannerOnOutbound", "CheckUs_Banner", "BannerText", "CheckUs_BannerOnInbound", "CheckUs_InBoundBanner", "InBoundBannerText", "CheckUs_Email", "CheckUs_StopWordMacro", "smtproutes_wildCard", "CheckUs_AppendDisclaimer", "CheckUs_Disclaimer", "disclaimerText", "CheckUs_customMessageDir", "DaysToRetry", "MaxRetryWarnings", "HoursBetweenWarnings", "InboundNoSenderOops", "InboundNoRecipientOops", "OutboundNoSenderOops", "OutboundOopsEmailAddress", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "InboundNoAdminOops", "OutboundNoAdminOops") FROM stdin;
\.


--
-- Data for Name: CustomerConfigDefault; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomerConfigDefault" ("CustomerId", "CheckUs_Email", "CheckUs_BannerOnOutbound", "OutBoundBannerText", "CheckUs_BannerOnInbound", "InBoundBannerText", "smtproutes_wildCard", "CheckUs_AppendDisclaimer", "disclaimerText", "primaryServerId", "backupServerId", "backupServerId1", "backupServerId2", "DaysToRetry", "MaxRetryWarnings", "HoursBetweenWarnings", "InboundNoSenderOops", "InboundNoRecipientOops", "OutboundNoSenderOops", "OutboundOopsEmailAddress", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "InboundNoAdminOops", "OutboundNoAdminOops") FROM stdin;
\.


--
-- Data for Name: CustomerConfigHosts; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomerConfigHosts" ("CustomerConfigHostsId", "CustomerId", "DataType", "HostIPAddress", "HostSubNet", "FirstIPNumeric", "LastIPNumeric", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "AuditInfoId", "ActiveState", "BlacklistExpiryDate", "TechChecksState", "TechChecksTestDate", "TechChecksCalledByUserId") FROM stdin;
\.


--
-- Data for Name: CustomerHostedMailProvider; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomerHostedMailProvider" ("CustomerHostedMailProviderId", "CustomerId", "HostedMailProviderId", "DomainId", "DateCreated", "whoAmended_nt_username", "WhoAmended_hostname", "AuditInfoId") FROM stdin;
\.


--
-- Data for Name: CustomerNamedRoute; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomerNamedRoute" ("NamedRouteId", "CustomerId", "NamedRoute", "DateCreated", "DateAmended", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: CustomerNamedRouteIPAddress; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomerNamedRouteIPAddress" ("NamedRouteIPAddressId", "NamedRouteId", "IPAddressId", "IPAddressOrder", "DateCreated", "DateAmended") FROM stdin;
\.


--
-- Data for Name: CustomerService; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomerService" ("CustomerId", "ServiceTypeId", "Enabled", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: CustomerServiceCode; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomerServiceCode" ("CustomerServiceCodeTypeId", "CodeId", "Code", "QmailReason", "DisplayText", "DisplaySortOrderUI", "Description", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: CustomerServiceType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."CustomerServiceType" ("TypeId", "ParentTypeId", "Description", "DisplaySequence", "TimesUsed", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "MinApiVersion") FROM stdin;
\.


--
-- Data for Name: Customers; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Customers" ("CustomerId", "ActiveState", "DateSuspended", "ParentResellerId", "CustomerName", "MincRef", "ActualNumberUsers", "CustomerExtRef", "AdminName", "AdminPassword", "ContactEmail", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "IsBulkMail", "HighVolumeInd", "PreferredLocaleId", "EnterpriseLicenceKey") FROM stdin;
\.


--
-- Data for Name: DLP; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLP" ("DLPId", "CustomerId", "DomainId", "ServiceTypeId", "UseDefault", "AdminEmailAddress", "PreventSubDomainInheritance", "DefaultTimeZoneId", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname", "InternalNotificationFromAddress", "ExternalNotificationFromAddress", "SubjectTagPosition", "SubjectTag", "EndUserNotifyFlag", "RptShowMatchedContentFlag", "RptShowSurroundTextFlag", "AdminNotificationTypeId", "UserNotificationTypeId", "IsCustomNotification") FROM stdin;
\.


--
-- Data for Name: DLPActionParamCategory; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPActionParamCategory" ("ParamCategory", "Description") FROM stdin;
\.


--
-- Data for Name: DLPActionParamType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPActionParamType" ("ParamType", "ParamCategory", "XMLSchemaElement", "Description") FROM stdin;
\.


--
-- Data for Name: DLPActionScalarParam; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPActionScalarParam" ("ScalarParamId", "PolicyId", "ScalarValue", "ScalarValueBinary", "ParamType", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DLPActionType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPActionType" ("ActionType", "XMLSchemaElement", "Description", "ActionCategory") FROM stdin;
\.


--
-- Data for Name: DLPActionValidParamType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPActionValidParamType" ("ActionType", "ParamType") FROM stdin;
\.


--
-- Data for Name: DLPCondition; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPCondition" ("ConditionId", "RuleId", "ConditionType", "JoinType", "ConditionScopeBody", "ConditionScopeSubject", "ConditionScopeAttachment", "ConditionScopeHeader", "ConditionScopeMetadata", "ScanOfficeDocs", "MatchCaseFlag", "MatchCountFlag", "MatchCount", "MatchUniqueCountFlag", "ExceptionFlag", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname", "DataObfuscationType") FROM stdin;
\.


--
-- Data for Name: DLPConditionAddressParam; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPConditionAddressParam" ("AddressParamId", "ConditionId", "GroupId", "GroupType", "ParamType", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DLPConditionGroup; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPConditionGroup" ("ConditionGroupId", "CustomerId", "DomainId", "Name", "Scope", "ParamType", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname", "Description", "IsSuper", "ConditionGroupCategoryId") FROM stdin;
\.


--
-- Data for Name: DLPConditionGroupCategory; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPConditionGroupCategory" ("ConditionGroupCategoryId", "CategoryName", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DLPConditionGroupData; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPConditionGroupData" ("ConditionGroupDataId", "ConditionGroupId", "ConditionGroupData", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DLPConditionGroupParam; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPConditionGroupParam" ("GroupParamId", "ConditionId", "ConditionGroupId", "ParamType", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DLPConditionParamCategory; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPConditionParamCategory" ("ParamCategory", "Description") FROM stdin;
\.


--
-- Data for Name: DLPConditionParamType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPConditionParamType" ("ParamType", "ParamCategory", "XMLSchemaElement", "Description") FROM stdin;
\.


--
-- Data for Name: DLPConditionScalarParam; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPConditionScalarParam" ("ScalarParamId", "ConditionId", "ScalarValue", "ScalarValueOperator", "ParamType", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DLPConditionTimeParam; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPConditionTimeParam" ("TimeParamId", "ConditionId", "TimezoneId", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "FromTime", "ToTime", "ParamType", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DLPConditionType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPConditionType" ("ConditionType", "ValidJoinTypes", "XMLSchemaElement", "Description", "HasDataObfuscation") FROM stdin;
\.


--
-- Data for Name: DLPConditionValidParamType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPConditionValidParamType" ("ConditionType", "ParamType") FROM stdin;
\.


--
-- Data for Name: DLPCustomerExclusionAddress; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPCustomerExclusionAddress" ("RowId", "CustomerId", "DomainId", "EmailAddress", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DLPGlobalExclusionAddress; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPGlobalExclusionAddress" ("AddressId", "EmailAddress", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DLPPolicy; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPPolicy" ("PolicyId", "CustomerId", "DomainId", "PolicyName", "PolicyDescription", "Sequence", "Active", "Template", "AdminEmailAddress", "SendToEmailAddress", "PolicyRuleOperator", "PolicyActionTypeId", "PolicyActionExit", "PolicyAdminNotificationTypeId", "PolicyUserNotificationTypeId", "PolicyDirection", "ServiceTypeId", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname", "IsTestPolicy", "IsCustomPolicyNotification") FROM stdin;
\.


--
-- Data for Name: DLPPolicyActionType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPPolicyActionType" ("PolicyActionTypeId", "PolicyActionType", "Description", "ActionCategory", "IsAvailableToAll", "IsExitAction", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DLPPolicyActionTypeMapping; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPPolicyActionTypeMapping" ("PolicyActionTypeId", "ActionType", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DLPPolicyServiceType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPPolicyServiceType" ("DLPPolicyServiceTypeId", "DLPPolicyId", "PolicyServiceTypeId", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DLPRule; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPRule" ("RuleId", "PolicyId", "RuleConditionOperator", "RuleName", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DLPSuperConditionGroup; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DLPSuperConditionGroup" ("SuperConditionGroupId", "SuperConditionGroupDataId", "ExclusionFlag", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: DMASGlobalControl; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DMASGlobalControl" ("DMASGlobalControlId", "DMASGlobalEnable", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: Disclaimer; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Disclaimer" ("DisclaimerId", "DisclaimerName", "CustomerId", "Priority", "IsDefault", "IsEnabled", "DateCreated", "DateAmended", "whoAmended_nt_username", "whoAmended_nt_hostname", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: DisclaimerGroup; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DisclaimerGroup" ("DisclaimerId", "GroupId", "GroupType", "DateCreated", "DateAmended", "whoAmended_nt_username", "whoAmended_nt_hostname") FROM stdin;
\.


--
-- Data for Name: DomainConfigDefault; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."DomainConfigDefault" ("DomainId", "useBannerDefaults", "useSpamDefaults", "useInboundServerDefaults", "AuditInfoId", "UseEmailDefaults", "UseVirusDefaults") FROM stdin;
\.


--
-- Data for Name: EICService; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."EICService" ("EICServiceId", "CustomerId", "DomainId", "UseDefault", "IPWhitelistConditionGroupId", "DomainWhitelistConditionGroupId", "EmailWhitelistServiceUserGroupId", "EICDomainSettingsId", "EICUserSettingsId", "EICMismatchSettingsid", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: EmailServerActiveState; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."EmailServerActiveState" ("ActiveState", "Description") FROM stdin;
\.


--
-- Data for Name: EmailServerTechChecksState; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."EmailServerTechChecksState" ("TechChecksState", "Description") FROM stdin;
\.


--
-- Data for Name: HostedMailProvider; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."HostedMailProvider" ("HostedMailProviderId", "ProviderName", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: HostedMailProviderCheck; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."HostedMailProviderCheck" ("HostedMailProviderCheckId", "HostedMailProviderId", "CheckType", "CheckAddress", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: IMCustomer; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."IMCustomer" ("CustomerId", "EmailFormatID", "ArchiveFormatID", "AdminEmailAddress", "ArchiveEmailAddress", "ArchiveEmailFrequency", "ArchiveEmailStartDate", "ArchiveEmailEnabled", "CCDomainName", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: InterfaceUQPrivacyUserSettings; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."InterfaceUQPrivacyUserSettings" ("OwnerId", "OwnerTypeId", "NotificationFrequencyId", "NotificationDefaultLang", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: LDAPGroup; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."LDAPGroup" ("LDAPGroupId", "CustomerId", "GroupName", "DateDeleted") FROM stdin;
\.


--
-- Data for Name: LDAPUser; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."LDAPUser" ("LDAPUserId", "CustomerId", "PrimaryEmailAddress", "DateDeleted", "ReplRegionId") FROM stdin;
\.


--
-- Data for Name: LDAPUserGroupMembership; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."LDAPUserGroupMembership" ("LDAPUserGroupMembershipId", "LDAPUserId", "LDAPGroupId", "IsDirectMembership", "DateDeleted") FROM stdin;
\.


--
-- Data for Name: Locale; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Locale" ("LocaleId", "LocaleName") FROM stdin;
\.


--
-- Data for Name: LocaleDataTable; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."LocaleDataTable" ("LocaleDataTableId", "LocaleDataTableName") FROM stdin;
\.


--
-- Data for Name: LocaleDataTableStrings; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."LocaleDataTableStrings" ("LocaleDataTableStringId", "LocaleDataTableId", "LocaleDataTableKeyId", "LocaleId", "LocaleDataTableString", "DateCreated", "DateAmended", "LocaleDataTableStringDesc") FROM stdin;
\.


--
-- Data for Name: Pen; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Pen" ("PenId", "PenTypeId", "DisplayName", "PenHostName", "IPAddress", "Description", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: PenType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."PenType" ("PenTypeId", "PenType", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: PolicyServiceType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."PolicyServiceType" ("PolicyServiceTypeId", "ParentTypeId", "Description", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: PublicBlacklist; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."PublicBlacklist" ("PublicBlacklistId", "CodeId", "Status", "RetiredDate", "ActiveList", "HomePageURL", "SpamDNSUserName", "SpamDNSLookupURL", "SpamDNSErrorText", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: Reseller; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."Reseller" ("CustomerId", "BannerOnOutbound", "OutBoundBanner", "OutBoundBannerText", "OutboundOopsEmailAddress", "BannerOnInbound", "InBoundBanner", "InBoundBannerText", "isTrial", "CheckUs_Email", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: SMTPRoutes; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."SMTPRoutes" ("SMTPRoutesId", "CustomerId", "DomainId", "smtproutes_DeliveryAddress", "smtpRoutes_Order", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "AuditInfoId", "ActiveState", "BlacklistExpiryDate", "TechChecksState", "TechChecksTestDate", "TechChecksCalledByUserId") FROM stdin;
\.


--
-- Data for Name: ServiceCF; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCF" ("ServiceCFId", "CustomerId", "DomainId", "UseDefault", "AdminEmailAddress", "PreventSubDomainInheritance", "DefaultTimeZoneId", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp", "InternalNotificationFromAddress", "ExternalNotificationFromAddress", "SubjectTagPosition", "SubjectTag", "SubjectTagCharSet", "CCPenNumber") FROM stdin;
\.


--
-- Data for Name: ServiceCFAction; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFAction" ("ActionId", "RuleId", "ActionType", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFActionParamCategory; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFActionParamCategory" ("ParamCategory", "Description", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFActionParamType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFActionParamType" ("ParamType", "ParamCategory", "XMLSchemaElement", "Description", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFActionScalarParam; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFActionScalarParam" ("ScalarParamId", "ActionId", "ScalarValue", "ParamType", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp", "ScalarValueBinary") FROM stdin;
\.


--
-- Data for Name: ServiceCFActionType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFActionType" ("ActionType", "XMLSchemaElement", "Description", "LockingTimestamp", "ActionValue", "ActionCategory") FROM stdin;
\.


--
-- Data for Name: ServiceCFActionValidParamType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFActionValidParamType" ("ActionType", "ParamType", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFCondition; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFCondition" ("ConditionId", "RuleId", "ConditionType", "JoinType", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFConditionAddressParam; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFConditionAddressParam" ("AddressParamId", "ConditionId", "UserGroupId", "ParamType", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp", "LDAPGroupId", "IMSSUserGroupId", "IMSSUserGroupType") FROM stdin;
\.


--
-- Data for Name: ServiceCFConditionGroup; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFConditionGroup" ("ConditionGroupId", "CustomerId", "DomainId", "Name", "Scope", "ParamType", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp", "Description", "IsSuper", "ServiceTypeId") FROM stdin;
\.


--
-- Data for Name: ServiceCFConditionGroupEntryCategory; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFConditionGroupEntryCategory" ("EntryCategory", "Description", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFConditionGroupParam; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFConditionGroupParam" ("GroupParamId", "ConditionId", "ConditionGroupId", "ParamType", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp", "Threshold") FROM stdin;
\.


--
-- Data for Name: ServiceCFConditionGroupValidEntryCategory; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFConditionGroupValidEntryCategory" ("ParamType", "EntryCategory", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFConditionParamCategory; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFConditionParamCategory" ("ParamCategory", "Description", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFConditionParamType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFConditionParamType" ("ParamType", "ParamCategory", "XMLSchemaElement", "Description", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFConditionScalarParam; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFConditionScalarParam" ("ScalarParamId", "ConditionId", "ScalarValue", "ParamType", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFConditionType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFConditionType" ("ConditionType", "ValidJoinTypes", "XMLSchemaElement", "Description", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFConditionValidParamType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFConditionValidParamType" ("ConditionType", "ParamType", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFCustomerExclusionAddress; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFCustomerExclusionAddress" ("RowId", "CustomerId", "DomainId", "EmailAddress", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceCFDomain; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFDomain" ("CFDomainId", "ConditionGroupId", "DomainName", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFGlobalExclusionAddress; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFGlobalExclusionAddress" ("AddressId", "EmailAddress", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceCFLexExpression; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFLexExpression" ("LexExpressionId", "ConditionGroupId", "LexicalExpression", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFRegExpression; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFRegExpression" ("RegExpressionId", "ConditionGroupId", "RegularExpression", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp", "Name", "Description") FROM stdin;
\.


--
-- Data for Name: ServiceCFRegExpressionTemplateReference; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFRegExpressionTemplateReference" ("RegExpReferenceId", "ConditionGroupId", "RegExpressionId", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFRule; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFRule" ("RuleId", "CustomerId", "DomainId", "RuleName", "Sequence", "Active", "Template", "AdminEmailAddress", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp", "ScanOfficeDocs", "UseDefaultSubjectTag", "SubjectTagPosition", "SubjectTag", "SubjectTagCharSet", "UseDefaultSendToEmailAddress", "SendToEmailAddress", "ConditionScopeBody", "ConditionScopeSubject", "ConditionScopeAttachment", "ConditionScopeHeader", "SenderConditionsOperator", "RecipientConditionsOperator", "EmailContentConditionsOperator", "AttachmentConditionsOperator", "RuleOperator", "ServiceTypeId") FROM stdin;
\.


--
-- Data for Name: ServiceCFSuperGroupEntry; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFSuperGroupEntry" ("EntryId", "SuperConditionGroupId", "EntryConditionGroupId", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFTimeRestrictionDayPart; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFTimeRestrictionDayPart" ("DayPartId", "ConditionGroupId", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFTimeRestrictionTimePart; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFTimeRestrictionTimePart" ("TimePartId", "ConditionGroupId", "FromTime", "ToTime", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFTimeRestrictionTimeZonePart; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFTimeRestrictionTimeZonePart" ("TimezonePartId", "ConditionGroupId", "TimezoneId", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceCFTimeZone; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceCFTimeZone" ("TimezoneId", "ZoneKey", "RawOffset", "SystemDefault", "ShowInUI", "UsesDaylightTime", "NormalShortName", "NormalLongName", "DaylightShortName", "DaylightLongName", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceGoodRcptTo; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceGoodRcptTo" ("RowId", "CustomerId", "DomainId", "UseDefault", "ReceiveAction", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "IsClientManaged", "LastUploadTime", "LastUploadApp") FROM stdin;
\.


--
-- Data for Name: ServicePorn; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePorn" ("RowId", "CustomerId", "DomainId", "UseDefault", "EmailAddresses", "LogAll", "InboundAntiPorn", "InboundSensitivity", "InboundAction", "InboundAdminSend", "InboundSenderSend", "InboundRecipientSend", "OutboundAntiPorn", "OutboundSensitivity", "OutboundAction", "OutboundAdminSend", "OutboundSenderSend", "OutboundRecipientSend", "OutboundOopsEmailAddress", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "SubjectTagPosition", "SubjectTag", "SubjectTagCharSet") FROM stdin;
\.


--
-- Data for Name: ServicePornActionType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornActionType" ("ActionType", "Description") FROM stdin;
\.


--
-- Data for Name: ServicePornDirectionType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornDirectionType" ("DirectionTypeId", "Description") FROM stdin;
\.


--
-- Data for Name: ServicePornGlobalImage; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornGlobalImage" ("ImageId", "ClientName", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServicePornImage; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornImage" ("ImageId", "OwnerTypeId", "OwnerId", "SignatureId", "ImageType", "Description", "CreatedByUserName", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServicePornImageSignature; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornImageSignature" ("SignatureId", "Signature", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServicePornImageType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornImageType" ("ImageType", "Description") FROM stdin;
\.


--
-- Data for Name: ServicePornListLimit; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornListLimit" ("ListLimitId", "OwnerTypeId", "OwnerId", "ListTypeId", "Limit", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServicePornListType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornListType" ("ListTypeId", "Description") FROM stdin;
\.


--
-- Data for Name: ServicePornOwnerType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornOwnerType" ("OwnerTypeId", "Description") FROM stdin;
\.


--
-- Data for Name: ServicePornRule; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornRule" ("PornRuleId", "OwnerTypeId", "OwnerId", "RuleTypeId", "DirectionTypeId", "Enabled", "ActionType", "SensitivityType", "UseServiceNotifications", "NotifyAdmin", "NotifySender", "NotifyRecipient", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServicePornRuleType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornRuleType" ("RuleTypeId", "Description", "ActionRequired", "SensitivityRequired", "NotificationRequired", "XmlTemplate") FROM stdin;
\.


--
-- Data for Name: ServicePornSensitivityType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornSensitivityType" ("SensitivityType", "Description") FROM stdin;
\.


--
-- Data for Name: ServicePornTrustedEmail; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornTrustedEmail" ("TrustedEmailId", "OwnerTypeId", "OwnerId", "TrustedEmailTypeId", "TrustedValue", "Description", "CreatedByUserName", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServicePornTrustedEmailType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornTrustedEmailType" ("TrustedEmailTypeId", "Description") FROM stdin;
\.


--
-- Data for Name: ServicePornUser; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServicePornUser" ("RowId", "CustomerId", "DomainId", "EmailAddress", "LogAll", "InboundAntiPorn", "InboundSensitivity", "InboundAction", "InboundAdminSend", "InboundSenderSend", "InboundRecipientSend", "OutboundAntiPorn", "OutboundSensitivity", "OutboundAction", "OutboundAdminSend", "OutboundSenderSend", "OutboundRecipientSend", "OutboundOopsEmailAddress", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceSpam; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceSpam" ("RowId", "CustomerId", "DomainId", "UseDefault", "EmailAddresses", "UseMessageLabsWhitelistIP", "UseMessageLabsWhitelistDomain", "UseMessageLabsBlacklistIP", "UseMessageLabsBlacklistDomain", "UseWhitelistIP", "InheritWhitelistIP", "UseWhitelistDomain", "InheritWhitelistDomain", "UseBlacklistIP", "InheritBlacklistIP", "UseBlacklistDomain", "InheritBlacklistDomain", "UseORBS", "UseRBL", "UseRSS", "UseDUL", "UseEnvelopeFromEmpty", "UseIPDomainHeloMismatch", "UseInvalidEnvelopeFrom", "UseKnownSpam", "UseHeuristics", "UseMailContainerMatching", "UseObfuscatedText", "UseLikeKnownSpam", "UseTrafficAnalysis", "InheritToSubDomain", "HasSpamQuarantine", "UseH7", "UseH8", "UseH9", "UseH10", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "PenNotification", "SpamPenNumber", "RetentionPeriod", "UserConfigurableNotification", "NotificationPeriod", "QuarantineAdministratorEmail", "QuarantineFallbackAction", "SubjectTag", "SubjectTagPosition", "SubjectTagCharSet", "WhitelistRequest", "WhitelistRequestRecipient", "QuarantineReportFrequency", "SpamAliasAcknowledgement", "QuarantineLocaleCode", "UseSig", "HasADULS", "HasSUDULS", "HasADULSMergeOption", "HasSUDULSMergeOption", "UseNewsletterDetection", "UseSPF", "UseDMARC", "NewsLettersAction", "NewsLettersSubjectTag", "NewsLettersSubjectTagPosition", "NewsLettersSubjectTagCharSet", "DMARCSubjectTag", "DMARCSubjectTagPosition", "DMARCSubjectTagCharSet", "SPFSubjectTag", "SPFSubjectTagPosition", "SPFSubjectTagCharSet") FROM stdin;
\.


--
-- Data for Name: ServiceSpamGlobalWBList; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceSpamGlobalWBList" ("RowId", "WhiteORBlack", "IpORDomain", "ListValue", "Description", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceSpamGroup; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceSpamGroup" ("SpamGroupId", "CustomerId", "DomainId", "Name", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceSpamHierarchy; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceSpamHierarchy" ("OwnerTypeId", "OwnerId", "InheritDetection", "InheritApprovedList", "InheritBlockedList", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceSpamOwnerType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceSpamOwnerType" ("OwnerTypeId", "Description") FROM stdin;
\.


--
-- Data for Name: ServiceSpamRecipient; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceSpamRecipient" ("SpamRecipientId", "CustomerId", "DomainId", "EmailAddress", "SpamGroupId", "Excluded", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceSpamRecipientAlias; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceSpamRecipientAlias" ("RecipientAliasId", "SpamRecipientId", "AliasEmailAddress", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceSpamSettings; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceSpamSettings" ("OwnerTypeId", "OwnerId", "BulkMailAddress", "UseMessageLabsWhitelistIP", "UseMessageLabsWhitelistDomain", "UseMessageLabsBlacklistIP", "UseMessageLabsBlacklistDomain", "UseWhitelistIP", "InheritWhitelistIP", "UseWhitelistDomain", "InheritWhitelistDomain", "UseBlacklistIP", "InheritBlacklistIP", "UseBlacklistDomain", "InheritBlacklistDomain", "UseORBS", "UseRBL", "UseRSS", "UseDUL", "UseEnvelopeFromEmpty", "UseIPDomainHeloMismatch", "UseInvalidEnvelopeFrom", "UseKnownSpam", "UseHeuristics", "UseMailContainerMatching", "UseObfuscatedText", "UseLikeKnownSpam", "UseTrafficAnalysis", "InheritToSubDomain", "HasSpamQuarantine", "UseH7", "UseH8", "UseH9", "UseH10", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname", "PenNotification", "SpamPenNumber", "RetentionPeriod", "UserConfigurableNotification", "NotificationPeriod", "QuarantineAdministratorEmail", "QuarantineFallbackAction", "SubjectTag", "SubjectTagPosition", "SubjectTagCharSet", "WhitelistRequest", "WhitelistRequestRecipient", "QuarantineReportFrequency", "SpamAliasAcknowledgement", "QuarantineLocaleCode", "UseSig", "UseNewsletterDetection", "UseSPF", "UseDMARC", "NewsLettersAction", "NewsLettersSubjectTag", "NewsLettersSubjectTagPosition", "NewsLettersSubjectTagCharSet", "DMARCSubjectTag", "DMARCSubjectTagPosition", "DMARCSubjectTagCharSet", "SPFSubjectTag", "SPFSubjectTagPosition", "SPFSubjectTagCharSet") FROM stdin;
\.


--
-- Data for Name: ServiceSpamUser; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceSpamUser" ("RowId", "CustomerId", "DomainId", "EmailAddress", "UseMessageLabsWhitelistIP", "UseMessageLabsWhitelistDomain", "UseMessageLabsBlacklistIP", "UseMessageLabsBlacklistDomain", "UseWhitelistIP", "InheritWhitelistIP", "UseWhitelistDomain", "InheritWhitelistDomain", "UseBlacklistIP", "InheritBlacklistIP", "UseBlacklistDomain", "InheritBlacklistDomain", "UseORBS", "UseRBL", "UseRSS", "UseDUL", "UseEnvelopeFromEmpty", "UseIPDomainHeloMismatch", "UseInvalidEnvelopeFrom", "UseKnownSpam", "UseHeuristics", "UseMailContainerMatching", "UseObfuscatedText", "UseLikeKnownSpam", "UseTrafficAnalysis", "InheritToSubDomain", "HasSpamQuarantine", "UseH7", "UseH8", "UseH9", "UseH10", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "PenNotification", "SpamPenNumber", "RetentionPeriod", "UserConfigurableNotification", "NotificationPeriod", "QuarantineAdministratorEmail", "QuarantineFallbackAction", "SubjectTag", "SubjectTagPosition", "SubjectTagCharSet", "WhitelistRequest", "WhitelistRequestRecipient", "QuarantineReportFrequency", "SpamAliasAcknowledgement", "QuarantineLocaleCode", "UseSig") FROM stdin;
\.


--
-- Data for Name: ServiceSpamWBItem; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceSpamWBItem" ("RowId", "OwnerTypeId", "OwnerId", "WhiteORBlack", "IpORDomain", "ListValue", "Description", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceSpamWBList; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceSpamWBList" ("RowId", "CustomerId", "DomainId", "ResellerDefault", "WhiteORBlack", "IpORDomain", "ListValue", "Description", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceSpamWBSettings; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceSpamWBSettings" ("WBSettingsId", "CustomerId", "DomainId", "WBSettingsTypeId", "ListsEnabledByDefault", "MergeWithParentList", "ListPriority", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceSpamWBSettingsType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceSpamWBSettingsType" ("WBSettingsTypeId", "Description") FROM stdin;
\.


--
-- Data for Name: ServiceUQ; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceUQ" ("UQId", "OwnerId", "OwnerTypeId", "UseProvisionDefault", "QPenId", "QPeriodDays", "HasPrivacyUsers", "QuarantineFallbackAction", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceUQOwnerService; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceUQOwnerService" ("UQId", "ServiceTypeId", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceUQOwnerType; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceUQOwnerType" ("OwnerTypeId", "Description", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceUQPrivacyUserSettings; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceUQPrivacyUserSettings" ("UQId", "QPeriodDays", "HasPairedAdmin", "HasOptability", "InitialStatus", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceUQUser; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceUQUser" ("UserId", "CustomerId", "DomainId", "EmailAddress", "RegisteredUser", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceUQUserExtendedProperties; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceUQUserExtendedProperties" ("UserId", "IsUQPrivacyUser", "IsUQAdministrator", "IsUQGlobalAdministrator", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceUQUserOptability; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceUQUserOptability" ("UserId", "ServiceTypeId", "HasInbound", "HasOutbound", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: ServiceUser; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceUser" ("UserId", "CustomerId", "DomainId", "EmailAddress", "DateDeleted", "RegisteredUser") FROM stdin;
\.


--
-- Data for Name: ServiceUserGroup; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceUserGroup" ("UserGroupId", "UserGroupName", "CustomerId", "DomainId", "DateDeleted") FROM stdin;
\.


--
-- Data for Name: ServiceUserGroupSpecial; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceUserGroupSpecial" ("UserGroupName", "UserGroupType", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname", "LockingTimestamp") FROM stdin;
\.


--
-- Data for Name: ServiceVirusUser; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."ServiceVirusUser" ("RowId", "CustomerId", "DomainId", "EmailAddress", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: SpamPen; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."SpamPen" ("SpamPenNumber", "DisplayName", "Description", "DateCreated", "DateAmended", "DateDeleted", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: TLS; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TLS" ("TLSId", "CustomerId", "DomainId", "TLSToMTA", "TLSFromMTA", "UseDefault", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: TLSCNOverride; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TLSCNOverride" ("TLSCNOverrideId", "DomainId", "CertificateCommonName", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: TLSDomainLevelConfig; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TLSDomainLevelConfig" ("DomainId", "TLSStaticRoute", "ConfigPath", "UseConfigPath", "TLSCertValidationId", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: TLSEnforcement; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TLSEnforcement" ("TLSEnforcementId", "TLSId", "IsEnabled", "EnforceInbound", "EnforceOutbound", "TLSEnforcementTypeId", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: TLSEnforcementDomainGroup; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TLSEnforcementDomainGroup" ("TLSEnforcementId", "TLSPartnerDomainGroupId", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: TLSPartnerCNOverride; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TLSPartnerCNOverride" ("TLSPartnerCNOverrideId", "TLSPartnerDomainId", "CertificateCommonName", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: TLSPartnerDomain; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TLSPartnerDomain" ("TLSPartnerDomainId", "CustomerId", "DomainName", "TLSStaticRoute", "IsEnabled", "TLSPartnerDomainGroupId", "DisableTLSFromMTA", "TLSCertValidationId", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: TLSPartnerDomainGroup; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TLSPartnerDomainGroup" ("TLSPartnerDomainGroupId", "CustomerId", "DomainGroupName", "IsSharedWithChildCustomers", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: TLSPartnerSubdomainExclusion; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TLSPartnerSubdomainExclusion" ("TLSPartnerSubdomainExclusionId", "TLSPartnerDomainId", "SubdomainName", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: TLSServiceConfig; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TLSServiceConfig" ("TLSServiceConfigId", "ConfigKey", "ConfigValue") FROM stdin;
\.


--
-- Data for Name: TLSSubdomainExclusion; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TLSSubdomainExclusion" ("TLSSubdomainExclusionId", "DomainId", "SubdomainName", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: TimeZone; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TimeZone" ("TimezoneId", "TimeZoneName", "InternalTimeZoneName", "STDAbbr", "STDName", "DSTAbbr", "DSTName", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname", "Enabled") FROM stdin;
\.


--
-- Data for Name: TimeZoneOffset; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TimeZoneOffset" ("TimezoneId", "GMTOffset", "DSTAdjust", "DSTStartDate", "DSTStartTime", "DSTEndDate", "DSTEndTime", "StartDate", "EndDate", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: TooBig; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."TooBig" ("TooBigId", "CustomerId", "DomainId", "UseDefault", "CheckUs_maxEmailSize", "IsReseller", "DateCreated", "DateAmended", "whoAmended_nt_username", "WhoAmended_hostname") FROM stdin;
\.


--
-- Data for Name: UserGroupMembership; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo."UserGroupMembership" ("GroupId", "MemberId", "MemberType", "DateDeleted") FROM stdin;
\.


--
-- Name: dbrelease_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.dbrelease_seq', 8, false);


--
-- Name: dbreleasechangelog_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.dbreleasechangelog_seq', 3306, false);


--
-- Name: hkindexmaintenancelog_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.hkindexmaintenancelog_seq', 405, false);


--
-- Name: mspeer_lsns_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.mspeer_lsns_seq', 1, false);


--
-- Name: DLPCustomerExclusionAddress IX_DLPCustomerExclusionAddress_CU01; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPCustomerExclusionAddress"
    ADD CONSTRAINT "IX_DLPCustomerExclusionAddress_CU01" UNIQUE ("CustomerId", "DomainId", "EmailAddress");


--
-- Name: DLPGlobalExclusionAddress IX_DLPGlobalExclusionAddress_CU01; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPGlobalExclusionAddress"
    ADD CONSTRAINT "IX_DLPGlobalExclusionAddress_CU01" UNIQUE ("EmailAddress");


--
-- Name: ATPAlertMalware PK_ATPAlertMalware; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ATPAlertMalware"
    ADD CONSTRAINT "PK_ATPAlertMalware" PRIMARY KEY ("AlertId");


--
-- Name: ATPDMASRegion PK_ATPDMASRegion; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ATPDMASRegion"
    ADD CONSTRAINT "PK_ATPDMASRegion" PRIMARY KEY ("ATPDMASRegionId");


--
-- Name: ATPService PK_ATPservice; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ATPService"
    ADD CONSTRAINT "PK_ATPservice" PRIMARY KEY ("ATPServiceId");


--
-- Name: AllDomains PK_AllDomains; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."AllDomains"
    ADD CONSTRAINT "PK_AllDomains" PRIMARY KEY ("DomainId");


--
-- Name: BlacklistMessage PK_BlacklistMessage; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."BlacklistMessage"
    ADD CONSTRAINT "PK_BlacklistMessage" PRIMARY KEY ("RowId");


--
-- Name: BulkMailSender PK_BulkMailSender; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."BulkMailSender"
    ADD CONSTRAINT "PK_BulkMailSender" PRIMARY KEY ("UserId");


--
-- Name: Cluster PK_Cluster; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Cluster"
    ADD CONSTRAINT "PK_Cluster" PRIMARY KEY ("ClusterId");


--
-- Name: ClusterServer PK_ClusterServer; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ClusterServer"
    ADD CONSTRAINT "PK_ClusterServer" PRIMARY KEY ("ServerId");


--
-- Name: ClusterServerConfig PK_ClusterServerConfig; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ClusterServerConfig"
    ADD CONSTRAINT "PK_ClusterServerConfig" PRIMARY KEY ("ClusterServerConfigId");


--
-- Name: ClusterServerConfigType PK_ClusterServerConfigType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ClusterServerConfigType"
    ADD CONSTRAINT "PK_ClusterServerConfigType" PRIMARY KEY ("ServerConfigId");


--
-- Name: ClusterServerType PK_ClusterServerType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ClusterServerType"
    ADD CONSTRAINT "PK_ClusterServerType" PRIMARY KEY ("ServerTypeId");


--
-- Name: ClusterServer_CheckUsAddIns PK_ClusterServer_CheckUsAddIns; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ClusterServer_CheckUsAddIns"
    ADD CONSTRAINT "PK_ClusterServer_CheckUsAddIns" PRIMARY KEY ("CS_CheckUsAddInsId");


--
-- Name: ClusterServer_OtherAddIns PK_ClusterServer_OtherAddIns; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ClusterServer_OtherAddIns"
    ADD CONSTRAINT "PK_ClusterServer_OtherAddIns" PRIMARY KEY ("CS_OtherAddInsId");


--
-- Name: ClusterSuperServer PK_ClusterSuperServer; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ClusterSuperServer"
    ADD CONSTRAINT "PK_ClusterSuperServer" PRIMARY KEY ("RowId");


--
-- Name: ConfigChangeApplied PK_ConfigChangeApplied; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ConfigChangeApplied"
    ADD CONSTRAINT "PK_ConfigChangeApplied" PRIMARY KEY ("ConfigChangeAppliedId");


--
-- Name: ConfigChangeApplied_DelRequest PK_ConfigChangeApplied_DelRequest; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ConfigChangeApplied_DelRequest"
    ADD CONSTRAINT "PK_ConfigChangeApplied_DelRequest" PRIMARY KEY ("DelRequestId");


--
-- Name: ConfigChangeRequest PK_ConfigChangeRequest; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ConfigChangeRequest"
    ADD CONSTRAINT "PK_ConfigChangeRequest" PRIMARY KEY ("ConfigChangeRequestId");


--
-- Name: ConfigFileType PK_ConfigFileType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ConfigFileType"
    ADD CONSTRAINT "PK_ConfigFileType" PRIMARY KEY ("configFileTypeId");


--
-- Name: CustomMessage PK_CustomMessage; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomMessage"
    ADD CONSTRAINT "PK_CustomMessage" PRIMARY KEY ("CustomMessageKey");


--
-- Name: CustomMessageEmail PK_CustomMessageEmail; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomMessageEmail"
    ADD CONSTRAINT "PK_CustomMessageEmail" PRIMARY KEY ("MessageUId");


--
-- Name: CustomMessageLookup PK_CustomMessageLookup; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomMessageLookup"
    ADD CONSTRAINT "PK_CustomMessageLookup" PRIMARY KEY ("CustomMessageLookupId");


--
-- Name: CustomMessageText PK_CustomMessageText; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomMessageText"
    ADD CONSTRAINT "PK_CustomMessageText" PRIMARY KEY ("MessageUId");


--
-- Name: CustomTextContent PK_CustomTextContent; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomTextContent"
    ADD CONSTRAINT "PK_CustomTextContent" PRIMARY KEY ("CustomTextContentId", "TargetLocaleId");


--
-- Name: CustomTextContentLine PK_CustomTextContentLine; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomTextContentLine"
    ADD CONSTRAINT "PK_CustomTextContentLine" PRIMARY KEY ("CustomTextContentLocaleId", "CustomTextContentLineNo");


--
-- Name: CustomTextHierarchy PK_CustomTextHierarchy; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomTextHierarchy"
    ADD CONSTRAINT "PK_CustomTextHierarchy" PRIMARY KEY ("CustomTextId");


--
-- Name: CustomerConfig PK_CustomerConfig; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomerConfig"
    ADD CONSTRAINT "PK_CustomerConfig" PRIMARY KEY ("CustomerConfigId");


--
-- Name: CustomerConfigDefault PK_CustomerConfigDefault; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomerConfigDefault"
    ADD CONSTRAINT "PK_CustomerConfigDefault" PRIMARY KEY ("CustomerId", "DateDeleted");


--
-- Name: CustomerConfigHosts PK_CustomerConfigHosts; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomerConfigHosts"
    ADD CONSTRAINT "PK_CustomerConfigHosts" PRIMARY KEY ("CustomerConfigHostsId");


--
-- Name: CustomerHostedMailProvider PK_CustomerHostedMailProvider; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomerHostedMailProvider"
    ADD CONSTRAINT "PK_CustomerHostedMailProvider" PRIMARY KEY ("CustomerHostedMailProviderId");


--
-- Name: CustomerNamedRoute PK_CustomerNamedRoute; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomerNamedRoute"
    ADD CONSTRAINT "PK_CustomerNamedRoute" PRIMARY KEY ("NamedRouteId");


--
-- Name: CustomerNamedRouteIPAddress PK_CustomerNamedRouteIPAddress; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomerNamedRouteIPAddress"
    ADD CONSTRAINT "PK_CustomerNamedRouteIPAddress" PRIMARY KEY ("NamedRouteIPAddressId");


--
-- Name: CustomerService PK_CustomerService; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomerService"
    ADD CONSTRAINT "PK_CustomerService" PRIMARY KEY ("CustomerId", "ServiceTypeId");


--
-- Name: CustomerServiceCode PK_CustomerServiceCode; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."CustomerServiceCode"
    ADD CONSTRAINT "PK_CustomerServiceCode" PRIMARY KEY ("CodeId");


--
-- Name: Customers PK_Customers; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Customers"
    ADD CONSTRAINT "PK_Customers" PRIMARY KEY ("CustomerId");


--
-- Name: DLP PK_DLP; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLP"
    ADD CONSTRAINT "PK_DLP" PRIMARY KEY ("DLPId");


--
-- Name: DLPActionParamCategory PK_DLPActionParamCategory; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPActionParamCategory"
    ADD CONSTRAINT "PK_DLPActionParamCategory" PRIMARY KEY ("ParamCategory");


--
-- Name: DLPActionParamType PK_DLPActionParamType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPActionParamType"
    ADD CONSTRAINT "PK_DLPActionParamType" PRIMARY KEY ("ParamType");


--
-- Name: DLPActionScalarParam PK_DLPActionScalarParam; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPActionScalarParam"
    ADD CONSTRAINT "PK_DLPActionScalarParam" PRIMARY KEY ("ScalarParamId");


--
-- Name: DLPActionType PK_DLPActionType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPActionType"
    ADD CONSTRAINT "PK_DLPActionType" PRIMARY KEY ("ActionType");


--
-- Name: DLPActionValidParamType PK_DLPActionValidParamType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPActionValidParamType"
    ADD CONSTRAINT "PK_DLPActionValidParamType" PRIMARY KEY ("ActionType", "ParamType");


--
-- Name: DLPCondition PK_DLPCondition; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPCondition"
    ADD CONSTRAINT "PK_DLPCondition" PRIMARY KEY ("ConditionId");


--
-- Name: DLPConditionAddressParam PK_DLPConditionAddressParam; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPConditionAddressParam"
    ADD CONSTRAINT "PK_DLPConditionAddressParam" PRIMARY KEY ("AddressParamId");


--
-- Name: DLPConditionGroup PK_DLPConditionGroup; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPConditionGroup"
    ADD CONSTRAINT "PK_DLPConditionGroup" PRIMARY KEY ("ConditionGroupId");


--
-- Name: DLPConditionGroupCategory PK_DLPConditionGroupCategory; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPConditionGroupCategory"
    ADD CONSTRAINT "PK_DLPConditionGroupCategory" PRIMARY KEY ("ConditionGroupCategoryId");


--
-- Name: DLPConditionGroupData PK_DLPConditionGroupData; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPConditionGroupData"
    ADD CONSTRAINT "PK_DLPConditionGroupData" PRIMARY KEY ("ConditionGroupDataId");


--
-- Name: DLPConditionGroupParam PK_DLPConditionGroupParam; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPConditionGroupParam"
    ADD CONSTRAINT "PK_DLPConditionGroupParam" PRIMARY KEY ("GroupParamId");


--
-- Name: DLPConditionParamCategory PK_DLPConditionParamCategory; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPConditionParamCategory"
    ADD CONSTRAINT "PK_DLPConditionParamCategory" PRIMARY KEY ("ParamCategory");


--
-- Name: DLPConditionParamType PK_DLPConditionParamType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPConditionParamType"
    ADD CONSTRAINT "PK_DLPConditionParamType" PRIMARY KEY ("ParamType");


--
-- Name: DLPConditionScalarParam PK_DLPConditionScalarParam; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPConditionScalarParam"
    ADD CONSTRAINT "PK_DLPConditionScalarParam" PRIMARY KEY ("ScalarParamId");


--
-- Name: DLPConditionTimeParam PK_DLPConditionTimeParam; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPConditionTimeParam"
    ADD CONSTRAINT "PK_DLPConditionTimeParam" PRIMARY KEY ("TimeParamId");


--
-- Name: DLPConditionType PK_DLPConditionType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPConditionType"
    ADD CONSTRAINT "PK_DLPConditionType" PRIMARY KEY ("ConditionType");


--
-- Name: DLPConditionValidParamType PK_DLPConditionValidParamType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPConditionValidParamType"
    ADD CONSTRAINT "PK_DLPConditionValidParamType" PRIMARY KEY ("ConditionType", "ParamType");


--
-- Name: DLPCustomerExclusionAddress PK_DLPCustomerExclusionAddress; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPCustomerExclusionAddress"
    ADD CONSTRAINT "PK_DLPCustomerExclusionAddress" PRIMARY KEY ("RowId");


--
-- Name: DLPGlobalExclusionAddress PK_DLPGlobalExclusionAddress; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPGlobalExclusionAddress"
    ADD CONSTRAINT "PK_DLPGlobalExclusionAddress" PRIMARY KEY ("AddressId");


--
-- Name: DLPPolicy PK_DLPPolicy; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPPolicy"
    ADD CONSTRAINT "PK_DLPPolicy" PRIMARY KEY ("PolicyId");


--
-- Name: DLPPolicyActionType PK_DLPPolicyActionType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPPolicyActionType"
    ADD CONSTRAINT "PK_DLPPolicyActionType" PRIMARY KEY ("PolicyActionTypeId");


--
-- Name: DLPPolicyActionTypeMapping PK_DLPPolicyActionTypeMapping; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPPolicyActionTypeMapping"
    ADD CONSTRAINT "PK_DLPPolicyActionTypeMapping" PRIMARY KEY ("PolicyActionTypeId", "ActionType");


--
-- Name: DLPPolicyServiceType PK_DLPPolicyServiceType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPPolicyServiceType"
    ADD CONSTRAINT "PK_DLPPolicyServiceType" PRIMARY KEY ("DLPPolicyServiceTypeId");


--
-- Name: DLPRule PK_DLPRule; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPRule"
    ADD CONSTRAINT "PK_DLPRule" PRIMARY KEY ("RuleId");


--
-- Name: DLPSuperConditionGroup PK_DLPSuperConditionGroup; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DLPSuperConditionGroup"
    ADD CONSTRAINT "PK_DLPSuperConditionGroup" PRIMARY KEY ("SuperConditionGroupId", "SuperConditionGroupDataId");


--
-- Name: DMASGlobalControl PK_DMASGlobalControl; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DMASGlobalControl"
    ADD CONSTRAINT "PK_DMASGlobalControl" PRIMARY KEY ("DMASGlobalControlId");


--
-- Name: Disclaimer PK_Disclaimer; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Disclaimer"
    ADD CONSTRAINT "PK_Disclaimer" PRIMARY KEY ("DisclaimerId");


--
-- Name: DisclaimerGroup PK_DisclaimerGroup; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DisclaimerGroup"
    ADD CONSTRAINT "PK_DisclaimerGroup" PRIMARY KEY ("DisclaimerId", "GroupId", "GroupType");


--
-- Name: DomainConfigDefault PK_DomainConfigDefault; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."DomainConfigDefault"
    ADD CONSTRAINT "PK_DomainConfigDefault" PRIMARY KEY ("DomainId");


--
-- Name: EICService PK_EICService; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."EICService"
    ADD CONSTRAINT "PK_EICService" PRIMARY KEY ("EICServiceId");


--
-- Name: EmailServerActiveState PK_EmailServerActiveState; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."EmailServerActiveState"
    ADD CONSTRAINT "PK_EmailServerActiveState" PRIMARY KEY ("ActiveState");


--
-- Name: EmailServerTechChecksState PK_EmailServerTechChecksState; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."EmailServerTechChecksState"
    ADD CONSTRAINT "PK_EmailServerTechChecksState" PRIMARY KEY ("TechChecksState");


--
-- Name: HostedMailProvider PK_HostedMailProvider; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."HostedMailProvider"
    ADD CONSTRAINT "PK_HostedMailProvider" PRIMARY KEY ("HostedMailProviderId");


--
-- Name: HostedMailProviderCheck PK_HostedMailProviderCheck; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."HostedMailProviderCheck"
    ADD CONSTRAINT "PK_HostedMailProviderCheck" PRIMARY KEY ("HostedMailProviderCheckId");


--
-- Name: InterfaceUQPrivacyUserSettings PK_InterfaceUQPrivacyUserSettings; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."InterfaceUQPrivacyUserSettings"
    ADD CONSTRAINT "PK_InterfaceUQPrivacyUserSettings" PRIMARY KEY ("OwnerId", "OwnerTypeId");


--
-- Name: LDAPGroup PK_LDAPGroup; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."LDAPGroup"
    ADD CONSTRAINT "PK_LDAPGroup" PRIMARY KEY ("LDAPGroupId");


--
-- Name: LDAPUser PK_LDAPUser; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."LDAPUser"
    ADD CONSTRAINT "PK_LDAPUser" PRIMARY KEY ("LDAPUserId");


--
-- Name: LDAPUserGroupMembership PK_LDAPUserGroupMembership; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."LDAPUserGroupMembership"
    ADD CONSTRAINT "PK_LDAPUserGroupMembership" PRIMARY KEY ("LDAPUserGroupMembershipId");


--
-- Name: Locale PK_Locale; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Locale"
    ADD CONSTRAINT "PK_Locale" PRIMARY KEY ("LocaleId");


--
-- Name: LocaleDataTable PK_LocaleDataTable; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."LocaleDataTable"
    ADD CONSTRAINT "PK_LocaleDataTable" PRIMARY KEY ("LocaleDataTableId");


--
-- Name: LocaleDataTableStrings PK_LocaleDataTableStrings; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."LocaleDataTableStrings"
    ADD CONSTRAINT "PK_LocaleDataTableStrings" PRIMARY KEY ("LocaleDataTableStringId");


--
-- Name: Pen PK_Pen; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Pen"
    ADD CONSTRAINT "PK_Pen" PRIMARY KEY ("PenId");


--
-- Name: PenType PK_PenType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."PenType"
    ADD CONSTRAINT "PK_PenType" PRIMARY KEY ("PenTypeId");


--
-- Name: PolicyServiceType PK_PolicyServiceType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."PolicyServiceType"
    ADD CONSTRAINT "PK_PolicyServiceType" PRIMARY KEY ("PolicyServiceTypeId");


--
-- Name: PublicBlacklist PK_PublicBlacklist; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."PublicBlacklist"
    ADD CONSTRAINT "PK_PublicBlacklist" PRIMARY KEY ("PublicBlacklistId");


--
-- Name: Reseller PK_Reseller; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."Reseller"
    ADD CONSTRAINT "PK_Reseller" PRIMARY KEY ("CustomerId");


--
-- Name: SMTPRoutes PK_SMTPRoutes; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."SMTPRoutes"
    ADD CONSTRAINT "PK_SMTPRoutes" PRIMARY KEY ("SMTPRoutesId");


--
-- Name: ServiceCF PK_ServiceCF; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCF"
    ADD CONSTRAINT "PK_ServiceCF" PRIMARY KEY ("ServiceCFId");


--
-- Name: ServiceCFAction PK_ServiceCFAction; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFAction"
    ADD CONSTRAINT "PK_ServiceCFAction" PRIMARY KEY ("ActionId");


--
-- Name: ServiceCFActionParamCategory PK_ServiceCFActionParamCategory; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFActionParamCategory"
    ADD CONSTRAINT "PK_ServiceCFActionParamCategory" PRIMARY KEY ("ParamCategory");


--
-- Name: ServiceCFActionParamType PK_ServiceCFActionParamType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFActionParamType"
    ADD CONSTRAINT "PK_ServiceCFActionParamType" PRIMARY KEY ("ParamType");


--
-- Name: ServiceCFActionScalarParam PK_ServiceCFActionScalarParam; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFActionScalarParam"
    ADD CONSTRAINT "PK_ServiceCFActionScalarParam" PRIMARY KEY ("ScalarParamId");


--
-- Name: ServiceCFActionType PK_ServiceCFActionType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFActionType"
    ADD CONSTRAINT "PK_ServiceCFActionType" PRIMARY KEY ("ActionType");


--
-- Name: ServiceCFActionValidParamType PK_ServiceCFActionValidParamType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFActionValidParamType"
    ADD CONSTRAINT "PK_ServiceCFActionValidParamType" PRIMARY KEY ("ActionType", "ParamType");


--
-- Name: ServiceCFCondition PK_ServiceCFCondition; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFCondition"
    ADD CONSTRAINT "PK_ServiceCFCondition" PRIMARY KEY ("ConditionId");


--
-- Name: ServiceCFConditionAddressParam PK_ServiceCFConditionAddressParam; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFConditionAddressParam"
    ADD CONSTRAINT "PK_ServiceCFConditionAddressParam" PRIMARY KEY ("AddressParamId");


--
-- Name: ServiceCFConditionGroup PK_ServiceCFConditionGroup; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFConditionGroup"
    ADD CONSTRAINT "PK_ServiceCFConditionGroup" PRIMARY KEY ("ConditionGroupId");


--
-- Name: ServiceCFConditionGroupEntryCategory PK_ServiceCFConditionGroupEntryCategory; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFConditionGroupEntryCategory"
    ADD CONSTRAINT "PK_ServiceCFConditionGroupEntryCategory" PRIMARY KEY ("EntryCategory");


--
-- Name: ServiceCFConditionGroupParam PK_ServiceCFConditionGroupParam; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFConditionGroupParam"
    ADD CONSTRAINT "PK_ServiceCFConditionGroupParam" PRIMARY KEY ("GroupParamId");


--
-- Name: ServiceCFConditionGroupValidEntryCategory PK_ServiceCFConditionGroupValidEntryCategory; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFConditionGroupValidEntryCategory"
    ADD CONSTRAINT "PK_ServiceCFConditionGroupValidEntryCategory" PRIMARY KEY ("ParamType", "EntryCategory");


--
-- Name: ServiceCFConditionParamCategory PK_ServiceCFConditionParamCategory; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFConditionParamCategory"
    ADD CONSTRAINT "PK_ServiceCFConditionParamCategory" PRIMARY KEY ("ParamCategory");


--
-- Name: ServiceCFConditionParamType PK_ServiceCFConditionParamType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFConditionParamType"
    ADD CONSTRAINT "PK_ServiceCFConditionParamType" PRIMARY KEY ("ParamType");


--
-- Name: ServiceCFConditionScalarParam PK_ServiceCFConditionScalarParam; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFConditionScalarParam"
    ADD CONSTRAINT "PK_ServiceCFConditionScalarParam" PRIMARY KEY ("ScalarParamId");


--
-- Name: ServiceCFConditionType PK_ServiceCFConditionType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFConditionType"
    ADD CONSTRAINT "PK_ServiceCFConditionType" PRIMARY KEY ("ConditionType");


--
-- Name: ServiceCFConditionValidParamType PK_ServiceCFConditionValidParamType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFConditionValidParamType"
    ADD CONSTRAINT "PK_ServiceCFConditionValidParamType" PRIMARY KEY ("ConditionType", "ParamType");


--
-- Name: ServiceCFCustomerExclusionAddress PK_ServiceCFCustomerExclusionAddress; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFCustomerExclusionAddress"
    ADD CONSTRAINT "PK_ServiceCFCustomerExclusionAddress" PRIMARY KEY ("RowId");


--
-- Name: ServiceCFDomain PK_ServiceCFDomain; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFDomain"
    ADD CONSTRAINT "PK_ServiceCFDomain" PRIMARY KEY ("CFDomainId");


--
-- Name: ServiceCFGlobalExclusionAddress PK_ServiceCFGlobalExclusionAddress; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFGlobalExclusionAddress"
    ADD CONSTRAINT "PK_ServiceCFGlobalExclusionAddress" PRIMARY KEY ("AddressId");


--
-- Name: ServiceCFLexExpression PK_ServiceCFLexExpression; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFLexExpression"
    ADD CONSTRAINT "PK_ServiceCFLexExpression" PRIMARY KEY ("LexExpressionId");


--
-- Name: ServiceCFRegExpression PK_ServiceCFRegExpression; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFRegExpression"
    ADD CONSTRAINT "PK_ServiceCFRegExpression" PRIMARY KEY ("RegExpressionId");


--
-- Name: ServiceCFRegExpressionTemplateReference PK_ServiceCFRegExpressionTemplateReference; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFRegExpressionTemplateReference"
    ADD CONSTRAINT "PK_ServiceCFRegExpressionTemplateReference" PRIMARY KEY ("RegExpReferenceId");


--
-- Name: ServiceCFRule PK_ServiceCFRule; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFRule"
    ADD CONSTRAINT "PK_ServiceCFRule" PRIMARY KEY ("RuleId");


--
-- Name: ServiceCFSuperGroupEntry PK_ServiceCFSuperGroupEntry; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFSuperGroupEntry"
    ADD CONSTRAINT "PK_ServiceCFSuperGroupEntry" PRIMARY KEY ("EntryId");


--
-- Name: ServiceCFTimeRestrictionDayPart PK_ServiceCFTimeRestrictionDayPart; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFTimeRestrictionDayPart"
    ADD CONSTRAINT "PK_ServiceCFTimeRestrictionDayPart" PRIMARY KEY ("DayPartId");


--
-- Name: ServiceCFTimeRestrictionTimePart PK_ServiceCFTimeRestrictionTimePart; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFTimeRestrictionTimePart"
    ADD CONSTRAINT "PK_ServiceCFTimeRestrictionTimePart" PRIMARY KEY ("TimePartId");


--
-- Name: ServiceCFTimeRestrictionTimeZonePart PK_ServiceCFTimeRestrictionTimezonePart; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFTimeRestrictionTimeZonePart"
    ADD CONSTRAINT "PK_ServiceCFTimeRestrictionTimezonePart" PRIMARY KEY ("TimezonePartId");


--
-- Name: ServiceCFTimeZone PK_ServiceCFTimeZone; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceCFTimeZone"
    ADD CONSTRAINT "PK_ServiceCFTimeZone" PRIMARY KEY ("TimezoneId");


--
-- Name: ServiceGoodRcptTo PK_ServiceGoodRcptTo; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceGoodRcptTo"
    ADD CONSTRAINT "PK_ServiceGoodRcptTo" PRIMARY KEY ("RowId");


--
-- Name: ServicePorn PK_ServicePorn; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePorn"
    ADD CONSTRAINT "PK_ServicePorn" PRIMARY KEY ("RowId");


--
-- Name: ServicePornActionType PK_ServicePornActionType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornActionType"
    ADD CONSTRAINT "PK_ServicePornActionType" PRIMARY KEY ("ActionType");


--
-- Name: ServicePornDirectionType PK_ServicePornDirectionType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornDirectionType"
    ADD CONSTRAINT "PK_ServicePornDirectionType" PRIMARY KEY ("DirectionTypeId");


--
-- Name: ServicePornGlobalImage PK_ServicePornGlobalImage; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornGlobalImage"
    ADD CONSTRAINT "PK_ServicePornGlobalImage" PRIMARY KEY ("ImageId");


--
-- Name: ServicePornImage PK_ServicePornImage; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornImage"
    ADD CONSTRAINT "PK_ServicePornImage" PRIMARY KEY ("ImageId");


--
-- Name: ServicePornImageSignature PK_ServicePornImageSignature; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornImageSignature"
    ADD CONSTRAINT "PK_ServicePornImageSignature" PRIMARY KEY ("SignatureId");


--
-- Name: ServicePornImageType PK_ServicePornImageType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornImageType"
    ADD CONSTRAINT "PK_ServicePornImageType" PRIMARY KEY ("ImageType");


--
-- Name: ServicePornListLimit PK_ServicePornListLimit; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornListLimit"
    ADD CONSTRAINT "PK_ServicePornListLimit" PRIMARY KEY ("ListLimitId");


--
-- Name: ServicePornListType PK_ServicePornListType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornListType"
    ADD CONSTRAINT "PK_ServicePornListType" PRIMARY KEY ("ListTypeId");


--
-- Name: ServicePornOwnerType PK_ServicePornOwnerType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornOwnerType"
    ADD CONSTRAINT "PK_ServicePornOwnerType" PRIMARY KEY ("OwnerTypeId");


--
-- Name: ServicePornRule PK_ServicePornRule; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornRule"
    ADD CONSTRAINT "PK_ServicePornRule" PRIMARY KEY ("PornRuleId");


--
-- Name: ServicePornRuleType PK_ServicePornRuleType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornRuleType"
    ADD CONSTRAINT "PK_ServicePornRuleType" PRIMARY KEY ("RuleTypeId");


--
-- Name: ServicePornSensitivityType PK_ServicePornSensitivityType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornSensitivityType"
    ADD CONSTRAINT "PK_ServicePornSensitivityType" PRIMARY KEY ("SensitivityType");


--
-- Name: ServicePornTrustedEmail PK_ServicePornTrustedEmail; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornTrustedEmail"
    ADD CONSTRAINT "PK_ServicePornTrustedEmail" PRIMARY KEY ("TrustedEmailId");


--
-- Name: ServicePornTrustedEmailType PK_ServicePornTrustedEmailType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornTrustedEmailType"
    ADD CONSTRAINT "PK_ServicePornTrustedEmailType" PRIMARY KEY ("TrustedEmailTypeId");


--
-- Name: ServicePornUser PK_ServicePornUser; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServicePornUser"
    ADD CONSTRAINT "PK_ServicePornUser" PRIMARY KEY ("RowId");


--
-- Name: ServiceSpam PK_ServiceSpam; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceSpam"
    ADD CONSTRAINT "PK_ServiceSpam" PRIMARY KEY ("RowId");


--
-- Name: ServiceSpamGlobalWBList PK_ServiceSpamGlobalWBList; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceSpamGlobalWBList"
    ADD CONSTRAINT "PK_ServiceSpamGlobalWBList" PRIMARY KEY ("RowId");


--
-- Name: ServiceSpamGroup PK_ServiceSpamGroup; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceSpamGroup"
    ADD CONSTRAINT "PK_ServiceSpamGroup" PRIMARY KEY ("SpamGroupId");


--
-- Name: ServiceSpamHierarchy PK_ServiceSpamHierarchy; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceSpamHierarchy"
    ADD CONSTRAINT "PK_ServiceSpamHierarchy" PRIMARY KEY ("OwnerTypeId", "OwnerId");


--
-- Name: ServiceSpamOwnerType PK_ServiceSpamOwnerType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceSpamOwnerType"
    ADD CONSTRAINT "PK_ServiceSpamOwnerType" PRIMARY KEY ("OwnerTypeId");


--
-- Name: ServiceSpamRecipient PK_ServiceSpamRecipient; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceSpamRecipient"
    ADD CONSTRAINT "PK_ServiceSpamRecipient" PRIMARY KEY ("SpamRecipientId");


--
-- Name: ServiceSpamRecipientAlias PK_ServiceSpamRecipientAlias; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceSpamRecipientAlias"
    ADD CONSTRAINT "PK_ServiceSpamRecipientAlias" PRIMARY KEY ("RecipientAliasId");


--
-- Name: ServiceSpamSettings PK_ServiceSpamSettings; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceSpamSettings"
    ADD CONSTRAINT "PK_ServiceSpamSettings" PRIMARY KEY ("OwnerTypeId", "OwnerId");


--
-- Name: ServiceSpamUser PK_ServiceSpamUser; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceSpamUser"
    ADD CONSTRAINT "PK_ServiceSpamUser" PRIMARY KEY ("RowId");


--
-- Name: ServiceSpamWBItem PK_ServiceSpamWBItem; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceSpamWBItem"
    ADD CONSTRAINT "PK_ServiceSpamWBItem" PRIMARY KEY ("RowId");


--
-- Name: ServiceSpamWBList PK_ServiceSpamWBList; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceSpamWBList"
    ADD CONSTRAINT "PK_ServiceSpamWBList" PRIMARY KEY ("RowId");


--
-- Name: ServiceSpamWBSettings PK_ServiceSpamWBSettings; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceSpamWBSettings"
    ADD CONSTRAINT "PK_ServiceSpamWBSettings" PRIMARY KEY ("WBSettingsId");


--
-- Name: ServiceSpamWBSettingsType PK_ServiceSpamWBSettingsType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceSpamWBSettingsType"
    ADD CONSTRAINT "PK_ServiceSpamWBSettingsType" PRIMARY KEY ("WBSettingsTypeId");


--
-- Name: ServiceUQ PK_ServiceUQ; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceUQ"
    ADD CONSTRAINT "PK_ServiceUQ" PRIMARY KEY ("UQId");


--
-- Name: ServiceUQOwnerService PK_ServiceUQOwnerService; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceUQOwnerService"
    ADD CONSTRAINT "PK_ServiceUQOwnerService" PRIMARY KEY ("UQId", "ServiceTypeId");


--
-- Name: ServiceUQOwnerType PK_ServiceUQOwnerType; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceUQOwnerType"
    ADD CONSTRAINT "PK_ServiceUQOwnerType" PRIMARY KEY ("OwnerTypeId");


--
-- Name: ServiceUQPrivacyUserSettings PK_ServiceUQPrivacyUserSettings; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceUQPrivacyUserSettings"
    ADD CONSTRAINT "PK_ServiceUQPrivacyUserSettings" PRIMARY KEY ("UQId");


--
-- Name: ServiceUQUser PK_ServiceUQUser; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceUQUser"
    ADD CONSTRAINT "PK_ServiceUQUser" PRIMARY KEY ("UserId");


--
-- Name: ServiceUQUserExtendedProperties PK_ServiceUQUserExtendedProperties; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceUQUserExtendedProperties"
    ADD CONSTRAINT "PK_ServiceUQUserExtendedProperties" PRIMARY KEY ("UserId");


--
-- Name: ServiceUQUserOptability PK_ServiceUQUserOptability; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceUQUserOptability"
    ADD CONSTRAINT "PK_ServiceUQUserOptability" PRIMARY KEY ("UserId", "ServiceTypeId");


--
-- Name: ServiceUser PK_ServiceUser; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceUser"
    ADD CONSTRAINT "PK_ServiceUser" PRIMARY KEY ("UserId");


--
-- Name: ServiceUserGroup PK_ServiceUserGroup; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceUserGroup"
    ADD CONSTRAINT "PK_ServiceUserGroup" PRIMARY KEY ("UserGroupId");


--
-- Name: ServiceUserGroupSpecial PK_ServiceUserGroupSpecial; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceUserGroupSpecial"
    ADD CONSTRAINT "PK_ServiceUserGroupSpecial" PRIMARY KEY ("UserGroupType");


--
-- Name: ServiceVirusUser PK_ServiceVirusUser; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."ServiceVirusUser"
    ADD CONSTRAINT "PK_ServiceVirusUser" PRIMARY KEY ("RowId");


--
-- Name: SpamPen PK_SpamPen; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."SpamPen"
    ADD CONSTRAINT "PK_SpamPen" PRIMARY KEY ("SpamPenNumber");


--
-- Name: TLS PK_TLS; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TLS"
    ADD CONSTRAINT "PK_TLS" PRIMARY KEY ("TLSId");


--
-- Name: TLSCNOverride PK_TLSCNOverride; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TLSCNOverride"
    ADD CONSTRAINT "PK_TLSCNOverride" PRIMARY KEY ("TLSCNOverrideId");


--
-- Name: TLSDomainLevelConfig PK_TLSDomainLevelConfig; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TLSDomainLevelConfig"
    ADD CONSTRAINT "PK_TLSDomainLevelConfig" PRIMARY KEY ("DomainId");


--
-- Name: TLSEnforcement PK_TLSEnforcement; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TLSEnforcement"
    ADD CONSTRAINT "PK_TLSEnforcement" PRIMARY KEY ("TLSEnforcementId");


--
-- Name: TLSEnforcementDomainGroup PK_TLSEnforcementDomainGroup; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TLSEnforcementDomainGroup"
    ADD CONSTRAINT "PK_TLSEnforcementDomainGroup" PRIMARY KEY ("TLSEnforcementId", "TLSPartnerDomainGroupId");


--
-- Name: TLSPartnerCNOverride PK_TLSPartnerCNOverride; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TLSPartnerCNOverride"
    ADD CONSTRAINT "PK_TLSPartnerCNOverride" PRIMARY KEY ("TLSPartnerCNOverrideId");


--
-- Name: TLSPartnerDomain PK_TLSPartnerDomain; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TLSPartnerDomain"
    ADD CONSTRAINT "PK_TLSPartnerDomain" PRIMARY KEY ("TLSPartnerDomainId");


--
-- Name: TLSPartnerDomainGroup PK_TLSPartnerDomainGroup; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TLSPartnerDomainGroup"
    ADD CONSTRAINT "PK_TLSPartnerDomainGroup" PRIMARY KEY ("TLSPartnerDomainGroupId");


--
-- Name: TLSPartnerSubdomainExclusion PK_TLSPartnerSubdomainExclusion; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TLSPartnerSubdomainExclusion"
    ADD CONSTRAINT "PK_TLSPartnerSubdomainExclusion" PRIMARY KEY ("TLSPartnerSubdomainExclusionId");


--
-- Name: TLSServiceConfig PK_TLSServiceConfig; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TLSServiceConfig"
    ADD CONSTRAINT "PK_TLSServiceConfig" PRIMARY KEY ("TLSServiceConfigId");


--
-- Name: TLSSubdomainExclusion PK_TLSSubdomainExclusion; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TLSSubdomainExclusion"
    ADD CONSTRAINT "PK_TLSSubdomainExclusion" PRIMARY KEY ("TLSSubdomainExclusionId");


--
-- Name: TimeZone PK_TimeZone; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TimeZone"
    ADD CONSTRAINT "PK_TimeZone" PRIMARY KEY ("TimezoneId");


--
-- Name: TimeZoneOffset PK_TimeZoneOffset; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TimeZoneOffset"
    ADD CONSTRAINT "PK_TimeZoneOffset" PRIMARY KEY ("TimezoneId", "StartDate", "EndDate");


--
-- Name: TooBig PK_TooBig; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."TooBig"
    ADD CONSTRAINT "PK_TooBig" PRIMARY KEY ("TooBigId");


--
-- Name: UserGroupMembership PK_UserGroupMembership; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo."UserGroupMembership"
    ADD CONSTRAINT "PK_UserGroupMembership" PRIMARY KEY ("GroupId", "MemberId", "MemberType", "DateDeleted");


--
-- Name: IX_ATPAlertMalware_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ATPAlertMalware_CL01" ON dbo."ATPAlertMalware" USING btree ("CustomerId", "DomainId");


--
-- Name: IX_ATPDMASRegion_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ATPDMASRegion_CU01" ON dbo."ATPDMASRegion" USING btree ("CustomerId", "DomainId");


--
-- Name: IX_ATPService_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ATPService_CL01" ON dbo."ATPService" USING btree ("CustomerId", "DomainId");


--
-- Name: IX_AllDomains_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_AllDomains_CL01" ON dbo."AllDomains" USING btree ("CustomerId");


--
-- Name: IX_AllDomains_NU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_AllDomains_NU02" ON dbo."AllDomains" USING btree ("Domain");


--
-- Name: IX_BlackListMessage_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_BlackListMessage_CU01" ON dbo."BlacklistMessage" USING btree ("CustomerId", "DomainId", "BlacklistType", "DateDeleted");


--
-- Name: IX_CS_CheckUsAddIns_Nc01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_CS_CheckUsAddIns_Nc01" ON dbo."ClusterServer_CheckUsAddIns" USING btree ("ClusterId", "ServerId");


--
-- Name: IX_CS_OtherAddIns_Cl01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_CS_OtherAddIns_Cl01" ON dbo."ClusterServer_OtherAddIns" USING btree ("ClusterId", "ServerId");


--
-- Name: IX_ClusterServerConfig_Cu01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ClusterServerConfig_Cu01" ON dbo."ClusterServerConfig" USING btree ("ClusterId", "ServerId");


--
-- Name: IX_ClusterServerConfig_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ClusterServerConfig_NC02" ON dbo."ClusterServerConfig" USING btree ("CustomerId");


--
-- Name: IX_ClusterServer_Nu02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ClusterServer_Nu02" ON dbo."ClusterServer" USING btree ("ServerName", "DateDeleted");


--
-- Name: IX_ClusterServer_Nu03; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ClusterServer_Nu03" ON dbo."ClusterServer" USING btree ("DisplayName", "DateDeleted");


--
-- Name: IX_ClusterServer_Nu04; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ClusterServer_Nu04" ON dbo."ClusterServer" USING btree ("SQLNamePrefix", "DateDeleted");


--
-- Name: IX_ClusterServer_Nu05; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ClusterServer_Nu05" ON dbo."ClusterServer" USING btree ("TowerId", "DateDeleted");


--
-- Name: IX_ClusterSuperServer_Cu01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ClusterSuperServer_Cu01" ON dbo."ClusterSuperServer" USING btree ("MasterServer_ClusterId", "MasterServer_ServerId", "Clone_ClusterId", "Clone_ServerId");


--
-- Name: IX_ClusterSuperServer_Nu01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ClusterSuperServer_Nu01" ON dbo."ClusterSuperServer" USING btree ("Clone_ClusterId", "Clone_ServerId");


--
-- Name: IX_Cluster_Nu01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Cluster_Nu01" ON dbo."Cluster" USING btree ("ClusterName", "DateDeleted");


--
-- Name: IX_ConfigChangeRequest_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ConfigChangeRequest_CU01" ON dbo."ConfigChangeRequest" USING btree ("ClusterId", "ServerId", "configFileTypeId", "DateDeleted");


--
-- Name: IX_ConfigFileType_NU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ConfigFileType_NU01" ON dbo."ConfigFileType" USING btree ("configFileDescription");


--
-- Name: IX_CustomMessage_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_CustomMessage_CU01" ON dbo."CustomMessage" USING btree ("ResellerId", "CustomerId", "DomainId", "CustomMessageGroupId", "DateDeleted");


--
-- Name: IX_CustomTextContent_01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_CustomTextContent_01" ON dbo."CustomTextContent" USING btree ("CustomTextContentLocaleId");


--
-- Name: IX_CustomTextHierarchy_NC03; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_CustomTextHierarchy_NC03" ON dbo."CustomTextHierarchy" USING btree ("CustomTextContentId");


--
-- Name: IX_CustomTextHierarchy_NC04; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_CustomTextHierarchy_NC04" ON dbo."CustomTextHierarchy" USING btree ("ParentCustomTextId");


--
-- Name: IX_CustomTextHierarchy_NC05; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_CustomTextHierarchy_NC05" ON dbo."CustomTextHierarchy" USING btree ("OwnerId", "OwnerTypeId", "ForUseByChildren");


--
-- Name: IX_CustomTextHierarchy_NC06; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_CustomTextHierarchy_NC06" ON dbo."CustomTextHierarchy" USING btree ("OwnerTypeId", "CustomTextTypeId", "State");


--
-- Name: IX_CustomTextHierarchy_NU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_CustomTextHierarchy_NU02" ON dbo."CustomTextHierarchy" USING btree ("OwnerId", "CustomTextTypeId", "OwnerTypeId", "ForUseByChildren");


--
-- Name: IX_CustomerConfigHosts_Cl01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_CustomerConfigHosts_Cl01" ON dbo."CustomerConfigHosts" USING btree ("CustomerId");


--
-- Name: IX_CustomerConfigHosts_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_CustomerConfigHosts_NC02" ON dbo."CustomerConfigHosts" USING btree ("FirstIPNumeric", "LastIPNumeric");


--
-- Name: IX_CustomerConfig_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_CustomerConfig_CL01" ON dbo."CustomerConfig" USING btree ("CustomerId");


--
-- Name: IX_CustomerConfig_NU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_CustomerConfig_NU02" ON dbo."CustomerConfig" USING btree ("DomainId", "DateDeleted");


--
-- Name: IX_CustomerNamedRouteIPAddress_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_CustomerNamedRouteIPAddress_CL01" ON dbo."CustomerNamedRouteIPAddress" USING btree ("NamedRouteId", "IPAddressId", "IPAddressOrder");


--
-- Name: IX_CustomerNamedRoute_NU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_CustomerNamedRoute_NU01" ON dbo."CustomerNamedRoute" USING btree ("CustomerId", "NamedRoute");


--
-- Name: IX_CustomerServiceType_NU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_CustomerServiceType_NU01" ON dbo."CustomerServiceType" USING btree ("TypeId");


--
-- Name: IX_CustomerService_NC01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_CustomerService_NC01" ON dbo."CustomerService" USING btree ("ServiceTypeId", "Enabled", "DateDeleted");


--
-- Name: IX_Customers_NC03; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_Customers_NC03" ON dbo."Customers" USING btree ("AdminName");


--
-- Name: IX_Customers_NC04; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_Customers_NC04" ON dbo."Customers" USING btree ("AdminPassword");


--
-- Name: IX_Customers_NC05; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_Customers_NC05" ON dbo."Customers" USING btree ("CustomerExtRef");


--
-- Name: IX_Customers_NC07; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_Customers_NC07" ON dbo."Customers" USING btree ("ParentResellerId");


--
-- Name: IX_Customers_NC08; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_Customers_NC08" ON dbo."Customers" USING btree ("ParentResellerId", "DateDeleted");


--
-- Name: IX_Customers_NU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Customers_NU01" ON dbo."Customers" USING btree ("CustomerName");


--
-- Name: IX_Customers_NU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Customers_NU02" ON dbo."Customers" USING btree ("MincRef");


--
-- Name: IX_DLPActionScalarParam_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_DLPActionScalarParam_CL01" ON dbo."DLPActionScalarParam" USING btree ("PolicyId", "ParamType");


--
-- Name: IX_DLPConditionAddressParam_NC01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_DLPConditionAddressParam_NC01" ON dbo."DLPConditionAddressParam" USING btree ("GroupId", "GroupType");


--
-- Name: IX_DLPConditionAddressParam_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_DLPConditionAddressParam_NC02" ON dbo."DLPConditionAddressParam" USING btree ("ConditionId", "GroupId", "GroupType");


--
-- Name: IX_DLPConditionGroupData_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_DLPConditionGroupData_CL01" ON dbo."DLPConditionGroupData" USING btree ("ConditionGroupId");


--
-- Name: IX_DLPConditionGroupParam_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_DLPConditionGroupParam_CU01" ON dbo."DLPConditionGroupParam" USING btree ("ConditionId", "ConditionGroupId");


--
-- Name: IX_DLPConditionGroupParam_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_DLPConditionGroupParam_NC02" ON dbo."DLPConditionGroupParam" USING btree ("ConditionGroupId");


--
-- Name: IX_DLPConditionGroup_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_DLPConditionGroup_CU01" ON dbo."DLPConditionGroup" USING btree ("CustomerId", "DomainId", "Name");


--
-- Name: IX_DLPConditionScalarParam_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_DLPConditionScalarParam_CU01" ON dbo."DLPConditionScalarParam" USING btree ("ConditionId", "ParamType");


--
-- Name: IX_DLPConditionTimeParam_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_DLPConditionTimeParam_CL01" ON dbo."DLPConditionTimeParam" USING btree ("ConditionId", "ParamType");


--
-- Name: IX_DLPPolicy_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_DLPPolicy_CU01" ON dbo."DLPPolicy" USING btree ("CustomerId", "DomainId", "PolicyName", "Sequence", "ServiceTypeId");


--
-- Name: IX_DLPRule_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_DLPRule_CL01" ON dbo."DLPRule" USING btree ("RuleId", "PolicyId");


--
-- Name: IX_DLP_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_DLP_CU01" ON dbo."DLP" USING btree ("CustomerId", "DomainId", "ServiceTypeId");


--
-- Name: IX_DisclaimerGroup_NC01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_DisclaimerGroup_NC01" ON dbo."DisclaimerGroup" USING btree ("GroupId", "GroupType");


--
-- Name: IX_Disclaimer_NU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Disclaimer_NU01" ON dbo."Disclaimer" USING btree ("CustomerId", "DisclaimerName");


--
-- Name: IX_EICService_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_EICService_CU01" ON dbo."EICService" USING btree ("CustomerId", "DomainId");


--
-- Name: IX_EmailAddress_NC03; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_EmailAddress_NC03" ON dbo."ServiceUser" USING btree ("EmailAddress");


--
-- Name: IX_EmailServerActiveState_NU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_EmailServerActiveState_NU02" ON dbo."EmailServerActiveState" USING btree ("Description");


--
-- Name: IX_EmailServerTechChecksState_NU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_EmailServerTechChecksState_NU02" ON dbo."EmailServerTechChecksState" USING btree ("Description");


--
-- Name: IX_InsightGroup_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_InsightGroup_CL01" ON dbo."ServiceUserGroup" USING btree ("UserGroupName", "CustomerId", "DateDeleted");


--
-- Name: IX_LDAPGroup_NC01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_LDAPGroup_NC01" ON dbo."LDAPGroup" USING btree ("CustomerId");


--
-- Name: IX_LDAPGroup_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_LDAPGroup_NC02" ON dbo."LDAPGroup" USING btree ("CustomerId", "DateDeleted", "LDAPGroupId");


--
-- Name: IX_LDAPUserGroupMembership_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_LDAPUserGroupMembership_CU01" ON dbo."LDAPUserGroupMembership" USING btree ("LDAPGroupId", "DateDeleted");


--
-- Name: IX_LDAPUserGroupMembership_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_LDAPUserGroupMembership_NC02" ON dbo."LDAPUserGroupMembership" USING btree ("LDAPUserId", "DateDeleted", "LDAPGroupId");


--
-- Name: IX_LDAPUser_NC01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_LDAPUser_NC01" ON dbo."LDAPUser" USING btree ("CustomerId");


--
-- Name: IX_LDAPUser_NC03; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_LDAPUser_NC03" ON dbo."LDAPUser" USING btree ("CustomerId", "DateDeleted", "LDAPUserId");


--
-- Name: IX_LocaleDataTableStrings_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_LocaleDataTableStrings_CL01" ON dbo."LocaleDataTableStrings" USING btree ("LocaleDataTableId", "LocaleDataTableKeyId", "LocaleId");


--
-- Name: IX_Pen_01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Pen_01" ON dbo."Pen" USING btree ("PenTypeId", "DisplayName", "PenHostName", "IPAddress");


--
-- Name: IX_SMPTRoutes_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_SMPTRoutes_CL01" ON dbo."SMTPRoutes" USING btree ("CustomerId", "DomainId", "smtproutes_DeliveryAddress", "smtpRoutes_Order", "DateDeleted");


--
-- Name: IX_SMTPRoutes_NU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_SMTPRoutes_NU02" ON dbo."SMTPRoutes" USING btree ("CustomerId", "DomainId", "smtproutes_DeliveryAddress", "DateDeleted");


--
-- Name: IX_ServiceCFActionScalarParam_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFActionScalarParam_CU01" ON dbo."ServiceCFActionScalarParam" USING btree ("ActionId", "ParamType", "DateDeleted");


--
-- Name: IX_ServiceCFAction_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceCFAction_CL01" ON dbo."ServiceCFAction" USING btree ("RuleId", "DateDeleted");


--
-- Name: IX_ServiceCFAddressGroupParam_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceCFAddressGroupParam_NC02" ON dbo."ServiceCFConditionAddressParam" USING btree ("UserGroupId", "DateDeleted");


--
-- Name: IX_ServiceCFAddressGroupParam_NC03; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceCFAddressGroupParam_NC03" ON dbo."ServiceCFConditionAddressParam" USING btree ("ConditionId", "UserGroupId", "DateDeleted");


--
-- Name: IX_ServiceCFAddressGroupParam_NC04; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceCFAddressGroupParam_NC04" ON dbo."ServiceCFConditionAddressParam" USING btree ("LDAPGroupId", "DateDeleted");


--
-- Name: IX_ServiceCFAddressGroupParam_NC05; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceCFAddressGroupParam_NC05" ON dbo."ServiceCFConditionAddressParam" USING btree ("ConditionId", "LDAPGroupId", "DateDeleted");


--
-- Name: IX_ServiceCFAddressGroupParam_NC06; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceCFAddressGroupParam_NC06" ON dbo."ServiceCFConditionAddressParam" USING btree ("ConditionId", "IMSSUserGroupId", "IMSSUserGroupType", "DateDeleted");


--
-- Name: IX_ServiceCFConditionDomainGroupParam_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFConditionDomainGroupParam_CL01" ON dbo."ServiceCFConditionGroupParam" USING btree ("ConditionId", "ConditionGroupId", "DateDeleted");


--
-- Name: IX_ServiceCFConditionGroupParam_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceCFConditionGroupParam_NC02" ON dbo."ServiceCFConditionGroupParam" USING btree ("ConditionGroupId", "DateDeleted");


--
-- Name: IX_ServiceCFConditionGroup_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFConditionGroup_CL01" ON dbo."ServiceCFConditionGroup" USING btree ("CustomerId", "Name", "DateDeleted", "ServiceTypeId");


--
-- Name: IX_ServiceCFConditionScalarParam_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFConditionScalarParam_CL01" ON dbo."ServiceCFConditionScalarParam" USING btree ("ConditionId", "ParamType", "DateDeleted");


--
-- Name: IX_ServiceCFCondition_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceCFCondition_CL01" ON dbo."ServiceCFCondition" USING btree ("RuleId", "DateDeleted");


--
-- Name: IX_ServiceCFCustomerExclusionAddress_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFCustomerExclusionAddress_CU01" ON dbo."ServiceCFCustomerExclusionAddress" USING btree ("CustomerId", "DomainId", "EmailAddress", "DateDeleted");


--
-- Name: IX_ServiceCFDomain_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFDomain_CL01" ON dbo."ServiceCFDomain" USING btree ("ConditionGroupId", "DomainName", "DateDeleted");


--
-- Name: IX_ServiceCFGlobalExclusionAddress_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFGlobalExclusionAddress_CU01" ON dbo."ServiceCFGlobalExclusionAddress" USING btree ("EmailAddress");


--
-- Name: IX_ServiceCFLexExpression_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceCFLexExpression_CL01" ON dbo."ServiceCFLexExpression" USING btree ("ConditionGroupId", "DateDeleted");


--
-- Name: IX_ServiceCFRegExpressionTemplateReference_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFRegExpressionTemplateReference_CL01" ON dbo."ServiceCFRegExpressionTemplateReference" USING btree ("ConditionGroupId", "RegExpressionId", "DateDeleted");


--
-- Name: IX_ServiceCFRegExpression_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFRegExpression_CL01" ON dbo."ServiceCFRegExpression" USING btree ("ConditionGroupId", "RegularExpression", "DateDeleted");


--
-- Name: IX_ServiceCFRule_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFRule_CL01" ON dbo."ServiceCFRule" USING btree ("CustomerId", "DomainId", "Sequence", "Template", "DateDeleted", "ServiceTypeId");


--
-- Name: IX_ServiceCFRule_NU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFRule_NU02" ON dbo."ServiceCFRule" USING btree ("CustomerId", "DomainId", "ServiceTypeId", "RuleName", "DateDeleted");


--
-- Name: IX_ServiceCFSuperGroupEntry_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFSuperGroupEntry_CU01" ON dbo."ServiceCFSuperGroupEntry" USING btree ("SuperConditionGroupId", "EntryConditionGroupId", "DateDeleted");


--
-- Name: IX_ServiceCFTimeRestrictionDayPart_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFTimeRestrictionDayPart_CL01" ON dbo."ServiceCFTimeRestrictionDayPart" USING btree ("ConditionGroupId", "DateDeleted");


--
-- Name: IX_ServiceCFTimeRestrictionTimePart_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFTimeRestrictionTimePart_CL01" ON dbo."ServiceCFTimeRestrictionTimePart" USING btree ("ConditionGroupId", "FromTime", "ToTime", "DateDeleted");


--
-- Name: IX_ServiceCFTimeRestrictionTimeZonePart_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFTimeRestrictionTimeZonePart_CL01" ON dbo."ServiceCFTimeRestrictionTimeZonePart" USING btree ("ConditionGroupId", "DateDeleted");


--
-- Name: IX_ServiceCFTimeZone_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCFTimeZone_CL01" ON dbo."ServiceCFTimeZone" USING btree ("ZoneKey");


--
-- Name: IX_ServiceCF_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceCF_CL01" ON dbo."ServiceCF" USING btree ("CustomerId", "DomainId", "DateDeleted");


--
-- Name: IX_ServiceGoodRcptTo_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceGoodRcptTo_CL01" ON dbo."ServiceGoodRcptTo" USING btree ("CustomerId", "DomainId", "DateDeleted");


--
-- Name: IX_ServicePornGlobalImage_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServicePornGlobalImage_NC02" ON dbo."ServicePornGlobalImage" USING btree ("ClientName");


--
-- Name: IX_ServicePornImageSignature_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServicePornImageSignature_NC02" ON dbo."ServicePornImageSignature" USING btree ("Signature");


--
-- Name: IX_ServicePornImage_CU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServicePornImage_CU02" ON dbo."ServicePornImage" USING btree ("OwnerTypeId", "OwnerId", "SignatureId", "DateDeleted");


--
-- Name: IX_ServicePornListLimit_CU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServicePornListLimit_CU02" ON dbo."ServicePornListLimit" USING btree ("OwnerTypeId", "OwnerId", "ListTypeId");


--
-- Name: IX_ServicePornRule_CU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServicePornRule_CU02" ON dbo."ServicePornRule" USING btree ("OwnerTypeId", "OwnerId", "RuleTypeId", "DirectionTypeId");


--
-- Name: IX_ServicePornTrustedEmail_CU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServicePornTrustedEmail_CU02" ON dbo."ServicePornTrustedEmail" USING btree ("OwnerTypeId", "OwnerId", "TrustedEmailTypeId", "TrustedValue");


--
-- Name: IX_ServicePornUser_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServicePornUser_CU01" ON dbo."ServicePornUser" USING btree ("CustomerId", "DomainId", "EmailAddress", "DateDeleted");


--
-- Name: IX_ServicePorn_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServicePorn_CU01" ON dbo."ServicePorn" USING btree ("CustomerId", "DomainId", "DateDeleted");


--
-- Name: IX_ServiceSpamGlobalWBList_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceSpamGlobalWBList_CU01" ON dbo."ServiceSpamGlobalWBList" USING btree ("WhiteORBlack", "IpORDomain", "ListValue", "DateDeleted");


--
-- Name: IX_ServiceSpamGroup_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceSpamGroup_CU01" ON dbo."ServiceSpamGroup" USING btree ("CustomerId", "DomainId", "Name");


--
-- Name: IX_ServiceSpamRecipientAlias_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceSpamRecipientAlias_NC02" ON dbo."ServiceSpamRecipientAlias" USING btree ("SpamRecipientId");


--
-- Name: IX_ServiceSpamRecipientAlias_NU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceSpamRecipientAlias_NU02" ON dbo."ServiceSpamRecipientAlias" USING btree ("AliasEmailAddress");


--
-- Name: IX_ServiceSpamRecipient_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceSpamRecipient_CU01" ON dbo."ServiceSpamRecipient" USING btree ("CustomerId", "DomainId", "EmailAddress");


--
-- Name: IX_ServiceSpamRecipient_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceSpamRecipient_NC02" ON dbo."ServiceSpamRecipient" USING btree ("SpamGroupId");


--
-- Name: IX_ServiceSpamRecipient_NC03; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceSpamRecipient_NC03" ON dbo."ServiceSpamRecipient" USING btree ("EmailAddress");


--
-- Name: IX_ServiceSpamUser_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceSpamUser_CU01" ON dbo."ServiceSpamUser" USING btree ("CustomerId", "DomainId", "EmailAddress", "DateDeleted");


--
-- Name: IX_ServiceSpamWBItem_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceSpamWBItem_CU01" ON dbo."ServiceSpamWBItem" USING btree ("OwnerTypeId", "OwnerId", "WhiteORBlack", "IpORDomain", "ListValue");


--
-- Name: IX_ServiceSpamWBList_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceSpamWBList_CU01" ON dbo."ServiceSpamWBList" USING btree ("CustomerId", "DomainId", "WhiteORBlack", "IpORDomain", "ListValue", "DateDeleted");


--
-- Name: IX_ServiceSpamWBSettings_CU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceSpamWBSettings_CU02" ON dbo."ServiceSpamWBSettings" USING btree ("CustomerId", "DomainId", "WBSettingsTypeId");


--
-- Name: IX_ServiceSpam_CU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceSpam_CU01" ON dbo."ServiceSpam" USING btree ("CustomerId", "DomainId", "DateDeleted");


--
-- Name: IX_ServiceUQUserExtendedProperties_01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceUQUserExtendedProperties_01" ON dbo."ServiceUQUserExtendedProperties" USING btree ("UserId", "IsUQPrivacyUser", "IsUQAdministrator");


--
-- Name: IX_ServiceUQUserOptability_01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceUQUserOptability_01" ON dbo."ServiceUQUserOptability" USING btree ("UserId", "ServiceTypeId", "HasInbound", "HasOutbound");


--
-- Name: IX_ServiceUQUser_01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceUQUser_01" ON dbo."ServiceUQUser" USING btree ("CustomerId", "DomainId", "EmailAddress");


--
-- Name: IX_ServiceUQUser_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceUQUser_NC02" ON dbo."ServiceUQUser" USING btree ("EmailAddress");


--
-- Name: IX_ServiceUQ_NCU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceUQ_NCU01" ON dbo."ServiceUQ" USING btree ("OwnerId", "OwnerTypeId");


--
-- Name: IX_ServiceUser_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_ServiceUser_NC02" ON dbo."ServiceUser" USING btree ("EmailAddress");


--
-- Name: IX_ServiceVirusUser_CU02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ServiceVirusUser_CU02" ON dbo."ServiceVirusUser" USING btree ("CustomerId", "DomainId", "EmailAddress", "DateDeleted");


--
-- Name: IX_SpamPen_Nu01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_SpamPen_Nu01" ON dbo."SpamPen" USING btree ("DisplayName", "DateDeleted");


--
-- Name: IX_TLSCNOverride_NC01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_TLSCNOverride_NC01" ON dbo."TLSCNOverride" USING btree ("DomainId");


--
-- Name: IX_TLSEnforcement_NC01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_TLSEnforcement_NC01" ON dbo."TLSEnforcement" USING btree ("TLSId");


--
-- Name: IX_TLSPartnerCNOverride_NC01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_TLSPartnerCNOverride_NC01" ON dbo."TLSPartnerCNOverride" USING btree ("TLSPartnerDomainId");


--
-- Name: IX_TLSPartnerDomainGroup_NU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_TLSPartnerDomainGroup_NU01" ON dbo."TLSPartnerDomainGroup" USING btree ("CustomerId");


--
-- Name: IX_TLSPartnerDomain_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_TLSPartnerDomain_NC02" ON dbo."TLSPartnerDomain" USING btree ("CustomerId");


--
-- Name: IX_TLSPartnerSubdomainExclusion_NC01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_TLSPartnerSubdomainExclusion_NC01" ON dbo."TLSPartnerSubdomainExclusion" USING btree ("TLSPartnerDomainId");


--
-- Name: IX_TLSServiceConfig_UN01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_TLSServiceConfig_UN01" ON dbo."TLSServiceConfig" USING btree ("ConfigKey");


--
-- Name: IX_TLSSubdomainExclusion_NC01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_TLSSubdomainExclusion_NC01" ON dbo."TLSSubdomainExclusion" USING btree ("DomainId");


--
-- Name: IX_TLSSubdomainExclusion_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_TLSSubdomainExclusion_NC02" ON dbo."TLSSubdomainExclusion" USING btree ("SubdomainName");


--
-- Name: IX_TLS_NC02; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_TLS_NC02" ON dbo."TLS" USING btree ("DomainId");


--
-- Name: IX_TLS_NU01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE UNIQUE INDEX "IX_TLS_NU01" ON dbo."TLS" USING btree ("CustomerId", "DomainId");


--
-- Name: IX_UserGroupMembership_NC01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_UserGroupMembership_NC01" ON dbo."UserGroupMembership" USING btree ("MemberId", "MemberType", "DateDeleted");


--
-- Name: IX_UserName_CL01; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX "IX_UserName_CL01" ON dbo."ServiceUser" USING btree ("CustomerId", "DomainId", "EmailAddress", "DateDeleted");


--
-- PostgreSQL database dump complete
--

