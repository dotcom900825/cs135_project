package sql_helper;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;
 
public class list_reader {
 
	public static void main(String[] argv) {
 
		System.out.println("-------- PostgreSQL "
				+ "JDBC Connection Testing ------------");
 
		try {
 
			Class.forName("org.postgresql.Driver");
 
		} catch (ClassNotFoundException e) {
 
			System.out.println("Where is your PostgreSQL JDBC Driver? "
					+ "Include in your library path!");
			e.printStackTrace();
			return;
 
		}
 
		System.out.println("PostgreSQL JDBC Driver Registered!");
 
		Connection connection = null;
 
		try {
 
			connection = DriverManager.getConnection(
					"jdbc:postgresql://127.0.0.1:5432/grad_admin", "postgres",
					"4742488");
 
		} catch (SQLException e) {
 
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return;
 
		}
 
		if (connection != null) 
		{
			try
			{
				System.out.println("You made it, take control your database now!");
				java.sql.Statement st = connection.createStatement();
	            String sql = " select * from disciplines " ;
	            ResultSet rs = st.executeQuery(sql);
	             while (rs.next())
	             {
	                System.out.print(rs.getInt( 1 ));
	                System.out.println(rs.getString( 2 ));
	            } 
	            rs.close();
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
 
}