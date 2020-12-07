package bean;

public class CartBook {
  private String bid;
  private String title;
  
  private int  price;
  private String category;
  
  private int  qty;
  public int getQty() {
	return qty;
}
public void setQty(int qty) {
	this.qty = qty;
}
public int getTotal() {
	return total;
}
public void setTotal(int total) {
	this.total = total;
}
private int total;
  
  public String getBid() {
	return bid;
}
public void setBid(String bid) {
	this.bid = bid;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}

  
  
}
