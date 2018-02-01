package kim.jun0.gonggam.mapper;

import java.util.List;

import kim.jun0.gonggam.domain.CodegroupVo;

public interface CodegroupMapper {

	public List<CodegroupVo> list() throws Exception;
	
	public void create(CodegroupVo vo) throws Exception;
	
	public void update(CodegroupVo vo) throws Exception;
	
	public int getChildCodeCnt(String codegroupId) throws Exception;
	
	public void delete(String codegroupId) throws Exception;
}
