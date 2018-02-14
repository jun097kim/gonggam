package kim.jun0.gonggam.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kim.jun0.gonggam.domain.UrlVo;
import kim.jun0.gonggam.mapper.UrlMapper;
import kim.jun0.gonggam.security.GonggamFilterSecurityMetadataSource;

@Service
public class UrlServiceImpl implements UrlService {

	@Autowired
	UrlMapper mapper;
	
	@Autowired
	GonggamFilterSecurityMetadataSource metadataSource;
	
	@Override
	public List<UrlVo> listUrl() throws Exception {
		return mapper.list();
	}
	
	@Override
	public void createUrl(UrlVo vo) throws Exception {
		mapper.create(vo);
		refreshDatasource();
	}
	
	@Transactional
	@Override
	public void updateUrl(UrlVo vo) throws Exception {
		mapper.delete(vo.getOld_url());
		mapper.create(vo);
		refreshDatasource();
	}
	
	@Override
	public void deleteUrl(String old_url) throws Exception {
		mapper.delete(old_url);
		refreshDatasource();
	}
	
	private void refreshDatasource() throws Exception {
		metadataSource.refreshDatasource();
	}
}
