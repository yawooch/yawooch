package com.kh.mvc.board.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.commit;
import static com.kh.mvc.common.jdbc.JDBCTemplate.rollback;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.board.model.dao.BoardDao;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.common.util.PageInfo;

public class BoardService
{
    public int getBoardCount()
    {
        int count = 0;
        
        Connection connection = getConnection();
        
        count = new BoardDao().getBoardCount(connection); 

        close(connection);
        
        return count;
    }

    public List<Board> getBoardList(PageInfo pageInfo)
    {
        List<Board> list = null;
        
        Connection connection = getConnection();
        
        list = new BoardDao().findAll(connection, pageInfo);
        
        close(connection);
        
        return list;
    }

    public Board getBoardByNo(int no)
    {
        Board board = null;
        
        Connection connection = getConnection();
        
        board = new BoardDao().findBoardByNo(connection, no);
        
        close(connection);
        
        return board;
    }

    public int save(Board board)
    {
        int result = 0;
        
        Connection connection = getConnection();

        //update 인지 insert 인지 판단한다.
        if (board.getWriterNo() > 0)
        {
            //update
            result = new BoardDao().updateBoard(connection, board);
        } else
        {
            //insert
            result = new BoardDao().insertBoard(connection, board);
        }
        
        //결과에따라 commit과 rollback을 한다.
        if (result > 0)
        {
            commit(connection);
        }
        else
        {
            rollback(connection);
        }
        
        close(connection);
        
        return result;
    }
}
