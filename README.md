사용 함수 정리
choice (String): 사용자 메뉴 선택

lottoNumbers (List<int>): 발급된 로또 번호

winningNumbers (List<int>): 비교용 당첨 번호.

random (Random): dart:math에서 제공하는 난수 생성기.

numbers (List<int>): 각 함수 내 임시로 사용하는 번호 리스트

matchCount (int): checkWinning에서 계산한 맞춘 번호 개수.

result (String): 맞춘 개수에 따른 등수 결과 문자열.

코드 설명
사용자에게 로또 번호 6가지를 입력 받은 후 당첨 번호와 대입하여 진행합니다.

사용자에게 로또 번호 6가지를 입력 받지 않을 경우 랜덤 난수 6자리로 당첨 번호와 대입하여 진행합니다.

1,2,3등 실패를 알려줍니다.

추가 된 점
사용자 로또 번호 직접 입력 기능 추가 assignment2
로또도 랜덤번호 추첨하려고했으나 다음기회에 추개 해볼예정!