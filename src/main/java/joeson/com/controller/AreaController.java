/**
 * 
 */
package joeson.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import joeson.com.bean.City;
import joeson.com.bean.Province;
import joeson.com.mapper.AreaMapper;
import joeson.com.uitl.JsonUitl;

/**
 * @创建人 zjh
 * @创建时间 2017年12月30日
 * @描述 
 */
@Controller
@RequestMapping("/area")
public class AreaController {

	@Autowired
	AreaMapper areaMapper;
	
	@RequestMapping("/getProvinces")
	@ResponseBody
	public String getProvinces(Integer countryId){
		List<Province> provinces = areaMapper.selectProvinces(countryId);
		return JsonUitl.toJson(provinces);
	}
	
	@RequestMapping("/getCities")
	@ResponseBody
	public String getCities(String provinceCode){
		List<City> cities = areaMapper.selectCities(provinceCode);
		return JsonUitl.toJson(cities);
	}
}
