CREATE TABLE dbo."AuthenticationManagerUserRegistrationKey"
(
	"Id"						INTEGER GENERATED ALWAYS AS IDENTITY				NOT NULL,
	"CustomUserId"				INTEGER												NOT NULL,
	"UserType"					INTEGER												NOT NULL,
	"RegistrationKey"			TEXT COLLATE dbo.case_insensitive					NOT NULL,
	"DateCreatedUTC"			TIMESTAMP WITHOUT TIME ZONE							NOT NULL	CONSTRAINT "DF_AuthenticationManagerUserRegistrationKey_DateCreatedUTC"  DEFAULT (GETUTCDATE()),
	"DateExpiredUTC"			TIMESTAMP WITHOUT TIME ZONE							NOT NULL	CONSTRAINT "DF_AuthenticationManagerUserRegistrationKey_DateExpiredUTC"  DEFAULT (DATEADD(hour,1,GETUTCDATE())),

	CONSTRAINT "PK_AuthenticationManagerUserRegistrationKey"	PRIMARY KEY  
	(
		"Id" 
	)		
);

CREATE UNIQUE INDEX "IX_AuthenticationManagerUserRegistrationKey_NC01" ON dbo."AuthenticationManagerUserRegistrationKey" 
  (
    "RegistrationKey"
  ); 
 
