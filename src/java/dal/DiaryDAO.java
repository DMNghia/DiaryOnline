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

/**
 *
 * @author dmngh
 */
public class DiaryDAO extends DBContext implements DAO<Diary> {

    public List<Diary> getAll(String username) {
        List<Diary> list = new ArrayList<>();
        String sql = "SELECT * from diary\n"
                + "WHERE username = ?\n"
                + "ORDER BY id DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Diary d = new Diary(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(5), rs.getDate(4));
                list.add(d);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public Diary getDiaryById(int id) {
        try {
            String sql = "SELECT * FROM diary WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Diary(id, rs.getString(2), rs.getString(3), rs.getString(5), rs.getDate(4));
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

        return null;
    }

    @Override
    public void insert(Diary o) {
        try {
            String sql = "INSERT INTO diary(username, title, time_of_diary, [content]) VALUES(?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, o.getUsername());
            ps.setString(2, o.getTitle());
            ps.setDate(3, o.getTime());
            ps.setString(4, o.getContent());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    @Override
    public void update(Diary o) {
        try {
            String sql = "UPDATE diary\n"
                    + "SET title = ?, time_of_diary = ?, content = ?\n"
                    + "WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, o.getTitle());
            ps.setDate(2, o.getTime());
            ps.setString(3, o.getContent());
            ps.setInt(4, o.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    @Override
    public void delete(Diary o) {
        try {
            deleteDiaryShared(o.getId());
            String sql = "DELETE FROM diary WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, o.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Err: " + e.getMessage());
        }
    }

    private void deleteDiaryShared(int id) {
        try {
            String sql = "DELETE FROM diary_shared WHERE diary_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Err: " + e.getMessage());
        }
    }

//    public void notShowDiary(Diary o) {
//        try {
//            String sql = "UPDATE diary\n"
//                    + "SET status = 0\n"
//                    + "WHERE id = ?";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, o.getId());
//            ps.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println("notShowDiary: " + e.getMessage());
//        }
//    }

//    public void addFavorite(Diary o) {
//        try {
//            String sql = "UPDATE diary\n"
//                    + "SET favorite = 1\n"
//                    + "WHERE id = ?";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, o.getId());
//            ps.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println("addFavorite: " + e.getMessage());
//        }
//    }

//    public void removeFavorite(Diary o) {
//        try {
//            String sql = "UPDATE diary\n"
//                    + "SET favorite = 0\n"
//                    + "WHERE id = ?";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, o.getId());
//            ps.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println("notShowDiary: " + e.getMessage());
//        }
//    }

//    public List<Diary> getFavorite(String username) {
//        List<Diary> list = new ArrayList<>();
//        String sql = "SELECT * from diary\n"
//                + "WHERE username = ? AND status = 1 AND favorite = 1\n"
//                + "ORDER BY id DESC";
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setString(1, username);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                Diary d = new Diary(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(5), rs.getDate(4), rs.getBoolean(6), rs.getBoolean(7));
//                list.add(d);
//            }
//        } catch (SQLException e) {
//
//        }
//        return list;
//    }
}
