package com.yawooch.plugin.actions;

import org.eclipse.jface.action.IAction;
import org.eclipse.jface.dialogs.InputDialog;
import org.eclipse.jface.text.IDocument;
import org.eclipse.jface.text.ITextSelection;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.ui.IEditorPart;
import org.eclipse.ui.IObjectActionDelegate;
import org.eclipse.ui.IWorkbenchPart;
import org.eclipse.ui.texteditor.ITextEditor;

/**
 * 컨텍스트 메뉴용 Getter/Setter 생성 액션
 */
public class GenerateGetterSetterAction implements IObjectActionDelegate {

	private IWorkbenchPart part;

	@Override
	public void run(IAction action) {
		if (part instanceof IEditorPart) {
			IEditorPart editor = (IEditorPart) part;
			
			if (editor instanceof ITextEditor) {
				ITextEditor textEditor = (ITextEditor) editor;
				
				InputDialog dialog = new InputDialog(
					part.getSite().getShell(),
					"Getter/Setter 생성",
					"필드 이름을 입력하세요:",
					"",
					null
				);
				
				if (dialog.open() == InputDialog.OK) {
					String fieldName = dialog.getValue().trim();
					
					if (!fieldName.isEmpty()) {
						String code = generateGetterSetter(fieldName);
						
						ISelection selection = textEditor.getSelectionProvider().getSelection();
						if (selection instanceof ITextSelection) {
							ITextSelection textSelection = (ITextSelection) selection;
							IDocument document = textEditor.getDocumentProvider()
								.getDocument(textEditor.getEditorInput());
							
							try {
								int offset = textSelection.getOffset();
								document.replace(offset, 0, code);
							} catch (Exception e) {
								e.printStackTrace();
							}
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
	
	private String generateGetterSetter(String fieldName) {
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
