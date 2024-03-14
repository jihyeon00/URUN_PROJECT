package kr.co.urun.controller;

import kr.co.urun.dto.IBDTO;
import kr.co.urun.service.IBService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ibrest")
@AllArgsConstructor
public class IBRestController {
    private IBService ibService;

    // IB 상세 조회
    @GetMapping(value = "/{IB_ID}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<IBDTO> get(@PathVariable("IB_ID") Long IB_ID) {
        return new ResponseEntity<>(ibService.IBSelectOne(IB_ID), HttpStatus.OK);
    }
}
