/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.admin;


import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.service.ItemMapping;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import edu.fpt.entity.Item;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;


/**
 * @author Admin
 */
public class EditItemAction extends ActionSupport {
    private int ino, itno;
    private String iname, dateImport, dateExpired;
    File itemImage;
    private int avaiAmount;
    private double unitPrice;
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

    ConnectDB db = new ConnectDB();

    public EditItemAction() {
    }

    @Override
    public String execute() {
        if (itemImage != null) {
            try {
                String filePath = ServletActionContext.getServletContext().getRealPath("webapp/resource/ProductImages")
                        .replace("\\target\\OnlineStore-1.0", "");
                System.out.println(filePath);
                String myFileFileName = "Item"+ ino + ".jpg";
                File destFile = new File(filePath, myFileFileName);
                if(destFile.exists()){
                    destFile.delete();
                }
                FileUtils.copyFile(itemImage, destFile);
            } catch (IOException e) {
                e.printStackTrace();
                return ERROR;
            }
        }
        ItemMapping.editItem(db, new Item(ino, itno, iname, unitPrice, dateImport, dateExpired, avaiAmount));
        db.closeConnection();
        return SUCCESS;
    }

    @Override
    public void validate() {
        //Handling Exception if dateExpired in jsp is null
        try {
            dateExpired = ServletActionContext.getRequest().getAttribute("dateExpired").toString();
        } catch (Exception ex) {
            dateExpired = null;
        }
        //----------
        try {
            if (new Date().getTime() < formatter.parse(dateImport).getTime()) {
                addFieldError("dateImportField", "Date import must be before now");
            }
            if (dateExpired != null && dateExpired != "") {
                if (formatter.parse(dateExpired).getTime() < formatter.parse(dateImport).getTime()) {
                    addFieldError("dateExpiredField", "Date expired must later than date import");
                }
            }
        } catch (ParseException ex) {
            System.out.println(ex);
        }
        if (unitPrice <= 0) {
            addFieldError("unitPriceField", "Item price must be positive number");
        }
        if (avaiAmount <= 0) {
            addFieldError("avaiAmountField", "Item amout must be positive number");
        }
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


    public int getAvaiAmount() {
        return avaiAmount;
    }

    public double getUnitPrice() {
        return unitPrice;
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

    public void setAvaiAmount(int avaiAmount) {
        this.avaiAmount = avaiAmount;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public File getItemImage() {
        return itemImage;
    }

    public void setItemImage(File itemImage) {
        this.itemImage = itemImage;
    }

}
