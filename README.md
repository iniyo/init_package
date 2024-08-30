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
- change_app_package_name

#### 패키지 추가하는 방법

flutter pub add 패키지이름

### 패키지 이름 변경 방법

- 프로젝트 이름 변경
  flutter pub run change_app_package_name:main com.new.package.name

### 프로젝트 사용 시 주의할 점

#### 환경변수 세팅 시

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
- Ios
- Web

