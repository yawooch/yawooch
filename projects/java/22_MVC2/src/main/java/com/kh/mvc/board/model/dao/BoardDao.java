package com.kh.mvc.board.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.common.util.PageInfo;

public class BoardDao
{
    public int getBoardCount(Connection connection)
    {
        int count = 0;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String query = "SELECT COUNT(*) FROM BOARD WHERE STATUS='Y'";

        try
        {
            pstmt = connection.prepareStatement(query);

            rs = pstmt.executeQuery();

            if (rs.next())
            {
                count = rs.getInt(1);
            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        } finally
        {
            close(pstmt);
            close(rs);
        }

        return count;
    }

    public List<Board> findAll(Connection connection, PageInfo pageInfo)
    {
        List<Board> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String query = "SELECT RNUM"
                + "     , NO"
                + "     , TITLE"
                + "     , ID"
                + "     , CREATE_DATE"
                + "     , ORIGINAL_FILENAME"
                + "     , READCOUNT"
                + "     , STATUS"
                + "  FROM ("
                + "       SELECT ROWNUM AS RNUM"
                + "            , NO"
                + "            , TITLE"
                + "            , ID"
                + "            , CREATE_DATE"
                + "            , ORIGINAL_FILENAME"
                + "            , READCOUNT"
                + "            , STATUS"
                + "       FROM ("
                + "            SELECT B.NO"
                + "                 , B.TITLE"
                + "                 , M.ID"
                + "                 , B.CREATE_DATE"
                + "                 , B.ORIGINAL_FILENAME"
                + "                 , B.READCOUNT"
                + "                 , B.STATUS"
                + "              FROM BOARD B JOIN MEMBER M ON(B.WRITER_NO = M.NO)"
                + "             WHERE B.STATUS = 'Y'  "
                + "             ORDER BY "
                + "                   B.NO DESC"
                + "            )"
                + "        )"
                + "WHERE RNUM BETWEEN ? and ?";

        try
        {
            pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, pageInfo.getStartList());
            pstmt.setInt(2, pageInfo.getEndList());

            rs = pstmt.executeQuery();

            while (rs.next())
            {
                Board board = new Board();

                board.setWriterNo((rs.getInt("NO")));
                board.setRowNum(rs.getInt("RNUM"));
                board.setWriterId(rs.getString("ID"));
                board.setTitle(rs.getString("TITLE"));
                board.setCreateDate(rs.getDate("CREATE_DATE"));
                board.setOriginalFilename(rs.getString("ORIGINAL_FILENAME"));
                board.setReadCount(rs.getInt("READCOUNT"));
                board.setStatus(rs.getString("STATUS"));

                list.add(board);

            }
        } catch (SQLException e)
        {
            e.printStackTrace();
        } finally
        {
            close(pstmt);
            close(rs);
        }

        return list;
    }

    public Board findBoardByNo(Connection connection, int no)
    {
        Board board             = null;
        PreparedStatement pstmt = null;
        ResultSet rs            = null;
        String query = "SELECT B.NO "
                     + "     , B.TITLE "
                     + "     , M.ID"
                     + "     , B.READCOUNT "
                     + "     , B.ORIGINAL_FILENAME "
                     + "     , B.RENAMED_FILENAME "
                     + "     , B.CONTENT "
                     + "     , B.CREATE_DATE "
                     + "     , B.MODIFY_DATE "
                     + "  FROM BOARD B "
                     + "  JOIN MEMBER M "
                     + "    ON (B.WRITER_NO = M.NO) "
                     + " WHERE B.STATUS = 'Y' "
                     + "   AND B.NO=? ";
        try
        {
            pstmt = connection.prepareStatement(query);
            
            pstmt.setInt(1, no);
            
            rs = pstmt.executeQuery();
            
            if (rs.next())
            {
                board = new Board();
                
                board.setWriterNo(rs.getInt("NO"));
                board.setTitle(rs.getString("TITLE"));
                board.setWriterId(rs.getString("ID"));
                board.setReadCount(rs.getInt("READCOUNT"));
                board.setOriginalFilename(rs.getString("ORIGINAL_FILENAME"));
                board.setRenamedFilename(rs.getString("RENAMED_FILENAME"));
                board.setContent(rs.getString("CONTENT"));
                board.setCreateDate(rs.getDate("CREATE_DATE"));
                board.setModifyDate(rs.getDate("MODIFY_DATE"));
            }
            
        } catch (SQLException e) { e.printStackTrace(); }
        finally {
            close(pstmt);
            close(rs);
        }
        
        return board;
    }

    public int insertBoard(Connection connection, Board board)
    {
        int result = 0;
        String query = "INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
        PreparedStatement pstmt = null;
        
        try
        {
            pstmt = connection.prepareStatement(query);
            
            pstmt.setInt(1, board.getWriterNo());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getContent());
            pstmt.setString(4, board.getOriginalFilename());
            pstmt.setString(5, board.getRenamedFilename());
            
            result = pstmt.executeUpdate();
            
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        return result;
    }

    public int updateBoard(Connection connection, Board board)
    {
        int result = 0;
        String query = "UPDATE BOARD SET TITLE=?"
                     + "     , CONTENT=?"
                     + "     , ORIGINAL_FILENAME=?"
                     + "     , RENAMED_FILENAME=?"
                     + "     , MODIFY_DATE=SYSDATE"
                     + " WHERE NO=?";
        PreparedStatement pstmt = null;
        
        
        try
        {
            pstmt = connection.prepareStatement(query);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setString(3, board.getOriginalFilename());
            pstmt.setString(4, board.getRenamedFilename());
            pstmt.setInt(   5, board.getWriterNo());
            
            result = pstmt.executeUpdate();
        } 
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        finally {
            close(pstmt);
        }
        return result;
    }
}
