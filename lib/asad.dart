void main() {
  List<String> drinks = ["아이스 아메리카노"];

  var [type, name] = drinks[0].split(" ");
  print(type); // 아이스
  print(name); // 아메리카노
}
