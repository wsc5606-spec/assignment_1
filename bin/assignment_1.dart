import 'package:assignment_1/assignment_1.dart' as assignment_1;

void main() {
  int score = 84;
  String grade;

  if (score >= 90) {
    grade = "A";
  } else if (score >= 80) {
    grade = "B";
  } else {
    grade = "C";
  }

  print("이 학생의 점수는 $score점 이며, 등급은 ${grade}등급입니다!");
}
