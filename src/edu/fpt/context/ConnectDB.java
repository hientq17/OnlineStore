/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author MrEnd
 */
public class ConnectDB {

    //localhost sqlserver
//    private static String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//
//    private static String connectionUrl = "jdbc:sqlserver://QH:1433;database=OnlineStore";
//
//    private static String username = "sa";
//
//    private static String password = "1712";

    //localhost mysql
//    private static String driverName = "com.mysql.cj.jdbc.Driver";
//
//    private static String connectionUrl = "jdbc:mysql://localhost:3306/OnlineStore";
//
//    private static String username = "root";
//
//    private static String password = "171200";


    //cpanel hosing
    private static String driverName = "com.mysql.cj.jdbc.Driver";

    private static String connectionUrl = "jdbc:mysql://103.97.125.254:3306/mrendzpc_OnlineStore";

    private static String username = "mrendzpc_mrend";

    private static String password = "Hien1712";

    private Connection con = null;

    public Connection getConnection() {
        return con;
    }

    public Connection openConnection() {
        try {
            Class.forName(driverName);
            this.con = DriverManager.getConnection(connectionUrl,username,password);
            System.out.println("Open connection successfully");
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        return this.con;
    }

    public void closeConnection(){
        try {
            if(con!=null) {
                this.con.close();
                System.out.println("Close connection successfully");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
