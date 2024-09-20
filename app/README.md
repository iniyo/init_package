# init-app

초기 세팅 프로젝트입니다.

## Guide

### 주의!

- 최상위에 .env파일 및 lib/config에 env.g.dart가 생성되어 있지 않음
- 따라서 바로 실행이 안되므로 환경변수부터 설정 혹은 env파일을 삭제하고 실행

- **환경변수 설정**
1. 최상위(lib가 있는 계층 그 밑 아님)에 .env생성 후 value값 (KEY1=value)설정
2. 실행 terminal: dart run build_runner build

! 환경변수 설정이 안된다면
- dart run build_runner clean 이후
- dart run build_runner build --delete-conflicting-outputs 로 실행

### 기본 설정 패키지

- flutter_riverpod - 상태 값
- dio - 인터넷 
- permission_handler - 권한 
- hive - 로컬 데이터 저장
- url_launcher - url parser
- flutter_dotenv - .env 파일에서 환경 변수를 로드
- envied - 환경변수 암호화
- lakos - 의존성 그래프
- build_runner - 실행 시 dart pub add dev:build_runner
- rename - 패키지 이름 변경
- universal_io (dart.io는 web에서 구동 안 함. 대신 사용)
- path_provider (web에선 구동 안 함)
- file_picker (web 디렉토리 선택 시 - path_provider 대신)
- logman - 로그 관리 패키지

### pub.dev 패키지 추가하는 방법

flutter pub add [패키지이름]

### 패키지 이름 변경 방법

terminal에 입력

- 패키지 이름 변경 (target os 변경 가능) Usage: rename <command> [arguments]
  rename setAppName --targets ios,android,macos,windows,linux --value "YourAppName"
  가져올때: rename getAppName --targets ios,android,macos,windows,linux

- dart run change_app_package_name:main com.new.package.name

+ android에서 bundle name 설정
  rename setBundleId --targets android --value "com.changed.bundleId"
  가져올때: rename getBundleId --targets android

### 프로젝트 이름 변경 방법

1. 패키지 이름 변경
2. windows기준, ctrl+shift+R 로 현재 프로젝트명을 입력후 바꿀 프로젝트명으로 변경
   ex) round_note(curren project name) -> test_name(replace project name)
3. 프로젝트 directory 이름 변경 (refactor -> rename)
   4android 종료 후 해당 디렉토리 이름 변경
- 변경 시 사용중이라고 뜨는 경우: 작업관리자 -> jdk manager 종료
  *선택* 추가적으로 android 디렉토리 이름 변경 작업 진행 (app -> src -> main -> kolin or java -> example -> 설정한 패키지 이름 디렉토리 변경)

## 프로젝트 사용 

### 환경변수 세팅 시

- Api key등의 환경변수는 최상위 env에 저장 후 lib/config/Env 에 가져올 변수이름 설정 후 가져오기
- 만약에 혹시라도 git에 env파일 저장이 필요할 시 .gitigonre의 맨 밑의 .env 삭제 필요하다면 .env.g.dart도

- 환경변수파일 수정하는 경우(.env) - **중요**
  dart run build_runner clean
  dart run build_runner build --delete-conflicting-outputs

### 프로젝트 ReBuild 방법

순서대로 입력:

1. flutter clean
2. flutter pub get

! config의 환경변수 env.g.dart가 사라진다면 아래 실행
dart run build_runner build - envied를 위해 필요

### 의존성 그래프 보기

terminal에 입력:

- 내장 프린터로 출력: flutter pub devs

- lakos로 출력 하는 법:

1. dart run lakos lib -o dependency_graph.dot
2. os별 실행
- mac/linux os에서 실행:
  권한 설정: chmod +x build_graph.sh
  파일 실행: ./build_graph.sh
- windows에서 실행: ./build_graph.bat

- lakos 코드로 실행:

```
import 'dart:io';

void main() async {
  // .dot 파일을 Graphviz의 dot 명령어로 PNG 이미지로 변환하는 함수
  var result = await Process.run('dot', ['-Tpng', 'dependency_graph.dot', '-o', 'dependency_graph.png']);

  if (result.exitCode == 0) {
    print('Graph generated successfully: dependency_graph.png');
  } else {
    print('Error generating graph: ${result.stderr}');
  }
}
```

### Flutter 패키지 만드는 법

1. 패키지 생성
- Flutter 모든 플랫폼 관련 파일 생성: flutter create [폴더명 설정]
- dart 패키지 관련 파일만 생성: flutter create --template=package [폴더명 설정]
2. 패키지 경로 명시
- app 내의 pubspec.yaml에 있는 dependencies에 추가
```
dependencies:
  # 이 부분 추가
  [폴더명]:
    path: ../[폴더명]  # API 패키지의 경로를 명시 필요할 시 수정
```

### 지원 Platform

- Android
- IOS
- Web
- Windows
- mac
- linux

### 각 플랫폼 별 패키지 등록 시 수정할 파일 위치

- android: app/src/main/AndroidManifest.xml
- IOS: Runner/Info.plist
- macOS: Runner/Info.plist, Runner/DebugProfile.entitlements, Runner/Release.entitlements
+ Capabilities 설정: Audio input 활성화

### Issue

lib와 Kotlin의 version차이로 Build시 version error
