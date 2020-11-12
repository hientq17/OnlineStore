package edu.fpt.action.ajax;

import com.opensymphony.xwork2.ActionSupport;
import edu.fpt.context.ConnectDB;
import edu.fpt.entity.Customer;
import edu.fpt.service.CustomerMapping;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

public class CustomerAction extends ActionSupport {
    public String getCustomer(){
        ConnectDB db = new ConnectDB();
        HttpServletRequest request = ServletActionContext.getRequest();
        Customer customer = CustomerMapping.getCustomer(db,
                (String)request.getSession().getAttribute("cnoLogin"));
        request.setAttribute("customer",customer);
        return SUCCESS;
    }
}
