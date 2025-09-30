void main() {
  // 장바구니 품목 list를 이용해 여러 품목을 cart에 저장
  List<String> cart = ["모니터", "키보드", "마우스", "모니터", "마이크"];

  // 상품 가격 정보 map을 이용해 prices에 각 가격을 저장
  Map<String, int> prices = {
    "모니터": 150000,
    "키보드": 30000,
    "마우스": 15000,
    "마이크": 7000,
  };

  // 총 금액(totalPrice) 계산
  int totalPrice = 0; // 처음에는 0원에서 시작
  for (var item in cart) {
    // cart 안에 있는 item이 prices에 존재하는지 확인
    if (prices.containsKey(item)) {
      // 존재하면 해당 가격을 totalPrice에 더함
      totalPrice += prices[item]!;
    }
  }
  // 장바구니에 담긴 총 금액 출력
  print("WOW!! 장바구니에 ${totalPrice}원이나 담아주셨네요~!!");

  // 할인 계산
  int discount = 0; // 기본적으로 할인은 없음
  if (totalPrice >= 20000) {
    // 총 금액이 20,000원 이상일 경우 10% 할인 적용
    discount = (totalPrice * 0.1).toInt();
    print("할인 금액: ${discount}원");
  }

  // 최종 결제 금액 계산
  // 총 금액에서 할인 금액을 뺀 값
  int finalPrice = totalPrice - discount;
  print("최종적으로 결제하실 금액은 ${finalPrice}원 입니다!");
}
