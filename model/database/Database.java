/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

/**
 *
 * @author Noria Soumbou
 */
public class Database {
    public void init_database(){
        
        String sql1 = "CREATE TABLE IF NOT EXISTS CUSTOMER("+
                "CID INTEGER PRIMARY KEY," +
                "FNAME VARCHAR(20) NOT NULL," +
                "LNAME VARCHAR(20) NOT NULL," +
                "EMAIL VARCHAR(20) NOT NULL," +
                "PHONE VARCHAR(10) NOT NULL," +
                "PSWD VARCHAR(32) NOT NULL);";
        
        String sql2 = "CREATE TABLE IF NOT EXISTS PRODUCTS(\n" +
                "PID INT PRIMARY KEY," +
                "BID INTEGER NOT NULL," +
                "PNAME VARCHAR(20) NOT NULL," +
                "COLOR VARCHAR(20) NOT NULL," +
                "DETAILS VARCHAR(1000) NOT NULL,\n" +
                "PSIZE INT,\n" +
                "PRICE DOUBLE NOT NULL,"+
                "QUANTITY INT NOT NULL," +
                "FOREIGN KEY (BID) REFERENCES BRAND(BID),"+
                ");";
       
        String sql3 = "CREATE TABLE IF NOT EXISTS  prod_orders (" +
                "ORDER_ID NUMBER," +
                "PID NUMBER," +
                "QUANTITY INT NOT NULL," +
                "Primary key(Order_id,PID)," +
                "Foreign Key (PID) references products," +
                "Foreign Key (ORDER_ID) references orders" +
                ");";
        
        String sql4 = "CREATE TABLE IF NOT EXISTS  CART(" +
                "QUANTITY INTEGER NOT NULL," +
                "CID INTEGER NOT NULL," +
                "PID INTEGER NOT NULL," +
                "PRIMARY KEY(CID,PID)," +
                "FOREIGN KEY (CID) REFERENCES CUSTOMER(CID)," +
                "FOREIGN KEY (PID) REFERENCES PRODUCTS(PID)" +
                ");";
        
        String sql5 = "CREATE TABLE IF NOT EXISTS  ORDERS (" +
                "ORDER_ID INT PRIMARY KEY," +
                "CID INT NOT NULL," +
                "AMOUNT DOUBLE NOT NULL," +
                "ORD_TIME timestamp NOT NULL," +
                "ORD_DATE DATE NOT NULL," +
                "DATE_DELIVERED DATE," +
                "STATUS CHAR(1) NOT NULL," +
                ");";
        
        String sql6 = "CREATE TABLE IF NOT EXISTS  BRAND (" +
                "BID INT PRIMARY KEY," +
                "BNAME VARCHAR(20) NOT NULL" +
                ");";
        
        String sql7 = "CREATE TABLE IF NOT EXISTS  ADDRESS(" +
                "AID INTEGER PRIMARY KEY," +
                "CID INTEGER NOT NULL," +
                "ADD_LINE1 VARCHAR(50) NOT NULL," +
                "ADD_LINE2 VARCHAR(50) NOT NULL," +
                "CITY VARCHAR(20) NOT NULL," +
                "STATE VARCHAR(2O) NOT NULL," +
                "ZIP NUMERIC(5,0) NOT NULL," +
                "FOREIGN KEY (STATE_CODE) REFERENCES STATES(STATE_CODE)," +
                "FOREIGN KEY (CID) REFERENCES CUSTOMER(CID)));";
        
        String sql8 = "CREATE TABLE IF NOT EXISTS  STAFF(" +
                "SID INTEGER PRIMARY KEY," +
                "FNAME VARCHAR(20) NOT NULL,\n" +
                "LNAME VARCHAR(20) NOT NULL,\n" +
                "EMAIL_ID VARCHAR(20) NOT NULL,\n" +
                "PHONE NUMBER(10) NOT NULL," +
                "UNAME VARCHAR(10) NOT NULL," +
                "PSWD VARCHAR(32) NOT NULL," +
                "JOB_TITLE VARCHAR(30) NOT NULL," +
                "JOINING_DATE DATE NOT NULL," +
                "SALARY NUMERIC(10,2) NOT NULL," +
                "ADD_LINE1 VARCHAR(50) NOT NULL," +
                "ADD_LINE2 VARCHAR(50) NOT NULL," +
                "CITY VARCHAR(20) NOT NULL," +
                "STATE VARCHAR(20) NOT NULL," +
                "ZIP NUMBER(5) NOT NULL," +
                "CONSTRAINT UK_STAFF_EMAIL UNIQUE(EMAIL_ID)," +
                "CONSTRAINT UK_STAFF_USER UNIQUE(UNAME)" +
                ");";
        
        
        
        
        
/*CREATE TABLE CARD_INFO(
CARD_NO NUMERIC(16,0) NOT NULL,
EXP_DATE CHAR(5),
CID INTEGER NOT NULL,
PRIMARY KEY (CARD_NO),
FOREIGN KEY (CID) REFERENCES CUSTOMER(CID)
);
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/*CREATE TABLE STATES(
STATE_CODE CHAR(2) PRIMARY KEY,
STATE_NAME VARCHAR(10) NOT NULL,
CONSTRAINT UK_STATE_NAME UNIQUE(STATE_NAME)
);*/
        



    }
}
