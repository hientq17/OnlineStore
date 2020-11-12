package edu.fpt.service;

import edu.fpt.context.ConnectDB;
import edu.fpt.dao.CartDAO;
import edu.fpt.entity.CartItem;
import java.util.List;

public class CartMapping {

    static CartDAO dao = new CartDAO();

    public static List<CartItem> getCart(ConnectDB db, String cno){
        return dao.getCart(db,cno);
    }

    public static int getQuantityCart(ConnectDB db, String cno, int ino){
        return dao.getQuantityCart(db,cno,ino);
    }

    public static void newCart(ConnectDB db, String cno, int ino, int quantity){
        dao.newCart(db,cno,ino,quantity);
        ItemMapping.allItems = null;
        ItemMapping.feturedItems = null;
        ItemMapping.topRateItems = null;
    }

    public static void editCart(ConnectDB db, String cno, int ino, int quantity){
        dao.editCart(db,cno,ino,quantity);
        ItemMapping.allItems = null;
        ItemMapping.feturedItems = null;
        ItemMapping.topRateItems = null;
    }

    public static void removeCart(ConnectDB db, String cno){
        dao.removeCart(db,cno);
        ItemMapping.allItems = null;
        ItemMapping.feturedItems = null;
        ItemMapping.topRateItems = null;
    }

    public static void removeCart(ConnectDB db, String cno, int ino){
        dao.removeCart(db,cno,ino);
        ItemMapping.allItems = null;
        ItemMapping.feturedItems = null;
        ItemMapping.topRateItems = null;
    }

}
