package kim.jun0.gonggam.service;

import java.util.List;

import kim.jun0.gonggam.domain.MenuVo;

public interface MenuService {

	public List<MenuVo> listMenu() throws Exception;
	
	public void updateMenu(List<MenuVo> menus, List<String> deleted) throws Exception;
	
	public String listPublicMenu() throws Exception;
}
