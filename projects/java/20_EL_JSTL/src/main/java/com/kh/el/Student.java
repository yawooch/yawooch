package com.kh.el;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@Getter
//@Setter
@NoArgsConstructor
@AllArgsConstructor
//@ToString
//@EqualsAndHashCode
public class Student
{
    private String name;
    private int age;
    private int mathScore;
    private int englishScore;
}