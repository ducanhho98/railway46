DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE IF NOT EXISTS Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
  
  
DROP TABLE IF EXISTS Department ;
CREATE TABLE IF NOT EXISTS Department (
    DepartmentID TINYINT NOT NULL AUTO_INCREMENT,
    DepartmentName VARCHAR(50),
    PRIMARY KEY (DepartmentID)
);

DROP TABLE IF EXISTS Position ;
CREATE TABLE IF NOT EXISTS Position (
    PositionID INT PRIMARY KEY AUTO_INCREMENT,
    PositionName ENUM('dev', 'test', 'scrum master', 'pm')
);
 
 DROP TABLE IF EXISTS `Account` ;
CREATE TABLE IF NOT EXISTS `Account` (
    AccountID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(30),
    Username VARCHAR(30),
    FullName VARCHAR(30),
    DepartmentID TINYINT NOT NULL,
    PositionID INT NOT NULL ,
    CreateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (DepartmentID)
        REFERENCES department (DepartmentID),
    FOREIGN KEY (PositionID)
        REFERENCES Position (PositionID)
);
 DROP TABLE IF EXISTS `Group` ;
CREATE TABLE IF NOT EXISTS `Group` (
    GroupID TINYINT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(30),
    CreatorID TINYINT,
    CreateDate DATE
); 
 
 DROP TABLE IF EXISTS `GroupAccount` ;
CREATE TABLE IF NOT EXISTS `GroupAccount` (
    GroupID TINYINT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT,
    JoinDate DATE,
    FOREIGN KEY (GroupID)
        REFERENCES `Group` (GroupID),
    FOREIGN KEY (AccountID)
        REFERENCES `Account` (AccountID)
); 

DROP TABLE IF EXISTS TypeQuestion ;
CREATE TABLE IF NOT EXISTS TypeQuestion (
    TypeID TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TypeName ENUM('Essay', 'Multiple-Choice')
);


DROP TABLE IF EXISTS CategoryQuestion ;
CREATE TABLE IF NOT EXISTS CategoryQuestion (
    CategoryID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CategoryName ENUM('Java', '.NET', 'SQL', 'Postman', 'Ruby')
);
  

 DROP TABLE IF EXISTS Question ;
CREATE TABLE IF NOT EXISTS Question (
    QuestionID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(255),
    CategoryID INT NOT NULL,
    TypeID TINYINT NOT NULL,
    CreatorID TINYINT,
    CreateDate DATE,
    FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (TypeID)
        REFERENCES TypeQuestion (TypeID)
);

DROP TABLE IF EXISTS Answer ;
CREATE TABLE IF NOT EXISTS Answer (
    AnswerID TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(255),
    QuestionID INT NOT NULL,
    isCorrect BOOLEAN,
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
);
 
DROP TABLE IF EXISTS Exam ;
CREATE TABLE IF NOT EXISTS Exam (
    ExamID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `Code`VARCHAR(30),
    Title VARCHAR(255),
    CategoryID INT NOT NULL,
    Duration TIME,
    CreatorID TINYINT,
    CreateDate DATE,
    FOREIGN KEY (CategoryID)
        REFERENCES CategoryQuestion (CategoryID)
    
);

DROP TABLE IF EXISTS ExamQuestion ;
CREATE TABLE IF NOT EXISTS ExamQuestion (
ExamID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
QuestionID  INT NOT NULL,
 FOREIGN KEY (ExamID)
        REFERENCES Exam (ExamID),
FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
        
);







 
 
 
