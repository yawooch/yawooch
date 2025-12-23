package com.yawooch.plugin.contentassist;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.jface.text.contentassist.CompletionProposal;
import org.eclipse.jface.text.contentassist.ICompletionProposal;
import org.eclipse.jdt.ui.text.java.IJavaCompletionProposalComputer;
import org.eclipse.jdt.ui.text.java.JavaContentAssistInvocationContext;

/**
 * Content Assist Processor
 * Ctrl+Space를 누르면 나타나는 자동완성 제안을 제공합니다.
 * 
 * 사용법:
 * 1. Java 에디터에서 "yawooch"를 입력하고 Ctrl+Space를 누르면
 *    커스텀 제안들이 나타납니다.
 * 2. 각 제안을 선택하면 해당 코드가 삽입됩니다.
 */
public class YawoochContentAssistProcessor implements IJavaCompletionProposalComputer {

	@Override
	public List<ICompletionProposal> computeCompletionProposals(
			JavaContentAssistInvocationContext context, 
			org.eclipse.core.runtime.IProgressMonitor monitor) {
		
		List<ICompletionProposal> proposals = new ArrayList<>();
		
		// 현재 입력된 텍스트 가져오기
		String prefix = context.getInvocationOffset() > 0 
			? context.getDocument().get().substring(
				Math.max(0, context.getInvocationOffset() - 20), 
				context.getInvocationOffset())
			: "";
		
		// "yawooch"로 시작하는 경우 제안 추가
		if (prefix.toLowerCase().contains("yawooch") || prefix.isEmpty()) {
			
			// 1. 로그 출력 코드 제안
			proposals.add(createProposal(
				context,
				"yawooch.log",
				"System.out.println(\"Yawooch: \" + ${cursor});",
				"Yawooch 로그 출력",
				"System.out.println을 사용한 로그 출력 코드를 삽입합니다."
			));
			
			// 2. 주석 템플릿 제안
			proposals.add(createProposal(
				context,
				"yawooch.comment",
				"/**\n * Yawooch: ${cursor}\n */",
				"Yawooch 주석 템플릿",
				"JavaDoc 주석 템플릿을 삽입합니다."
			));
			
			// 3. 메서드 템플릿 제안
			proposals.add(createProposal(
				context,
				"yawooch.method",
				"public void yawoochMethod() {\n\t${cursor}\n}",
				"Yawooch 메서드 템플릿",
				"기본 메서드 템플릿을 삽입합니다."
			));
			
			// 4. try-catch 블록 제안
			proposals.add(createProposal(
				context,
				"yawooch.trycatch",
				"try {\n\t${cursor}\n} catch (Exception e) {\n\te.printStackTrace();\n}",
				"Yawooch try-catch 블록",
				"try-catch 블록 템플릿을 삽입합니다."
			));
			
			// 5. 현재 시간 출력 제안
			proposals.add(createProposal(
				context,
				"yawooch.time",
				"System.out.println(\"Current Time: \" + new java.util.Date());",
				"Yawooch 현재 시간 출력",
				"현재 시간을 출력하는 코드를 삽입합니다."
			));
		}
		
		return proposals;
	}

	/**
	 * 제안(Proposal) 객체를 생성합니다.
	 */
	private ICompletionProposal createProposal(
			JavaContentAssistInvocationContext context,
			String replacementString,
			String displayString,
			String additionalProposalInfo) {
		
		int offset = context.getInvocationOffset();
		int length = 0; // 대체할 텍스트 길이 (0이면 삽입만 함)
		
		// ${cursor}를 실제 커서 위치로 대체
		String finalReplacement = replacementString.replace("${cursor}", "");
		
		return new CompletionProposal(
			finalReplacement,      // 삽입할 텍스트
			offset,                // 삽입 위치
			length,                // 대체할 길이
			finalReplacement.length(), // 커서 위치
			null,                  // 아이콘 (null이면 기본 아이콘)
			displayString,         // 표시될 텍스트
			null,                  // 컨텍스트 정보
			additionalProposalInfo // 추가 정보
		);
	}

	@Override
	public List<org.eclipse.jdt.ui.text.java.CompletionProposal> computeCompletionProposals(
			org.eclipse.jdt.ui.text.java.ContentAssistInvocationContext context,
			org.eclipse.core.runtime.IProgressMonitor monitor) {
		// 이 메서드는 사용되지 않지만 인터페이스 구현을 위해 필요합니다.
		// 필요시 여기에도 구현을 추가할 수 있습니다.
		return new ArrayList<>();
	}

	@Override
	public List<org.eclipse.jdt.ui.text.java.CompletionProposal> computeContextInformation(
			org.eclipse.jdt.ui.text.java.ContentAssistInvocationContext context,
			org.eclipse.core.runtime.IProgressMonitor monitor) {
		// 컨텍스트 정보는 제공하지 않습니다.
		return new ArrayList<>();
	}

	@Override
	public String getErrorMessage() {
		return null;
	}

	@Override
	public void sessionStarted() {
		// 세션이 시작될 때 호출됩니다.
	}

	@Override
	public void sessionEnded() {
		// 세션이 종료될 때 호출됩니다.
	}
}
