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
public class ItemType {
    private int itno;
    private String itname;
    private String url;

    public ItemType() {
    }

    public ItemType(int itno, String itname) {
        this.itno = itno;
        this.itname = itname;
    }

    public ItemType(int itno, String itname, String url) {
        this.itno = itno;
        this.itname = itname;
        this.url = url;
    }

    public ItemType(String itname, String url) {
        this.itname = itname;
        this.url = url;
    }

    public int getItno() {
        return itno;
    }

    public String getItname() {
        return itname;
    }

    public String getUrl() {
        return url;
    }

    public void setItno(int itno) {
        this.itno = itno;
    }

    public void setItname(String itname) {
        this.itname = itname;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
}
