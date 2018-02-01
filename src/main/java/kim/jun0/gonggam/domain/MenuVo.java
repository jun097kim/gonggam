package kim.jun0.gonggam.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@JsonPropertyOrder({"id", "parent", "text"})
public class MenuVo {

	@JsonProperty("id")
	private String menuId;
	@JsonProperty("parent")
	private String parentMenuId;
	@JsonProperty("text")
	private String menuName;
	private Data data;
}

@Getter
@Setter
@ToString
class Data {
	private String menuUrl;
	private Integer sortNo;
	private char openYn;
}
