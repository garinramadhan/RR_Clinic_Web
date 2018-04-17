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
public interface InDrug {
    public String getDrugID();
    public void setDrugID(String DrugID);
    public String getDrugName();
    public void setDrugName(String DrugName);
    public String getDrugType();
    public void setDrugType(String DrugType);
    public int getDrugStock();
    public void setDrugStock(int DrugStock);
    public String getDrugEXP();
    public void setDrugEXP(String DrugEXP);
    public double getDrugPrice();
    public void setDrugPrice(double DrugPrice);
    public int doInsert();
    public int doUpdate();
    public int doDelete();
    public ArrayList tableDrug();
    public ArrayList getRecord(String search);
    public String[] FDDrug();
    public String autoid();
}
