package support;
import java.io.*;
import java.util.*;


public class support{
    public Vector getCountriesAndStates(String path){
    	CountriesAndStates c = new CountriesAndStates();
        return c.getVector(path);
    }

    public Vector getUniversities(String path){
        Universities u = new Universities();
        return u.getVector(path);
    }


    //the logic for majors and specs are exactly
    //the same as for countries so just reuse the class
    public Vector getDisciplines(String path){
    		GenericLoader m = new GenericLoader();
	        return m.getVector(path);
    }

    public Vector getSpecializations(String path){
    		GenericLoader s = new GenericLoader();
	        return s.getVector(path);
    }
    
    public static int getCountryStateID(String countryState, Vector<CountryState> v)
    {
    	for(int i = 0; i < v.size(); i++)
    	{
    		if(v.get(i).countryStateName.equals(countryState))
    		{
    			return i + 1;
    		}
    	}
    	return -1;
    }
}

class GenericLoader
{
	Vector c = new Vector();

    public Vector getVector(String path){
        if(c.isEmpty())
            this.initVector(path);
        return c;
    }

    void initVector(String path){
        try{
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path)));
            String line = "";
            int count = 0;
            while((line = br.readLine()) != null) {
                c.add(line);
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
    }	
}

class CountriesAndStates{
    Vector<CountryState> c = new Vector();

    public Vector getVector(String path){
        if(c.isEmpty())
            this.initVector(path);
        return c;
    }

    void initVector(String path){
        try{
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path)));
            String line = "";
            int count = 0;
            while((line = br.readLine()) != null) {
            	CountryState cs = new CountryState();
            	if(count < 51)
            	{
            		// this is a state, states come first...we do 51 bc we're including D.C. as a state
            		cs.isCountry = false;
            	}
            	else
            	{
            		cs.isCountry = true;
            	}
            	
            	cs.countryStateName = line;
            	
                c.add(cs);
                
                count++;
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
}

class Universities{
    Vector v = new Vector();

    public Vector getVector(String path){
        if(v.isEmpty())
            this.initVector(path);
        return v;
    }

    void initVector(String path){
        this.initStates(path);
    }

    void initStates(String path){
        try{
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path)));
            String line = "";
            Vector tuple = new Vector();
            Vector univ = new Vector();
            while((line = br.readLine()) != null) {
                //if we hit a blank line
                if(line.trim().length() == 0){
                    if(!univ.isEmpty()){
                        tuple.add(univ);
                        v.add(tuple);
                        
                        tuple = new Vector();
                        univ = new Vector();

                        //is there a next state?
                        if((line = br.readLine()) != null)                            
                            tuple.add(line.trim());
                    }
                    //else this is the first entry, just add the state to the tuple
                    else if(tuple.isEmpty() && (line = br.readLine()) != null){                     
                         tuple.add(line.trim());
                    }
                }
                else{
                    univ.add(line.trim());
                }
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
}