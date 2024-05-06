package com.kh.hw.employee.view;

import java.util.Scanner;

import com.kh.hw.employee.controller.EmployeeController;

public class EmployeeMenu
{
    /*
     * com.kh.hw.employee.view.EmployeeMenu
     * - sc : Scanner = new Scanner(System.in)
     * - ec : EmployeeController = new EmployeeController();
     * + EmployeeMenu() 메인 메뉴를 출력하는 기본 생성자
     * + insertEmp() : void 저장할 데이터를 사용자에게 받는 메소드
     * + updateEmp() : void 수정할 데이터를 사용자에게 받는 메소드
     * + deleteEmp() : void 데이터 삭제하는 메소드
     * + printEmp()  : void 데이터 출력하는 메소드
     */
    // 멤버 필드
    private Scanner sc            = new Scanner(System.in);
    private EmployeeController ec = new EmployeeController();
    

    //+ EmployeeMenu() 메인 메뉴를 출력하는 기본 생성자
    public EmployeeMenu()
    {
        // 메뉴 안내가 되고 메뉴 번호에 따라 같은 클래스에 있는 메소드 실행
        // 번호를 잘못 입력했으면 잘못 입력했다는 안내가 뜸
        // + insertEmp() : void 저장할 데이터를 사용자 에게 받는 메소드
        // + updateEmp() : void 수정할 데이터를 사용자 에게 받는 메소드
        // + deleteEmp() : void 데이터 삭제하는 메소드
        // + printEmp()  : void 데이터 출력하는 메소드
        
//        new Employee(1 , "홍길동" , "남" , "010-1234-5678");
//        new Employee(2 , "김길순" , "여" , "010-5678-1234" , "영업부" , 3000000 , 0.15);

        
        int rs = 0;
        do
        {
            System.out.println("1. 사원 추가");
            System.out.println("2. 사원 수정");
            System.out.println("3. 사원 삭제");
            System.out.println("4. 사원 출력");
            System.out.println("9. 프로그램 종료");
            System.out.print("메뉴 번호를 누르세요 : ");
            rs = sc.nextInt();
            sc.nextLine();
            switch (rs)
            {
            case 1:
            {
                insertEmp();
                break;
            }
            case 2:
            {
                updateEmp();
                break;
            }
            case 3:
            {
                deleteEmp();
                break;
            }
            case 4:
            {
                printEmp();
                break;
            }
            case 9:
            {
                System.out.println("프로그램을 종료합니다.");
                break;
            }
            default:
                System.out.println("잘못 입력하셨습니다.");
            }
        }while(rs != 9);
    }
    /** + insertEmp() : void 저장할 데이터를 사용자에게 받는 메소드 */
    public void insertEmp()
    {
        // 사원 번호, 사원 이름, 사원 성별, 전화 번호는 기본적으로 받고
        // 추가적인 정보를 더 입력할 것인지 물어본 후
        // 입력하겠다고 하면 사원부서, 사원 연봉, 보너스 율을 추가로 더 받고
        // 모든 데이터를 EmployeeController의 add메소드 인자로 보냄
        // 추가정보를 입력하지 않겠다고 하면 기본정보만 add메소드 인자로 보냄
        System.out.print("사원 번호 : ");
        int    empNo  = sc.nextInt();
        sc.nextLine();
        System.out.print("사원 이름 : ");
        String name   = sc.nextLine();
        System.out.print("사원 성별 : ");
        char   gender = sc.next().charAt(0);
        sc.nextLine();
        System.out.print("전화 번호 : ");
        String phone  = sc.nextLine();
        System.out.print("추가 정보를 더 입력하시겠습니까?(y/n) : ");
        char   rs     = sc.next().charAt(0);
        sc.nextLine();
        
        if(rs == 'y' || rs == 'Y')
        {
            System.out.print("사원 부서 : ");
            String dept   = sc.nextLine();
            System.out.print("사원 연봉 : ");
            int    salary = sc.nextInt();
            sc.nextLine();
            System.out.print("보너스 율 : ");
            double bonus  = sc.nextDouble();
            sc.nextLine();
            ec.add(empNo, name, gender, phone, dept, salary, bonus);
        }
        else
            ec.add(empNo, name, gender, phone);
    }
    

    /** + updateEmp() : void 수정할 데이터를 사용자에게 받는 메소드 */
    public void updateEmp()
    {
        // 사원 정보 수정에 대한 메뉴 안내가 출력되고
        // 사용자가 수정하고 싶은 내용에 대한 번호를 입력
        // 입력한 메뉴에 맞는 해당 데이터를 EmployeeController에서 수정
        System.out.println("가장 최신의 사원 정보를 수정하게 됩니다.");
        System.out.println("사원의 어떤 정보를 수정하시겠습니까?");
        System.out.println("1. 전화 번호");
        System.out.println("2. 사원 연봉");
        System.out.println("3. 보너스 율");
        System.out.println("9. 돌아가기");
        System.out.print("메뉴 번호를 누르세요 : ");
        int rs = sc.nextInt();
        sc.nextLine();
        
        switch (rs)
        {
        case 1:
            System.out.print("수정할 전화 번호 : ");
            String phone  = sc.nextLine();
            ec.modify(phone);
            break;
        case 2:
            System.out.print("수정할 연봉      : ");
            int    salary = sc.nextInt();
            ec.modify(salary);
            break;
        case 3:
            System.out.print("수정할 보너스율  : ");
            double bonus  = sc.nextDouble();
            ec.modify(bonus);
            break;
        case 9:
            break;
        }
    }

    /** + deleteEmp() : void 데이터 삭제하는 메소드 */
    public void deleteEmp()
    {
        // 정말 삭제할 것인지 물어본 후 삭제하겠다고 하면
        // EmployeeController의 remove()메소드를 호출하여 반환 값에 따라
        // 데이터 삭제에 실패하였는지 성공하였는지 출력
        System.out.print("정말 삭제하시겠습니까? (y/n) : ");
        char rs = sc.next().charAt(0);
        sc.nextLine();
        if(rs == 'y' || rs == 'Y')
        {
            ec.remove(); 
            System.out.println("데이터 삭제에 성공하였습니다.");
        }
        else
        {
            System.out.println("데이터 삭제에 실패하였습니다.");
        }
    }

    /** + printEmp()  : void 데이터 출력하는 메소드 */
    public void printEmp()
    {
        // 사원정보가 있다면 사원정보 출력, 없다면 “사원 데이터가 없습니다”출력
        System.out.println("사원 출력아아아아아아아아~~~~~~~~");
        String rsStr = ec.inform();
        if(rsStr == null)
            System.out.println("사원 데이터가 없습니다");
        else
            System.out.println(rsStr);
    }
}
