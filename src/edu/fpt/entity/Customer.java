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
public class Customer {
    String cno, cpass, cname, cphone, caddress;
    boolean cgender, cadmin;

    public Customer() {
    }

    public Customer(String cno, String cpass, String cname, boolean cgender, String cphone, String caddress, boolean cadmin) {
        this.cno = cno;
        this.cpass = cpass;
        this.cname = cname;
        this.cphone = cphone;
        this.caddress = caddress;
        this.cgender = cgender;
        this.cadmin = cadmin;
    }
    
    public Customer(String cno, String cpass, String cname, boolean cgender, String cphone, String caddress) {
        this.cno = cno;
        this.cpass = cpass;
        this.cname = cname;
        this.cphone = cphone;
        this.caddress = caddress;
        this.cgender = cgender;
    }
    
    public Customer(String cno, String cname, boolean cgender, String cphone, String caddress) {
        this.cno = cno;
        this.cname = cname;
        this.cphone = cphone;
        this.caddress = caddress;
        this.cgender = cgender;
    }
    
    public Customer(String cno, String cname, String cphone, String caddress) {
        this.cno = cno;
        this.cname = cname;
        this.cphone = cphone;
        this.caddress = caddress;
    }

    public String getCno() {
        return cno;
    }

    public String getCpass() {
        return cpass;
    }

    public String getCname() {
        return cname;
    }

    public String getCphone() {
        return cphone;
    }

    public String getCaddress() {
        return caddress;
    }

    public boolean isCgender() {
        return cgender;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public void setCpass(String cpass) {
        this.cpass = cpass;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public void setCaddress(String caddresss) {
        this.caddress = caddresss;
    }

    public void setCgender(boolean cgender) {
        this.cgender = cgender;
    }

    public boolean isCadmin() {
        return cadmin;
    }

    public void setCadmin(boolean cadmin) {
        this.cadmin = cadmin;
    }
    
}
