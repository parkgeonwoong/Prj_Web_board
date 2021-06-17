package tool;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import vo.Board;

public class DBConn {

	public static Connection conn = null;

	public static Connection getConnection() {

		if (conn != null) {
			return conn;
		} else {
			final String DRIVER_CLASS_NAME = "com.mysql.jdbc.Driver";
			final String URL = "jdbc:mysql://localhost:3306/TEST?serverTimezone=UTC";
			final String USER_NAME = "root";
			final String PASSWORD = "";

			try {
				Class.forName(DRIVER_CLASS_NAME);
				conn = DriverManager.getConnection(URL, USER_NAME, PASSWORD);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
	}

	// 글쓰기
	public static void writeBoard(HttpServletRequest request) {

		Connection conn = getConnection();
		String sql = "INSERT INTO board (title, memo, writer, file_name, file) VALUES (?, ?, ?, ?, ?)";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {

			String dir = "C:\\Users\\ASUS\\OneDrive\\바탕 화면\\Workspace\\project\\src\\main\\webapp\\upload";//파일 다운로드 경로
			int max = 5 * 1024 * 1024;
			MultipartRequest m = new MultipartRequest(request, dir, max, "UTF-8", new DefaultFileRenamePolicy());// 이때파일업로드됨
			String title = m.getParameter("title");
			String writer = m.getParameter("writer");
			String memo = m.getParameter("memo");
			String fileName = m.getFilesystemName("file");
			String filePath = dir + "/" + fileName;

			pstmt.setString(1, title);
			pstmt.setString(2, memo);
			pstmt.setString(3, writer);
			pstmt.setString(4, fileName);
			pstmt.setString(5, filePath);

			pstmt.executeUpdate();

		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
	}

	// 전체글가져오기
	public static List<Board> selectBoardList() {
		List<Board> boardList = new ArrayList<>();

		Connection conn = getConnection();
		String sql = "SELECT * FROM BOARD ORDER BY num DESC";
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			ResultSet rs;
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Board board = new Board();
				board.setNum(rs.getLong("num"));
				board.setTitle(rs.getString("title"));
				board.setMemo(rs.getString("memo"));
				board.setWriter(rs.getString("writer"));
				board.setDate(rs.getDate("date"));
				board.setHit(rs.getInt("hit"));
				board.setFileName(rs.getString("file_name"));
				board.setFile(rs.getString("file"));
				boardList.add(board);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return boardList;
	}

	// 검색글가져오기
	public static List<Board> selectBoardList(String type, String keyword) {
		List<Board> boardList = new ArrayList<>();

		Connection conn = getConnection();
		String sql = "SELECT * FROM BOARD WHERE ";
		sql += type + " LIKE '%" + keyword + "%' ORDER BY num DESC";
		try (Statement stmt = conn.createStatement()) {
			ResultSet rs;
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Board board = new Board();
				board.setNum(rs.getLong("num"));
				board.setTitle(rs.getString("title"));
				board.setMemo(rs.getString("memo"));
				board.setWriter(rs.getString("writer"));
				board.setDate(rs.getDate("date"));
				board.setHit(rs.getInt("hit"));
				board.setFileName(rs.getString("file_name"));
				board.setFile(rs.getString("file"));
				boardList.add(board);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return boardList;
	}

	// 글읽기
	public static Board selectBoard(long num) {
		Board board = null;
		Connection conn = getConnection();
		String hitSql = "UPDATE board set hit = hit+1 WHERE num = ?";
		String sql = "SELECT * FROM BOARD WHERE num = ?";
		try (PreparedStatement hitPstmt = conn.prepareStatement(hitSql);
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			hitPstmt.setLong(1, num);
			hitPstmt.executeUpdate();// 조회수증가 1++

			pstmt.setLong(1, num);
			ResultSet rs;
			rs = pstmt.executeQuery();

			while (rs.next()) {
				board = new Board();
				board.setNum(rs.getLong("num"));
				board.setTitle(rs.getString("title"));
				board.setMemo(rs.getString("memo"));
				board.setWriter(rs.getString("writer"));
				board.setDate(rs.getDate("date"));
				board.setHit(rs.getInt("hit"));
				board.setFileName(rs.getString("file_name"));
				board.setFile(rs.getString("file"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return board;
	}

	// 파일다운로드
	public static void fileDownload(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException, IOException {
		long num = Long.parseLong(request.getParameter("num"));
		Board board = selectBoard(num);
		String filePath = board.getFile();
		
		File file = new File(filePath);
		
		String utf8FileName;
		utf8FileName = URLEncoder.encode(board.getFileName(), "utf-8");
        utf8FileName = utf8FileName.replaceAll("\\+", "%20");

        //파일전송
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment;fileName=" + utf8FileName);
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setContentLengthLong(file.length());

        try (InputStream is = new FileInputStream(file);
             OutputStream os = response.getOutputStream()) {
            IO.inputStream2OutputStream(is, os);
        }
	}
	
	/*
	 * //수정 함수 public int update(String title, String memo) { Connection conn =
	 * getConnection(); String SQL = "UPDATE board SET title = ?, memo = ?";
	 * 
	 * try {
	 * 
	 * PreparedStatement pstmt = conn.prepareStatement(SQL);
	 * 
	 * pstmt.setString(1, title); pstmt.setString(2, memo); return
	 * pstmt.executeUpdate();
	 * 
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } return -1; // 데이터베이스 오류 }
	 */
}


