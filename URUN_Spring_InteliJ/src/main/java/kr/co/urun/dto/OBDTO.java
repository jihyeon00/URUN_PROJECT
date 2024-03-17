package kr.co.urun.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OBDTO {
    //    출고    OB
    private String OB_ID;                       // 출고(ID) 코드
    private String OB_Company_ID;               // 거래처 코드
    private String OB_ITEM_ID;                  // 제품 코드
    private String OB_Quantity;                 // 출고수량
    private String OB_Expected_Date;            // 출고예정날짜
    private String OB_Status;                   // 출고 진행상태
    private String OB_Note;                     // 비고

    private String OB_Complete_Date;            // 출고완료날짜(날짜+시간)
    private String OB_Complete_Date_date;       // 출고완료날짜
    private String OB_Complete_Date_time;       // 출고완료시간

    //    출고 입력
    private String OB_Company_ID_;              // 거래처 아이디
    private String OB_ITEM_ID_;                 // 제품 아이디
    private String OB_Quantity_;                // 입고수량
    private String OB_Expected_Date_;           // 입고예정날짜

    //    거래처   company
    private String COMPANY_ID;                  // 거래처 아이디
    private String COMPANY_NAME;                // 거래처 이름

    //    제품    item
    private String ITEM_ID;                     // 제품 아이디
    private String ITEM_NAME;                   // 제품 이름

    //    진행상태
    private String OBWhere;                     // 검색
}
