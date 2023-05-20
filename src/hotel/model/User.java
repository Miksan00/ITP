package hotel.model;

public class User {
	protected int id;
	protected String fullname;
	protected String username;
	protected int mobile;
	protected String address;
	protected String mail;
	protected String password;

	public User(int id, String fullname, String username, int mobile, String address, String mail, String password) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.username = username;
		this.mobile = mobile;
		this.address = address;
		this.mail = mail;
		this.password = password;
	}

	public User() {
		super();
	}

	public User(String fullname, String username, int mobile, String address, String mail, String password) {
		super();
		this.fullname = fullname;
		this.username = username;
		this.mobile = mobile;
		this.address = address;
		this.mail = mail;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getMobile() {
		return mobile;
	}

	public void setMobile(int mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
