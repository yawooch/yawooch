package com.kh.classes;

/** <pre>도서관에서 책을 관리하는 프로그램 Book Class
 *  String  subject      : 책제목
    String  author       : 저자명
    int     bookPrice    : 책가격
    String  category     : 분류(카테고리)
    String  serialNumber : 고유번호
    boolean borrowNum    : 대출 상태
    </pre>
 */
public class BookOrig
{
    /* 도서관에서 책을 관리하는 프로그램 Book Class생성하고 */
    // * 데이터 : 책제목, 저자명, 책가격, 분류, 카테고리, 고유번호
    // 기능 : 대출하는 기능, 반납하는 기능, 대출중인지 확인하는 기능
    
    //데이터
    //책제목
    private String subject      = "";
    //저자명
    private String author       = "";
    //책가격
    private int bookPrice       = 0;
    //분류(카테고리)
    private String category     = "";
    //고유번호
    private String serialNumber = "";
    
    //+ 대출 상태 false : 소장중 , true : 대출중
    boolean borrowNum = false;
    

    public BookOrig(String subject, String author, int bookPrice, String category, String serialNumber, boolean borrowNum)
    {
        super();
        this.subject      = subject;
        this.author       = author;
        this.bookPrice    = bookPrice;
        this.category     = category;
        this.serialNumber = serialNumber;
        this.borrowNum    = borrowNum;
    }
    public BookOrig()
    {
        super();
    }
    
    //대출하는 기능
    public void borrowBook()
    {
        this.borrowNum = true;
        System.out.println("대출되었습니다.");
    }
    //반납하는 기능
    public void returnBook()
    {
        this.borrowNum = false;
        System.out.println("반납되었습니다.");
    }
    
    //대출중인지 확인하는 기능
    public boolean isBorrow()
    {
        return false;
    }

    //+ 책의 정보를 출력하는 기능
    public void bookInfo()
    {
        System.out.println("책제목         : " + subject     );
        System.out.println("저자명         : " + author      );
        System.out.println("책가격         : " + bookPrice   );
        System.out.println("분류(카테고리) : " + category    );
        System.out.println("고유번호       : " + serialNumber);
        System.out.println("대출 상태      : " + (borrowNum == false?"소장중":"대여중"));
    }
    
    
    public String getSubject()
    {
        return subject;
    }
    public void setSubject(String subject)
    {
        this.subject = subject;
    }
    public String getAuthor()
    {
        return author;
    }
    public void setAuthor(String author)
    {
        this.author = author;
    }
    public int getBookPrice()
    {
        return bookPrice;
    }
    public void setBookPrice(int bookPrice)
    {
        this.bookPrice = bookPrice;
    }
    public String getCategory()
    {
        return category;
    }
    public void setCategory(String category)
    {
        this.category = category;
    }
    public String getSerialNumber()
    {
        return serialNumber;
    }
    public void setSerialNumber(String serialNumber)
    {
        this.serialNumber = serialNumber;
    }
    public boolean getBorrowNum()
    {
        return borrowNum;
    }
    public void setBorrowNum(String borrowNum)
    {
        if(borrowNum.equals("True"))
        {
            this.borrowNum = true;
        }
        else if(borrowNum.equals("False"))
        {
            this.borrowNum = false;
        }
        else
        {
            System.out.println("잘못된 입력입니다.");
        }
    }
}
