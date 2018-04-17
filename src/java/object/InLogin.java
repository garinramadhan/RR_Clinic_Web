/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package object;

import java.util.ArrayList;

/**
 *
 * @author GR
 */
public interface InLogin{
    public String getUserID();
    public void setUserID(String UserID);
    public String getUsername();
    public void setUsername(String Username);
    public String getPassword();
    public void setPassword(String Password);
    public String getIsAdmin();
    public void setIsAdmin(String IsAdmin);
    public int doInsert();
    public int doUpdate();
    public int doDelete();
    public ArrayList display();
    public ArrayList getRecord(String search);
    public int doLogin();
    public String[] FDUser();
    public String[] cekAccess();
    public int cekUsername();
    public String autoid();
}
