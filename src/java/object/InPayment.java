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
public interface InPayment{
    public String getPayID();
    public void setPayID(String PayID);
    public String getTreatID();
    public void setTreatID(String TreatID);
    public double getPayDoctor();
    public void setPayDoctor(double PayDoctor);
    public double getPayDrug();
    public void setPayDrug(double PayDrug);
    public double getPayTotal();
    public void setPayTotal(double PayTotal);
    public int getIsPay();
    public void setIsPay(int IsPay);
    public int doUpdate();
    public ArrayList tablePayment();
    public ArrayList getRecordDetailPayment(String search);
    public String[] FDPayment();
    public String autoid();
    
    public ArrayList tablePaymentHistory();
    public ArrayList getRecordDetailPaymentHistory(String search);
}
