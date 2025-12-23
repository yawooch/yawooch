# Yawooch Eclipse Plugin

이클립스에서 사용할 수 있는 커스텀 플러그인입니다. 이 플러그인은 4가지 주요 기능을 제공합니다.

## 📋 목차

1. [프로젝트 구조 설명](#프로젝트-구조-설명)
2. [MANIFEST.MF 파일 설명](#manifestmf-파일-설명)
3. [plugin.xml 파일 설명](#pluginxml-파일-설명)
4. [기능 설명](#기능-설명)
5. [빌드 및 배포](#빌드-및-배포)

---

## 프로젝트 구조 설명

```
YawoochPlugin/
├── META-INF/
│   └── MANIFEST.MF          # 플러그인 메타데이터 (의존성, 버전 등)
├── src/
│   └── com/yawooch/plugin/
│       ├── Activator.java   # 플러그인 시작/종료 클래스
│       ├── contentassist/   # Content Assist 기능
│       │   └── YawoochContentAssistProcessor.java
│       ├── handlers/        # 커맨드 핸들러 (메뉴/단축키 실행)
│       │   ├── HelloWorldHandler.java
│       │   ├── FormatCodeHandler.java
│       │   └── GenerateGetterSetterHandler.java
│       └── actions/         # 컨텍스트 메뉴 액션
│           ├── HelloWorldAction.java
│           ├── FormatCodeAction.java
│           └── GenerateGetterSetterAction.java
├── plugin.xml               # 플러그인 확장점 정의
├── build.properties         # 빌드 설정
└── .project                 # 이클립스 프로젝트 설정
```

---

## MANIFEST.MF 파일 설명

`MANIFEST.MF`는 플러그인의 **메타데이터**를 정의하는 파일입니다. OSGi 번들(플러그인)의 핵심 정보를 담고 있습니다.

### 주요 항목 설명:

```properties
Bundle-Name: Yawooch Plugin
```
- 플러그인의 이름입니다.

```properties
Bundle-SymbolicName: com.yawooch.plugin
```
- 플러그인의 고유 ID입니다. 다른 플러그인과 구분하는 식별자입니다.

```properties
Bundle-Version: 1.0.0.qualifier
```
- 플러그인 버전입니다.

```properties
Bundle-Activator: com.yawooch.plugin.Activator
```
- 플러그인이 시작/종료될 때 실행되는 클래스입니다.

```properties
Require-Bundle: org.eclipse.ui, org.eclipse.core.runtime, ...
```
- 이 플러그인이 **의존하는** 다른 플러그인들입니다.
- 예: `org.eclipse.ui`는 UI 기능을 위해 필요합니다.

```properties
Bundle-RequiredExecutionEnvironment: JavaSE-11
```
- 필요한 Java 버전입니다.

### 왜 필요한가요?

- 이클립스는 **OSGi** 프레임워크를 사용합니다.
- 각 플러그인은 **번들(Bundle)**로 관리됩니다.
- `MANIFEST.MF`는 이클립스에게 "이 플러그인이 무엇이고, 무엇이 필요한지" 알려줍니다.

---

## plugin.xml 파일 설명

`plugin.xml`은 플러그인의 **확장점(Extension Points)**을 정의하는 파일입니다. 
이클립스의 다양한 기능에 플러그인을 연결하는 역할을 합니다.

### 확장점(Extension Points)이란?

이클립스는 특정 위치에서 플러그인이 기능을 추가할 수 있도록 **확장점**을 제공합니다.
예를 들어:
- `org.eclipse.ui.menus`: 메뉴에 항목 추가
- `org.eclipse.ui.commands`: 커맨드 정의
- `org.eclipse.ui.bindings`: 단축키 바인딩
- `org.eclipse.ui.popupMenus`: 컨텍스트 메뉴 추가

### 주요 확장점 설명:

#### 1. Content Assist (Ctrl+Space)
```xml
<extension point="org.eclipse.jdt.ui.javaCompletionProposalComputer">
```
- Java 에디터에서 Ctrl+Space를 누를 때 나타나는 자동완성 제안을 추가합니다.

#### 2. 메뉴 추가
```xml
<extension point="org.eclipse.ui.menus">
```
- 이클립스 메인 메뉴와 툴바에 항목을 추가합니다.

#### 3. 커맨드 정의
```xml
<extension point="org.eclipse.ui.commands">
```
- 실행 가능한 커맨드를 정의합니다.

#### 4. 단축키 바인딩
```xml
<extension point="org.eclipse.ui.bindings">
```
- 커맨드에 단축키를 연결합니다.
- 예: `CTRL+SHIFT+Y` → Hello World 커맨드

#### 5. 핸들러 연결
```xml
<extension point="org.eclipse.ui.handlers">
```
- 커맨드가 실행될 때 호출되는 Java 클래스를 지정합니다.

#### 6. 컨텍스트 메뉴
```xml
<extension point="org.eclipse.ui.popupMenus">
```
- 우클릭 메뉴에 항목을 추가합니다.

---

## 기능 설명

### 1. Content Assist (Ctrl+Space) 기능

**사용법:**
1. Java 에디터를 엽니다.
2. 코드를 입력하다가 `yawooch`를 입력하고 **Ctrl+Space**를 누릅니다.
3. 다음과 같은 제안이 나타납니다:
   - `yawooch.log`: 로그 출력 코드 삽입
   - `yawooch.comment`: JavaDoc 주석 템플릿
   - `yawooch.method`: 메서드 템플릿
   - `yawooch.trycatch`: try-catch 블록
   - `yawooch.time`: 현재 시간 출력

**구현 위치:**
- `YawoochContentAssistProcessor.java`
- `plugin.xml`의 `org.eclipse.jdt.ui.javaCompletionProposalComputer` 확장점

---

### 2. 이클립스 메뉴에 프로그램 추가

**사용법:**
1. 이클립스 메뉴바에서 **Yawooch Tools** 메뉴를 찾습니다.
2. 다음 항목들이 있습니다:
   - Hello World
   - Format Selected Code
   - Generate Getter/Setter

**구현 위치:**
- `plugin.xml`의 `org.eclipse.ui.menus` 확장점
- 각 커맨드의 핸들러 클래스

---

### 3. 단축키 등록

**사용법:**
- **Ctrl+Shift+Y**: Hello World 실행
- **Ctrl+Shift+F**: 코드 포맷팅
- **Ctrl+Shift+G**: Getter/Setter 생성

**구현 위치:**
- `plugin.xml`의 `org.eclipse.ui.bindings` 확장점

**단축키 변경 방법:**
1. 이클립스 메뉴: `Window > Preferences > General > Keys`
2. 검색창에 "Yawooch" 또는 커맨드 이름 입력
3. 원하는 단축키로 변경

---

### 4. 에디터 우클릭 컨텍스트 메뉴

**사용법:**
1. Java 에디터에서 코드를 선택합니다.
2. **마우스 우클릭**을 합니다.
3. 메뉴에서 다음 항목들이 보입니다:
   - **Yawooch: Hello World**
   - **Yawooch: Format Code**
   - **Yawooch: Generate Getter/Setter**

**구현 위치:**
- `plugin.xml`의 `org.eclipse.ui.popupMenus` 확장점
- 각 액션 클래스 (`actions/` 폴더)

---

## 빌드 및 배포

### 1. 이클립스에서 빌드하기

1. 프로젝트를 이클립스에 임포트합니다.
2. 프로젝트를 우클릭하고 **Export**를 선택합니다.
3. **Plug-in Development > Deployable plug-ins and fragments**를 선택합니다.
4. 다음을 선택합니다:
   - Export destination: **Directory**
   - Directory: 원하는 경로 (예: `C:\eclipse-plugins\`)
5. **Finish**를 클릭합니다.

### 2. 플러그인 설치하기

#### 방법 1: Dropins 폴더 사용 (가장 간단)

1. 이클립스 설치 폴더에 `dropins` 폴더를 만듭니다 (없는 경우).
2. 빌드된 플러그인 폴더를 `dropins` 폴더에 복사합니다.
   ```
   eclipse/
   └── dropins/
       └── YawoochPlugin/
           ├── META-INF/
           ├── plugin.xml
           └── ...
   ```
3. 이클립스를 재시작합니다.

#### 방법 2: 플러그인 디렉토리에 직접 설치

1. 이클립스 설치 폴더의 `plugins` 폴더를 찾습니다.
2. 빌드된 플러그인을 복사합니다.
3. 이클립스를 재시작합니다.

### 3. 플러그인 확인하기

1. 이클립스를 재시작합니다.
2. 메뉴에서 **Yawooch Tools** 메뉴가 보이는지 확인합니다.
3. Java 에디터에서 Ctrl+Space를 눌러 제안이 나타나는지 확인합니다.
4. 에디터에서 우클릭하여 컨텍스트 메뉴를 확인합니다.

---

## 개발 팁

### 새로운 기능 추가하기

1. **새 커맨드 추가:**
   - `plugin.xml`에 커맨드 정의 추가
   - 핸들러 클래스 생성 (`handlers/` 폴더)
   - 메뉴 또는 컨텍스트 메뉴에 연결

2. **새 Content Assist 제안 추가:**
   - `YawoochContentAssistProcessor.java`의 `computeCompletionProposals` 메서드 수정

3. **새 단축키 추가:**
   - `plugin.xml`의 `org.eclipse.ui.bindings` 확장점에 추가

### 디버깅하기

1. **플러그인을 디버그 모드로 실행:**
   - 프로젝트 우클릭 → **Debug As > Eclipse Application**
   - 새로운 이클립스 인스턴스가 실행됩니다.

2. **로그 확인:**
   - `Activator.java`의 `start()` 메서드에서 `System.out.println` 사용
   - 또는 `org.eclipse.core.runtime.Platform.getLog()` 사용

---

## 문제 해결

### 플러그인이 로드되지 않는 경우

1. **의존성 확인:**
   - `MANIFEST.MF`의 `Require-Bundle`이 올바른지 확인
   - 이클립스 버전과 호환되는지 확인

2. **빌드 오류 확인:**
   - 프로젝트 우클릭 → **Properties > Java Build Path** 확인
   - 필요한 라이브러리가 포함되어 있는지 확인

3. **플러그인 캐시 삭제:**
   - 이클립스 설치 폴더의 `.metadata` 폴더 삭제 (주의: 워크스페이스 설정이 초기화됩니다)

---

## 참고 자료

- [Eclipse Plugin Development](https://www.eclipse.org/pde/)
- [OSGi Specification](https://www.osgi.org/)
- [Eclipse Extension Points](https://www.eclipse.org/articles/Article-Plug-in-architecture/plugin_architecture_article.html)

---

## 라이선스

이 프로젝트는 예제 목적으로 제공됩니다.
