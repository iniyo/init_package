# init-app

초기 세팅 프로젝트입니다.

## Guide

### 기본 설정 패키지

- flutter_riverpod
- dio
- permission_handler
- hive
- url_launcher
- change_app_package_name
- flutter_dotenv
- lakos
- envied
- build_runner - 실행 시 dart pub add dev:build_runner
- rename

### pub.dev 패키지 추가하는 방법

flutter pub add [패키지이름]

### 패키지 이름 변경 방법

terminal에 입력

- 패키지 이름 변경 (target os 변경 가능) Usage: rename <command> [arguments]
  rename setAppName --targets ios,android,macos,windows,linux --value "YourAppName"
  가져올때: rename getAppName --targets ios,android,macos,windows,linux

+ android에서 bundle name 설정
  rename setBundleId --targets android --value "com.changed.bundleId"
  가져올때: rename getBundleId --targets android

### 프로젝트 이름 변경 방법

1. 패키지 이름 변경
2. pubspec.yaml에 정의되어 있는 이름을 변경
3. windows기준, ctrl+shift+R 로 현재 프로젝트명을 입력후 바꿀 프로젝트명으로 변경
   ex) init_package(curren project name) -> test_name(replace project name)
4. 프로젝트 directory 이름 변경 (refactor -> rename)
5. android 종료 후 해당 디렉토리 이름 변경
- 변경 시 사용중이라고 뜨는 경우: 작업관리자 -> jdk manager 종료
6. 추가적으로 android 디렉토리 이름 변경 작업 진행

## 프로젝트 사용 시 주의할 점

### 환경변수 세팅 시

- Api key등의 환경변수는 최상위 env에 저장 후 lib/config/Env 에 가져올 변수이름 설정 후 가져오기
- 만약에 혹시라도 git에 env파일 저장이 필요할 시 .gitigonre의 맨 밑의 .env 삭제 필요하다면 .env.g.dart도

- 환경변수파일 수정하는 경우(.env) - **중요**
  dart run build_runner clean
  dart run build_runner build --delete-conflicting-outputs

### 프로젝트 ReBuild 방법

순서대로 입력:

flutter clean
flutter pub get
dart run build_runner build - envied를 위해 필요

### 의존성 그래프 보기

terminal에 입력:

- 내장 프린터로 출력: flutter pub deps

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

### 지원 Platform

- Android
- IOS
- Web
- Windows
- mac
- linux


### Issue
lib와 Kotlin의 version차이로 Build시 version error
