/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.Item;
import edu.fpt.entity.ItemType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MrEnd
 */
public class ItemDAO {

    public List<Item> getAllItems(ConnectDB db){
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "Select * from Item";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            List<Item> list = new ArrayList<>();
            while(rs.next()){
                list.add(new Item(
                        rs.getInt("Ino"),
                        rs.getInt("ITno"),
                        rs.getString("Iname"),
                        rs.getDouble("UnitPrice"),
                        rs.getString("DateImport"),
                        rs.getString("DateExpired"),
                        rs.getInt("AvailableAmount"),
                        rs.getString("ImageURL"))
                );
            }
            rs.close();
            stmt.close();
            return list;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return null;
    }
    
    public List<Item> getAllFeturedItems(ConnectDB db){
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "Select InvoiceDetail.Ino, ITno, Iname, UnitPrice, AvailableAmount, ImageURL, sum(ItemAmount) as TotalAmount from InvoiceDetail inner join Item on Item.Ino = InvoiceDetail.Ino \n" +
                        "group by InvoiceDetail.Ino, ITno, Iname, UnitPrice, AvailableAmount, ImageURL order by TotalAmount DESC LIMIT 8";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            List<Item> list = new ArrayList<>();
            Item item;
            while(rs.next()){
                item = new Item();
                item.setIno(rs.getInt("Ino"));
                item.setItno(rs.getInt("ITno"));
                item.setIname(rs.getString("Iname"));
                item.setUnitPrice(rs.getDouble("UnitPrice"));
                item.setAvailableAmount(rs.getInt("AvailableAmount"));
                item.setUrl(rs.getString("ImageURL"));
                list.add(item);
            }
            rs.close();
            stmt.close();
            return list;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return null;
    }

    public List<Item> getAllTopRateItems(ConnectDB db){
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "Select InvoiceDetail.Ino, Iname, UnitPrice, AvailableAmount, ImageURL, sum(ItemAmount) as TotalAmount from InvoiceDetail inner join Item on Item.Ino = InvoiceDetail.Ino \n" +
                    "group by InvoiceDetail.Ino, Iname, UnitPrice, AvailableAmount, ImageURL order by TotalAmount DESC LIMIT 4";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            List<Item> list = new ArrayList<>();
            Item item;
            while(rs.next()){
                item = new Item();
                item.setIno(rs.getInt("Ino"));
                item.setIname(rs.getString("Iname"));
                item.setUnitPrice(rs.getDouble("UnitPrice"));
                item.setAvailableAmount(rs.getInt("AvailableAmount"));
                item.setUrl(rs.getString("ImageURL"));
                list.add(item );
            }
            rs.close();
            stmt.close();
            return list;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return null;
    }

    public int getNextInoItem(ConnectDB db){
        int ino = 0;
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "\n" +
                    "SELECT AUTO_INCREMENT as Ino FROM information_schema.TABLES " +
                    "WHERE TABLE_SCHEMA = \"mrendzpc_OnlineStore\" AND TABLE_NAME = \"Item\";";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next()){
                ino = rs.getInt("Ino");
            }
            stmt.close();
            return ino;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return ino;
    }

    public int getNextItnoItemType(ConnectDB db){
        int itno = 0;
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "\n" +
                    "SELECT AUTO_INCREMENT as Itno FROM information_schema.TABLES " +
                    "WHERE TABLE_SCHEMA = \"mrendzpc_OnlineStore\" AND TABLE_NAME = \"ItemType\";";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next()){
                itno = rs.getInt("Itno");
            }
            stmt.close();
            return itno;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return itno;
    }

    public List<Item> searchItems(ConnectDB db, String inameValue, int itnoValue, int sortValue){
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "Select Item.* from Item inner join ItemType on Item.ITno = ItemType.ITno";           
            if(itnoValue > 0){
                sql += " where (Item.Itno = "+itnoValue;
                if(inameValue!=null && inameValue.length()>0 && !inameValue.equals("null"))
                    sql += " and Iname like '%"+inameValue+"%') or (Item.Itno = "+itnoValue+" and ItemType.ITname like '%"+inameValue+"%')";
                else    sql += ")" ;
            } else{
                if(inameValue!=null && inameValue.length()>0 && !inameValue.equals("null"))
                    sql += " where Iname like '%"+inameValue+"%' or ItemType.ITname like '%"+inameValue+"%'";
            }
            if(sortValue==1) sql += " order by UnitPrice ASC";
            else if(sortValue==-1) sql += " order by UnitPrice DESC";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            List<Item> list = new ArrayList<>();
            while(rs.next()){
                list.add(new Item(
                        rs.getInt("Ino"),
                        rs.getInt("ITno"),
                        rs.getString("Iname"),
                        rs.getDouble("UnitPrice"),
                        rs.getString("DateImport"),
                        rs.getString("DateExpired"),
                        rs.getInt("AvailableAmount"),
                        rs.getString("ImageURL"))
                );
            }
            rs.close();
            stmt.close();
            return list;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return null;
    }
    
    public List<ItemType> getAllItemTypes(ConnectDB db){
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "Select * from ItemType";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            List<ItemType> list = new ArrayList<>();
            while(rs.next()){
                list.add(new ItemType(
                        rs.getInt("ITno"),
                        rs.getString("ITname"),
                        rs.getString("ImageURL"))
                );
            }
            rs.close();
            stmt.close();
            return list;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return null;
    }
    
    public boolean newItem(ConnectDB db, Item item){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String sql = "Insert into Item values(?,?,?,?,?,?,?,?)";
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, item.getIno());
            pstmt.setInt(2, item.getItno());
            pstmt.setString(3, item.getIname());
            pstmt.setDouble(4, item.getUnitPrice());
            java.sql.Date sDate = new java.sql.Date(formatter.parse(item.getDateImport()).getTime());
            pstmt.setDate(5, sDate);
            if(item.getDateExpired()!=null && item.getDateExpired()!=""){
                sDate = new java.sql.Date(formatter.parse(item.getDateExpired()).getTime());
                pstmt.setDate(6, sDate);
            } else{
                pstmt.setDate(6, null);
            }
            pstmt.setInt(7, item.getAvailableAmount());
            pstmt.setString(8, item.getUrl());
            int result = pstmt.executeUpdate();
            pstmt.close();
            return result>0;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }
    
    public boolean newItemType(ConnectDB db, ItemType itemType){
        String sql = "Insert into ItemType values(?,?,?)";
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, itemType.getItno());
            pstmt.setString(2, itemType.getItname());
            pstmt.setString(3, itemType.getUrl());
            int result= pstmt.executeUpdate();
            pstmt.close();
            return result>0;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }
    
    public boolean editItem(ConnectDB db, Item item){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String sql = "Update Item set ITno=?, Iname=?, UnitPrice=?, DateImport=?, DateExpired=?, AvailableAmount=? where Ino=?";
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            PreparedStatement pstmt = con.prepareStatement(sql);           
            pstmt.setInt(1, item.getItno());
            pstmt.setString(2, item.getIname());
            pstmt.setDouble(3, item.getUnitPrice());
            java.sql.Date sDate = new java.sql.Date(formatter.parse(item.getDateImport()).getTime());
            pstmt.setDate(4, sDate);
            if(item.getDateExpired()!=null && item.getDateExpired()!=""){
                sDate = new java.sql.Date(formatter.parse(item.getDateExpired()).getTime());
                pstmt.setDate(5, sDate);
            } else{
                pstmt.setDate(5, null);
            }
            pstmt.setInt(6, item.getAvailableAmount());
            pstmt.setInt(7, item.getIno());
            int result = pstmt.executeUpdate();
            pstmt.close();
            return result>0;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }
    
    public boolean editItemType(ConnectDB db, ItemType itemType){
        String sql = "Update ItemType set ITname=? where ITno=?";
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, itemType.getItname());
            pstmt.setInt(2, itemType.getItno());
            int result = pstmt.executeUpdate();
            pstmt.close();
            return result>0;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }
    
    public int removeItem(ConnectDB db, int ino){
        String sql = "Delete from Item where Ino = "+ino;
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            Statement stmt = con.createStatement();
            int result = stmt.executeUpdate(sql);
            stmt.close();
            return result;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return -1;
    }
    
    public int removeItemType(ConnectDB db, int itno){
        String sql = "Delete from ItemType where ITno = "+itno;
        try{
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            Statement stmt = con.createStatement();
            int result = stmt.executeUpdate(sql);
            stmt.close();
            return result;
        } catch(Exception ex){
            System.out.println(ex);
        }
        return -1;
    }
}
