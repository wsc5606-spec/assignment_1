void main() {
  // 장바구니 품목
  List<String> cart = ["모니터", "키보드", "마우스", "모니터", "마이크"];

  // 상품 가격 정보
  Map<String, int> prices = {
    "모니터": 150000,
    "키보드": 30000,
    "마우스": 15000,
    "마이크": 7000,
  };

  // 계산
  int totalPrice = 0;
  for (var item in cart) {
    if (prices.containsKey(item)) {
      totalPrice += prices[item]!;
    }
  }
  print("WOW!! 장바구니에 ${totalPrice}원이나 담아주셨네요~!!");

  // 할인
  int discount = 0;
  if (totalPrice >= 20000) {
    discount = (totalPrice * 0.1).toInt();
    print("할인 금액: ${discount}원");
  }

  // 최종 결제 금액
  int finalPrice = totalPrice - discount;
  print("최종적으로 결제하실 금액은 ${finalPrice}원 입니다!");
}
