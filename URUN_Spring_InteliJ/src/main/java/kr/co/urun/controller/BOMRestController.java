package kr.co.urun.controller;


import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.urun.dto.BomDTO;
import kr.co.urun.service.BOMService;
import lombok.extern.log4j.Log4j;

import java.util.List;

@RestController
@Log4j
@RequestMapping("/bomRest")
@AllArgsConstructor
public class BOMRestController {
	
    private BOMService bomService;
	
    // 자재 상세 조회
    @GetMapping(value = "/{MATERIAL_ID}", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<BomDTO> get(@PathVariable("MATERIAL_ID") Long MATERIAL_ID) {
        BomDTO bomDTO = bomService.selectOneMaterial(MATERIAL_ID);
        return new ResponseEntity<>(bomDTO, HttpStatus.OK);
    }

}
