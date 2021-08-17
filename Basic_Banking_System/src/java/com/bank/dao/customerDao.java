package com.bank.dao;

import com.bank.entities.User;
import com.bank.entities.transaction;
import java.sql.*;
import java.util.ArrayList;

public class customerDao {
    private Connection con;

    public customerDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<User> allCustomer() {
        ArrayList<User> list = new ArrayList<>();

        try {
            String query = "select * from customers";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet set = pstmt.executeQuery();

            while(set.next()) {
                int id=set.getInt("userID");
                String name=set.getString("userName");
                String email=set.getString("userEmail");
                String balance=set.getString("userBalance");
                User user=new User(id,name,email,balance);
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
   
    public User getSenderUser(int id){
        User user =null;
        
        try {
            String query="select * from customers where userID=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet set=pstmt.executeQuery();
            
            if(set.next()){
                user=new User();
                
                user.setName(set.getString("userName"));
                user.setEmail(set.getString("userEmail"));
                user.setId(set.getInt("userID"));
                user.setBalance(set.getString("userBalance"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public User getReceiverUser(String email){
        User user =null;
        
        try {
            String query="select * from customers where userEmail=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, email);
            ResultSet set=pstmt.executeQuery();
            
            if(set.next()){
                user=new User();
                
                user.setName(set.getString("userName"));
                user.setEmail(set.getString("userEmail"));
                user.setId(set.getInt("userID"));
                user.setBalance(set.getString("userBalance"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean updateBalance(int id,int amt){
        boolean f=false;
        try {
            String query="update customers set userBalance=? where userID=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, amt);
            p.setInt(2, id);
            
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }   
    
    // Method to insert data to transaction history
    public boolean updateTransactionHistory(String sName,String rName,int amt) {
        boolean f=false;
        try {
            // Coding through which user reaches to database
            String query = "insert into transaction(sender,receiver,tAmount) values(?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, sName);
            pstmt.setString(2, rName);
            pstmt.setInt(3, amt);

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public ArrayList<transaction> DataFromTransHstry() {
        ArrayList<transaction> trans = new ArrayList<>();
        
        try {
            String query="select * from transaction order by dTime DESC";
            PreparedStatement pstmt=con.prepareStatement(query);
            ResultSet set=pstmt.executeQuery();
          
            while(set.next()) {
                int amount=set.getInt("tAmount");
                String sName=set.getString("sender");
                String rName=set.getString("receiver");
                Timestamp date = set.getTimestamp("dTime");
                transaction tr=new transaction(sName, rName, amount,date);
                trans.add(tr);
            }
        } catch (Exception e) {
        } 
        return trans;
    }
}
