/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dmngh
 */
public class Friend {
    int id;
    String username, friendUsername;

    public Friend() {
    }

    public Friend(String username, String friendUsername) {
        this.username = username;
        this.friendUsername = friendUsername;
    }

    public Friend(int id, String username, String friendUsername) {
        this.id = id;
        this.username = username;
        this.friendUsername = friendUsername;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFriendUsername() {
        return friendUsername;
    }

    public void setFriendUsername(String friendUsername) {
        this.friendUsername = friendUsername;
    }
    
}
