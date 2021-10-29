-- RPG GAME DATABASE STORED PROCEDURES
-- CASEY CULP
----------
--UPDATE PROCEDURES
----------
-- stored procedure to change character name
----------

CREATE PROCEDURE spCHANGENAME @I_CHARACTER_ID CHAR(4), @I_CHARACTER_NEWNAME VARCHAR(20)
AS
BEGIN
UPDATE CHARACTERS
SET NAME = @I_CHARACTER_NEWNAME
WHERE (CHARACTER_ID = @I_CHARACTER_ID)
END
GO
--EXAMPLE USE
--EXEC spCHANGENAME '0001', 'Killerino';
--DROP PROCEDURE spCHANGENAME
----------


----------
-- stored procedure to update ability description
----------

CREATE PROCEDURE spCHANGE_ABIL_DESC @I_ABILITY_ID CHAR(3), @I_NEWDESC VARCHAR(200)
AS
BEGIN
UPDATE ABILITY
SET DESCRIPTION = @I_NEWDESC
WHERE (ABILITY_ID = @I_ABILITY_ID)
END
GO
--EXAMPLE USE
--EXEC spCHANGE_ABIL_DESC 'A01', 'Immediately kill everything in an Area of Effect, friend or foe.';
--DROP PROCEDURE spCHANGE_ABIL_DESC
----------


----------
-- stored procedure to update character experience
----------

CREATE PROCEDURE spCHANGE_EXP @I_CHARACTER_ID CHAR(4), @I_NEW_EXP SMALLINT
AS
BEGIN
UPDATE CHARACTERS
SET EXPERIENCE = @I_NEW_EXP
WHERE (CHARACTER_ID = @I_CHARACTER_ID)
END
GO
--EXAMPLE USE
--EXEC spCHANGE_EXP '0001', '3333';
--DROP PROCEDURE spCHANGE_EXP
----------


----------
--INSERT PROCEDURES
----------
--stored procedure to insert a new character
----------

CREATE PROCEDURE spNEWCHAR @I_CHARID CHAR(4), @I_NAME VARCHAR(20), @I_RACE VARCHAR(20), @I_ROLE VARCHAR(20), @I_FACT TINYINT, @I_OWNER CHAR(4)
AS
BEGIN
SET NOCOUNT ON
INSERT INTO CHARACTERS
(CHARACTER_ID, NAME, RACE, ROLE, EXPERIENCE, FACTION, OWNER_NUM)
VALUES (@I_CHARID, @I_NAME, @I_RACE, @I_ROLE, 0, @I_FACT, @I_OWNER)
END
GO

--EXAMPLE USE
--EXEC spNEWCHAR '0013', 'Paisley', 'Fairy', 'Hunter', '3', 'A004';
--DROP PROCEDURE spNEWCHAR
----------


----------
--stored procedure to insert a new role
----------

CREATE PROCEDURE spNEWROLE @I_ROLENAME VARCHAR(20), @I_DESC VARCHAR(300), @I_ABILITY VARCHAR(3)
AS
BEGIN
SET NOCOUNT ON
INSERT INTO CHARACTER_ROLE
(ROLE_NAME, ROLE_DESCRIPTION, ROLE_ABILITY)
VALUES (@I_ROLENAME, @I_DESC, @I_ABILITY)
END
GO

--EXAMPLE USE
--EXEC spNEWROLE 'Dragon Rider', 'Dragon riders can summon dragons both as mounts an as fighting companions.', 'A04';
--DROP PROCEDURE spNEWROLE
----------


----------
--stored procedure to insert a new player
----------

CREATE PROCEDURE spNEWPLAYER @I_PLAYERNUM CHAR(4), @I_USERNAME VARCHAR(20), @I_PROFILENAME VARCHAR(20)
AS
BEGIN
SET NOCOUNT ON
INSERT INTO PLAYER
(PLAYER_NUM, USERNAME, PROFILE_NAME, BATTLE_POINTS)
VALUES (@I_PLAYERNUM, @I_USERNAME, @I_PROFILENAME, 0)
END
GO

--EXAMPLE USE
--EXEC spNEWPLAYER 'P006', 'MyKitty', 'Yusuke';
--DROP PROCEDURE spNEWPLAYER
----------


----------
--DELETE PROCEDURES
----------
--stored procedure to delete a player and their characters
----------

CREATE PROCEDURE spDELPLAYER @I_PLAYERNUM CHAR(4)
AS
BEGIN
DELETE FROM PLAYER
WHERE (PLAYER_NUM = @I_PLAYERNUM)
DELETE FROM CHARACTERS
WHERE (OWNER_NUM = @I_PLAYERNUM)
END
GO

--EXAMPLE USE
--EXEC spDELPLAYER 'A001';
--DROP PROCEDURE spDELPLAYER
----------


----------
--stored procedure to delete just one character
----------

CREATE PROCEDURE spDELCHAR @I_CHARID CHAR(4)
AS
BEGIN
DELETE FROM CHARACTERS
WHERE (CHARACTER_ID = @I_CHARID)

END
GO

--EXAMPLE USE
--EXEC spDELCHAR '0002';
--DROP PROCEDURE spDELCHAR
----------


----------
--stored procedure to delete a role and all characters with that role
----------

CREATE PROCEDURE spDELROLE @I_ROLE VARCHAR(20)
AS
BEGIN
DELETE FROM CHARACTERS
WHERE (ROLE = @I_ROLE)
DELETE FROM CHARACTER_ROLE
WHERE (ROLE_NAME = @I_ROLE)
END
GO

--EXAMPLE USE
--EXEC spDELROLE 'Warrior';
--DROP PROCEDURE spDELROLE
----------