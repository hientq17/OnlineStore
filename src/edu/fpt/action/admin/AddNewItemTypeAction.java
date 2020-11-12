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
public class AddNewItemTypeAction extends ActionSupport {

    String itname;
    File itemTypeImage;

    ConnectDB db = new ConnectDB();

    public AddNewItemTypeAction() {
    }

    public String execute() {
        try {
            String filePath = ServletActionContext.getServletContext().getRealPath("webapp/resource/ProductImages")
                    .replace("\\target\\OnlineStore-1.0", "");
            System.out.println(filePath);
            int itno = ItemMapping.getNextItnoItemType(db);
            String myFileFileName = "ItemType"+itno + ".jpg";
            File destFile = new File(filePath, myFileFileName);
            FileUtils.copyFile(itemTypeImage, destFile);
            ItemMapping.newItemType(db, new ItemType(itname, myFileFileName));
        } catch (IOException e) {
            e.printStackTrace();
            return ERROR;
        }
        db.closeConnection();
        return SUCCESS;
    }

    public String getItname() {
        return itname;
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
