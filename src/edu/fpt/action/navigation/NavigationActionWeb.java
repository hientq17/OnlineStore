/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.navigation;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.dao.CustomerDAO;
import edu.fpt.dao.ItemDAO;
import edu.fpt.entity.*;
import edu.fpt.service.CartMapping;
import edu.fpt.service.CustomerMapping;
import edu.fpt.service.InvoiceMapping;
import edu.fpt.service.ItemMapping;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 *
 * @author MrEnd
 */
public class NavigationActionWeb extends ActionSupport {

    public String homePage(){
        ConnectDB db = new ConnectDB();
        HttpServletRequest request = ServletActionContext.getRequest();
        List<ItemType> allItemTypes = ItemMapping.getAllItemTypes(db);
        List<Item> featuredItems = ItemMapping.getAllFeturedItems(db);
        List<Item> topRateItems = ItemMapping.getAllTopRateItems(db);
        request.setAttribute("allItemTypes",allItemTypes);
        request.setAttribute("featuredItems",featuredItems);
        request.setAttribute("topRateItems",topRateItems);
        db.closeConnection();
        return SUCCESS;
    }
    public String categoryPage(){
        ConnectDB db = new ConnectDB();
        HttpServletRequest request = ServletActionContext.getRequest();
        String itnoValue = request.getParameter("itno");
        List<Item> listItems = null;
        if(itnoValue!=null){
            int itno = Integer.parseInt(itnoValue);
            request.setAttribute("itno",itno);
            listItems = ItemMapping.getItemsByCategory(db,itno);
        }
        listItems = ItemMapping.getAllItems(db);
        request.setAttribute("listItems",listItems);
        List<ItemType> allItemTypes = ItemMapping.getAllItemTypes(db);
        request.setAttribute("allItemTypes",allItemTypes);
        int paginationNo = listItems.size()%6==0?listItems.size()/6:listItems.size()/6+1;
        request.setAttribute("paginationNo",paginationNo);
        db.closeConnection();
        return SUCCESS;
    }
    public String cartPage(){
        ConnectDB db = new ConnectDB();
        HttpServletRequest request = ServletActionContext.getRequest();
        String cno = (String)request.getSession().getAttribute("cnoLogin");
        if(cno!=null && cno.length()>0 && !cno.equals("null")){
            double totalCart = 0;
            List<CartItem> listCarts = CartMapping.getCart(db,cno);
            for(int i=0; i<listCarts.size(); i++){
                totalCart += listCarts.get(i).getQuantity()*listCarts.get(i).getUnitPrice();
            }
            request.setAttribute("totalCart",totalCart);
            request.setAttribute("listCarts",listCarts);
        }
        List<Invoice> invoiceList = InvoiceMapping.getInvoices(db,cno);
        request.setAttribute("invoiceList",invoiceList);
        db.closeConnection();
        return SUCCESS;
    }

    public String aboutPage(){
        ConnectDB db = new ConnectDB();
        db.closeConnection();
        return SUCCESS;
    }
    public String loginPage(){
        return SUCCESS;
    }
    public String signupPage(){
        return SUCCESS;
    }
    public String itemPage(){
        ConnectDB db = new ConnectDB();
        HttpServletRequest request = ServletActionContext.getRequest();
        int ino = Integer.parseInt(request.getParameter("ino"));
        Item item = ItemMapping.getItem(db,ino);
        request.setAttribute("item",item);
        List<Item> relatedItems = ItemMapping.getItemsByCategory(db,item.getItno());
        request.setAttribute("relatedItems",relatedItems);
        db.closeConnection();
        return SUCCESS;
    }
    public String checkoutPage(){
        ConnectDB db = new ConnectDB();
        HttpServletRequest request = ServletActionContext.getRequest();
        String cno = (String)request.getSession().getAttribute("cnoLogin");
        Customer customer = CustomerMapping.getCustomer(db,cno);
        request.setAttribute("customer",customer);
        List<CartItem> cartItemList = CartMapping.getCart(db,cno);
        request.setAttribute("cartItemList",cartItemList);
        db.closeConnection();
        return SUCCESS;
    }
    public String invoiceDetailPage(){
        ConnectDB db = new ConnectDB();
        HttpServletRequest request = ServletActionContext.getRequest();
        int inno = Integer.parseInt(request.getParameter("inno"));
        List<InvoiceDetail> invoiceDetailList = InvoiceMapping.getInvoiceDetail(db,inno);
        request.setAttribute("invoiceDetailList",invoiceDetailList);
        db.closeConnection();
        return SUCCESS;
    }
    public String warningPage(){
        return SUCCESS;
    }
    public String changePasswordPage(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String cno = (String)request.getSession().getAttribute("cnoLogin");
        if(cno!=null && cno.length()>0){
            ConnectDB db = new ConnectDB();
            String currentPassword = CustomerMapping.getCustomer(db,cno).getCpass();
            db.closeConnection();
            request.setAttribute("currentPassword",currentPassword);
        }
        return SUCCESS;
    }
    public String changeInformationPage(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String cno = (String)request.getSession().getAttribute("cnoLogin");
        if(cno!=null && cno.length()>0){
            ConnectDB db = new ConnectDB();
            Customer customer = CustomerMapping.getCustomer(db,cno);
            db.closeConnection();
            request.setAttribute("customer",customer);
        }
        return SUCCESS;
    }
}
