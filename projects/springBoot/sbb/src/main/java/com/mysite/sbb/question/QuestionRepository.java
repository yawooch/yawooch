package com.mysite.sbb.question;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionRepository extends JpaRepository<Question, Integer>
{
    Question findBySubject(String subject);
    Question findBySubjectAndContent(String string, String string2);
    List<Question> findBySubjectLike(String string);
    Page<Question> findAll(Pageable pageable);
    Page<Question> findAll(Specification<Question> spec, Pageable pageable);
}
