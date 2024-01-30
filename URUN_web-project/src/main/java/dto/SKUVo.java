package dto;

public class SKUVo {
	String Stock_Keeping;
	int SKU_Company_ID;
	String SKU_Company_input_date;
	
	public String getStock_Keeping() {
		return Stock_Keeping;
	}
	public void setStock_Keeping(String stock_Keeping) {
		Stock_Keeping = stock_Keeping;
	}
	public int getSKU_Company_ID() {
		return SKU_Company_ID;
	}
	public void setSKU_Company_ID(int sKU_Company_ID) {
		SKU_Company_ID = sKU_Company_ID;
	}
	public String getSKU_Company_input_date() {
		return SKU_Company_input_date;
	}
	public void setSKU_Company_input_date(String sKU_Company_input_date) {
		SKU_Company_input_date = sKU_Company_input_date;
	}
	
	
}
