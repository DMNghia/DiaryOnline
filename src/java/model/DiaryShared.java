/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author dmngh
 */
public class DiaryShared {

    int id, diaryId, friendId;
    private String username, title, content;
    private Date time;

    public DiaryShared() {
    }

    public DiaryShared(int id, int diaryId, int friendId) {
        this.id = id;
        this.diaryId = diaryId;
        this.friendId = friendId;
    }
    public DiaryShared(int diaryId, int friendId) {
        this.diaryId = diaryId;
        this.friendId = friendId;
    }

    public DiaryShared(int id, String username, String title, String content, Date time) {
        this.id = id;
        this.username = username;
        this.title = title;
        this.content = content;
        this.time = time;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDiaryId() {
        return diaryId;
    }

    public void setDiaryId(int diaryId) {
        this.diaryId = diaryId;
    }

    public int getFriendId() {
        return friendId;
    }

    public void setFriendId(int friendId) {
        this.friendId = friendId;
    }

}
