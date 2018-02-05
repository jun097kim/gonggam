package kim.jun0.gonggam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kim.jun0.gonggam.domain.MenuVo;
import kim.jun0.gonggam.mapper.MenuMapper;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuMapper mapper;

	@Override
	public List<MenuVo> listMenu() throws Exception {
		return mapper.list();
	}

	@Transactional
	@Override
	public void updateMenu(List<MenuVo> menus, List<String> deleted) throws Exception {
		if (deleted.size() > 0) {
			mapper.delete(deleted);
		}
		mapper.update(menus);
	}

	@Override
	public String listPublicMenu() throws Exception {
		return (String) mapper.listXml().get("menuXml");
	}
}
