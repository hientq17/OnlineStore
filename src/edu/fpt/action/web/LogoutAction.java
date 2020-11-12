/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.fpt.action.web;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.dao.CustomerDAO;
import edu.fpt.entity.Customer;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author MrEnd
 */
public class LogoutAction extends ActionSupport {
    public String logout(){
        ServletActionContext.getRequest().getSession().invalidate();
        return SUCCESS;
    }
    
}
