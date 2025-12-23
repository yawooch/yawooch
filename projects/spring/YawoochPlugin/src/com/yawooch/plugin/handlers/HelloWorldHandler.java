package com.yawooch.plugin.handlers;

import org.eclipse.core.commands.AbstractHandler;
import org.eclipse.core.commands.ExecutionEvent;
import org.eclipse.core.commands.ExecutionException;
import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.handlers.HandlerUtil;

/**
 * Hello World 커맨드 핸들러
 * 
 * 이 핸들러는:
 * 1. 메뉴에서 "Yawooch Tools > Hello World"를 클릭했을 때
 * 2. 단축키 Ctrl+Shift+Y를 눌렀을 때
 * 3. 컨텍스트 메뉴에서 "Yawooch: Hello World"를 클릭했을 때
 * 실행됩니다.
 */
public class HelloWorldHandler extends AbstractHandler {

	@Override
	public Object execute(ExecutionEvent event) throws ExecutionException {
		IWorkbenchWindow window = HandlerUtil.getActiveWorkbenchWindowChecked(event);
		
		MessageDialog.openInformation(
			window.getShell(),
			"Yawooch Plugin",
			"안녕하세요! Yawooch Plugin입니다.\n\n" +
			"이 메시지는 다음 방법으로 실행할 수 있습니다:\n" +
			"1. 메뉴: Yawooch Tools > Hello World\n" +
			"2. 단축키: Ctrl+Shift+Y\n" +
			"3. 우클릭 메뉴: Yawooch: Hello World"
		);
		
		return null;
	}
}
