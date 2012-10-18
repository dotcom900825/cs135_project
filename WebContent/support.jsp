<%@page language="java" import="support.*, java.util.*" %>

<HTML>
 <HEAD> <TITLE> Support Example</TITLE> </HEAD>
 <BODY>
  <% 
   	support s = new support();   	
   	
   	String path1 = config.getServletContext().getRealPath("/support/countries_and_states.txt");
   	String path2 = config.getServletContext().getRealPath("/support/universities.txt");
    String path3 = config.getServletContext().getRealPath("/support/disciplines.txt");
    String path4 = config.getServletContext().getRealPath("/support/specializations.txt");
	
    //getCountriesAndStates returns a vector of the countries to be used for choosing citizenship
    Vector<CountryState> countries_and_states = s.getCountriesAndStates(path1);    
    //getUniversities returns a vector of vectors where each vector is a tuple of <string, vector>
    //with the string being the name of the country/state and the vector being the list of universities there
    Vector universities = s.getUniversities(path2);
    //getDisciplines and getSpecializations return vectors
    Vector disciplines = s.getDisciplines(path3);
    Vector specializations = s.getSpecializations(path4);

    //print all the countries and states
    for(int i=0; i<countries_and_states.size(); i++)
      out.println((String) ((CountryState)countries_and_states.get(i)).countryStateName + "<br>");
    
    out.println("<br>");
    
    //print all the disciplines
    for(int i=0; i<disciplines.size(); i++)
      out.println(disciplines.get(i) + "<br>");

    out.println("<br>");

    //print all the specializations
    for(int i=0; i<specializations.size(); i++)
      out.println(specializations.get(i) + "<br>");

    %><br>Number of states/countries with universities: <%=universities.size()%><br>
    <%
    for (int i=0; i<universities.size(); i++){
      //each entry in the universities vector is a tuple with the first entry being the country/state
      //and the second entry being a vector of the universities as String's
      Vector tuple = (Vector)universities.get(i);
      String state = (String)tuple.get(0);
      out.println("<br>"+state+"<br>");    
            Vector u = (Vector)tuple.get(1);
            for(int j=0; j<u.size(); j++){%>
              <%=u.get(j)%><br>
      <%}
    } 
    
  %>
 </BODY>
</HTML>

