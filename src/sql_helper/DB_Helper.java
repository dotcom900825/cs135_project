package sql_helper;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import support.CountryState;

import com.mysql.jdbc.Statement;

/*
* Name: Yu Xia student
* Date: Oct 20, 2012
* File: list_reader.java
* Source of Help: slides on lecture
*
* This class is DataBase Connector, has several function to perform insert to table operation
*/
public class DB_Helper 
{
	private Connection connection;
	
    /*
		* Name: list_reader
		* Purpose: list_reader class constructor 
		* Parameters:  none
		* Return: void
		*/
	public DB_Helper()
	{
		init_db(); 
	}
	
    /*
		* Name: init_db
		* Purpose: inital database connection
		* Parameters: none
		* Return: void
		*/
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
			//User may need to change the database configuration here
			connection = DriverManager.getConnection( 
					"jdbc:postgresql://127.0.0.1:5432/grad_admin_2th", "postgres",
					"4742488");
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			return;
		}
	}
	public void closeConnection() throws SQLException
	{
		  connection.close();
	}
    /*
		* Name: StoreDegreeInfo
		* Purpose: Store degree tuple into database 
		* Parameters:  All the parameters corresbonding to the entry in the db's table
		* Return: void
		*/
	public void storeApplicant(String last_name, String middle_name, String first_name, String country,
								String state, String city, String zip_code, String specialization, long unique_id)
	{
		if (connection != null) 
		{
			try
			{
				
				java.sql.Statement st = connection.createStatement();
	            String sql = "insert into degree_list(last_name, middle_name, first_name, country, " +
	            		"state, city, zip_code, school_name, discipline, gpa, degree,degree_time)" +
	            		"values ('" + last_name + "', '" + middle_name + "', '" + first_name + "', '" + country + "', '" + state + "', '" + city + "', '" + zip_code + "', '" +
	            				 specialization + "' ,'"+ unique_id + "')";
	            st.executeUpdate(sql);
	          
	            st.close();
	          
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		} else {
			System.out.println("Failed to make connection!");
		}
	}
	
    /*
		* Name: StoreDescipline
		* Purpose: store new added discipline to database
		* Parameters:   string discipline
		* Return: void
		*/
	public void storeDiscipline(String discipline)
	{
		if (connection != null) 
		{
			try
			{		
				java.sql.Statement st = connection.createStatement();
				String sql = "insert into disciplines(discipline)" +
					"values ('" + discipline +"')";
				st.executeUpdate(sql);
				System.out.print("succefully added");
				st.close();
				connection.close();
				}
				catch(Exception ex)
				{
					System.out.print("error!");
				}
			}
		else 
		{
			System.out.println("Failed to make connection!");
		}
	}
	
    /*
		* Name: storeNewSchool
		* Purpose: store new added school to database
		* Parameters: int country_state_id, String school_name
		* Return: void
		*/
	public void storeNewSchool(int country_state_id, String school_name)
{
		if (connection != null) 
		{
			try
			{	
				java.sql.Statement st = connection.createStatement();
				String sql = "insert into universities(country_state_id, school_name)" +
					"values ('" + country_state_id + "', '" + school_name + "')";
				st.executeUpdate(sql);				
				st.close();
				connection.close();
			}
			catch(Exception ex)
			{
			
			}
		} 
		else 
		{
			System.out.println("Failed to make connection!");
		}
}
	public Vector<String> fetchCountry()
	{
		Vector<String> countryList = new Vector();
		if (connection != null) 
		{
			try
			{		
				java.sql.Statement st = connection.createStatement();
				String sql = "select * from countries_and_states where is_country = 'true'";
				ResultSet rs = st.executeQuery(sql);
				while(rs.next())
				{
					countryList.add(rs.getString(2));
				}
				st.close();
				connection.close();
				}
				catch(Exception ex)
				{
					System.out.print("error!");
				}
			}
		else 
		{
			System.out.println("Failed to make connection!");
		}
		return countryList;
	}
	
	public Vector<String> fetchStates()
	{
		Vector<String> stateList = new Vector();
		if (connection != null) 
		{
			try
			{		
				java.sql.Statement st = connection.createStatement();
				String sql = "select * from countries_and_states where is_country = 'false'";
				ResultSet rs = st.executeQuery(sql);
				while(rs.next())
				{
					stateList.add(rs.getString(2));
				}
				st.close();
				connection.close();
				}
				catch(Exception ex)
				{
					System.out.print("error!");
				}
			}
		else 
		{
			System.out.println("Failed to make connection!");
		}
		return stateList;
	}
	public Vector fetchSchool(String place)
	{
		Vector schoolList = new Vector();
		if (connection != null) 
		{
			try
			{	
				 java.sql.Statement st = connection.createStatement();
				 String sql = "select cs_id from countries_and_states where country_state ='"+ place + "'";								
	             ResultSet rs =  st.executeQuery(sql);
	             rs.next();
	        	 int cs_id = rs.getInt(1);				
	        	 sql = "select university from universities where country_state_id ='"+ cs_id + "'";
	        	 rs =  st.executeQuery(sql);							   
	        	 while(rs.next())
	        	 {
	        		 String school_name = rs.getString(1);
	        		 schoolList.add(school_name);
	        	 }
	        	 st.close();
	             connection.close();
			}
			catch(Exception ex)
			{
				
			}								
		}
		else 
		{
			System.out.println("Failed to make connection!");
		}
		return schoolList;
	}
	
	public Vector fetchPlaceWithSchool( )
	{
		Vector placeList = new Vector();
		if (connection != null) 
		{
			try
			{		
				java.sql.Statement st = connection.createStatement();
				String sql = "select distinct cs_id, country_state from countries_and_states, " +
						"		universities where cs_id = universities.country_state_id order by cs_id";
				ResultSet rs = st.executeQuery(sql);
				while(rs.next())
				{
					placeList.add(rs.getString(2));
				}
				
				st.close();
				connection.close();
				}
				catch(Exception ex)
				{
					System.out.print("error!");
				}
			}
		else 
		{
			System.out.println("Failed to make connection!");
		}
		return placeList;
	}
	
	public Vector fetchPlaceUniversities()
	{
		Vector placeList = new Vector();
		if (connection != null) 
		{
			try
			{		
				java.sql.Statement st = connection.createStatement();
				String sql = "select distinct cs_id, country_state from countries_and_states, " +
						"		universities where cs_id = universities.country_state_id order by cs_id";
				ResultSet rs = st.executeQuery(sql);
				while(rs.next())
				{
					placeList.add(rs.getString(2));
				}
				
				st.close();
				connection.close();
				}
				catch(Exception ex)
				{
					System.out.print("error!");
				}
			}
		else 
		{
			System.out.println("Failed to make connection!");
		}
		return placeList;
	}
	public Vector fetchDiscipline()
	{
		Vector discipline_list = new Vector();
		if (connection != null) 
		{
			try
			{		
				java.sql.Statement st = connection.createStatement();
				String sql = "select * from disciplines";
				ResultSet rs = st.executeQuery(sql);
				while(rs.next())
				{
					discipline_list.add(rs.getString(2));
				}
				
				st.close();
				connection.close();
				}
				catch(Exception ex)
				{
					System.out.print("error!");
				}
			}
		else 
		{
			System.out.println("Failed to make connection!");
		}
		return discipline_list;
	}
	
	public Vector DisciplineFromDegreeList()
	{
		Vector discipline_list = new Vector();
		if (connection != null) 
		{
			try
			{		
				java.sql.Statement st = connection.createStatement();
				String sql = "select discipline from degree_list";
				ResultSet rs = st.executeQuery(sql);
				while(rs.next())
				{
					discipline_list.add(rs.getString(1));
				}
				
				st.close();
				connection.close();
				}
				catch(Exception ex)
				{
					System.out.print("error!");
				}
			}
		else 
		{
			System.out.println("Failed to make connection!");
		}
		return discipline_list;
	}
	public static void main(String[] args)
	{
		
	}
	
}