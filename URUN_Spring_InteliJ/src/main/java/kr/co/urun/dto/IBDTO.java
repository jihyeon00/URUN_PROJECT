package kr.co.urun.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class IBDTO {
    //    입고    IB
    private String IB_ID;
    private String IB_Company_ID;
    private String IB_MATERIAL_ID;
    private String IB_Quantity;
    private String IB_Test_Quantity;
    private String IB_Defective_Quantity;
    private String IB_defect_rate;
    private String IB_Defective_Date;
    private String IB_Expected_Date;
    private String IB_Complete_Date;
    private String IB_Status;
    private String IB_Note;

    private String IB_Company_ID_;
    private String IB_MATERIAL_ID_;
    private String IB_Quantity_;
    private String IB_Expected_Date_;


    //    거래처   company
    private String COMPANY_ID;
    private String COMPANY_NAME;

    //    자재    material
    private String MATERIAL_ID;
    private String MATERIAL_NAME;

    //    진행상태
    private String IBWhere;

}
