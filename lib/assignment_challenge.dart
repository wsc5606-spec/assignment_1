import 'dart:math';

void main() {
  // 복권 발급
  List<int> lottoNumbers = generateLottoNumbers();
  print('발급한 로또 번호 : $lottoNumbers');

  // 당첨 번호 비교
  List<int> winningNumbers = [9, 19, 29, 35, 37, 38];
  checkWinning(lottoNumbers, winningNumbers);

  // 초기화
  lottoNumbers.clear();
  print('현재 발급한 로또 번호 : $lottoNumbers');
}

// 랜덤 번호 6개 생성 (1~45)
List<int> generateLottoNumbers() {
  Random random = Random();
  List<int> numbers = [];

  while (numbers.length < 6) {
    int num = random.nextInt(45) + 1;
    if (!numbers.contains(num)) {
      numbers.add(num);
    }
  }

  numbers.sort();
  return numbers;
}

// 당첨 확인
void checkWinning(List<int> lotto, List<int> winning) {
  int matchCount = lotto.where((num) => winning.contains(num)).length;

  String result;
  if (matchCount >= 5) {
    result = '1등';
  } else if (matchCount == 4) {
    result = '2등';
  } else if (matchCount == 3) {
    result = '3등';
  } else {
    result = '당첨 실패!';
  }

  print('당첨 여부 : $result');
}
