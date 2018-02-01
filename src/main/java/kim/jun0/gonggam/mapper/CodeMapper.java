package kim.jun0.gonggam.mapper;

import java.util.List;

import kim.jun0.gonggam.domain.CodeVo;

public interface CodeMapper {

	public List<CodeVo> list(String codegroupId) throws Exception;
	
	public void create(CodeVo vo) throws Exception;
	
	public void update(CodeVo vo) throws Exception;
	
	public void delete(String codeId) throws Exception;
}
