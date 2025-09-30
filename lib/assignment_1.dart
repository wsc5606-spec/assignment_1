void main() {
  // 학생 점수를 저장하는 변수 score에 저장합니다.
  int score = 84;

  // 등급을 저장할 변수 grade에 저장합니다.
  String grade;

  // 점수(score)에 따라 등급을 결정하는 조건문
  if (score >= 90) {
    // 만약 점수가 90점 이상일 경우
    grade = "A";
  } else if (score >= 80) {
    // 만약 점수가 80점 이상 90점 미만일 경우
    grade = "B";
  } else {
    // 80점 미만인 경우
    grade = "C";
  }

  // 최종 결과 출력
  print("이 학생의 점수는 $score점 이며, 등급은 ${grade}등급입니다!");
}
