import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.*;

public class TableGenerator {
    public static String readInputFile(String filePath) {
        try {
            return new String(Files.readAllBytes(Paths.get(filePath)), StandardCharsets.UTF_8);
        } catch (NoSuchFileException e) {
            System.out.printf("오류: %s 파일을 찾을 수 없습니다.%n", filePath);
            return null;
        } catch (IOException e) {
            System.out.printf("파일 읽기 오류: %s%n", e.getMessage());
            return null;
        }
    }

    // repeat 메서드 대체 함수 추가
    private static String repeatChar(char ch, int count) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < count; i++) {
            sb.append(ch);
        }
        return sb.toString();
    }

    public static String convertTextToTable(String text, String delimiter) {
        if (text == null || text.trim().isEmpty()) {
            return "변환할 텍스트가 없습니다.";
        }

        // 텍스트를 행으로 분리
        String[] lines = text.trim().split("\n");
        List<String[]> tableData = new ArrayList<>();
        
        // 각 행을 구분자로 분리
        for (String line : lines) {
            tableData.add(line.trim().split(delimiter));
        }

        // 모든 행의 열 개수를 첫 번째 행과 동일하게 맞추기
        int maxCols = tableData.get(0).length;
        for (int i = 0; i < tableData.size(); i++) {
            String[] row = tableData.get(i);
            if (row.length < maxCols) {
                String[] newRow = Arrays.copyOf(row, maxCols);
                for (int j = row.length; j < maxCols; j++) {
                    newRow[j] = "";
                }
                tableData.set(i, newRow);
            }
        }

        // 각 열의 최대 길이 계산
        int[][] colWidths = new int[maxCols][2];  // [실제 길이, 표시 길이]
        for (int col = 0; col < maxCols; col++) {
            int maxWidth = 0;
            int maxDisplayWidth = 0;
            for (String[] row : tableData) {
                String cell = row[col].trim();
                maxWidth = Math.max(maxWidth, cell.length());
                maxDisplayWidth = Math.max(maxDisplayWidth, getDisplayLength(cell));
            }
            colWidths[col] = new int[]{maxWidth, maxDisplayWidth};
        }

        // 테이블 생성
        StringBuilder result = new StringBuilder();
        
        // 상단 테두리 생성
        result.append("┌");
        for (int i = 0; i < colWidths.length; i++) {
            result.append(repeatChar('─', colWidths[i][1] + 2));
            result.append(i == colWidths.length - 1 ? "┐" : "┬");
        }
        result.append("\n");

        // 테이블 내용 생성
        for (int i = 0; i < tableData.size(); i++) {
            String[] row = tableData.get(i);
            
            // 행 내용 추가
            result.append("│");
            for (int j = 0; j < row.length; j++) {
                String content = row[j].trim();
                int padding = colWidths[j][1] - getDisplayLength(content);
                result.append(" ").append(content).append(repeatChar(' ', padding)).append(" │");
            }
            result.append("\n");

            // 행 구분선 추가
            if (i < tableData.size() - 1) {
                result.append("├");
                for (int k = 0; k < colWidths.length; k++) {
                    result.append(repeatChar('─', colWidths[k][1] + 2));
                    result.append(k == colWidths.length - 1 ? "┤" : "┼");
                }
                result.append("\n");
            }
        }

        // 하단 테두리 생성
        result.append("└");
        for (int i = 0; i < colWidths.length; i++) {
            result.append(repeatChar('─', colWidths[i][1] + 2));
            result.append(i == colWidths.length - 1 ? "┘" : "┴");
        }
        result.append("\n");

        return result.toString();
    }

    private static int getDisplayLength(String s) {
        int length = 0;
        for (char c : s.toCharArray()) {
            if ((c >= 0xAC00 && c <= 0xD7A3) ||
                (c >= 0x3131 && c <= 0x314E) ||
                (c >= 0x314F && c <= 0x3163)) {
                length += 2;
            } else {
                length += 1;
            }
        }
        return length;
    }

    public static void saveOutput(String table, String outputFile) {
        try {
            Files.write(Paths.get(outputFile), table.getBytes(StandardCharsets.UTF_8));
            System.out.printf("테이블이 %s에 저장되었습니다.%n", outputFile);
        } catch (IOException e) {
            System.out.printf("파일 저장 오류: %s%n", e.getMessage());
        }
    }

    public static void main(String[] args) {
        String inputFile = "C:\\Users\\sdream\\Documents\\work\\python\\input_txt.txt";
        String outputFile = "C:\\Users\\sdream\\Documents\\work\\python\\output_table.txt";
        
        // 입력 파일 읽기
        String inputText = readInputFile(inputFile);
        if (inputText == null) {
            return;
        }
        
        // 테이블 변환
        String table = convertTextToTable(inputText, "\t");
        
        // 결과 출력 및 저장
        System.out.println("\n변환된 테이블:");
        System.out.println(table);
        saveOutput(table, outputFile);
    }
}