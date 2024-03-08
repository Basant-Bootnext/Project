package in.co.pro4.exception;

/**
 * RecordNotFoundException thrown when a record not found occurred.
 * 
 * @author Basant Vishwakarma
 * 
 */
public class RecordNotFoundException extends Exception {

	public RecordNotFoundException(String msg) {
		super(msg);
	}
}
