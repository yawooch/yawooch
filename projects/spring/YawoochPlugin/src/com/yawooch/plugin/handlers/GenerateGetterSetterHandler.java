package com.yawooch.plugin.handlers;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;
import org.eclipse.jface.dialogs.InputDialog;
import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.jface.text.IDocument;
import org.eclipse.jface.text.ITextSelection;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.ui.IEditorPart;
import org.eclipse.ui.handlers.HandlerUtil;
import org.eclipse.ui.texteditor.ITextEditor;

/**
 * Getter/Setter 생성 핸들러
 * 
 * 필드 이름을 입력받아 getter/setter 메서드를 생성합니다.
 * 단축키: Ctrl+Shift+G
 */
public class GenerateGetterSetterHandler extends AbstractHandler {

	@Override
	public Object execute(ExecutionEvent event) throws ExecutionException {
		IEditorPart editor = HandlerUtil.getActiveEditor(event);
		
		if (editor instanceof ITextEditor) {
			ITextEditor textEditor = (ITextEditor) editor;
			
			// 필드 이름 입력 받기
			InputDialog dialog = new InputDialog(
				HandlerUtil.getActiveShell(event),
				"Getter/Setter 생성",
				"필드 이름을 입력하세요 (예: name, age):",
				"",
				null
			);
			
			if (dialog.open() == InputDialog.OK) {
				String fieldName = dialog.getValue().trim();
				
				if (!fieldName.isEmpty()) {
					String code = generateGetterSetter(fieldName);
					
					// 현재 커서 위치에 코드 삽입
					ISelection selection = textEditor.getSelectionProvider().getSelection();
					if (selection instanceof ITextSelection) {
						ITextSelection textSelection = (ITextSelection) selection;
						IDocument document = textEditor.getDocumentProvider()
							.getDocument(textEditor.getEditorInput());
						
						try {
							int offset = textSelection.getOffset();
							document.replace(offset, 0, code);
						} catch (Exception e) {
							MessageDialog.openError(
								HandlerUtil.getActiveShell(event),
								"오류",
								"코드 삽입 중 오류가 발생했습니다: " + e.getMessage()
							);
						}
					}
				}
			}
		}
		
		return null;
	}
	
	/**
	 * 필드 이름으로부터 getter/setter 메서드를 생성합니다.
	 */
	private String generateGetterSetter(String fieldName) {
		// 첫 글자를 대문자로 변환
		String capitalized = fieldName.substring(0, 1).toUpperCase() 
			+ fieldName.substring(1);
		
		StringBuilder sb = new StringBuilder();
		sb.append("\n\t// Getter\n");
		sb.append("\tpublic String get").append(capitalized).append("() {\n");
		sb.append("\t\treturn ").append(fieldName).append(";\n");
		sb.append("\t}\n\n");
		
		sb.append("\t// Setter\n");
		sb.append("\tpublic void set").append(capitalized).append("(String ").append(fieldName).append(") {\n");
		sb.append("\t\tthis.").append(fieldName).append(" = ").append(fieldName).append(";\n");
		sb.append("\t}\n");
		
		return sb.toString();
	}
}
