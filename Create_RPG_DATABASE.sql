-- RPG GAME DATABASE
-- CASEY CULP

BEGIN TRANSACTION;

-- Create PLAYER table
CREATE TABLE PLAYER (
    PLAYER_NUM CHAR(4) PRIMARY KEY NOT NULL,
    USERNAME VARCHAR(20) NOT NULL,
    PROFILE_NAME VARCHAR(20) NOT NULL,
    BATTLE_POINTS SMALLINT,
);

-- Insert PLAYERS
INSERT INTO PLAYER VALUES('A001','killysmurf','Casey','9999');
INSERT INTO PLAYER VALUES('A002','Qu1zr','morgen','300');
INSERT INTO PLAYER VALUES('A003','SoupMan64','penguin','1250');
INSERT INTO PLAYER VALUES('A004','SUGA','Nik','800');
INSERT INTO PLAYER VALUES('A005','hamperz','Hamp','300');
INSERT INTO PLAYER VALUES('P001','ZillaVanillaz','zilla','300');
INSERT INTO PLAYER VALUES('P002','BLOODWORTH','TYLER','300');
INSERT INTO PLAYER VALUES('P003','DEKAF','gebba','300');
INSERT INTO PLAYER VALUES('P004','TimHorton','Ameer','300');
INSERT INTO PLAYER VALUES('P005','I_LIKE_ANIME','Andyrew','300');



-- Create CHARACTERS table      
CREATE TABLE CHARACTERS (
    CHARACTER_ID CHAR(4) PRIMARY KEY NOT NULL,
    NAME VARCHAR(20) NOT NULL,
    RACE VARCHAR(20) NOT NULL,
    ROLE VARCHAR(20) NOT NULL,
    EXPERIENCE SMALLINT,
    FACTION TINYINT NOT NULL,
	OWNER_NUM CHAR(4) NOT NULL,
);

-- Insert CHARACTERS 
INSERT INTO CHARACTERS VALUES('0001','Killy','Tiefling','Mage','9999','1','A001');
INSERT INTO CHARACTERS VALUES('0002','ksmurfy','Tiefling','Assassin','9999','2','A001');
INSERT INTO CHARACTERS VALUES('0003','Mo','Human','Warrior','3758','1','A002');
INSERT INTO CHARACTERS VALUES('0004','Eve','Elf','Hunter','3894','2','A004');
INSERT INTO CHARACTERS VALUES('0005','DANKpally','Dwarf','Paladin','1823','2','P002');
INSERT INTO CHARACTERS VALUES('0006','TROLLZOR','Troll','Assassin','5734','1','P001');
INSERT INTO CHARACTERS VALUES('0007','cuteANIMEgirl','Fairy','Mage','3432','3','P005');
INSERT INTO CHARACTERS VALUES('0008','Babish','Gnome','Warrior','324','1','P004');
INSERT INTO CHARACTERS VALUES('0009','mquizzy','Werewolf','Assassin','9999','2','A002');
INSERT INTO CHARACTERS VALUES('0010','hamper','Orc','Paladin','8453','1','A005');
INSERT INTO CHARACTERS VALUES('0011','DOOMFISH','Orc','Warrior','1234','2','P001');
INSERT INTO CHARACTERS VALUES('0012','MrPenguinSoup','Gnome','Hunter','7021','3','A003');



-- Create CHARACTER_RACE table 
CREATE TABLE CHARACTER_RACE (
    RACE_NAME VARCHAR(20) PRIMARY KEY NOT NULL,
    RACE_DESCRIPTION VARCHAR(300) NOT NULL,
	RACIAL_ABILITY VARCHAR(3) NOT NULL,

);

-- Insert CHARACTER_RACES
INSERT INTO CHARACTER_RACE VALUES('Human','Not particularly good at anything, but also has no weaknesses.','P01');
INSERT INTO CHARACTER_RACE VALUES('Elf','Tall and graceful, Elves excel at magic and tasks that require dexterity.','P02');
INSERT INTO CHARACTER_RACE VALUES('Dark Elf','The Dark Elf abandons all healing magic proficiency to boost their affinity to dark magic.','P03');
INSERT INTO CHARACTER_RACE VALUES('Orc','Orcs are strong bodied and have high attack and defense, making them capable melee fighters.','P04');
INSERT INTO CHARACTER_RACE VALUES('Dwarf','Dwarves are thick-skinned and sturdy. They can not do magic but have unparalleled defense.','P05');
INSERT INTO CHARACTER_RACE VALUES('Werewolf','Werewolves can temporarily abandon their consious mind for a power boost, but this comes at a cost.','A01');
INSERT INTO CHARACTER_RACE VALUES('Troll','Tall and monstrous, Trolls excel at both primal magic and hand-to-hand fighting.','M01');
INSERT INTO CHARACTER_RACE VALUES('Tiefling','Disliked by most other races, Tieflings have an affinity for summoning magic and thievery.','M02');
INSERT INTO CHARACTER_RACE VALUES('Fairy','The Fairies evolved from Elves, sacrificing their physical form to become even more proficient at light magic.','A02');
INSERT INTO CHARACTER_RACE VALUES('Gnome','Though weak of body, Gnomes are masterful engineers, creating machines to fight for them.','A03');


-- Create CHARACTER_ROLE table 
CREATE TABLE CHARACTER_ROLE (
    ROLE_NAME VARCHAR(20) PRIMARY KEY NOT NULL,
    ROLE_DESCRIPTION VARCHAR(300) NOT NULL,
	ROLE_ABILITY VARCHAR(3) NOT NULL,

);

-- Insert CHARACTER_ROLE
INSERT INTO CHARACTER_ROLE VALUES('Warrior','Warriors are proficient with melee weapons and wear heavy armor.','A04');
INSERT INTO CHARACTER_ROLE VALUES('Mage','Mages can use magic both for damage-dealing and healing. They wear light armor.','M03');
INSERT INTO CHARACTER_ROLE VALUES('Hunter','Hunters use a variety of ranged weapons, and also keep a beast as a companion for both protection and extra damage. They wear light armor','A05');
INSERT INTO CHARACTER_ROLE VALUES('Assassin','The Assassin strikes quickly and retreats just as fast. They wear medium armor','M04');
INSERT INTO CHARACTER_ROLE VALUES('Paladin','Paladins absorb as much damage as possible while healing themselves and their allies. They wear heavy armor.','M05');


-- Create FACTION table 
CREATE TABLE FACTION (
    FACTION_ID TINYINT PRIMARY KEY NOT NULL,
    FACTION_NAME VARCHAR(20) NOT NULL,

);

-- Insert CHARACTER_ROLE
INSERT INTO FACTION VALUES('1','Tribe of Luna');
INSERT INTO FACTION VALUES('2','Sol Seekers');
INSERT INTO FACTION VALUES('3','Anorachus');




-- Create ABILITY table 
CREATE TABLE ABILITY (
	ABILITY_ID CHAR(3) PRIMARY KEY NOT NULL,
    ABILITY_NAME VARCHAR(20) NOT NULL,
	DESCRIPTION VARCHAR(200) NOT NULL,

);

-- Insert ABILITIES
INSERT INTO ABILITY VALUES('P01','Jack of All','Get +2 in every stat category.');
INSERT INTO ABILITY VALUES('P02','Precision','Increase critical strike chance by 10%.');
INSERT INTO ABILITY VALUES('P03','Dark Arts','Reduce casting time for dark magic spells by 50%.');
INSERT INTO ABILITY VALUES('P04','Last Stand','Gain 50% armor when under 25% HP.');
INSERT INTO ABILITY VALUES('P05','Steadfast','You have +5 resistance to all elements.');
INSERT INTO ABILITY VALUES('A01','Frenzy','Lose control of your character for 10 seconds to deal 100% extra damage');
INSERT INTO ABILITY VALUES('M01','Totem','Summon any totem at no MP cost.');
INSERT INTO ABILITY VALUES('M02','Partnership','Summon an imp to fight as your companion.');
INSERT INTO ABILITY VALUES('A02','Blessing','Fully heal an ally.');
INSERT INTO ABILITY VALUES('A03','Little Buddy','Craft a mechanical companion to do battle for you.');
INSERT INTO ABILITY VALUES('A04','World Slash','Slash your weapon in a circle, dealing damage in an Area of Effect.');
INSERT INTO ABILITY VALUES('M03','Fireball','Cast a high-damage fireball.');
INSERT INTO ABILITY VALUES('A05','Befriend','Charm a beast to fight as your companion.');
INSERT INTO ABILITY VALUES('M04','Stealth','Enter stealth mode. Enemies can not see you until you attack.');
INSERT INTO ABILITY VALUES('M05','Divine Shield','Shield all allies in an Area of Effect.');



COMMIT TRANSACTION;
