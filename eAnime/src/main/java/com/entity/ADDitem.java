package com.entity;

public class ADDitem {

	private int id;
	private String Iname;
	private String Icompany;
	private String Price;
	private String Itype;
	private String Istatus;
	private String Iphotos;

	public ADDitem(int id) {
		super();
		this.id = id;
	}

	public ADDitem(String iname, String icompany, String price, String itype, String istatus, String iphotos) {
		super();
		this.Iname = iname;
		this.Icompany = icompany;
		this.Price = price;
		this.Itype = itype;
		this.Istatus = istatus;
		this.Iphotos = iphotos;
	}

	public ADDitem() {
		// TODO Auto-generated constructor stub
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIname() {
		return Iname;
	}

	public void setIname(String iname) {
		this.Iname = iname;
	}

	public String getIcompany() {
		return Icompany;
	}

	public void setIcompany(String icompany) {
		this.Icompany = icompany;
	}

	public String getPrice() {
		return Price;
	}

	public void setPrice(String price) {
		this.Price = price;
	}

	public String getItype() {
		return Itype;
	}

	public void setItype(String itype) {
		this.Itype = itype;
	}

	public String getIstatus() {
		return Istatus;
	}

	public void setIstatus(String istatus) {
		this.Istatus = istatus;
	}

	public String getIphotos() {
		return Iphotos;
	}

	public void setIphotos(String iphotos) {
		this.Iphotos = iphotos;
	}

	@Override
	public String toString() {
		return "ADDitem [id=" + id + ", Iname=" + Iname + ", Icompany=" + Icompany + ", Price=" + Price + ", Itype="
				+ Itype + ", Istatus=" + Istatus + ", Iphotos=" + Iphotos + "]";
	}

}
