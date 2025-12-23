package com.yawooch.plugin.actions;

import org.eclipse.jface.action.IAction;
import org.eclipse.jface.viewers.ISelection;
import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.ui.IObjectActionDelegate;
import org.eclipse.ui.IWorkbenchPart;
import org.eclipse.ui.PlatformUI;

/**
 * 컨텍스트 메뉴용 Hello World 액션
 * 
 * 에디터나 프로젝트 탐색기에서 우클릭했을 때 나타나는 메뉴 항목입니다.
 */
public class HelloWorldAction implements IObjectActionDelegate {

	private IWorkbenchPart part;

	@Override
	public void run(IAction action) {
		MessageDialog.openInformation(
			PlatformUI.getWorkbench().getActiveWorkbenchWindow().getShell(),
			"Yawooch Plugin - 컨텍스트 메뉴",
			"우클릭 메뉴에서 실행되었습니다!\n\n" +
			"선택된 리소스에 대한 작업을 수행할 수 있습니다."
		);
	}

	@Override
	public void selectionChanged(IAction action, ISelection selection) {
		// 선택이 변경될 때 호출됩니다.
		// 여기서 선택된 항목에 따라 액션을 활성화/비활성화할 수 있습니다.
	}

	@Override
	public void setActivePart(IAction action, IWorkbenchPart targetPart) {
		this.part = targetPart;
	}
}
