package edu.fpt.service;

import edu.fpt.context.ConnectDB;
import edu.fpt.dao.ItemDAO;
import edu.fpt.entity.Item;
import edu.fpt.entity.ItemType;

import java.util.ArrayList;
import java.util.List;

public class ItemMapping {
    public static List<Item> allItems = null;
    public static List<Item> feturedItems = null;
    public static List<Item> topRateItems = null;
    public static List<ItemType> allItemTypes = null;
    static ItemDAO dao = new ItemDAO();

    public static List<Item> getAllItems(ConnectDB db) {
        if (allItems != null) return allItems;
        allItems = dao.getAllItems(db);
        return allItems;
    }

    public static List<Item> getAllFeturedItems(ConnectDB db) {
        if (feturedItems != null) return feturedItems;
        feturedItems = dao.getAllFeturedItems(db);
        return feturedItems;
    }

    public static List<Item> getAllTopRateItems(ConnectDB db) {
        if (topRateItems != null) return topRateItems;
        topRateItems = dao.getAllTopRateItems(db);
        return topRateItems;
    }

    public static List<Item> searchItems(ConnectDB db, String inameValue, int itnoValue, int sortValue) {
        return dao.searchItems(db,inameValue,itnoValue,sortValue);
    }

    public static Item getItem(ConnectDB db, int ino) {
        if (allItems == null) allItems = dao.getAllItems(db);
        for (int i = 0; i < allItems.size(); i++) {
            if (allItems.get(i).getIno()==ino) return allItems.get(i);
        }
        return null;
    }

    public static List<Item> getItemsByCategory(ConnectDB db, int itno) {
        if (allItems == null) allItems = dao.getAllItems(db);
        List<Item> listItems = new ArrayList<>();
        for (int i = 0; i < allItems.size(); i++) {
            if (allItems.get(i).getItno()==itno) {
                listItems.add(allItems.get(i));
            }
        }
        return listItems;
    }

    public static List<ItemType> getAllItemTypes(ConnectDB db) {
        if (allItemTypes != null) return allItemTypes;
        allItemTypes = dao.getAllItemTypes(db);
        return allItemTypes;
    }

    public static ItemType getItemType(ConnectDB db, int itno) {
        if (allItemTypes == null) allItemTypes = dao.getAllItemTypes(db);
        for (int i = 0; i < allItemTypes.size(); i++) {
            if (allItemTypes.get(i).getItno()==itno) {
                return allItemTypes.get(i);
            }
        }
        return null;
    }

    public static void newItem(ConnectDB db, Item item) {
        if (dao.newItem(db,item)) {
            allItems = null;
            feturedItems = null;
            topRateItems = null;
        }
    }

    public static void newItemType(ConnectDB db, ItemType itemType) {
        if (dao.newItemType(db,itemType)) {
            allItemTypes = null;
            allItems = null;
            feturedItems = null;
            topRateItems = null;
        }
    }

    public static void editItem(ConnectDB db, Item item) {
        if (dao.editItem(db,item)) {
            allItems = null;
            feturedItems = null;
            topRateItems = null;
        }
    }

    public static void editItemType(ConnectDB db, ItemType itemType) {
        if (dao.editItemType(db,itemType)) {
            allItemTypes = null;
            allItems = null;
            feturedItems = null;
            topRateItems = null;
        }
    }

    public static void removeItem(ConnectDB db, int ino) {
        if (dao.removeItem(db,ino) > 0) {
            allItems = null;
            feturedItems = null;
            topRateItems = null;
        }
    }

    public static void removeItemType(ConnectDB db, int itno) {
        if (dao.removeItemType(db,itno) > 0) {
            allItemTypes = null;
            allItems = null;
            feturedItems = null;
            topRateItems = null;
        }
    }

    public static int getNextInoItem(ConnectDB db){
        return dao.getNextInoItem(db);
    }

    public static int getNextItnoItemType(ConnectDB db){
        return dao.getNextItnoItemType(db);
    }

}
