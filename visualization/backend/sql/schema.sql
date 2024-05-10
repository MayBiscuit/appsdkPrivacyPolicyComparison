#DROP TABLE IF EXISTS STUDENT;
CREATE TABLE STUDENT(
	NAME VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	SEX VARCHAR(255) COLLATE UTF8_BIN,
	STU_NO VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	COLLEGE VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	MAJOR VARCHAR(255) COLLATE UTF8_BIN NOT NULL, 
	AD_YEAR VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	PASSWORD VARCHAR(255) COLLATE UTF8_BIN NOT NULL, 
	ID VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	PRIMARY KEY (STU_NO)
)ENGINE=INNODB DEFAULT CHARSET=UTF8;

#DROP TABLE IF EXISTS LOG_INFORMATION;
CREATE TABLE LOG_INFORMATION(
	STU_NO VARCHAR(255) COLLATE UTF8_BIN,
	LOG_TIME DATETIME,
	IP_ADDRESS VARCHAR(255) COLLATE UTF8_BIN,
	STATUS VARCHAR(255) COLLATE UTF8_BIN,
	PRIMARY KEY (STU_NO,LOG_TIME,IP_ADDRESS),
	FOREIGN KEY (STU_NO) REFERENCES STUDENT(STU_NO)
)ENGINE=INNODB DEFAULT CHARSET=UTF8;
 
#DROP TABLE IF EXISTS ADMINISTRATOR;#管理员
CREATE TABLE ADMINISTRATOR(
	STU_NO VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	PRIMARY KEY (STU_NO),
	FOREIGN KEY (STU_NO) REFERENCES STUDENT(STU_NO)
)ENGINE=INNODB DEFAULT CHARSET=UTF8;
 
#DROP TABLE IF EXISTS EDUCATION_PLAN;
CREATE TABLE EDUCATION_PLAN(
	AD_YEAR VARCHAR(255) COLLATE UTF8_BIN NOT NULL,#年级
	MAJOR VARCHAR(255) COLLATE UTF8_BIN NOT NULL,#专业
	CLASSIFICATION VARCHAR(255) COLLATE UTF8_BIN,#是否必修
	CO_NO VARCHAR(255) COLLATE UTF8_BIN NOT NULL,#课程号
	CO_100 VARCHAR(255) COLLATE UTF8_BIN NOT NULL,#用于获得已选课程的课程号
	CO_NAME VARCHAR(255) COLLATE UTF8_BIN NOT NULL,#学生名
	TEACHER VARCHAR(255) COLLATE UTF8_BIN NOT NULL,#老师
	CREDITS DECIMAL(3,1),
	TOTAL_HR INT(10),#总课时
	START_TIME DATE,
	END_TIME DATE,
	CLASS_TIME VARCHAR(255) COLLATE UTF8_BIN,
	MAX_STUDENTS INT(10),
	CO_HR INT(10),#授课课时
	ONLINE_HR INT(10),
	EXPR_HR INT(10),
	PRAC_HR INT(10),
	PRAC_WK INT(10),
	START_SEMENMTER INT(2) NOT NULL,
	IS_MUST INT(2) DEFAULT '0',
	COLLEGE VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	NOTE TEXT COLLATE UTF8_BIN,
	PRIMARY KEY (CO_NO)
)ENGINE=INNODB DEFAULT CHARSET=UTF8;
 
#DROP TABLE IF EXISTS CHOOSE;/*选过且结课的课*/
CREATE TABLE CHOOSE(
	AD_YEAR VARCHAR(255) COLLATE UTF8_BIN NOT NULL,#年级
	MAJOR VARCHAR(255) COLLATE UTF8_BIN NOT NULL,#专业
	STU_NO VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	CO_NO VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	GRADE DECIMAL(5,1),
	COMMENT VARCHAR(255) COLLATE UTF8_BIN,
	PRIMARY KEY (STU_NO,CO_NO),
	FOREIGN KEY (STU_NO) REFERENCES STUDENT(STU_NO),
	FOREIGN KEY (CO_NO) REFERENCES EDUCATION_PLAN(CO_NO)
)ENGINE=INNODB DEFAULT CHARSET=UTF8;

#DROP TABLE IF EXISTS EDU_STU_PLAN;/*每个人的学分信息*/
CREATE TABLE EDU_STU_PLAN(
	AD_YEAR VARCHAR(255) COLLATE UTF8_BIN NOT NULL,/*入学年份*/
	STU_NO VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	DIRECTION VARCHAR(255) COLLATE UTF8_BIN,
	FINISHED_CO VARCHAR(255) COLLATE UTF8_BIN,
	HAS_CREDITS DECIMAL(10,2),
	NOT_CREDITS DECIMAL(10,2),
	PRIMARY KEY (STU_NO),
	FOREIGN KEY (STU_NO) REFERENCES STUDENT(STU_NO)
)ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE NEWS(
	TOPIC VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	COMMENTS VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	COMMENTER VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	CREATE_TIME timestamp NOT NULL DEFAULT NOW(),
	NEWS_ID VARCHAR(255) COLLATE UTF8_BIN NOT NULL,
	IS_FIRST VARCHAR(255) COLLATE UTF8_BIN NOT NULL
)ENGINE=INNODB DEFAULT CHARSET=UTF8;