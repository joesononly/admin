/**
 * 
 */
package joeson.com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import joeson.com.bean.City;
import joeson.com.bean.Country;
import joeson.com.bean.Province;

/**
 * @author joesn
 *
 */
public interface AreaMapper {
	
	@Select("select * from country")
	public List<Country> selectCountries();
	
	@Select("select * from provinces where countryCode = #{id}")
	public List<Province> selectProvinces(@Param("id") int id);
	
	@Select("select * from cities where provinceCode = #{code}")
	public List<City> selectCities(@Param("code") String code);

}
