package kr.co.urun.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class IBDTO {
    //    입고    IB
    private String IB_ID;                       // 입고(ID) 코드
    private String IB_Company_ID;               // 거래처 코드
    private String IB_MATERIAL_ID;              // 자재 코드
    private String IB_Quantity;                 // 입고수량
    private String IB_Test_Quantity;            // 검수수량
    private String IB_Defective_Quantity;       // 불량수량
    private String IB_defect_rate;              // 불량률
    private String IB_Defective_Date;           // 불량기록날짜
    private String IB_Expected_Date;            // 입고예정날짜
    private String IB_Complete_Date;            // 입고완료날짜(날짜+시간)
    private String IB_Complete_Date_date;       // 입고완료날짜
    private String IB_Complete_Date_time;       // 입고완료시간
    private String IB_Status;                   // 입고 진행상태
    private String IB_Note;                     // 비고

    //    입고 입력
    private String IB_Company_ID_;              // 거래처 아이디
    private String IB_MATERIAL_ID_;             // 자재 아이디
    private String IB_Quantity_;                // 입고수량
    private String IB_Expected_Date_;           // 입고예정날짜


    //    거래처   company
    private String COMPANY_ID;                  // 거래처 아이디
    private String COMPANY_NAME;                // 거래처 이름

    //    자재    material
    private String MATERIAL_ID;                // 자재 아이디
    private String MATERIAL_NAME;              // 자재 이름

    //    진행상태
    private String IBWhere;                    // 검색

}
