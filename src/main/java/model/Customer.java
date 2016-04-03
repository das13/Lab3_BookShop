package model;

import org.apache.log4j.Logger;

/**
 * Class that describes the customer's.
 *
 * @author Veleri Rechembei
 * @version %I%, %G%
 */
public class Customer {
    private final int           id;
    private String              login;
    private String              password;
    private String              eMail;
    private int                 phone;
    private int                 role;
    private static final Logger LOG  = Logger.getLogger(Customer.class);

    public Customer(int id, String login, String password, String eMail,int phone, int role) {
        this.id = id;
        this.login = login;
        this.password = password;
        this.eMail = eMail;
        this.phone = phone;
        this.role = role;

    }

    public int getId() {
        return id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        if((role!=0)||(role!=10)||(role!=1)){
            LOG.info("Wrong number of role. Operation rejected!");
        }
        else {
            this.role = role;
        }
    }

}