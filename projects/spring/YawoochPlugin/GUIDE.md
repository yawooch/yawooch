# Yawooch Plugin - 초보자를 위한 가이드

이 문서는 이클립스 플러그인 개발을 처음 접하는 분들을 위한 상세한 설명입니다.

---

## 🎯 이 플러그인이 하는 일

이 플러그인은 이클립스에 **4가지 기능**을 추가합니다:

1. **Ctrl+Space 자동완성**: 코드 입력 시 자동완성 제안 제공
2. **메뉴 추가**: 이클립스 메뉴바에 "Yawooch Tools" 메뉴 추가
3. **단축키**: 빠른 실행을 위한 키보드 단축키 제공
4. **우클릭 메뉴**: 에디터에서 우클릭 시 나타나는 컨텍스트 메뉴 추가

---

## 📁 파일 구조와 역할

### 1. META-INF/MANIFEST.MF

**이 파일은 무엇인가요?**
- 플러그인의 **신분증** 같은 파일입니다.
- 이클립스에게 "이 플러그인은 누구이고, 무엇이 필요한가?"를 알려줍니다.

**주요 내용:**
```properties
Bundle-Name: Yawooch Plugin          # 플러그인 이름
Bundle-SymbolicName: com.yawooch.plugin  # 고유 ID
Bundle-Version: 1.0.0                 # 버전
Bundle-Activator: ...Activator        # 시작 클래스
Require-Bundle: org.eclipse.ui, ...   # 필요한 다른 플러그인들
```

**왜 필요한가요?**
- 이클립스는 **OSGi**라는 시스템을 사용합니다.
- 각 플러그인은 독립적인 **번들(Bundle)**입니다.
- `MANIFEST.MF`는 번들의 정보를 담고 있습니다.

**비유:**
- 자동차의 **등록증**과 같습니다.
- 차량 정보, 소유자 정보, 필요한 연료 종류 등을 기록합니다.

---

### 2. plugin.xml

**이 파일은 무엇인가요?**
- 플러그인의 **기능 정의서**입니다.
- "어디에 무엇을 추가할 것인가?"를 정의합니다.

**주요 내용:**
```xml
<extension point="org.eclipse.ui.menus">
  <!-- 메뉴에 항목 추가 -->
</extension>

<extension point="org.eclipse.ui.commands">
  <!-- 실행 가능한 커맨드 정의 -->
</extension>

<extension point="org.eclipse.ui.bindings">
  <!-- 단축키 연결 -->
</extension>
```

**확장점(Extension Point)이란?**
- 이클립스는 특정 위치에서 플러그인이 기능을 추가할 수 있도록 **구멍(확장점)**을 만들어 놓았습니다.
- 플러그인은 이 구멍에 **플러그(확장)**를 꽂아서 기능을 추가합니다.

**비유:**
- 벽에 **콘센트**가 있습니다 (확장점).
- 플러그인은 **플러그**를 꽂아서 전기를 사용합니다 (기능 추가).

**주요 확장점:**
- `org.eclipse.ui.menus`: 메뉴 추가
- `org.eclipse.ui.commands`: 커맨드 정의
- `org.eclipse.ui.bindings`: 단축키 바인딩
- `org.eclipse.ui.popupMenus`: 우클릭 메뉴
- `org.eclipse.jdt.ui.javaCompletionProposalComputer`: 자동완성

---

### 3. Java 소스 코드

#### Activator.java
**역할:** 플러그인의 **시작/종료**를 관리합니다.

```java
public void start(BundleContext context) {
    // 플러그인이 시작될 때 실행
    System.out.println("플러그인 시작!");
}

public void stop(BundleContext context) {
    // 플러그인이 종료될 때 실행
    System.out.println("플러그인 종료!");
}
```

**비유:** 앱의 **onCreate()**와 **onDestroy()**와 같습니다.

---

#### Handlers (핸들러)
**역할:** 커맨드가 실행될 때 **실제로 동작하는 코드**입니다.

**예시:**
- `HelloWorldHandler`: "Hello World" 메시지를 보여줍니다.
- `FormatCodeHandler`: 코드를 포맷팅합니다.
- `GenerateGetterSetterHandler`: Getter/Setter를 생성합니다.

**동작 흐름:**
1. 사용자가 메뉴를 클릭하거나 단축키를 누릅니다.
2. 이클립스가 `plugin.xml`을 보고 어떤 핸들러를 실행할지 찾습니다.
3. 해당 핸들러의 `execute()` 메서드가 호출됩니다.

**비유:** 
- 메뉴 클릭 = 버튼 누르기
- 핸들러 = 버튼을 눌렀을 때 실행되는 함수

---

#### Actions (액션)
**역할:** 컨텍스트 메뉴(우클릭 메뉴)에서 실행되는 코드입니다.

**Handlers vs Actions:**
- **Handlers**: 메뉴바, 단축키에서 사용 (최신 방식)
- **Actions**: 우클릭 메뉴에서 사용 (레거시 방식, 하지만 여전히 유용)

---

#### Content Assist Processor
**역할:** Ctrl+Space를 눌렀을 때 나타나는 **자동완성 제안**을 만듭니다.

**동작 방식:**
1. 사용자가 코드를 입력합니다.
2. Ctrl+Space를 누릅니다.
3. `computeCompletionProposals()` 메서드가 호출됩니다.
4. 제안 목록을 반환합니다.
5. 이클립스가 목록을 보여줍니다.

**예시:**
```java
// 사용자가 "yawooch" 입력 후 Ctrl+Space
→ "yawooch.log" 제안
→ 선택 시: System.out.println("Yawooch: " + ); 삽입
```

---

## 🔄 동작 흐름

### 시나리오 1: 메뉴에서 "Hello World" 클릭

```
1. 사용자: 메뉴바 > Yawooch Tools > Hello World 클릭
   ↓
2. 이클립스: plugin.xml을 확인
   - "com.yawooch.plugin.commands.helloWorld" 커맨드 찾음
   - 핸들러: HelloWorldHandler 지정됨
   ↓
3. HelloWorldHandler.execute() 실행
   ↓
4. 메시지 다이얼로그 표시
```

### 시나리오 2: Ctrl+Shift+Y 단축키 누르기

```
1. 사용자: Ctrl+Shift+Y 누름
   ↓
2. 이클립스: plugin.xml의 bindings 확인
   - "CTRL+SHIFT+Y" → "helloWorld" 커맨드 연결됨
   ↓
3. HelloWorldHandler.execute() 실행
   ↓
4. 메시지 다이얼로그 표시
```

### 시나리오 3: Ctrl+Space 자동완성

```
1. 사용자: Java 에디터에서 "yawooch" 입력 후 Ctrl+Space
   ↓
2. 이클립스: 모든 Content Assist Processor 호출
   - YawoochContentAssistProcessor.computeCompletionProposals() 실행
   ↓
3. 제안 목록 반환
   - yawooch.log
   - yawooch.comment
   - yawooch.method
   - ...
   ↓
4. 이클립스: 제안 목록을 팝업으로 표시
   ↓
5. 사용자: 제안 선택
   ↓
6. 선택된 코드가 에디터에 삽입됨
```

### 시나리오 4: 우클릭 메뉴

```
1. 사용자: 에디터에서 우클릭
   ↓
2. 이클립스: plugin.xml의 popupMenus 확인
   - ICompilationUnit (Java 파일)에 대한 액션 찾음
   ↓
3. 컨텍스트 메뉴에 "Yawooch: Hello World" 등 표시
   ↓
4. 사용자: 메뉴 항목 클릭
   ↓
5. HelloWorldAction.run() 실행
```

---

## 🛠️ 새로운 기능 추가하기

### 예제: "현재 날짜 출력" 기능 추가

#### 1단계: 커맨드 정의 (plugin.xml)

```xml
<extension point="org.eclipse.ui.commands">
  <command
        id="com.yawooch.plugin.commands.printDate"
        name="Print Current Date"
        description="현재 날짜를 출력합니다">
  </command>
</extension>
```

#### 2단계: 핸들러 생성

```java
// PrintDateHandler.java
public class PrintDateHandler extends AbstractHandler {
    @Override
    public Object execute(ExecutionEvent event) {
        String date = new java.util.Date().toString();
        MessageDialog.openInformation(
            HandlerUtil.getActiveShell(event),
            "현재 날짜",
            "오늘 날짜: " + date
        );
        return null;
    }
}
```

#### 3단계: 핸들러 연결 (plugin.xml)

```xml
<extension point="org.eclipse.ui.handlers">
  <handler
        class="com.yawooch.plugin.handlers.PrintDateHandler"
        commandId="com.yawooch.plugin.commands.printDate">
  </handler>
</extension>
```

#### 4단계: 메뉴에 추가 (plugin.xml)

```xml
<extension point="org.eclipse.ui.menus">
  <menuContribution locationURI="menu:org.eclipse.ui.main.menu?after=additions">
    <menu id="com.yawooch.plugin.menu" label="Yawooch Tools">
      <!-- 기존 항목들... -->
      <command
            commandId="com.yawooch.plugin.commands.printDate"
            label="Print Current Date">
      </command>
    </menu>
  </menuContribution>
</extension>
```

#### 5단계: 단축키 추가 (선택사항)

```xml
<extension point="org.eclipse.ui.bindings">
  <key
        commandId="com.yawooch.plugin.commands.printDate"
        sequence="CTRL+SHIFT+D"
        contextId="org.eclipse.ui.contexts.window">
  </key>
</extension>
```

---

## 🐛 문제 해결

### 문제 1: 플러그인이 보이지 않아요

**해결 방법:**
1. 이클립스를 재시작합니다.
2. `Help > About Eclipse > Installation Details > Plug-ins`에서 플러그인이 있는지 확인합니다.
3. `dropins` 폴더에 올바르게 복사되었는지 확인합니다.

### 문제 2: 컴파일 오류가 발생해요

**해결 방법:**
1. 프로젝트 우클릭 → `Properties > Java Build Path`
2. 필요한 라이브러리가 포함되어 있는지 확인합니다.
3. `MANIFEST.MF`의 `Require-Bundle`이 올바른지 확인합니다.

### 문제 3: 단축키가 작동하지 않아요

**해결 방법:**
1. `Window > Preferences > General > Keys`
2. 커맨드 이름으로 검색합니다.
3. 단축키가 다른 커맨드와 충돌하는지 확인합니다.
4. 필요시 단축키를 변경합니다.

### 문제 4: Content Assist가 나타나지 않아요

**해결 방법:**
1. Java 에디터에서 테스트하는지 확인합니다.
2. `plugin.xml`의 `proposalComputer` 설정이 올바른지 확인합니다.
3. `activate="true"`로 설정되어 있는지 확인합니다.

---

## 📚 학습 자료

### 이클립스 플러그인 개발 기본 개념

1. **OSGi**: 플러그인 시스템의 기반
   - 각 플러그인은 독립적인 번들
   - 의존성 관리 자동화

2. **Extension Points**: 기능 추가 지점
   - 이클립스가 제공하는 "구멍"
   - 플러그인이 "플러그"를 꽂는 곳

3. **Commands & Handlers**: 실행 메커니즘
   - Command: "무엇을 할 것인가" (정의)
   - Handler: "어떻게 할 것인가" (구현)

### 추천 학습 순서

1. ✅ 이 예제 프로젝트 이해하기
2. ✅ 간단한 기능 하나 추가해보기
3. ✅ 이클립스 공식 문서 읽기
4. ✅ 다른 오픈소스 플러그인 코드 분석하기

---

## 💡 팁

### 디버깅 팁

1. **콘솔 출력 사용:**
   ```java
   System.out.println("디버그 메시지");
   ```

2. **디버그 모드로 실행:**
   - 프로젝트 우클릭 → `Debug As > Eclipse Application`
   - 새로운 이클립스 인스턴스가 실행됩니다.

3. **로그 사용:**
   ```java
   Platform.getLog(getDefault().getBundle())
       .log(new Status(IStatus.INFO, PLUGIN_ID, "메시지"));
   ```

### 성능 팁

1. **Lazy Loading**: 플러그인은 필요할 때만 로드되도록 설계합니다.
2. **캐싱**: 자주 사용하는 데이터는 캐시합니다.
3. **비동기 처리**: 긴 작업은 백그라운드 스레드에서 실행합니다.

---

## 🎓 다음 단계

이 예제를 이해했다면:

1. **더 복잡한 기능 추가**
   - 파일 읽기/쓰기
   - 외부 API 호출
   - 데이터베이스 연결

2. **UI 개선**
   - 커스텀 다이얼로그
   - Preference 페이지
   - View 추가

3. **다른 확장점 탐색**
   - `org.eclipse.ui.views`: 새로운 View 추가
   - `org.eclipse.ui.editors`: 커스텀 에디터
   - `org.eclipse.ui.perspectives`: 새로운 Perspective

---

## ❓ 질문과 답변

**Q: 플러그인을 배포하려면 어떻게 하나요?**
A: `Export > Deployable plug-ins and fragments`를 사용하여 빌드한 후, `dropins` 폴더에 복사합니다.

**Q: 다른 사람과 공유하려면?**
A: 빌드된 플러그인 폴더를 압축하여 공유하거나, 업데이트 사이트를 만들어 배포할 수 있습니다.

**Q: 플러그인을 업데이트하려면?**
A: 버전을 올리고 (`MANIFEST.MF`의 `Bundle-Version`), 다시 빌드하여 배포합니다.

---

**행운을 빕니다! 🚀**
