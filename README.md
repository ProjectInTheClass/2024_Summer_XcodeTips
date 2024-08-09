# Xcode Tips

## 프로젝트 파일 준비
USG XcodeTips Repository: https://github.com/ProjectInTheClass/2024_Summer_XcodeTips

1. Fork 버튼 클릭
![Fork_Button](resource/Fork_Button.png)

2. Fork Repository 생성
![Create_fork](resource/Create_fork.png)

3. Fork한 Repository의 페이지에서 URL 복사
Fork된 Repository인지 확인하고 Code 메뉴에서 Clone URL을 복사
![GitURL](resource/GitURL.png)

4. Terminal에서 Fork한 Repository를 Clone
터미널을 열고, `git clone 복사한URL` 명령어를 통해 Repository를 Clone
![GitClone](resource/GitClone.png)

5. 자신의 닉네임으로 Branch를 생성하고, Push하기
아래 명령어를 차례대로 입력
``` shell
git checkout -b 자신의닉네임
git push origin 자신의닉네임
```
![Branch_Push](resource/Branch_Push.png)

6. 다시 자신의 Repository 페이지에서 방금 Push한 Branch가 확인된다면 준비 완료!
![Branch_Check](resource/Branch_Check.png)

## Xcode 사용팁
- 커서 이동
    - `⌥(option)`+ 좌우 화살표: 단어 혹은 키워드 단위 이동
    - `⌘(command)`+ 좌우 화살표: 줄 맨 끝으로 이동
- Preview 단축키 : `⌥(option) + ⌘(command) + ⏎(return)`
- Multi Cursor : `⌃(control) + ⇧(shift)` + 원하는 위치 클릭
    - 화살표로 커서 이동시, 선택된 커서 전체 이동
- 괄호 접기: `⌥(option) + ⌘(command)` + 좌우 화살표
- 코드 정렬: `⌃(control) + i`
    - 주로 전체 블록 선택(`⌘(command) + a`)과 함께 사용
- Code Snippet
- `MARK`, `TODO`, `FIXME`, `!!!`, `???` 주석 라벨
- Docs 이동
    - `⌥(option)`+ 키워드 클릭: 공식 문서 Overview표시 및 이동
    - `⌘(command)`+ 키워드 클릭: 소스 선언부로 이동

## 실습 자료 PR 올리기(제작 중)