package com.abccarsportal.ABCCarsPortal.exceptions;

public class TestDriveNotFoundException extends RuntimeException {

	private static final long serialVersionUID = -9058636734329950120L;

	public TestDriveNotFoundException() {

    }

    public TestDriveNotFoundException(String message) {
        super(message);
    }

    public TestDriveNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }

    public TestDriveNotFoundException(Throwable cause) {
        super(cause);
    }
}