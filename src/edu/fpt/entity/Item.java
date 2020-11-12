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
public class Item {
    private int ino, itno;
    private String iname;
    private String dateImport, dateExpired;
    private double unitPrice;
    private int availableAmount;
    private String url;

    public Item() {
    }

    public Item(int ino, int itno, String iname, double unitPrice, String dateImport, String dateExpired, int availableAmount) {
        this.ino = ino;
        this.itno = itno;
        this.iname = iname;
        this.dateImport = dateImport;
        this.dateExpired = dateExpired;
        this.unitPrice = unitPrice;
        this.availableAmount = availableAmount;
    }
    
    public Item(int ino, int itno, String iname, double unitPrice, String dateImport, int availableAmount) {
        this.ino = ino;
        this.itno = itno;
        this.iname = iname;
        this.dateImport = dateImport;
        this.unitPrice = unitPrice;
        this.availableAmount = availableAmount;
    }

    public Item(int ino, int itno, String iname, double unitPrice, String dateImport, String dateExpired, int availableAmount, String url) {
        this.ino = ino;
        this.itno = itno;
        this.iname = iname;
        this.dateImport = dateImport;
        this.dateExpired = dateExpired;
        this.unitPrice = unitPrice;
        this.availableAmount = availableAmount;
        this.url = url;
    }

    public Item(int itno, String iname, double unitPrice, String dateImport, String dateExpired, int availableAmount, String url) {
        this.itno = itno;
        this.iname = iname;
        this.dateImport = dateImport;
        this.dateExpired = dateExpired;
        this.unitPrice = unitPrice;
        this.availableAmount = availableAmount;
        this.url = url;
    }
    
    public Item(int ino, String iname, double unitPrice, int quantity, String url) {
        this.ino = ino;
        this.iname = iname;
        this.unitPrice = unitPrice;
        this.availableAmount = quantity;
        this.url = url;
    }

    public Item(int ino, String iname, double unitPrice, String url) {
        this.ino = ino;
        this.iname = iname;
        this.unitPrice = unitPrice;
        this.url = url;
    }
    
    public int getIno() {
        return ino;
    }

    public int getItno() {
        return itno;
    }

    public String getIname() {
        return iname;
    }

    public String getDateImport() {
        return dateImport;
    }

    public String getDateExpired() {
        return dateExpired;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public int getAvailableAmount() {
        return availableAmount;
    }

    public String getUrl() {
        return url;
    }

    public void setIno(int ino) {
        this.ino = ino;
    }

    public void setItno(int itno) {
        this.itno = itno;
    }

    public void setIname(String iname) {
        this.iname = iname;
    }

    public void setDateImport(String dateImport) {
        this.dateImport = dateImport;
    }

    public void setDateExpired(String dateExpired) {
        this.dateExpired = dateExpired;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public void setAvailableAmount(int availableAmount) {
        this.availableAmount = availableAmount;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    
}
