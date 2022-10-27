CREATE TABLE USER (
    id SMALLINT UNSIGNED NOT NULL auto_increment,
    Username varchar(50) NOT NULL ,
    PSalt char(10) NOT NULL,
    PHash char(40) NOT NULL,
    FName varchar(40) NOT NULL DEFAULT "Anonymous",
    LName varchar(40),
    Email varchar(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (Username),
    UNIQUE KEY (Email)
);

CREATE TABLE POST (
    id INT UNSIGNED NOT NULL auto_increment,
    Created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Title varchar(50) NOT NULL,
    Content MEDIUMTEXT NOT NULL,
    Published BOOLEAN,
    UserID SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (UserID) REFERENCES USER(id) ON UPDATE RESTRICT ON DELETE CASCADE
);

CREATE TABLE COMMENT (
    id INT UNSIGNED NOT NULL auto_increment,
    Created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Content VARCHAR(512) NOT NULL,
    PostID INT UNSIGNED NOT NULL,
    UserID SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (PostID) REFERENCES POST(id) ON UPDATE RESTRICT ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES USER(id) ON UPDATE RESTRICT ON DELETE CASCADE
);



INSERT INTO USER (id, Username, PSalt, PHash, FName, LName, Email)
VALUES (NULL, "besmera", "9c8ffcdf2b", SHA1("9c8ffcdf2bpassword"), "Andrew", "Besmer", "besmera@winthrop.edu");

INSERT INTO USER (id, Username, PSalt, PHash, Fname, Lname, Email) 
VALUES (NULL, "williamc", "15f4d183d4", SHA1("15f4d183d4password"), "Will", "Cats", "willc@winthrop.edu");

INSERT INTO USER  (id, Username, PSalt, PHash, Fname, Lname, Email) 
VALUES (NULL, "smithj", "2053c865b4", SHA1("2053c865b4password"), "John", "Smith", "smithj@winthrop.edu");

Insert INTO USER (id, Username, PSalt, PHash, Fname, Lname, Email) 
VALUES (NULL, "dots", "9c388e08e4", SHA1("9c388e08e4password"), "Slash", "Dot", "dots@winthrop.edu");

INSERT INTO POST(id, Created, Title, Content, Published, UserID)
VALUES (NULL, CURRENT_TIMESTAMP, "First Post", "Hello, this is my first post!", TRUE, 1);

INSERT INTO POST (id, Created, Title, Content, Published, UserID)
VALUES (NULL, CURRENT_TIMESTAMP, "Another Post", "Hello, I also made a post!", TRUE, 2);

INSERT INTO COMMENT (id, Created, Content, PostID, UserID)
VALUES (NULL, CURRENT_TIMESTAMP, "I really like your post", 2, 3);

INSERT INTO COMMENT (id, Created, Content, PostID, UserID)
VALUES (NULL, CURRENT_TIMESTAMP, "I like your post too!", 2, 4);

INSERT INTO COMMENT (id, Created, Content, PostID, UserID)
VALUES (NULL, CURRENT_TIMESTAMP, "You have an amazing post", 1, 2);

SELECT * FROM USER;

SELECT * FROM POST;

SELECT * FROM COMMENT;

SELECT POST.Created, POST.Title, POST.Content, USER.FName, USER.LName, USER.Email 
FROM POST JOIN USER 
ON POST.UserID = USER.id;