/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.admin;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.service.ItemMapping;
import edu.fpt.entity.ItemType;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.IOException;

/**
 * @author MrEnd
 */
public class EditItemTypeAction extends ActionSupport {
    int itno;
    String itname;
    File itemTypeImage;

    ConnectDB db = new ConnectDB();

    public EditItemTypeAction() {
    }

    public String execute() {
        if (itemTypeImage != null) {
            try {
                String filePath = ServletActionContext.getServletContext().getRealPath("webapp/resource/ProductImages")
                        .replace("\\target\\OnlineStore-1.0", "");
                System.out.println(filePath);
                String myFileFileName = "ItemType" + itno + ".jpg";
                File destFile = new File(filePath, myFileFileName);
                FileUtils.copyFile(itemTypeImage, destFile);
            } catch (IOException e) {
                e.printStackTrace();
                return ERROR;
            }
        }
        ItemMapping.editItemType(db, new ItemType(itno, itname));
        db.closeConnection();
        return SUCCESS;
    }

    public int getItno() {
        return itno;
    }

    public String getItname() {
        return itname;
    }

    public void setItno(int itno) {
        this.itno = itno;
    }

    public void setItname(String itname) {
        this.itname = itname;
    }

    public File getItemTypeImage() {
        return itemTypeImage;
    }

    public void setItemTypeImage(File itemTypeImage) {
        this.itemTypeImage = itemTypeImage;
    }


}
