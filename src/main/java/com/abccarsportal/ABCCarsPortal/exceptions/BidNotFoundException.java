package com.abccarsportal.ABCCarsPortal.exceptions;

public class BidNotFoundException extends RuntimeException {
	
	private static final long serialVersionUID = -4273029831781023562L;

	public BidNotFoundException(String message) {
        super(message);
    }

}
