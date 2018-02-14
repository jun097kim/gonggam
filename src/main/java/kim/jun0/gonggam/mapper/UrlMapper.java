package kim.jun0.gonggam.mapper;

import java.util.List;

import kim.jun0.gonggam.domain.UrlVo;

public interface UrlMapper {

	public List<UrlVo> list() throws Exception;
	
	public void create(UrlVo vo) throws Exception;
	
	public void delete(String old_url) throws Exception;
}
