import 'dart:io';
import 'dart:math';

void main() {
  // 제목 출력
  print('=====================');
  print('  로또 번호 발급기  ');
  print('=====================');

  // choice 변수는 사용자가 선택한 메뉴(문자 '1' 또는 '2')를 저장
  String choice = '';
  // 사용자가 '1' 또는 '2'를 입력할 때까지 반복한다.
  while (choice != '1' && choice != '2') {
    stdout.write('1. 자동 생성  2. 직접 입력: '); // 입력 안내 출력
    choice = stdin.readLineSync() ?? ''; // 콘솔에서 한 줄 읽음, null이면 빈 문자열로 대체
    if (choice != '1' && choice != '2') {
      print('잘못된 선택입니다. 다시 입력하세요.'); // 유효하지 않은 입력이면 다시 시도
    }
  }

  // 로또용지 로또 번호를 받아서 입력 받습니다.
  List<int> lottoNumbers = [];

  // 자동으로 생성 or 6개를 입력합니다.
  if (choice == '1') {
    lottoNumbers = generateLottoNumbers(); // 자동으로 번호 6개 생성
    print('\n[자동 생성] 발급한 로또 번호 : $lottoNumbers');
  } else if (choice == '2') {
    lottoNumbers = inputLottoNumbers(); // 사용자가 직접 6개 숫자 입력
    print('\n[직접 입력] 발급한 로또 번호 : $lottoNumbers');
  }

  // 2. 당첨 번호
  List<int> winningNumbers = [9, 19, 29, 35, 37, 38];
  print('당첨 번호 : $winningNumbers');

  // 3. 당첨 확인
  checkWinning(lottoNumbers, winningNumbers);

  // 4. 초기화: 발급한 로또 번호 리스트를 비움
  lottoNumbers.clear();
  print('\n현재 발급한 로또 번호 : $lottoNumbers');
}

// 랜덤 번호 생성 (
List<int> generateLottoNumbers() {
  Random random = Random(); // 난수 생성기
  List<int> numbers = [];

  // numbers 길이가 6이 될 때까지 랜덤 숫자 추가
  while (numbers.length < 6) {
    int num = random.nextInt(45) + 1;
    if (!numbers.contains(num)) {
      // 이미 있는 숫자면 추가하지 않음
      numbers.add(num);
    }
  }

  numbers.sort(); // 보기 좋게 오름차순 정렬
  return numbers; // 생성된 6개 숫자 반환
}

// 사용자 직접 입력
List<int> inputLottoNumbers() {
  List<int> numbers = [];
  print('1~45 사이의 숫자 6개를 입력하세요 (중복 불가)');

  // 6개가 채워질 때까지 반복
  while (numbers.length < 6) {
    stdout.write('${numbers.length + 1}번째 숫자: '); // 사용자 입력 유도
    String? input = stdin.readLineSync(); // 사용자 입력 한 줄을 읽음

    if (input == null) continue; // null이면 다시 요청

    int? num = int.tryParse(input); // 입력을 정수로 변환 시도
    if (num == null || num < 1 || num > 45) {
      // 숫자 변환 실패 또는 범위 벗어남
      print('1~45 사이의 숫자만 입력 가능합니다.');
      continue; // 다시 입력 받음
    }

    if (numbers.contains(num)) {
      // 이미 입력한 숫자인지 검사
      print('이미 입력한 숫자입니다. 다른 숫자를 입력하세요.');
      continue; // 중복이면 재입력
    }

    numbers.add(num); // 유효하면 리스트에 추가
  }

  numbers.sort(); // 보기 좋게 정렬
  return numbers; // 입력된 6개 숫자 반환
}

// 당첨 확인 함수: 발급한 번호와 당첨 번호를 비교해 맞춘 개수와 등수를 출력
void checkWinning(List<int> lotto, List<int> winning) {
  // lotto 리스트의 각 숫자가 winning에 포함되어 있는지 확인하여 맞춘 개수 계산
  int matchCount = lotto.where((num) => winning.contains(num)).length;

  String result;
  // 간단한 등수 판정
  if (matchCount == 6) {
    result = '1등';
  } else if (matchCount == 5) {
    result = '2등';
  } else if (matchCount == 4) {
    result = '3등';
  } else {
    result = '당첨 실패!';
  }

  // 결과 출력
  print('맞춘 개수: $matchCount');
  print('당첨 여부: $result');
}
