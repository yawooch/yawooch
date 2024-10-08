package com.kh.opendata.department.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.opendata.department.model.mapper.DepartmentMapper;
import com.kh.opendata.department.model.vo.Department;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DepartmentServiceImpl implements DepartmentService
{
    private final DepartmentMapper departmentMapper;
    @Override
    public List<Department> getDepartments()
    {
        return departmentMapper.selectAll();
    }

}
