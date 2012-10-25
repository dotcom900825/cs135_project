package sql_helper;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import support.degreeInfo;

import com.mysql.jdbc.Statement;
 
public class list_reader 
{
	public static Vector degree_list = new Vector();
	private Connection connection;
	
	public list_reader()
	{
		init_db();
	}
	public void init_db()
	{
		try 
		{
			Class.forName("org.postgresql.Driver"); 
		} 
		catch (ClassNotFoundException e)
		{ 
			System.out.println("Where is your PostgreSQL JDBC Driver? "
					+ "Include in your library path!");
			e.printStackTrace();
			return;
		} 
		 connection = null;
 
		try 
		{

			connection = DriverManager.getConnection(
					"jdbc:postgresql://127.0.0.1:5432/grad_admin", "postgres",
					"4742488");
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			return;
		}
	}
	
	public void storeDegreeInfo(String sName, String degree, String discipline, String degree_time, String gpa)
	{
		if (connection != null) 
		{
			try
			{
				
				java.sql.Statement st = connection.createStatement();
	            String sql = "insert into degree_list(school_name, discipline, gpa, degree,degree_time)" +
	            		"values ('" + sName +"', '" + discipline + "' ,'" + gpa + "' ,'" + degree + "' ,'"
	            		+ degree_time + "')";
	            st.executeUpdate(sql);
	          
	            st.close();
	            connection.close();
			}
			catch(Exception ex)
			{
				
			}
		} else {
			System.out.println("Failed to make connection!");
		}
	}
	
	public void deleteSchool(String schoolID)
	{
		if (connection != null) 
		{
			try
			{				
				java.sql.Statement st = connection.createStatement();
	            String sql = "DELETE FROM degree_list WHERE degree_id = '" + schoolID + "'";
	            st.executeUpdate(sql);
	           
	            st.close();
	            connection.close();
			}
			catch(Exception ex)
			{
				
			}
		} else {
			System.out.println("Failed to make connection!");
		}
	}
	public void getDegreeList()
	{
		
		if (connection != null) 
		{
			try
			{				
				java.sql.Statement st = connection.createStatement();
	            String sql = "select * from degree_list";
	            ResultSet rs =  st.executeQuery(sql);
	           while(rs.next())
	           {
	        	   String sID = rs.getString(1);
	        	   String schoolName = rs.getString(2);
	        	   String discipline = rs.getString(3);
	        	   String gpa = rs.getString(4);
	        	   String degree = rs.getString(5);
	        	   String degree_time = rs.getString(6);
	        	   degreeInfo dInfo = new degreeInfo(sID, schoolName,discipline,gpa,degree,degree_time);
	        	   degree_list.add(dInfo);
	           }
	            st.close();
	            connection.close();
			}
			catch(Exception ex)
			{
				
			}
		} else {
			System.out.println("Failed to make connection!");
		}
		
		
	}
	public static void main(String []args)
	{
		list_reader lr = new list_reader();
		lr.getDegreeList();
		System.out.print(list_reader.degree_list.size());
	}
}