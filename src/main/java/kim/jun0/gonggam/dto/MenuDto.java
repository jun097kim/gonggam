package kim.jun0.gonggam.dto;

import java.util.List;

import kim.jun0.gonggam.domain.MenuVo;
import lombok.Data;

@Data
public class MenuDto {

	private List<MenuVo> menus;
	private List<String> deleted;
}
