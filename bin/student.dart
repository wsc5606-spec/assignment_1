// dart:io 라이브러리
import 'dart:io';

/// Score 클래스
class Score {
  int score;

  // 생성자
  Score(this.score);

  // 점수 출력 메서드

  void showInfo() {
    print('점수: $score');
  }
}

/// StudentScore 클래스 (Score를 상속)
/// - showInfo()를 재정의

class StudentScore extends Score {
  String name;

  // StudentScore 이름과 점수를 받아서 초기화하고, Score의 생성자 호출
  StudentScore(this.name, int score) : super(score);

  // @override를 사용하여 부모 클래스의 showInfo()를 재정의합니다.
  @override
  void showInfo() {
    // 프린트 출력 전에 클래스 함수 이용해서 출력
    print('이름 : $name, 점수 : $score');
  }
}


/// students.txt 파일에서 데이터를 읽어와 List<StudentScore>를 반환
List<StudentScore> loadStudentData(String filePath) {
  try {
    final file = File(filePath);

    // 파일이 존재하지 않으면 예외
    if (!file.existsSync()) {
      throw FileSystemException('파일을 찾을 수 없습니다.', filePath);
    }

    // 파일을 라인 단위로
    final lines = file.readAsLinesSync();

    List<StudentScore> students = [];

    for (var line in lines) {
      // 빈 줄은 무시
      if (line.trim().isEmpty) continue;

      final parts = line.split(',');
      if (parts.length != 2) {
        throw FormatException('잘못된 데이터 형식: $line');
      }

      String name = parts[0].trim();
      int score = int.parse(parts[1].trim());
      students.add(StudentScore(name, score));
    }

    return students;
  } catch (e) {
    // 파일 읽기에 실패하면 메시지 출력 후 종료
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
}


/// 결과를 result.txt에 저장하는 함수
void saveResults(String filePath, String content) {
  try {
    final file = File(filePath);
    file.writeAsStringSync(content);
    // 저장 완료 메시지 (요구사항)
    print("저장이 완료되었습니다.");
  } catch (e) {
    print("저장에 실패했습니다: $e");
  }
}

/// main 함수: 프로그램 시작점

void main() {
  // 1) students.txt에서 학생 데이터를 로드합니다.
  final students = loadStudentData('students.txt');

  // late를 사용하여 나중할당 명시
  late StudentScore 조의준;
  late StudentScore 김의준;
  late StudentScore 박의준;
  late StudentScore 최의준;
  late StudentScore 우의준;
  late StudentScore 정의준;

  // 로드된 데이터가 있으면 순서대로 할당
  if (students.isNotEmpty) {
    조의준 = students.length > 0 ? students[0] : StudentScore('조의준(더미)', 0);
    김의준 = students.length > 1 ? students[1] : StudentScore('김의준(더미)', 0);
    박의준 = students.length > 2 ? students[2] : StudentScore('박의준(더미)', 0);
    최의준 = students.length > 3 ? students[3] : StudentScore('최의준(더미)', 0);
    우의준 = students.length > 4 ? students[4] : StudentScore('우의준(더미)', 0);
    정의준 = students.length > 5 ? students[5] : StudentScore('정의준(더미)', 0);
  } else {
    // 학생 데이터가 전혀 없으면 더미로 초기화
    조의준 = StudentScore('조의준(더미)', 0);
    김의준 = StudentScore('김의준(더미)', 0);
    박의준 = StudentScore('박의준(더미)', 0);
    최의준 = StudentScore('최의준(더미)', 0);
    우의준 = StudentScore('우의준(더미)', 0);
    정의준 = StudentScore('정의준(더미)', 0);
  }

  //어떤 학생
  while (true) {
    stdout.write('어떤 학생의 통계를 확인하시겠습니까? ');
    String? input = stdin.readLineSync();

    if (input == null) {
      // null 입력 방어
      print('잘못된 입력입니다. 다시 입력해주세요.');
      continue;
    }

    final nameInput = input.trim();

    // 입력된 이름과 동일한 학생들을 모두 찾습니다.
    final matches = students.where((s) => s.name == nameInput).toList();

    if (matches.isEmpty) {
      //재입력 유도
      print('잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.');
      continue; 
    } else {
      //  평균계산
      final sum = matches.fold<int>(0, (prev, s) => prev + s.score);

      // 평균을 소수로 계산 정수 출력
      final average = sum / matches.length;
      final averageRounded = average.round();

      // StudentScore 객체로 평균 결과
      final result = StudentScore(nameInput, averageRounded);
      result.showInfo(); 

     
      final fileContent = '이름: $nameInput, 점수: $averageRounded';
      saveResults('result.txt', fileContent);

      // 작업 완료 후 프로그램 종료
      break;
    }
  }
}
