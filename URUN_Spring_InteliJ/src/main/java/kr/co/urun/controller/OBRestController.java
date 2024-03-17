package kr.co.urun.controller;

import kr.co.urun.dto.OBDTO;
import kr.co.urun.service.OBService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/obrest")
@AllArgsConstructor
public class OBRestController {
    private OBService obService;

    // OB 상세 조회
    @GetMapping(value = "/{OB_ID}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<OBDTO> get(@PathVariable("OB_ID") Long OB_ID) {
        return new ResponseEntity<>(obService.OBSelectOne(OB_ID), HttpStatus.OK);
    }
}
