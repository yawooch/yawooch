package com.mysite.sbb;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.mysite.sbb.answer.AnswerRepository;
import com.mysite.sbb.question.QuestionRepository;
import com.mysite.sbb.question.QuestionService;

@SpringBootTest
class SbbApplicationTests {

    @Autowired
    private QuestionService questionService;
    
    @Autowired
    private QuestionRepository questionRepository;
    
    @Autowired
    private AnswerRepository answerRepository;
    
    
    @Test
    void testJpa()
    {
//        for (int i = 18; i < 300; i++)
//        {
//            String subject = String.format("테스트 데이터입니다:[%03d]", i);
//            String content = "내용없음" + i;
//            this.questionService.create(subject, content);
//        }
    }
    
//    //테스트 코드를 수행할때만 어노테이션을 사용한다.
//    @Transactional
//    @Test
//    void testJpa()
//    {
//        Optional<Question> oq = this.questionRepository.findById(12);
//        assertTrue(oq.isPresent());
//        Question q = oq.get();
//        
//        List<Answer> answerList = q.getAnswerList();
//        
//        assertEquals(1, answerList.size());
//        assertEquals("네 자동으로 생성됩니다.", answerList.get(0).getContent());
//    }
    
//    @Test
//    void testJpa()
//    {
//        Optional<Question> oq = this.questionRepository.findById(12);
//        assertTrue(oq.isPresent());
//        Question q = oq.get();
//        
//        Answer a = new Answer();
//        a.setContent("네 자동으로 생성됩니다.");
//        a.setQuestion(q);
//        a.setCreateDate(LocalDateTime.now());
//        this.answerRepository.save(a);
//    }
    
//    @Test
//    void testJpa()
//    {
//        assertEquals(2,this.questionRepository.count());
//        Optional<Question> oq = this.questionRepository.findById(11);
//        assertTrue(oq.isPresent());
//        Question q = oq.get();
//        this.questionRepository.delete(q);
//        assertEquals(2,this.questionRepository.count());
//    }
    
//    @Test
//    void testJpa()
//    {
//        Optional<Question> oq = this.questionRepository.findById(11);
//        assertTrue(oq.isPresent());
//        Question q = oq.get();
//        q.setSubject("수정된 제목");
//        this.questionRepository.save(q);
//    }
    
//    @Test
//    void testJpa()
//    {
//        List<Question> qList = this.questionRepository.findBySubjectLike("SBB%");
//        Question q = qList.get(0);
//        assertEquals("SBB가 무엇인가요?", q.getSubject());
//    }
    
//    @Test
//    void testJpa()
//    {
//        Question q = this.questionRepository.findBySubjectAndContent("SBB가 무엇인가요?", "SBB에 대해 알고 싶습니다.");
//        assertEquals(11, q.getId());
//    }
    
//    @Test
//    void testJpa()
//    {
//        Question q = this.questionRepository.findBySubject("SBB가 무엇인가요?");
//        assertEquals(11,q.getId());
//    }
//    @Test
//    void testJpa()
//    {
//        List<Question> all = this.questionRepository.findAll();
//        assertEquals(2, all.size());
//        
//
//        Question q =  all.get(0);
//        assertEquals("SBB가 무엇인가요?", q.getSubject());
//    }

//    @Test
//    void testJpa()
//    {
//        Question q1 = new Question();
//        q1.setSubject("SBB가 무엇인가요?");
//        q1.setContent("SBB에 대해 알고 싶습니다.");
//        q1.setCreateDate(LocalDateTime.now());
//        this.questionRepository.save(q1);
//        
//        Question q2 = new Question();
//        q2.setSubject("스프링부트 모델 질문입니다.");
//        q2.setContent("id는 자동으로 생성되나요?");
//        q2.setCreateDate(LocalDateTime.now());
//        this.questionRepository.save(q2);
//    }

}
