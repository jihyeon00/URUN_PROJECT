package kr.co.urun.dto;

import lombok.Getter;
import lombok.Setter;

/**
 *검색을 위한 클래스
 */
@Getter
@Setter
public class Criteria {
    // 검색창
    private String search_ITEM_NAME;        // 제품 이름
    private String search_ITEM_ID;          // 제품 코드
    private String search_START_DATE1;      // 시작날짜 1
    private String search_START_DATE2;      // 시작날짜 2
    private String search_END_DATE1;        // 종료날짜 1
    private String search_END_DATE2;        // 종료날짜 2
}
