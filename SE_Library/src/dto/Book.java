package dto;

public class Book {
	private int bookId;
	private String bookName;
	private String bookAuthor;
	private String bookPublisher;
	private String bookPublishYear;
	private String bookImageName;
	
	public Book(String bookName, String bookAuthor, String bookPublisher, String bookPublishYear) {
		super();
		this.bookName = bookName;
		this.bookAuthor = bookAuthor;
		this.bookPublisher = bookPublisher;
		this.bookPublishYear = bookPublishYear;
	}
	
	public Book(String bookName, String bookAuthor, String bookPublisher, String bookPublishYear,
			String bookImageName) {
		super();
		this.bookName = bookName;
		this.bookAuthor = bookAuthor;
		this.bookPublisher = bookPublisher;
		this.bookPublishYear = bookPublishYear;
		this.bookImageName = bookImageName;
	}
	
	public Book(int bookId, String bookName, String bookAuthor, String bookPublisher, String bookPublishYear) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookAuthor = bookAuthor;
		this.bookPublisher = bookPublisher;
		this.bookPublishYear = bookPublishYear;
	}
	
	public Book(int bookId, String bookName, String bookAuthor, String bookPublisher, String bookPublishYear,
			String bookImageName) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookAuthor = bookAuthor;
		this.bookPublisher = bookPublisher;
		this.bookPublishYear = bookPublishYear;
		this.bookImageName = bookImageName;
	}
	
	public Book() {
		super();
	}
	
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public String getBookPublisher() {
		return bookPublisher;
	}
	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}
	public String getBookPublishYear() {
		return bookPublishYear;
	}
	public void setBookPublishYear(String bookPublishYear) {
		this.bookPublishYear = bookPublishYear;
	}
	public String getBookImageName() {
		return bookImageName;
	}
	public void setBookImageName(String bookImageName) {
		this.bookImageName = bookImageName;
	}
	
	
}
