/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.dao;

import edu.fpt.context.ConnectDB;
import edu.fpt.entity.Invoice;
import edu.fpt.entity.InvoiceDetail;

import java.sql.CallableStatement;
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
public class InvoiceDAO {

    public List<Invoice> getAllInvoices(ConnectDB db){
        List<Invoice> list = new ArrayList<>();
        String sql = "Select * from Invoice order by Inno DESC";
        try {
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int inno = rs.getInt(1);
                String cno = rs.getString(2);
                String date = rs.getString(3);
                double total = rs.getDouble(4);
                boolean status = rs.getBoolean(5);
                list.add(new Invoice(inno, cno, date, total, status));
            }
            rs.close();
            stmt.close();
            return list;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<InvoiceDetail> getInvoiceDetail(ConnectDB db, int inno) {
        try {
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "Select Inno, InvoiceDetail.Ino, Iname, ItemAmount, TotalPrice from InvoiceDetail inner join Item on InvoiceDetail.Ino = Item.Ino where Inno = "+inno;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            List<InvoiceDetail> list = new ArrayList<>();
            while(rs.next()) {
                list.add(new InvoiceDetail(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDouble(5)
                ));
            }
            rs.close();
            stmt.close();
            return list;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void newInvoiceDetail(ConnectDB db,int inno, int ino, int quantity) {
        try {
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            CallableStatement cstmt = con.prepareCall("{call insert_InvoiceDetail(?,?,?)}");
            cstmt.setInt(1, inno);
            cstmt.setInt(2, ino);
            cstmt.setInt(3, quantity);
            cstmt.executeUpdate();
            cstmt.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public boolean newInvoice(ConnectDB db, String cno, String dateSale, boolean paymentStatus) {
        try {
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "Insert into Invoice(Cno,DateSale,PaymentStatus) values(?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, cno);
            pstmt.setString(2, dateSale);
            pstmt.setBoolean(3, paymentStatus);
            int result = pstmt.executeUpdate();
            pstmt.close();
            return result>0;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return false;
    }

    public boolean confirmInvoice(ConnectDB db,int inno, boolean status) {
        try {
            Connection con = db.getConnection();
            if(con==null){
                con = db.openConnection();
            }
            String sql = "Update Invoice set PaymentStatus = ? where Inno = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setBoolean(1, status);
            pstmt.setInt(2, inno);
            int result = pstmt.executeUpdate();
            pstmt.close();
            return result>0;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return false;
    }

    public int removeInvoice(ConnectDB db, int inno){
        String sql = "Delete from Invoice where Inno = "+inno;
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
