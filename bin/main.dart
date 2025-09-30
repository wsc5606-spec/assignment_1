import 'dart:io';

/// Score 클래스
class Score {
  int score;
  Score(this.score);

  void showInfo() {
    print('점수 : $score');
  }
}

/// StudentScore 클래스 (Score 상속)
class StudentScore extends Score {
  String name;
  String subject;

  StudentScore(this.name, int score, {this.subject = '국어'}) : super(score);

  @override
  void showInfo() {
    print('이름 : $name, 점수 : $score');
  }

  String formatForSave() {
    return '이름 : $name, 점수 : $score';
  }
}

/// 학생 데이터 불러오기
List<StudentScore> loadStudentData(String filePath) {
  try {
    final file = File(filePath);
    final lines = file.readAsLinesSync();
    final students = <StudentScore>[];

    for (var rawLine in lines) {
      final line = rawLine.trim();
      if (line.isEmpty) continue;

      final parts = line.split(',');
      if (parts.length != 2) {
        throw FormatException('잘못된 데이터 형식: $line');
      }

      final name = parts[0].trim();
      final score = int.parse(parts[1].trim());

      students.add(StudentScore(name, score));
    }

    return students;
  } catch (e) {
    print('학생 데이터를 불러오는 데 실패했습니다: $e');
    exit(1);
  }
}

/// 결과 저장
void saveResults(String filePath, String content) {
  try {
    final file = File(filePath);
    file.writeAsStringSync(content);
    print('저장이 완료되었습니다.');
  } catch (e) {
    print('저장에 실패했습니다: $e');
  }
}

/// 메인 함수
void main() {
  const inputPath = 'students.txt';
  const outputPath = 'result.txt';

  final students = loadStudentData(inputPath);

  StudentScore? selected;
  while (selected == null) {
    print('어떤 학생의 통계를 확인하시겠습니까?');
    String? input = stdin.readLineSync();
    print(input);
    if (input == null) {
      print('입력이 없습니다. 프로그램을 종료합니다.');
      exit(0);
    }

    final name = input.trim();
    for (var s in students) {
      if (s.name == name) {
        selected = s;
        break;
      }
    }

    if (selected == null) {
      print('잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.');
    }
  }

  selected.showInfo();
  final content = selected.formatForSave();
  saveResults(outputPath, content);
}
