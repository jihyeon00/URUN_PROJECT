package kr.co.urun.service;

import kr.co.urun.dto.NoticeDTO;
import kr.co.urun.mapper.MainMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


public interface MainService {
    List<NoticeDTO> selectNoticeFetch();

}
