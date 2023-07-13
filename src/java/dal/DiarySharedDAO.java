/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Diary;
import model.DiaryShared;

/**
 *
 * @author dmngh
 */
public class DiarySharedDAO extends DBContext implements DAO<DiaryShared> {

    public List<DiaryShared> getAll(String username) {
        List<DiaryShared> list = new ArrayList<>();
        try {
            String sql = "SELECT d.id, p.full_name, d.title, d.content, d.time_of_diary FROM diary d\n"
                    + "LEFT JOIN diary_shared ds ON d.id = ds.diary_id\n"
                    + "LEFT JOIN friend f ON f.id = ds.friend_id\n"
                    + "LEFT JOIN profile p ON p.username = f.username\n"
                    + "WHERE f.friend_username = ?\n"
                    + "ORDER BY d.time_of_diary DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DiaryShared(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5)));
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

        return list;
    }

    public Diary getDiarySharedById(int id, String username) {
        try {
            String sql = "SELECT d.* FROM diary d\n"
                    + "LEFT JOIN diary_shared ds ON d.id = ds.diary_id\n"
                    + "LEFT JOIN friend f ON f.id = ds.friend_id\n"
                    + "WHERE f.friend_username = ? and d.id = ?\n"
                    + "ORDER BY ds.id DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setInt(2, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Diary(id, username, rs.getString(3), rs.getString(5), rs.getDate(4));
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }

    public List<DiaryShared> getDiaryPostShared(String username) {
        List<DiaryShared> list = new ArrayList<>();

        try {
            String sql = "SELECT d.id, p.full_name, d.title, d.content, d.time_of_diary FROM diary d\n"
                    + "LEFT JOIN diary_shared ds ON d.id = ds.diary_id\n"
                    + "LEFT JOIN friend f ON f.id = ds.friend_id\n"
                    + "LEFT JOIN profile p ON p.username = f.friend_username\n"
                    + "WHERE f.username = ?\n"
                    + "ORDER BY d.time_of_diary DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DiaryShared(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5)));
            }
        } catch (SQLException e) {

        }

        return list;
    }

    public int findFriendID(String username, String friend_username) {
        try {
            String sql = "SELECT * FROM friend WHERE username = ? and friend_username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, friend_username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

        return 0;
    }

    public boolean checkDiarySharedExist(int diaryId, int friendId) {
        try {
            String sql = "SELECT * FROM diary_shared WHERE diary_id = ? and friend_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, diaryId);
            ps.setInt(2, friendId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {

        }

        return false;
    }

    @Override
    public void insert(DiaryShared o) {
        try {
            String sql = "INSERT INTO diary_shared(diary_id, friend_id) VALUES(?, ?);";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, o.getDiaryId());
            ps.setInt(2, o.getFriendId());
            ps.executeUpdate();
        } catch (SQLException e) {
            
        }
    }

    @Override
    public void update(DiaryShared o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(DiaryShared o) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
