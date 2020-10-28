package cn.etu.mydisk.pager;

//创建查询条件的类，例如：WHERE name operator value
//				   WHERE name LIKE value
public class Expression {

	private String name;
	private String operator;
	private String value;
	
	public Expression() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Expression(String name, String operator, String value) {
		super();
		this.name = name;
		this.operator = operator;
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
}
