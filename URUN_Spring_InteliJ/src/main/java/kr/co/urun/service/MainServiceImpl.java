package kr.co.urun.service;

import kr.co.urun.dto.NoticeDTO;
import kr.co.urun.mapper.MainMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainServiceImpl implements MainService{
    @Autowired
    private MainMapper mainMapper;

    @Override
    public List<NoticeDTO> selectNoticeFetch() {
        List<NoticeDTO> selectNoticeFetch = mainMapper.selectNoticeFetch();
        return selectNoticeFetch;
    }
}
