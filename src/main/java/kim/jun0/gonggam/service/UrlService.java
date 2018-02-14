package kim.jun0.gonggam.service;

import java.util.List;

import kim.jun0.gonggam.domain.UrlVo;

public interface UrlService {

	public List<UrlVo> listUrl() throws Exception;
	
	public void createUrl(UrlVo vo) throws Exception;
	
	public void updateUrl(UrlVo vo) throws Exception;
	
	public void deleteUrl(String old_url) throws Exception;
}
