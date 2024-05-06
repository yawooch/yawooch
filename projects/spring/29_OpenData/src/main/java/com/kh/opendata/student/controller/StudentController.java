package com.kh.opendata.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.opendata.department.model.service.DepartmentService;
import com.kh.opendata.department.model.vo.Department;
import com.kh.opendata.student.model.service.StudentService;
import com.kh.opendata.student.model.vo.Student;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StudentController
{
    private final StudentService    studentService;
    private final DepartmentService departmentService;
    
    @GetMapping("/student/search")
    public ModelAndView search(ModelAndView modelAndView) {
        
        List<Department> departments = departmentService.getDepartments();

        departments.stream().forEach(System.out::println);
        
        modelAndView.addObject("departments", departments);
        
        modelAndView.setViewName("student/search");
        
        return modelAndView;
    }
    
    @GetMapping("/students")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> students(
            @RequestParam String deptNo,
            @RequestParam String absenceYn
            ) {
        
        Map<String, Object> map = new HashMap<>();
        
        List<Student> students = studentService.getStudentsByNoAndAbsenceYn(deptNo, absenceYn);
        
        System.out.println("absenceYn : " + absenceYn);
        
        map.put("students", students);
        map.put("totalCount", students.size());
        
        students.stream().forEach(System.out::println);
        
        return ResponseEntity.ok(map);
    }
    
    @DeleteMapping("/students/{studentNo}")
    @ResponseBody
    public Map<String, Object> delete(@PathVariable String studentNo) 
    {
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("resultCode", studentService.delete(studentNo));
        
        return map;
    }
}
