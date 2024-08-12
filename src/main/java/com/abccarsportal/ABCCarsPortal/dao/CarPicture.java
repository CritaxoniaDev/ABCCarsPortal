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
@Table(name = "car_picture")
public class CarPicture {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_carpicture")
	private Long idCarPicture;

	@Column(name = "file_name", nullable = false)
	private String fileName;

	@Column(name = "file_type", nullable = false)
	private String fileType;

	@Lob
	@Column(nullable = false, columnDefinition = "LONGTEXT")
	private String image;

	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "car_id")
	private Car car;
	
	public CarPicture(Long idCarPicture, String fileName, String fileType, String image, Car car) {
		super();
		this.idCarPicture = idCarPicture;
		this.fileName = fileName;
		this.fileType = fileType;
		this.image = image;
		this.car = car;
	}

	public CarPicture() {
		
	}

	public Long getIdCarPicture() {
		return idCarPicture;
	}

	public void setIdCarPicture(Long idCarPicture) {
		this.idCarPicture = idCarPicture;
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

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

}
