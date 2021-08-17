package com.bank.entities;
import java.sql.Timestamp;

public class transaction {
    String sName;
    String rName;
    int amount;
    Timestamp date;

    public transaction() {
    }

    public transaction(String sName, String rName, int amount,Timestamp date) {
        this.sName = sName;
        this.rName = rName;
        this.amount = amount;
        this.date=date;
    }

    public transaction(String sName, String rName, int amount) {
        this.sName = sName;
        this.rName = rName;
        this.amount = amount;
    }

    // getter and setter
    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }    
}
