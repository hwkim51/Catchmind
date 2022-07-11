package com.e1i4.catchmind.member.model.vo;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Data
public class Follow {

	private int foUser;
	private int foedUser;
}
