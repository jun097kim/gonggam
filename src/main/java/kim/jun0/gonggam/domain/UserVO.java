package kim.jun0.gonggam.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVo {
	
	private String userId;
	private String userPw;
	private String userName;
	private Date regDate;
	private Date updateDate;

}
