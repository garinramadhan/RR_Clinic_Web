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
public interface InRecipe {
    public String getRecipeDetID();
    public void setRecipeDetID(String RecipeDetID);
    public String getRecipeID();
    public void setRecipeID(String RecipeID);
    public String getDrugID();
    public void setDrugID(String DrugID);
    public int getQTY();
    public void setQTY(int QTY);
    public String getDose();
    public void setDose(String Dose);
    public double getSubTotal();
    public void setSubTotal(double SubTotal);
    public int getIsDraft();
    public void setIsDraft(int IsDraft);
    public int doInsert();
//    public int doUpdate();
    public int doDelete();
    public ArrayList tableRecipe();
    public ArrayList tableDrug();
    public ArrayList getRecord(String search);
    public String[] FDRecipe();
    public String autoid();
}
