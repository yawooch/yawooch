package com.yawooch.plugin.handlers;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;
import org.eclipse.jface.text.IDocument;
import org.eclipse.jface.text.ITextSelection;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.ui.IEditorPart;
import org.eclipse.ui.PlatformUI;
import org.eclipse.ui.handlers.HandlerUtil;
import org.eclipse.ui.texteditor.ITextEditor;

/**
 * 코드 포맷팅 핸들러
 * 
 * 선택된 코드를 포맷팅합니다.
 * 단축키: Ctrl+Shift+F
 */
public class FormatCodeHandler extends AbstractHandler {

	@Override
	public Object execute(ExecutionEvent event) throws ExecutionException {
		IEditorPart editor = HandlerUtil.getActiveEditor(event);
		
		if (editor instanceof ITextEditor) {
			ITextEditor textEditor = (ITextEditor) editor;
			ISelection selection = textEditor.getSelectionProvider().getSelection();
			
			if (selection instanceof ITextSelection) {
				ITextSelection textSelection = (ITextSelection) selection;
				IDocument document = textEditor.getDocumentProvider()
					.getDocument(textEditor.getEditorInput());
				
				String selectedText = textSelection.getText();
				
				if (selectedText != null && !selectedText.trim().isEmpty()) {
					// 간단한 포맷팅 예제: 공백 정리
					String formatted = formatText(selectedText);
					
					try {
						document.replace(
							textSelection.getOffset(),
							textSelection.getLength(),
							formatted
						);
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					// 선택된 텍스트가 없으면 메시지 표시
					org.eclipse.jface.dialogs.MessageDialog.openInformation(
						HandlerUtil.getActiveShell(event),
						"코드 포맷팅",
						"포맷팅할 텍스트를 선택해주세요."
					);
				}
			}
		}
		
		return null;
	}
	
	/**
	 * 텍스트를 포맷팅합니다.
	 * 실제로는 Eclipse의 기본 포맷터를 사용하는 것이 좋습니다.
	 */
	private String formatText(String text) {
		// 간단한 예제: 줄바꿈 정리
		return text.replaceAll("\\s+", " ").trim();
	}
}
