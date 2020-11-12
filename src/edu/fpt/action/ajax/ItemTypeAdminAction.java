/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.ajax;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.entity.Item;
import edu.fpt.entity.ItemType;
import edu.fpt.service.ItemMapping;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 *
 * @author MrEnd
 */
public class ItemTypeAdminAction extends ActionSupport {
    int itno;

    ConnectDB db = new ConnectDB();

    public String removeItemType(){
        ItemMapping.removeItemType(db,itno);
        //Delete image
        String filePath = ServletActionContext.getServletContext().getRealPath("webapp/resource/ProductImages")
                .replace("\\target\\OnlineStore-1.0","");
        System.out.println(filePath);
        Path imagesPath = Paths.get(filePath+"\\ItemType"+itno+".jpg");
        try {
            Files.delete(imagesPath);
            System.out.println("File "
                    + imagesPath.toAbsolutePath().toString()
                    + " successfully removed");
        } catch (IOException e) {
            System.err.println("Unable to delete "
                    + imagesPath.toAbsolutePath().toString()
                    + " due to...");
            e.printStackTrace();
        }
        List<ItemType> allItemTypes = ItemMapping.getAllItemTypes(db);
        ServletActionContext.getRequest().setAttribute("allItemTypes",allItemTypes);
        db.closeConnection();
        return SUCCESS;
    }

    public int getItno() {
        return itno;
    }

    public void setItno(int itno) {
        this.itno = itno;
    }

}
