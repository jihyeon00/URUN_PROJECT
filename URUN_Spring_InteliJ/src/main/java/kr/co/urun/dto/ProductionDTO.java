package kr.co.urun.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductionDTO {
    private String PROCESS_Status;              // 진행상태
    private String ITEM_NAME;                   // 제품 이름
    private String PROCESS_ID;                  // 작업 코드
    private String PROCESS_ITEM_ID;             // 제품 코드
    private String PROCESS_Plan_Quantity;       // 총 계획수량
    private String PROCESS_LINE;                // 생산라인
    private String WORK_Item_Quantity;          // 총 생산수량
    private String WORK_Defective_Quantity;     // 총 불량수량
    private String PROCESS_defect_rate;         // 총 불량률
    private String PROCESS_START_DATE;          // 생산시작날짜
    private String PROCESS_END_DATE;            // 생산종료날짜

    // 당일 작업 등록
    private String PROCESS_ID_2;                // 작업코드
    private String WORK_Plan_Quantity_2;        // 당일계획수량
    private String WORK_ITEM_Quantity_2;        // 당일생산수량
    private String WORK_Defective_Quantity_2;   // 당일불량수량
    private String WORK_Defective_Reason_2;     // 불량사유

    // 생산계획등록
    private String PROCESS_ITEM_ID_1;           // 생산제품코드
    private String PROCESS_Plan_Quantity_1;     // 계획수량
    private String PROCESS_START_DATE_1;        // 생산시작날짜
    private String PROCESS_LINE_1;              // 생산라인

}
