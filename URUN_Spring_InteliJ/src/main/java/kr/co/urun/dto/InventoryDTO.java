package kr.co.urun.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
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
}
