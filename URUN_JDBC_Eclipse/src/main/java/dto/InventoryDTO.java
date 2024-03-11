package dto;

public class InventoryDTO {
	private int INVENTORY_ID;
	private int INVENTORY_MATERIAL_ID;
	private int INVENTORY_ITEM_ID;
	private int INVENTORY_IB_ID;
	private int INVENTORY_OB_ID;
	private int INVENTORY_WORK_ID;
	private int INVENTORY_Quantity;
	private String INVENTORY_Warehouse;
	
	private String ITEM_ID;
	private String ITEM_NAME;
	private String ITEM_COLOR;
	private int ITEM_SIZE;
	
	
	private String MATERIAL_ID;
	private String MATERIAL_NAME;
	private String MATERIAL_USES;
	
	
	private int sumINVENTORY;


	public int getINVENTORY_ID() {
		return INVENTORY_ID;
	}
	public void setINVENTORY_ID(int iNVENTORY_ID) {
		INVENTORY_ID = iNVENTORY_ID;
	}
	public int getINVENTORY_MATERIAL_ID() {
		return INVENTORY_MATERIAL_ID;
	}
	public void setINVENTORY_MATERIAL_ID(int iNVENTORY_MATERIAL_ID) {
		INVENTORY_MATERIAL_ID = iNVENTORY_MATERIAL_ID;
	}
	public int getINVENTORY_ITEM_ID() {
		return INVENTORY_ITEM_ID;
	}
	public void setINVENTORY_ITEM_ID(int iNVENTORY_ITEM_ID) {
		INVENTORY_ITEM_ID = iNVENTORY_ITEM_ID;
	}
	public int getINVENTORY_IB_ID() {
		return INVENTORY_IB_ID;
	}
	public void setINVENTORY_IB_ID(int iNVENTORY_IB_ID) {
		INVENTORY_IB_ID = iNVENTORY_IB_ID;
	}
	public int getINVENTORY_OB_ID() {
		return INVENTORY_OB_ID;
	}
	public void setINVENTORY_OB_ID(int iNVENTORY_OB_ID) {
		INVENTORY_OB_ID = iNVENTORY_OB_ID;
	}
	public int getINVENTORY_WORK_ID() {
		return INVENTORY_WORK_ID;
	}
	public void setINVENTORY_WORK_ID(int iNVENTORY_WORK_ID) {
		INVENTORY_WORK_ID = iNVENTORY_WORK_ID;
	}
	public int getINVENTORY_Quantity() {
		return INVENTORY_Quantity;
	}
	public void setINVENTORY_Quantity(int iNVENTORY_Quantity) {
		INVENTORY_Quantity = iNVENTORY_Quantity;
	}
	public String getINVENTORY_Warehouse() {
		return INVENTORY_Warehouse;
	}
	public void setINVENTORY_Warehouse(String iNVENTORY_Warehouse) {
		INVENTORY_Warehouse = iNVENTORY_Warehouse;
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
	public int getSumINVENTORY() {
		return sumINVENTORY;
	}
	public void setSumINVENTORY(int sumINVENTORY) {
		this.sumINVENTORY = sumINVENTORY;
	}
}
