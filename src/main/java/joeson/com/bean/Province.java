/**
 * 
 */
package joeson.com.bean;

/**
 * @创建人 zjh
 * @创建时间 2017年12月30日
 * @描述 
 */
public class Province {

	private int id;
	private String code;
	private String name;
	private int countryId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCountryId() {
		return countryId;
	}
	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}
}
