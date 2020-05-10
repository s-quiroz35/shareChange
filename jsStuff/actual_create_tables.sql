DROP DATABASE IF EXISTS ligma;
CREATE DATABASE ligma;
USE ligma;

CREATE TABLE User
(
    ID varchar(255),
    PRIMARY KEY (ID)
);

CREATE TABLE Account
(
    user_ID varchar(255),
    userName varchar(255),
    PASS varchar(255),
    bank varchar(255),

    PRIMARY KEY (user_ID, bank),
    FOREIGN KEY (user_ID) references User(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Card
(
	user_ID varchar(255),
    cardNumber varchar(255),
    expMonth int,
    expYear int,
    cvc int,
    
    PRIMARY KEY (user_ID, cardNumber),
    FOREIGN KEY (user_ID) references User(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Transactions
(
	user_ID varchar(255),
    transaction_ID varchar(255),
    amount double,
    processed bool,
    
    PRIMARY KEY (transaction_ID),
    FOREIGN KEY (user_ID) references User(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO User VALUES("Timmy");