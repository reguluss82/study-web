package och11;

import java.util.Date;

/*
DTO
Data Transfer Object의 약자로, 계층간 데이터 교환을 위한 자바빈즈를 뜻한다.
또한 DTO는 VO(Value Object)와 용어를 혼용해서 많이 사용하는데, 
VO는 읽기만 가능한 read only 속성을 가져 DTO와의 차이점이 존재한다.
일반적으로 DTO는 로직을 가지고 있지 않은 순수한 데이터의 객체이며 
객체의 속성과 그 속성의 접근을 위한 getter 및 setter 메소드만을 가지고 있다.
*/
public class MemberDto {
	private String id;
	private String password;
	private String name;
	private Date   reg_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}
