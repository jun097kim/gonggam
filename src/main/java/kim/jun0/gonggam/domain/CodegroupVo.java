package kim.jun0.gonggam.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CodegroupVo {

	private String codegroupId;
	private String old_codegroupId;
	private String codegroupName;
	private String codegroupDesc;
	private Date regDate;
	private String regUserId;
	private Date updateDate;
	private String updateUserId;
	
}
