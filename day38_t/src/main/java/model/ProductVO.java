package model;

public class ProductVO {
	private int num;
	private String name;
	private int price;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	public ProductVO() {
		this(0,null,0);
	}
	public ProductVO(int num,String name,int price) {
		this.num=num;
		this.name=name;
		this.price=price;
	}

	@Override
	public String toString() {
		return name+" : "+price+"원";
	}	
}
