CREATE SCHEMA IF NOT EXISTS sensus_survey COLLATE utf8mb4_0900_ai_ci;

USE sensus_survey;

SET GLOBAL local_infile = 'ON';

DROP TABLE IF EXISTS survey_result;
CREATE TABLE `survey_result` (
  `Row_id` int NOT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Id` varchar(45) DEFAULT NULL,
  `DeviceId` varchar(300) DEFAULT NULL,
  `Timestamp` varchar(45) DEFAULT NULL,
  `ProtocolId` varchar(45) DEFAULT NULL,
  `BuildId` varchar(20) DEFAULT NULL,
  `ParticipantId` varchar(45) DEFAULT NULL,
  `DeviceManufacturer` varchar(20) DEFAULT NULL,
  `DeviceModel` varchar(20) DEFAULT NULL,
  `OperatingSystem` varchar(20) DEFAULT NULL,
  `TaggedEventId` varchar(255) DEFAULT NULL,
  `TaggedEventTags` varchar(255) DEFAULT NULL,
  `SensingAgentStateDescription` varchar(255) DEFAULT NULL,
  `LocalOffsetFromUTC` varchar(20) DEFAULT NULL,
  `Decibels` double DEFAULT NULL,
  `BatteryLevel` double DEFAULT NULL,
  `AccessPointBSSID` varchar(30) DEFAULT NULL,
  `Activity` varchar(20) DEFAULT NULL,
  `Phase` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Confidence` varchar(20) DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `LocationAccuracy` double DEFAULT NULL,
  `ProtocolName` varchar(255) DEFAULT NULL,
  `Formatted_time` datetime DEFAULT NULL,
  PRIMARY KEY (`Row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOAD DATA LOCAL INFILE '/Users/jathinkolluru/Documents/group8_output.csv' INTO TABLE survey_result
   FIELDS TERMINATED BY ',' ESCAPED BY '\\' OPTIONALLY ENCLOSED BY '"'
   LINES TERMINATED BY '\n'
   ignore 1 lines;


