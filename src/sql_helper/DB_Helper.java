package sql_helper;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import support.Applicant;
import support.school_record;





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
	public void commitTransaction() throws SQLException
	{
		connection.commit();
	}
	public void setAutoCommitFalse() throws SQLException
	{
		connection.setAutoCommit(false);
	}
	public void setAutoCommitTrue() throws SQLException
	{
		connection.setAutoCommit(true);
	}
    /*
		* Name: StoreDegreeInfo
		* Purpose: Store degree tuple into database 
		* Parameters:  All the parameters corresbonding to the entry in the db's table
		* Return: void
		*/
	public void storeApplicant(String last_name, String middle_name, String first_name, String country,
								String state, String city, long zip_code, String specialization, int unique_id)
	{
		if (connection != null) 
		{
			try
			{			
				connection.setAutoCommit(false);
				 String sql = "insert into applicant(last_name, middle_name, first_name, country, " +
        		"state, city, zip_code, specialization, aid)" +
        		"values(?,?,?,?,?,?,?,?,?)";
				 PreparedStatement pstmt = connection.prepareStatement(sql);
				 pstmt.setString(1, last_name);
				 pstmt.setString(2, middle_name);
				 pstmt.setString(3, first_name);
				 pstmt.setString(4, country);
				 pstmt.setString(5, state);
				 pstmt.setString(6, city);
				 pstmt.setLong(7, zip_code);
				 pstmt.setString(8, specialization);
				 pstmt.setInt(9, unique_id);
				//System.out.println(pstmt.executeUpdate());
	             pstmt.executeUpdate();
	            pstmt.close();
	            connection.commit();
	            connection.setAutoCommit(true);
	          
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		} else {
			System.out.println("Failed to make connection!");
		}
	}
	public boolean checkUniversity(String uName)
	{
		if (connection != null) 
		{
			try
			{		
				
				String sql = "select * from universities where university = ?";
				PreparedStatement pst = connection.prepareStatement(sql);
				pst.setString(1, uName);
				ResultSet rs = pst.executeQuery();
				if(!rs.next())
				{
					return false;
				}
				else
				{
					return true;
				}
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		else 
		{
			System.out.println("Failed to make connection!");
		}
		return false;
	}
	public boolean checkAdmin(String username, String password)
	{
		if (connection != null) 
		{
			try
			{		
				
				String sql = "select * from chair where username = ? and password = ?";
				PreparedStatement pst = connection.prepareStatement(sql);
				pst.setString(1, username);
				pst.setString(2, password);
				ResultSet rs = pst.executeQuery();
				if(!rs.next())
				{
					return false;
				}
				else
				{
					return true;
				}
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
		return false;
	}
    	/*
		* Name: StoreDegreeInfo
		* Purpose: Store degree tuple into database 
		* Parameters:  All the parameters corresponding to the entry in the db's table
		* Return: void
		*/
	public PreparedStatement storeDegreeList(String school,int gpa, String degree, int year, int month, String discipline, int unique_id)
	{
		if (connection != null) 
		{
			try
			{
	            String sql = "insert into degree_list(gpa, degree, degree_year, degree_month, discipline, did, school) " +
	            		"values (?,?,?,?,?,?,?)";
	            PreparedStatement pst = connection.prepareStatement(sql);
	            pst.setInt(1, gpa);
	            pst.setString(2, degree);
	            pst.setInt(3, year);
	            pst.setInt(4, month);
	            pst.setString(5, discipline);
	            pst.setInt(6,unique_id);
	            pst.setString(7, school);
	            return pst;
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		} else {
			System.out.println("Failed to make connection!");
		}
		
		return null;
	}
	
	public PreparedStatement storeSubmission(int applicant_id, int degree_id, int application_id)
	{
		if (connection != null) 
		{
			try
			{
	            String sql = "insert into application_submission(applicant_id, degree_id, application_id) " +
	            		"values (?,?,?)";
	            PreparedStatement pst = connection.prepareStatement(sql);
	            pst.setInt(1, applicant_id);
	            pst.setInt(2, degree_id);
	            pst.setInt(3, application_id);
	            return pst;
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		} else {
			System.out.println("Failed to make connection!");
		}
		
		return null;
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
	
	public PreparedStatement fetchSpecializationCount(String specialization)
	{
		if (connection != null) 
		{
			try
			{
	            String sql = "SELECT count(specialization) FROM applicant where specialization = ?";
	            PreparedStatement pst = connection.prepareStatement(sql);
	            pst.setString(1, specialization);	            
	            return pst;
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		} else {
			System.out.println("Failed to make connection!");
		}
		
		return null;
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
	public Vector<Applicant> fetchApplicationWithDiscipline(String discipline)
	{
		Vector<Applicant> applicantList = new Vector<Applicant>();
		if (connection != null) 
		{
			try
			{		
				java.sql.Statement st = connection.createStatement();
				String sql = "select * from applicant where aid in (select applicant_id " +
						"from application_submission where degree_id in" +
						" (select did from degree_list where discipline='" +discipline +"'))";
				ResultSet rs = st.executeQuery(sql);
				while(rs.next())
				{
					String unique_id = rs.getString(1);
					String last_name = rs.getString(2);
					String first_name = rs.getString(3);
					String middle_name = rs.getString(4);
					String country = rs.getString(5);
					String street_address = rs.getString(6);
					String city = rs.getString(7);
					String state = rs.getString(8);
					String zip_code = rs.getString(9);
					String specialization = rs.getString(10);
					
					Applicant aTemp = new Applicant(last_name,first_name,middle_name,
							country,street_address,city,state,zip_code,specialization,unique_id);
					applicantList.add(aTemp);
				}
				st.close();
				connection.close();
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		else 
		{
			System.out.println("Failed to make connection!");
		}
		return applicantList;
	}
	
	public Vector<Applicant> fetchApplicant(String aid)
	{
		Vector<Applicant> applicantList = new Vector<Applicant>();
		if (connection != null) 
		{
			try
			{		
				java.sql.Statement st = connection.createStatement();
				String sql = "select * from applicant where aid = '" + aid +"'";
				ResultSet rs = st.executeQuery(sql);
				while(rs.next())
				{
					String unique_id = rs.getString(1);
					String last_name = rs.getString(2);
					String first_name = rs.getString(3);
					String middle_name = rs.getString(4);
					String country = rs.getString(5);
					String street_address = rs.getString(6);
					String city = rs.getString(7);
					String state = rs.getString(8);
					String zip_code = rs.getString(9);
					String specialization = rs.getString(10);
					
					Applicant aTemp = new Applicant(last_name,first_name,middle_name,
							country,street_address,city,state,zip_code,specialization,unique_id);
					applicantList.add(aTemp);
				}
				st.close();
				connection.close();
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		else 
		{
			System.out.println("Failed to make connection!");
		}
		return applicantList;
	}
	public Vector<Applicant> fetchApplicationWithSpecialization(String special)
	{
		Vector<Applicant> applicantList = new Vector<Applicant>();
		if (connection != null) 
		{
			try
			{		
				java.sql.Statement st = connection.createStatement();
				String sql = "SELECT last_name, first_name, middle_name, country, street_address," +
						" city, state, zip_code, specialization, aid FROM applicant " +
						"where applicant.specialization = '" + special + "' ";
				ResultSet rs = st.executeQuery(sql);
				while(rs.next())
				{
					String last_name = rs.getString(1);
					String first_name = rs.getString(2);
					String middle_name = rs.getString(3);
					String country = rs.getString(4);
					String street_address = rs.getString(5);
					String city = rs.getString(6);
					String state = rs.getString(7);
					String zip_code = rs.getString(8);
					String specialization = rs.getString(9);
					String unique_id = rs.getString(10);
					Applicant aTemp = new Applicant(last_name,first_name,middle_name,
							country,street_address,city,state,zip_code,specialization,unique_id);
					applicantList.add(aTemp);
				}
				st.close();
				connection.close();
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		else 
		{
			System.out.println("Failed to make connection!");
		}
		return applicantList;
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
	
	public Vector fetchSpecializations()
	{
		Vector specializations_list = new Vector();
		if (connection != null) 
		{
			try
			{		
				java.sql.Statement st = connection.createStatement();
				String sql = "select * from specializations";
				ResultSet rs = st.executeQuery(sql);
				while(rs.next())
				{
					specializations_list.add(rs.getString(2));
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
		return specializations_list;
	}
	public Vector<String> fetchDisciplineAnalList()
	{
		Vector<String> discList = new Vector<String>();
		if (connection != null) 
		{
			try
			{	
				 java.sql.Statement st = connection.createStatement();
				 java.sql.Statement st2 = connection.createStatement();
				 String sql = "select discipline from degree_list group by discipline";								
	             ResultSet rs =  st.executeQuery(sql);							   
	        	 while(rs.next())
	        	 {
	        		 discList.add(rs.getString(1));
	        		 String sql2 = "select count(distinct applicant_id) from application_submission " +
	        		 		"where degree_id in (select did from degree_list where discipline = '" + rs.getString(1) + "')";
	        		 ResultSet rs2 = st2.executeQuery(sql2);
	        		 while(rs2.next())
	        		 {
	        			 discList.add(rs2.getString(1));
	        		 }
	        		
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
		return discList;
	}

	public Vector<school_record> fetchDegreeListDiscipline(String aid, String discipline)
	{
		Vector<school_record> discipline_list = new Vector<school_record>();
		if (connection != null) 
		{
			try
			{		
				java.sql.Statement st = connection.createStatement();
				String sql = "select school, degree, degree_month, degree_year, gpa, " +
						"discipline from degree_list, application_submission " +
						"where application_submission.applicant_id =  '" + aid + "' "+
						"and application_submission.degree_id = degree_list.did and degree_list.discipline = '" + discipline + "'";
				System.out.print(sql);
				ResultSet rs = st.executeQuery(sql);
				while(rs.next())
				{
					String school = rs.getString(1);
					String degree = rs.getString(2);
					String degree_time = rs.getString(3) + "/" + rs.getString(4);
					String gpa = rs.getString(5);
					String disciplineT = rs.getString(6);
					school_record sr = new school_record(school,disciplineT ,gpa, degree, degree_time);				
					discipline_list.add(sr);
				}
				
				st.close();
				connection.close();
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		else 
		{
			System.out.println("Failed to make connection!");
		}
		return discipline_list;
	}
	public Vector<school_record> fetchDegreeList(String aid)
	{
		Vector<school_record> discipline_list = new Vector<school_record>();
		if (connection != null) 
		{
			try
			{		
				java.sql.Statement st = connection.createStatement();
				String sql = "select school, degree, degree_month, degree_year, gpa, " +
						"discipline from degree_list, application_submission " +
						"where application_submission.applicant_id =  '" + aid + "' "+
						"and application_submission.degree_id = degree_list.did";
				System.out.print(sql);
				ResultSet rs = st.executeQuery(sql);
				while(rs.next())
				{
					String school = rs.getString(1);
					String degree = rs.getString(2);
					String degree_time = rs.getString(3) + "/" + rs.getString(4);
					String gpa = rs.getString(5);
					String discipline = rs.getString(6);
					school_record sr = new school_record(school,discipline,gpa, degree, degree_time);				
					discipline_list.add(sr);
				}
				
				st.close();
				connection.close();
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		else 
		{
			System.out.println("Failed to make connection!");
		}
		return discipline_list;
	}
	public static void main(String[] args) throws SQLException
	{
		DB_Helper nar = new DB_Helper();
		/*PreparedStatement pst = nar.fetchSpecializationCount("Artificial Intelligence");
		ResultSet rs = null;
		try {
			rs = pst.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
			System.out.println(rs.next());*/
		Vector<Applicant> temp = nar.fetchApplicationWithSpecialization("Artificial Intelligence");
	}
	
}
