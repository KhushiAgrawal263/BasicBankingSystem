package com.bank.helper;

import java.sql.*;

public class ConnectionProvider {
    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
                // Load driver class
                Class.forName("com.mysql.jdbc.Driver");

                // Create a connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/basic_banking_system", "root", "Khushi@123");
                System.out.println("connection succesful");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }    
}
