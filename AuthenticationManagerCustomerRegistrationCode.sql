
CREATE TABLE dbo."AuthenticationManagerCustomerRegistrationCode"
(
	"Id"							INTEGER GENERATED ALWAYS AS IDENTITY					NOT NULL,
	"CustomerId"					INTEGER													NOT NULL,
	"RegistrationCode"				TEXT COLLATE dbo.case_insensitive						NOT NULL,
	"DateCreatedUTC"				TIMESTAMP WITHOUT TIME ZONE								NOT NULL	CONSTRAINT "DF_AuthenticationManagerCustomerRegistrationCode_DateCreatedUTC"			DEFAULT (GETUTCDATE()),
	"DateExpiredUTC"				TIMESTAMP WITHOUT TIME ZONE								NOT NULL	CONSTRAINT "DF_AuthenticationManagerCustomerRegistrationCode_DateExpiredUTC"			DEFAULT (DATEADD(day,7,GETUTCDATE())),
	"WhoAmended_nt_username"		TEXT COLLATE dbo.case_insensitive						NOT NULL	CONSTRAINT "DF_AuthenticationManagerCustomerRegistrationCode_WhoAmended_nt_username"	DEFAULT ('Unknown'),
	"WhoAmended_hostname"			TEXT COLLATE dbo.case_insensitive						NOT NULL	CONSTRAINT "DF_AuthenticationManagerCustomerRegistrationCode_WhoAmended_hostname"		DEFAULT ('Unknown'),
	CONSTRAINT "PK_AuthenticationManagerCustomerRegistrationCode"	PRIMARY KEY  
	(
		"Id"
	)	
);

CREATE  INDEX "IX_AuthenticationManagerCustomerRegistrationCode_NC01" ON dbo."AuthenticationManagerCustomerRegistrationCode" 
   (
     "CustomerId"
   );
 
CREATE UNIQUE  INDEX "IX_AuthenticationManagerCustomerRegistrationCode_NU01" ON dbo."AuthenticationManagerCustomerRegistrationCode" 
  (
   "RegistrationCode"
  );
 
