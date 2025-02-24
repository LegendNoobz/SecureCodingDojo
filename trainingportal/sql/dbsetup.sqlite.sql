CREATE TABLE dbInfo (
  version INTEGER
);
INSERT INTO dbInfo (version) VALUES (6);

CREATE TABLE moduleInfo (
  version INTEGER
);
INSERT INTO moduleInfo (version) VALUES (0);

CREATE TABLE challengeEntries (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  userId INTEGER,
  challengeId CHAR(255),
  timestamp CHAR(255)
);

CREATE TABLE badges (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  userId INTEGER,
  moduleId CHAR(255),
  timestamp CHAR(255)
);

CREATE TABLE teams (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name CHAR(255) UNIQUE,
  description CHAR(2048),
  ownerId INTEGER UNIQUE
);
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  accountId CHAR(255) NOT NULL UNIQUE,
  teamId INTEGER unsigned,
  familyName CHAR(255),
  givenName CHAR(255),
  score INTEGER DEFAULT 0
);

CREATE TRIGGER update_user_score_after_challenge
AFTER INSERT ON challengeEntries
FOR EACH ROW
BEGIN
  UPDATE users SET score = score + 15 WHERE id = NEW.userid AND NEW.challengeId LIKE '%codereview%';
  UPDATE users SET score = score + 25 WHERE id = NEW.userid AND NEW.challengeId LIKE '%crypto%';
  UPDATE users SET score = score + 45 WHERE id = NEW.userid AND NEW.challengeId LIKE '%cwe%';
  UPDATE users SET score = score + 55 WHERE id = NEW.userid AND NEW.challengeId LIKE '%owasp2017%';
END;