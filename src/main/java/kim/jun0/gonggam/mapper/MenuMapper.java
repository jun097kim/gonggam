package kim.jun0.gonggam.mapper;

import java.util.HashMap;
import java.util.List;

import kim.jun0.gonggam.domain.MenuVo;

public interface MenuMapper {

	public List<MenuVo> list() throws Exception;
	
	public void update(List<MenuVo> menus) throws Exception;
	
	public void delete(List<String> deleted) throws Exception;
	
	public HashMap<String, Object> listXml() throws Exception;
}
