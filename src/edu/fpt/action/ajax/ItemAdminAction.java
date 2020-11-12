/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.ajax;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.service.ItemMapping;
import edu.fpt.entity.Item;
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
public class ItemAdminAction extends ActionSupport {
    int ino;
    int itno;
    List<Item> listItems;

    ConnectDB db = new ConnectDB();

    public String removeItem(){
        ItemMapping.removeItem(db,ino);
        //Delete image
        String filePath = ServletActionContext.getServletContext().getRealPath("webapp/resource/ProductImages")
                .replace("\\target\\OnlineStore-1.0","");
        System.out.println(filePath);
        Path imagesPath = Paths.get(filePath+"\\Item"+ino+".jpg");
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
        if(itno>0){
            listItems = ItemMapping.getItemsByCategory(db,itno);
        } else{
            listItems = ItemMapping.getAllItems(db);
        }
        db.closeConnection();
        return SUCCESS;
    }

    public String sortItems(){
        if(itno>0){
            listItems = ItemMapping.getItemsByCategory(db,itno);
        } else{
            listItems = ItemMapping.getAllItems(db);
        }
        db.closeConnection();
        return SUCCESS;
    }

    public int getIno() {
        return ino;
    }

    public void setIno(int ino) {
        this.ino = ino;
    }

    public int getItno() {
        return itno;
    }

    public void setItno(int itno) {
        this.itno = itno;
    }

    public List<Item> getListItems() {
        return listItems;
    }

    public void setListItems(List<Item> listItems) {
        this.listItems = listItems;
    }
}
