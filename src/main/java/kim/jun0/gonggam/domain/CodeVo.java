package kim.jun0.gonggam.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CodeVo {

	private String codegroupId;
	private String codeId;
	private String old_codeId;
	private String codeName;
	private String codeDesc;
	private Integer sortNo;
	private String regUserId;
	private Date regDate;
	private String updateUserId;
	private Date updateDate;
}
