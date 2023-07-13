/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dmngh
 */
public class Account {
    private String username, password;

    public Account() {
    }

    public Account(String account, String password) {
        this.username = account;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String account) {
        this.username = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
