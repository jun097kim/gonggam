package kim.jun0.gonggam.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UrlVo {

	private String url;
	private String old_url;
	private List<String> groupName;
}
