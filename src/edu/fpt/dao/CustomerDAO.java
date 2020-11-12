/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MrEnd
 */
public class CustomerDAO {

    public List<Customer> getAllCustomers(ConnectDB db){
        List<Customer> list = new ArrayList<>();
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "Select * from Customer";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                list.add(new Customer(
                        rs.getString("Cno"),
                        rs.getString("Cpass"),
                        rs.getString("Cname"),
                        rs.getBoolean("Cgender"),
                        rs.getString("Cphone"),
                        rs.getString("Caddress"),
                        rs.getBoolean("Cadmin")
                ));
            }
            rs.close();
            stmt.close();
        } catch(Exception ex){
            System.out.println(ex);
        }
        return list;
    }
    
    public Customer getCustomer(ConnectDB db, String cno){
        Customer cus = null;
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "Select * from Customer where Cno = '"+ cno +"' ";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);           
            if(rs.next()){
                cus = new Customer(
                        rs.getString("Cno"),
                        rs.getString("Cpass"),
                        rs.getString("Cname"),
                        rs.getBoolean("Cgender"),
                        rs.getString("Cphone"),
                        rs.getString("Caddress"),
                        rs.getBoolean("Cadmin")
                );
            }
            rs.close();
            stmt.close();
        } catch(Exception ex){
            System.out.println(ex);
        }
        return cus;
    }
    
    public boolean newCustomer(ConnectDB db, Customer cus){
        String sql = "Insert into Customer values(?,?,?,?,?,?,?)";
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, cus.getCno());
            pstmt.setString(2, cus.getCpass());
            pstmt.setString(3, cus.getCname());
            pstmt.setBoolean(4, cus.isCgender());
            pstmt.setString(5, cus.getCphone());
            pstmt.setString(6, cus.getCaddress());
            pstmt.setBoolean(7, cus.isCadmin());
            int result = pstmt.executeUpdate();
            pstmt.close();
            return result>0;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public boolean changePassword(ConnectDB db, Customer cus){
        String sql = "Update Customer set Cpass=? where Cno=?";
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, cus.getCpass());
            pstmt.setString(2, cus.getCname());
            int result = pstmt.executeUpdate();
            pstmt.close();
            return result>0;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }
    
    public boolean editCustomer(ConnectDB db, Customer cus){
        String sql = "Update Customer set Cname=?, Cgender=?, Cphone=?, Caddress=? where Cno=?";
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, cus.getCname());
            pstmt.setBoolean(2, cus.isCgender());
            pstmt.setString(3, cus.getCphone());
            pstmt.setString(4, cus.getCaddress());
            pstmt.setString(5, cus.getCno());
            int result = pstmt.executeUpdate();
            pstmt.close();
            return result>0;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public boolean removeCustomer(ConnectDB db, String cno){
        String sql = "Delete from Customer where Cno = '"+cno+"'";
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            Statement stmt = con.createStatement();
            int result = stmt.executeUpdate(sql);
            stmt.close();
            return result>0;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }
}
