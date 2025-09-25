import 'dart:io';
import 'dart:math';

void main() {
  // 타이틀 멋지게 출력
  print('=====================');
  print('  로또 번호 발급기  ');
  print('=====================');

  // 자동으로 뽑을지, 내가 직접 입력할지 고르는 부분
  String choice = '';
  while (choice != '1' && choice != '2') {
    stdout.write('1. 자동 생성  2. 직접 입력: '); // 메뉴 선택
    choice = stdin.readLineSync() ?? ''; // 입력값 받기 (null이면 빈 문자열로 처리)
    if (choice != '1' && choice != '2') {
      print('잘못 입력했어! 다시 골라봐~');
    }
  }

  // 발급받은 로또 번호 담을 리스트
  List<int> lottoNumbers = [];

  // 선택에 따라 자동 생성 or 내가 직접 6개 입력
  if (choice == '1') {
    lottoNumbers = generateLottoNumbers();
    print('\n[자동 생성] 발급한 번호 : $lottoNumbers');
  } else if (choice == '2') {
    lottoNumbers = inputLottoNumbers();
    print('\n[직접 입력] 발급한 번호 : $lottoNumbers');
  }

  // 당첨 번호도 랜덤으로 뽑아줌
  List<int> winningNumbers = generateLottoNumbers();
  print('이번 회차 당첨 번호 : $winningNumbers');

  // 당첨 확인 ㄱㄱ
  checkWinning(lottoNumbers, winningNumbers);

  // 마지막에 로또 번호 초기화 (비워버림)
  lottoNumbers.clear();
  print('\n현재 발급된 번호 : $lottoNumbers');
}

// 랜덤 번호 뽑는 함수 (1~45 중에 6개, 중복 안됨)
List<int> generateLottoNumbers() {
  Random random = Random();
  List<int> numbers = [];

  // 6개 될 때까지 반복해서 숫자 뽑기
  while (numbers.length < 6) {
    int num = random.nextInt(45) + 1; // 1~45 숫자 뽑음
    if (!numbers.contains(num)) {
      // 중복 체크
      numbers.add(num);
    }
  }

  numbers.sort(); // 번호 정렬해주면 깔끔
  return numbers;
}

// 내가 직접 번호 입력하는 함수
List<int> inputLottoNumbers() {
  List<int> numbers = [];
  print('1~45 사이 숫자 6개 입력 ㄱㄱ (중복 불가)');

  while (numbers.length < 6) {
    stdout.write('${numbers.length + 1}번째 숫자: ');
    String? input = stdin.readLineSync();

    if (input == null) continue; // 입력이 비었으면 다시 ㄱ

    int? num = int.tryParse(input); // 숫자로 바꿀 수 있는지 확인
    if (num == null || num < 1 || num > 45) {
      print('1~45 숫자만 넣어야 돼!');
      continue;
    }

    if (numbers.contains(num)) {
      print('이미 넣은 숫자야. 다른 거 골라~');
      continue;
    }

    numbers.add(num); // 통과하면 리스트에 추가
  }

  numbers.sort();
  return numbers;
}

// 당첨 확인 함수
void checkWinning(List<int> lotto, List<int> winning) {
  // 몇 개 맞았는지 세기
  int matchCount = lotto.where((num) => winning.contains(num)).length;

  String result;
  if (matchCount == 6) {
    result = '1등 🎉';
  } else if (matchCount == 5) {
    result = '2등 👍';
  } else if (matchCount == 4) {
    result = '3등 👏';
  } else {
    result = '꽝... 다음 기회에 😢';
  }

  print('맞춘 개수: $matchCount');
  print('결과: $result');
}
