package kr.co.urun.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductionDTO {
    private String PROCESS_Status;             // 진행상태
    private String ITEM_NAME;                  // 제품 이름
    private String PROCESS_ITEM_ID;            // 제품 코드
    private String PROCESS_Plan_Quantity;      // 총 계획수량
    private String WORK_Item_Quantity;         // 총 생산수량
    private String WORK_Defective_Quantity;    // 총 불량수량
    private String PROCESS_defect_rate;        // 총 불량률
    private String PROCESS_START_DATE;         // 생산시작날짜
    private String PROCESS_END_DATE;           // 생산종료날짜
}
