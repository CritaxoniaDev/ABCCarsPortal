package com.abccarsportal.ABCCarsPortal.dao;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "profile_picture")
public class ProfilePicture {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_picture")
	private Long idpicture;

	@Column(name = "file_name", nullable = false)
	private String fileName;

	@Column(name = "file_type", nullable = false)
	private String fileType;

	@Lob
	@Column(nullable = false, columnDefinition = "LONGTEXT")
	private String image;

	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "id")
	private User user;

	public ProfilePicture(Long idpicture, String fileName, String fileType, String image, User user) {
		this.idpicture = idpicture;
		this.fileName = fileName;
		this.fileType = fileType;
		this.image = image;
		this.user = user;
	}

	public ProfilePicture() {
		
	}

	public Long getIdpicture() {
		return idpicture;
	}

	public void setIdpicture(Long idpicture) {
		this.idpicture = idpicture;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


}
