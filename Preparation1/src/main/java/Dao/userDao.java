package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.Query;

import Models.UserModel;
import Modules.Product;

public class userDao {
	
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private int rs;
    private ResultSet rss;
    
    
    public userDao(Connection con) {
		this.con = con;
	}
    
    public void userRegistarion(String name,String email, String password) throws SQLException {
    	
    	query="INSERT INTO users(name,email,password) VALUES(?,?,?) ";
    	pst =con.prepareStatement(query) ;
    	pst.setString(1, name);
    	pst.setString(2, email);
        pst.setString(3, password);
        rs = pst.executeUpdate();
    	
      
    }
    
public List<UserModel> getEllProduct() {
    	
	List<UserModel> pro= new ArrayList();
    	try {
			query="select * from users";
			pst=con.prepareStatement(query);
			rss=pst.executeQuery();
			while(rss.next()) {
				UserModel row =new UserModel();
				row.setId(rss.getInt("id"));
				row.setName(rss.getString("name"));
				row.setEmail(rss.getString("email"));
				row.setPassword(rss.getString("password"));
				pro.add(row);
			}
    		
		} catch (Exception e) {
			// TODO: handle exception
		}
    	
    	return pro;
		
	}

public UserModel getSingleProduct(int id) {
	UserModel row = null;
       try {
           query = "select * from users where id=? ";

           pst = this.con.prepareStatement(query);
           pst.setInt(1, id);
           ResultSet rs = pst.executeQuery();

           while (rs.next()) {
           	row = new UserModel();
               row.setId(rs.getInt("id"));
               row.setName(rs.getString("name"));
               row.setEmail(rs.getString("email"));
               row.setPassword(rs.getString("password"));
               
           }
       } catch (Exception e) {
           e.printStackTrace();
           System.out.println(e.getMessage());
       }

       return row;
   }

public boolean updateUser(UserModel user) throws SQLException {
	boolean rowUpdated=false;
	try  {
		query="update users set name = ?,email= ?, password =? where id = ?";
		pst = this.con.prepareStatement(query);
		pst.setString(1, user.getName());
		pst.setString(2, user.getEmail());
		pst.setString(3, user.getPassword());
		pst.setInt(4, user.getId());

		rowUpdated = pst.executeUpdate() > 0;
	
	
} catch (Exception e) {
    e.printStackTrace();
    System.out.println(e.getMessage());  
}
	return rowUpdated;
}





public void deleteUser(int id) {
    //boolean result = false;
    try {
        query = "delete from users where id=?";
        pst = this.con.prepareStatement(query);
        pst.setInt(1, id);
        pst.execute();
        //result = true;
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.print(e.getMessage());
    }
    //return result;
}









}

