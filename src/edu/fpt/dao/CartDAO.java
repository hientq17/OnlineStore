/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.CartItem;

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
public class CartDAO {

   public List<CartItem> getCart(ConnectDB db, String cno){
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "Select Item.Ino, Iname, UnitPrice, Cart.Quantity, AvailableAmount, Item.ImageURL from Cart inner join Item on Cart.Ino = Item.Ino where Cno = '"+ cno +"' ";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            List<CartItem> list = new ArrayList<>();
            while(rs.next()){
                list.add(new CartItem(
                        rs.getInt("Ino"),
                        rs.getString("Iname"),
                        rs.getDouble("UnitPrice"),
                        rs.getInt("Quantity"),
                        rs.getInt("AvailableAmount"),
                        rs.getString("ImageURL")
                ));
            }
            rs.close();
            stmt.close();
            return list;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return null;
    }
   
   public int getQuantityCart(ConnectDB db, String cno, int ino){
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "Select Quantity from Cart where cno=? and ino=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, cno);
            pstmt.setInt(2, ino);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                int result = rs.getInt("Quantity");
                rs.close();
                pstmt.close();
                return result;
            }
            rs.close();
            pstmt.close();
        } catch(Exception ex){
            System.out.println(ex);
        }
        return -1;
   }
   
   public boolean newCart(ConnectDB db, String cno, int ino, int quantity){
        String sql = "Insert into Cart values(?,?,?)";
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, cno);
            pstmt.setInt(2, ino);
            pstmt.setInt(3, quantity);
            int result = pstmt.executeUpdate();
            pstmt.close();
            return result>0;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }
   
   public boolean editCart(ConnectDB db, String cno, int ino, int quantity){
        String sql = "Update Cart set quantity=? where Cno=? and Ino=?";
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, quantity);
            pstmt.setString(2, cno); 
            pstmt.setInt(3, ino);
            int result = pstmt.executeUpdate();
            pstmt.close();
            return result>0;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }
   
   public boolean removeCart(ConnectDB db, String cno){
        String sql = "Delete from Cart where Cno='"+cno+"'";
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
   
   public boolean removeCart(ConnectDB db, String cno, int ino){
        String sql = "Delete from Cart where Cno=? and Ino=?";
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, cno);
            pstmt.setInt(2, ino);
            int result = pstmt.executeUpdate();
            pstmt.close();
            return result>0;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }
   
}
