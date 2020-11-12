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

import java.util.List;

/**
 *
 * @author MrEnd
 */
public class CategoryAction extends ActionSupport {
    int itno;
    String iname, sort;
    List<Item> listItems = null;
    int paginationNo;

    ConnectDB db = new ConnectDB();

    public String advancedCategory(){
        listItems = ItemMapping.searchItems(db, iname, itno, Integer.parseInt(sort));
        paginationNo = listItems.size()%6==0?listItems.size()/6:listItems.size()/6+1;
        db.closeConnection();
        return SUCCESS;
    }

    public String getIname() {
        return iname;
    }

    public void setIname(String iname) {
        this.iname = iname;
    }

    public int getItno() {
        return itno;
    }

    public void setItno(int itno) {
        this.itno = itno;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public List<Item> getListItems() {
        return listItems;
    }

    public void setListItems(List<Item> listItems) {
        this.listItems = listItems;
    }

    public int getPaginationNo() {
        return paginationNo;
    }

    public void setPaginationNo(int paginationNo) {
        this.paginationNo = paginationNo;
    }
}
