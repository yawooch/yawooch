package com.kh.mybatis.board.model.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import com.kh.mybatis.board.model.vo.Board;
import com.kh.mybatis.common.util.PageInfo;

@TestMethodOrder(OrderAnnotation.class)
class BoardServiceTest
{
    private BoardService service;

    @BeforeEach
    void setUp()
    {
        service = new BoardServiceImpl();
        System.out.println("여기는 @BeforeEach BoardService를 생성했당");
    }

    @Test
    @Disabled
    void nothing()
    {
        
    }
    
    @Test
    @Disabled
    @DisplayName("BoardService 생성 테스트")
    void create()
    {
        assertThat(service).isNotNull();
    }
    
    @Test
    @Order(1)
    @DisplayName("전체 게시글 수 조회 테스트")
    void getBoardCountTest()
    {
        System.out.println("*******************************\n전체 게시글 수 조회 테스트");
        
        int count = 0;
        
        count = service.getBoardCount();
        
        System.out.println("카운드 수 : " + count);
        
        assertThat(count).isGreaterThan(0);
    }
    
    @Test
    @Order(2)
    @DisplayName("게시글 전체 목록 조회 테스트")
    void getBoardListTest()
    {
        System.out.println("*******************************\n게시글 전체 목록 조회 테스트");
        int page          = 1;
        PageInfo pageInfo = null;
        List<Board> list  = null;
        int listCount     = 0;

        listCount = service.getBoardCount();
        
        pageInfo = new PageInfo(page, 10, listCount, 10);
        
        list = service.getBoardList(pageInfo);
        
        list.stream().forEach(System.out::println);
        
        System.out.println("리스트 : " + list);
        
        assertThat(list).isNotNull().isNotEmpty();
    }

    @ParameterizedTest
    @CsvSource(
        value = {
        "null   , null",
        "writer , yoc",
        "title  , 50",
        "content, 10"
        },
        nullValues = "null"
        )
    @Order(3)
    @DisplayName("게시글 전체 목록 조회(검색 기능 적용)테스트")
    void getBoardListTest(String type, String keyword)
    {
        System.out.println("*******************************\n게시글 전체 목록 조회(검색 기능 적용)테스트");
        List<Board> list = null;

        PageInfo pageInfo = null;
        int listCount = 0;
        
        listCount = service.getBoardCount(type, keyword);
        pageInfo = new PageInfo(1, 10, listCount, 5);
        list = service.getBoardList(pageInfo, type, keyword);
        
        System.out.println(list.size());
        
        list.stream().forEach(System.out::println);
        
        System.out.println(listCount);
        System.out.println(pageInfo.getMaxPage());
        System.out.println();
        
        assertThat(list).isNotNull().isNotEmpty();
    }
    
    @Test
    @Order(4)
    @DisplayName("게시글 목록 조회(필터 기능 적용) 테스트")
    void getBoardListByFilterTest() 
    {
        System.out.println("*******************************\n게시글 목록 조회(필터 기능 적용) 테스트");
        String[] filters  = {"B2", "B3"};
        List<Board> list  = null;
        PageInfo pageInfo = null;
        int listCount     = 0;
        
        listCount = service.getBoardCount(filters);
        pageInfo  = new PageInfo(1, 10, listCount, 5);
        list      = service.getBoardList(pageInfo, filters);
        
        list.stream().forEach(System.out::println);
        System.out.println(list.size());
        System.out.println(listCount);
        System.out.println(pageInfo.getMaxPage());
        
        assertThat(list).isNotNull().isNotEmpty();
    } 
    
    @Test
    @Order(5)
    @DisplayName("게시글 상세 조회 (댓글포함) 테스트")
    void getBoardByNo()
    {
        System.out.println("*******************************\n게시글 상세 조회 (댓글포함) 테스트");
        Board board = null;
        
        board = service.getBoardByNo(213);
        
        
        System.out.println(board);
        System.out.println(board.getReplies());
        System.out.println(board.getReplies().size());
        
        board.getReplies().stream().forEach(System.out::println);
        
        
        assertThat(board).isNotNull();
    }
    @Test
    @Order(6)
//    @Disabled
    @DisplayName("게시글 등록 테스트")
    void insertBoardTest(){
        System.out.println("*******************************\n게시글 등록 테스트");
        Board board = null;
        int result = 0;
        
        board = new Board();
        
//        System.out.println(board);
        
        board.setWriterNo(5);
        board.setTitle("mybatis로 게시글 작성");
        board.setContent("mybatis로 작성된 게시글입니다.");
        board.setOriginalFilename("test.txt");
        board.setRenamedFilename("text.txt");
        
//        result = service.save(board);
        
        
        System.out.println(board);
        assertThat(result).isGreaterThan(0);
        assertThat(board.getNo()).isGreaterThan(0);
    }
    
    @Test
    @Order(7)
//    @Disabled
    @DisplayName("게시글 수정 테스트")
    void updateBoardTest() {
        System.out.println("*******************************\n게시글 수정 테스트");
        Board board = null;
        int result = 0;
        
        board = service.getBoardByNo(223);
        
        System.out.println(board);
        
        board.setTitle("mybatis 게시글 4번 수정");
        board.setContent("mybatis 게시글을 4번 수정하였습니다.");
        board.setOriginalFilename(null);
        board.setRenamedFilename(null);
        
        result = service.save(board);
        
        System.out.println(board);
        
        assertThat(result).isGreaterThan(0);
    }
    
    @Test
    @Order(8)
    @DisplayName("게시글 삭제 테스트")
    void deleteBoardTest() {
        System.out.println("*******************************\n게시글 삭제 테스트");
        int result = 0;
        
        System.out.println(result);
        
        result = service.delete(223);
        
        System.out.println(result);
        
        assertThat(result).isGreaterThan(0);
        assertThat(service.getBoardByNo(223));
    }
}
