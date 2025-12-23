package com.yawooch.plugin.actions;

import org.eclipse.jface.action.IAction;
import org.eclipse.jface.text.IDocument;
import org.eclipse.jface.text.ITextSelection;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.ui.IEditorPart;
import org.eclipse.ui.IObjectActionDelegate;
import org.eclipse.ui.IWorkbenchPart;
import org.eclipse.ui.texteditor.ITextEditor;

/**
 * 컨텍스트 메뉴용 코드 포맷팅 액션
 */
public class FormatCodeAction implements IObjectActionDelegate {

	private IWorkbenchPart part;

	@Override
	public void run(IAction action) {
		if (part instanceof IEditorPart) {
			IEditorPart editor = (IEditorPart) part;
			
			if (editor instanceof ITextEditor) {
				ITextEditor textEditor = (ITextEditor) editor;
				ISelection selection = textEditor.getSelectionProvider().getSelection();
				
				if (selection instanceof ITextSelection) {
					ITextSelection textSelection = (ITextSelection) selection;
					IDocument document = textEditor.getDocumentProvider()
						.getDocument(textEditor.getEditorInput());
					
					String selectedText = textSelection.getText();
					
					if (selectedText != null && !selectedText.trim().isEmpty()) {
						// 선택된 텍스트 포맷팅
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
					}
				}
			}
		}
	}

	@Override
	public void selectionChanged(IAction action, ISelection selection) {
		// 선택 변경 시 호출
	}

	@Override
	public void setActivePart(IAction action, IWorkbenchPart targetPart) {
		this.part = targetPart;
	}
	
	private String formatText(String text) {
		return text.replaceAll("\\s+", " ").trim();
	}
}
