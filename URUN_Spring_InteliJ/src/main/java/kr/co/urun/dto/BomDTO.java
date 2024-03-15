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
public class BomDTO {

	private String BOM_ID;
	private String BOM_MATERIAL_ID;
	private String BOM_ITEM_ID;
	private int BOM_MATERIAL_QUANTITY;

	
	private String MATERIAL_ID;
	private String MATERIAL_NAME;
	private String MATERIAL_USES;
	
	private String materialNameList;
	
	
	private String ITEM_ID;
	private String ITEM_NAME;
	private String ITEM_COLOR;
	private int ITEM_SIZE;
	
	private int ROWNUM;
	private String searchText;

	
}
