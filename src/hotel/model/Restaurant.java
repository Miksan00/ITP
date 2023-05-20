package hotel.model;

public class Restaurant {
	public int id;
	public String user;
	public String juice;
	public String main;
	public String dessert;
	public Restaurant(int id, String user, String juice, String main, String dessert) {
		super();
		this.id = id;
		this.user = user;
		this.juice = juice;
		this.main = main;
		this.dessert = dessert;
	}
	
	
	public Restaurant(String user, String juice, String main, String dessert) {
		super();
		this.user = user;
		this.juice = juice;
		this.main = main;
		this.dessert = dessert;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getJuice() {
		return juice;
	}
	public void setJuice(String juice) {
		this.juice = juice;
	}
	public String getMain() {
		return main;
	}
	public void setMain(String main) {
		this.main = main;
	}
	public String getDessert() {
		return dessert;
	}
	public void setDessert(String dessert) {
		this.dessert = dessert;
	}

}