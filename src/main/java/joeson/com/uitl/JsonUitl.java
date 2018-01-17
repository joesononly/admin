package joeson.com.uitl;

import com.google.gson.Gson;

public class JsonUitl {
	
	public static Gson gson = new Gson();
	
	public static String toJson(Object obj){
		return gson.toJson(obj);
	}

}
