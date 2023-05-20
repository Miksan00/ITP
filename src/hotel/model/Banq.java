package hotel.model;

public class Banq {
	public int id;
	public String guest;
	public int mobile;
	public String additional;
	public String decoration;
	public String date;
	public String filename;
	public String path;

	public Banq(String filename, String path) {
		super();
		this.filename = filename;
		this.path = path;
	}



	public Banq(String guest, int mobile, String additional, String decoration, String date) {
		super();
		this.guest = guest;
		this.mobile = mobile;
		this.additional = additional;
		this.decoration = decoration;
		this.date = date;
	}



	public Banq(int id, String guest, int mobile, String additional, String decoration, String date) {
		super();
		this.id = id;
		this.guest = guest;
		this.mobile = mobile;
		this.additional = additional;
		this.decoration = decoration;
		this.date = date;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGuest() {
		return guest;
	}

	public void setGuest(String guest) {
		this.guest = guest;
	}

	public int getMobile() {
		return mobile;
	}

	public void setMobile(int mobile) {
		this.mobile = mobile;
	}

	public String getAdditional() {
		return additional;
	}

	public void setAdditional(String additional) {
		this.additional = additional;
	}

	public String getDecoration() {
		return decoration;
	}

	public void setDecoration(String decoration) {
		this.decoration = decoration;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
