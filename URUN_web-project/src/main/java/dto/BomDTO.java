package dto;

public class BomDTO {

	private String BOM_ID;
	private String BOM_MATERIAL_ID;
	private String BOM_ITEM_ID;
	private int BOM_MATERIAL_QUANTITY;

	
	private String MATERIAL_ID;
	private String MATERIAL_NAME;
	private String MATERIAL_USES;
	
	private String ITEM_ID;
	private String ITEM_NAME;
	private String ITEM_COLOR;
	private int ITEM_SIZE;
	
	
	public String getBOM_ID() {
		return BOM_ID;
	}
	public void setBOM_ID(String bOM_ID) {
		BOM_ID = bOM_ID;
	}
	public String getBOM_MATERIAL_ID() {
		return BOM_MATERIAL_ID;
	}
	public void setBOM_MATERIAL_ID(String bOM_MATERIAL_ID) {
		BOM_MATERIAL_ID = bOM_MATERIAL_ID;
	}
	public String getBOM_ITEM_ID() {
		return BOM_ITEM_ID;
	}
	public void setBOM_ITEM_ID(String bOM_ITEM_ID) {
		BOM_ITEM_ID = bOM_ITEM_ID;
	}
	public int getBOM_MATERIAL_QUANTITY() {
		return BOM_MATERIAL_QUANTITY;
	}
	public void setBOM_MATERIAL_QUANTITY(int bOM_MATERIAL_QUANTITY) {
		BOM_MATERIAL_QUANTITY = bOM_MATERIAL_QUANTITY;
	}
	public String getMATERIAL_ID() {
		return MATERIAL_ID;
	}
	public void setMATERIAL_ID(String mATERIAL_ID) {
		MATERIAL_ID = mATERIAL_ID;
	}
	public String getMATERIAL_NAME() {
		return MATERIAL_NAME;
	}
	public void setMATERIAL_NAME(String mATERIAL_NAME) {
		MATERIAL_NAME = mATERIAL_NAME;
	}
	public String getMATERIAL_USES() {
		return MATERIAL_USES;
	}
	public void setMATERIAL_USES(String mATERIAL_USES) {
		MATERIAL_USES = mATERIAL_USES;
	}
	public String getITEM_ID() {
		return ITEM_ID;
	}
	public void setITEM_ID(String iTEM_ID) {
		ITEM_ID = iTEM_ID;
	}
	public String getITEM_NAME() {
		return ITEM_NAME;
	}
	public void setITEM_NAME(String iTEM_NAME) {
		ITEM_NAME = iTEM_NAME;
	}
	public String getITEM_COLOR() {
		return ITEM_COLOR;
	}
	public void setITEM_COLOR(String iTEM_COLOR) {
		ITEM_COLOR = iTEM_COLOR;
	}
	public int getITEM_SIZE() {
		return ITEM_SIZE;
	}
	public void setITEM_SIZE(int iTEM_SIZE) {
		ITEM_SIZE = iTEM_SIZE;
	}
	
	
}
