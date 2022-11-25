package com.goodee.everydoctor.pet.profile;

import java.sql.Date;

import lombok.Data;

@Data
public class PetVO {

	private Long petNum;
	private String userName;
	private Long petBioNum;
	private String petName;
	private Date petBirth;
	private Integer petAge;
	private Integer petSex;
	private Integer neutered;
	private Integer vaccinnation;
	private String petFileName;
	
}
