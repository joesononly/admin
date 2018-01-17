package joeson.com.inter;

import java.util.List;

public interface BaseMapper {
	
	public void add(Object obj);
	
	public void delete(Object obj);
	
	public void update(Object obj);
	
	public Object selectById(int id);
	
	public List<Object> selectList(Object obj);

}
