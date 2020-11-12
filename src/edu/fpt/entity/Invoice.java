/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.entity;


/**
 *
 * @author Admin
 */
public class Invoice {

    private int inno;
    private String cno;
    private String dateSale;
    private double totalPayment;
    private boolean paymentStatus;
    
    public Invoice() {}

    public Invoice(int inno, String cno, String dateSale, double totalPayment, boolean paymentStatus) {
        this.inno = inno;
        this.cno = cno;
        this.dateSale = dateSale;
        this.totalPayment = totalPayment;
        this.paymentStatus = paymentStatus;
    }

    public int getInno() {
        return inno;
    }

    public String getCno() {
        return cno;
    }

    public String getDateSale() {
        return dateSale;
    }

    public double getTotalPayment() {
        return totalPayment;
    }

    public boolean isPaymentStatus() {
        return paymentStatus;
    }

    public void setInno(int inno) {
        this.inno = inno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public void setDateSale(String dateSale) {
        this.dateSale = dateSale;
    }

    public void setTotalPayment(double totalPayment) {
        this.totalPayment = totalPayment;
    }

    public void setPaymentStatus(boolean paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    
}
