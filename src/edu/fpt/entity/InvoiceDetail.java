/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.entity;

/**
 *
 * @author MrEnd
 */
public class InvoiceDetail {
    int inno, ino;
    String iname;
    int itemAmount;
    double totalPrice;

    public InvoiceDetail() {
    }

    public InvoiceDetail(int inno, int ino, String iname, int itemAmount, double totalAmount) {
        this.inno = inno;
        this.ino = ino;
        this.iname = iname;
        this.itemAmount = itemAmount;
        this.totalPrice = totalAmount;
    }

    public int getInno() {
        return inno;
    }

    public int getIno() {
        return ino;
    }

    public String getIname() {
        return iname;
    }

    public int getItemAmount() {
        return itemAmount;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setInno(int inno) {
        this.inno = inno;
    }

    public void setIno(int ino) {
        this.ino = ino;
    }

    public void setIname(String iname) {
        this.iname = iname;
    }

    public void setItemAmount(int itemAmount) {
        this.itemAmount = itemAmount;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
}
