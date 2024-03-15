package kr.co.urun.mapper;

import kr.co.urun.dto.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MainMapper {
    List<NoticeDTO> selectNoticeFetch();

}
