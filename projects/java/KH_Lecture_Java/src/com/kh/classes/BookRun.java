package com.kh.classes;
/** 책 객체 클래스를 생성해서 관련 메서드를 호출/ 테스트할수 있는 클래스 */
public class BookRun
{
    public static void main(String[] args)
    {
        //내방법 => rename = BookOrig.java
//        Book littlePrince = new Book("어린왕자","생택쥐페리",14500, "소설", "B001", false);
//        
//        littlePrince.borrowBook();
//        System.out.println("\n\n\n\n");
//        littlePrince.bookInfo();
//
//        System.out.println("\n\n\n\n");
//        littlePrince.returnBook();
//        
//        littlePrince.bookInfo();
//        
//        System.out.println("\n\n\n\n");
//        
//        Book standartOfJava = new Book();
//        
//        standartOfJava.setSubject("자바의 정석");
//        standartOfJava.setAuthor("남궁성");
//        standartOfJava.setBookPrice(18000);
//        standartOfJava.setCategory("기술");
//        standartOfJava.setSerialNumber("B002");
//        standartOfJava.borrowNum = true;
////        standartOfJava.setBorrowNum("True");
//        
//        standartOfJava.bookInfo();
//        
//        System.out.println("\n\n\n\n");
//        //책반납
//        standartOfJava.returnBook();
        
//        int num = 1;
        //Book 클래스 객체생성
        Book b1 = new Book();
//        b1.title = "어린완자"; //(x)
        b1.setTitle("어린완자");
//        b1.setNumber(num++);
//        System.out.printf("%s (%d)", b1.getTitle(), b1.getNumber());
//        System.out.printf("%s (%d) - absVariable : %d\n", b1.getTitle(), b1.getCurrNumber(), Book.absVariable);
        b1.addNumber();
        
        Book.absVariable = Book.absVariable ++;

        Book b2 = new Book();
        b2.setTitle("수박의 정석");
//        b2.setNumber(num++);
//        System.out.printf("%s (%d)", b2.getTitle(), b2.getNumber());
//        System.out.printf("%s (%d) - absVariable : %d\n ", b2.getTitle(), b2.getCurrNumber(), b2.absVariable);
        
        
        //static 변수 : 객체 생성 없이 바로 호출이 가능하다. 클래스명.메소드명();
        //static 변수의 예시 - 랜덤함수, System.arraycopy()
    }
}