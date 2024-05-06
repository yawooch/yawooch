package com.kh.hw.employee.controller;

import com.kh.hw.employee.model.vo.Employee;

public class EmployeeController
{
    /*
     * com.kh.hw.employee.controller.EmployeeController
     * - e : Employee = new Employee();
     * + add(empNo:int, name:String, gender:char, phone:String)                                        : void 매개변수 있는 생성자를 이용하여 데이터 저장하 는 메소드
     * + add(empNo:int, name:String, gender:char, phone:String, dept:String, salary:int, bonus:double) : void 매개변수 있는 생성자를 이용하여 데이터 저장하 는 메소드
     * + modify(phone:String)                                                                          : void setter로 정보 수정
     * + modify(salary:int)                                                                            : void setter로 정보 수정
     * + modify(bonus:double)                                                                          : void setter를 이용하여 정보 수정
     * + remove()                                                                                      : Employee 객체를 삭제하는 메소드
     * + inform()                                                                                      : String 객체에 저장된 데이터를 가져와 반환하는 메소드
     */ 
     // 멤버 필드
     private Employee e = new Employee();

     /** void 매개변수 있는 생성자를 이용하여 데이터 저장하 는 메소드 */
     public void add(int empNo, String name, char gender, String phone) 
     {
         // 받아온 매개변수만큼 매개변수 있는 생성자를 통해 값 저장
         e = new Employee(empNo, name, gender, phone);
     }
     
     /** void 매개변수 있는 생성자를 이용하여 데이터 저장하 는 메소드 */
     public void add(int empNo, String name, char gender, String phone, String dept, int salary, double bonus) 
     {
         // 받아온 매개변수만큼 매개변수 있는 생성자를 통해 값 저장
         e = new Employee(empNo, name, gender, phone, dept, salary, bonus);
     }
     
     /** void setter로 정보 수정 */
     public void modify(String phone)
     {
         // 받아온 매개변수를 이용하여 해당 정보 수정
         e.setPhone(phone);
     }
     
     /** void setter로 정보 수정 */
     public void modify(int salary)
     {
         // 받아온 매개변수를 이용하여 해당 정보 수정
         e.setSalary(salary);
     }
     
     /** void setter를 이용하여 정보 수정 */
     public void modify(double bonus)
     {
         // 받아온 매개변수를 이용하여 해당 정보 수정
         e.setBonus(bonus);
     }
     
     /** Employee 객체를 삭제하는 메소드 */
     public Employee remove()
     {
         // 객체 e에 null을 저장하여 객체 삭제
         e = null;
         return e;
     }
     
     /** String 객체에 저장된 데이터를 가져와 반환하는 메소드 */
     public String inform()
     {
         // 객체 e가 null이라면 null 반환, 아니라면 사원 정보 반환
         return e == null? null:e.printEmployee();
     }
}
