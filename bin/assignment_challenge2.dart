import 'dart:io';
import 'dart:math';

void main() {
  print('=====================');
  print('  로또 번호 발급기  ');
  print('=====================');

  // 1. 자동 생성 또는 직접 입력 선택
  print('1. 자동 생성  2. 직접 입력');
  String? choice = stdin.readLineSync();

  List<int> lottoNumbers = [];

  if (choice == '1') {
    lottoNumbers = generateLottoNumbers();
  } else if (choice == '2') {
    lottoNumbers = inputLottoNumbers();
  } else {
    print('잘못된 선택입니다. 자동으로 생성합니다.');
    lottoNumbers = generateLottoNumbers();
  }

  print('\n발급한 로또 번호 : $lottoNumbers');

  // 2. 당첨 번호
  List<int> winningNumbers = [9, 19, 29, 35, 37, 38];
  print('당첨 번호 : $winningNumbers');

  // 3. 당첨 확인
  checkWinning(lottoNumbers, winningNumbers);

  // 4. 초기화
  lottoNumbers.clear();
  print('\n현재 발급한 로또 번호 : $lottoNumbers');
}

// --------------------
// 랜덤 번호 생성
// --------------------
List<int> generateLottoNumbers() {
  Random random = Random();
  List<int> numbers = [];

  while (numbers.length < 6) {
    int num = random.nextInt(45) + 1; // 1~45
    if (!numbers.contains(num)) {
      numbers.add(num);
    }
  }

  numbers.sort();
  return numbers;
}

// --------------------
// 사용자 입력
// --------------------
List<int> inputLottoNumbers() {
  List<int> numbers = [];
  print('1~45 사이의 숫자 6개를 입력하세요 (중복 불가)');

  while (numbers.length < 6) {
    stdout.write('${numbers.length + 1}번째 숫자: ');
    String? input = stdin.readLineSync();

    if (input == null) continue;

    int? num = int.tryParse(input);
    if (num == null || num < 1 || num > 45) {
      print('1~45 사이의 숫자만 입력 가능합니다.');
      continue;
    }
    if (numbers.contains(num)) {
      print('이미 입력한 숫자입니다. 다른 숫자를 입력하세요.');
      continue;
    }

    numbers.add(num);
  }

  numbers.sort();
  return numbers;
}

// --------------------
// 당첨 확인
// --------------------
void checkWinning(List<int> lotto, List<int> winning) {
  int matchCount = lotto.where((num) => winning.contains(num)).length;

  String result;
  if (matchCount == 6) {
    result = '1등';
  } else if (matchCount == 5) {
    result = '2등';
  } else if (matchCount == 4) {
    result = '3등';
  } else {
    result = '당첨 실패!';
  }

  print('당첨 개수: $matchCount');
  print('당첨 여부 : $result');
}
