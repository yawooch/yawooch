package com.kh.classes;

public class Book {
    /*
     * 도서관에서 책을 관리하는 프로그램을 만들기 위해
     * 먼저, 책이라는 객체를 Book이라는 클래스로 구성해보자.
     * 
     * 책이 가지고 있는 데이터와 기능을 먼저 떠올려보기..
     * - 데이터: 책제목, 저자명, 책가격, 분류(카테고리), 고유번호, ...
     * - 기능: 대출하는 기능, 반납하는 기능, 대출 중인지 확인하는 기능, ...
     * 
     * [3]
     *  // 변수 정의
     *  String title;
     *  String author;
     *  int number;
     *  int price;
     *  String borrow;
     *  String catagory;
     *  int pageNumber;
     *  //메소드 정의
     *  public int getPageNumber(){};
     *  public String getBorrow(){};
     *  public void getBookInfo(){};
     */
    private String title;            //책제목
    private String author;           //저자명
    private static int number = 1;   //고유번호
    private int price;               //책가격
    String borrow;                   //대출여부 : 대출중, 보관중
    String catagory;                 //카테고리
    int pageNumber;                  //페이지수
    private int currNumber;          //고유번호
    
    static int absVariable = 1; 
    
    
    /** getter title  */
    public String getTitle()
    {
        return title;
    }
    
    /** setter title  */
    public void setTitle(String title)
    {
        //this : 클래스 내부에서 다음에 연결되는 멤버를 찾음
        this.title = title; 
    }
    
    /** getter author  */
    public String getAuthor()
    {
        return author;
    }
    
    /** setter author  */
    public void setAuthor(String author)
    {
        this.author = author; 
    }
    
    /** getter number  */
//    public int getNumber()
//    {
//        return number;
//    }
    
    /** setter number  */
//    public void setNumber(int number)
//    {
//    }
    
    /** getter price  */
    public int getPrice()
    {
        return price;
    }
    
    /** setter price  */
    public void setPrice(int price)
    {
        this.price = price; 
    }

    /** 페이지 수 알려주는 메소드 */
    public int getPageNumber()
    {
        System.out.println("페이지수 : "+ this.pageNumber);
        return pageNumber;
    }

    /** 대출여부를 알려주는 메소드 */
    public String getBorrow()
    {
        return borrow;
    }
    /** 책정보를 출력해주는 메소드 */
    public void getBookInfo()
    {
        println("=============================");
        println("책제목    \t: " + title       );
        println("저자명    \t: " + author      );
        println("고유번호  \t: " + number      );
        println("가격      \t: " + price       );
        println("페이지 수 \t: " + pageNumber  );
        println("카테고리  \t: " + catagory    );
        println("대출 여부 \t: " + borrow      );
        println("==============================");
    }
    
    /** 클래스 내부에서 출력함수 사용 */
    private void println(String msg)
    {
        System.out.println(msg);
    }
    
    /** 고유번호를 관리하는 메소드 */
    public void addNumber()
    {
        currNumber = number++;
    }
    /** getter currNumber  */
    public int getCurrNumber()
    {
        return currNumber;
    }
    
//    // 인스턴스 변수(데이터)
//    private String title;
//    private String author;
//    private int price;
//    private String category;
//    private int uniqueNumber;
//    boolean isBorrow;
//    
//    // 생성자 ( 초기화 메소드 )
//    public Book(String title, String author, int price) {
//        this.title = title;
//        this.author = author;
//        this.price = price;
//    }
//    
//    // 인스턴스 메소드 (기능)
//    
//    // -------- getter, setter -------------
//    public String getTitle() {
//        return title;
//    }
//
//    public void setTitle(String title) {
//        this.title = title;
//    }
//
//    public String getAuthor() {
//        return author;
//    }
//
//    public void setAuthor(String author) {
//        this.author = author;
//    }
//
//    public int getPrice() {
//        return price;
//    }
//
//    public void setPrice(int price) {
//        this.price = price;
//    }
//
//    public String getCategory() {
//        return category;
//    }
//
//    public void setCategory(String category) {
//        this.category = category;
//    }
//
//    public int getUniqueNumber() {
//        return uniqueNumber;
//    }
//
//    public void setUniqueNumber(int uniqueNumber) {
//        this.uniqueNumber = uniqueNumber;
//    }
//    // --------------------------------
//    // 책의 정보를 모두 표시해주는 메소드
//    public void showBookInfo() {
//        System.out.println("==========================");
//        System.out.println("제목\t: " + title);
//        System.out.println("저자\t: " + author);
//        System.out.println("가격\t: " + price);
//        System.out.println("카테고리\t: " + category);
//        System.out.println("고유번호\t: " + uniqueNumber);
//        System.out.println("대출가능여부\t: " + (isBorrow ? "불가" : "가능"));
//        System.out.println("==========================");
//    }
//    
//    // 책의 할인율을 적용하는 메소드
//    public int setDiscountPrice(double discountRate) {
//        this.price = (int)(this.price * (1-discountRate));
//        return this.price;
//    }
//    
//    // 책의 대출 여부를 확인하는 메소드
//    //  대출여부에 해당하는 데이터(isBorrow) 값을 결과로 반환
//    public boolean checkBorrowBook() {
//        return isBorrow;
//    }
//
//    // 책을 대출하기 위해 사용하는 메소드
//    //  대출/반납 여부의 값을 변경
//    public void borrowBook() {
//        if (!this.isBorrow) {
//            this.isBorrow = true;
//        } else {
//            System.out.println("이미 대출되어 있습니다.");
//        }
//    }
//    
//    // 책을 반납하기 위해 사용하는 메소드
//    //  대출/반납 여부의 값을 변경
//    public void returnBook() {
//        if (this.isBorrow) {
//            this.isBorrow = false;
//        } else {
//            System.out.println(this.title + " 책은 현재 대출된 상태가 아닙니다.");
//        }
//    }
}