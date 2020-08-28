# 개인 프로젝트 진행

```
 - 로그인[o]
 - 회원가입[o]
 - 로그아웃 [o]
 - 회원정보 수정 [o]
 - 이름, 이메일 입력시 아이디 찾기 [-]
 - 가입시 감사메일 발송 [o]
 - 게시판 [o]
 - 게시물 리스트
 - 게시물 작성 [o]

 -board 테이블, article 테이블 생성
    -/usr/article/free-write : 자유 게시물 작성
    -/usr/article/notice-write : 공지사항 게시물 작성
      -힌트
        - @RequestMapping("/usr/article/{boardCode}-write")
        - public String showWrite(Model model, @PathVariable("boardCode"), String boardCode){
    -/usr/article/free-list: 자유 게시물 리스트
    -/usr/article/notice-list: 공지사항 게시물 리스트
        - @RequestMapping("/usr/article/{boardCode}-list")
        - public String showList(Model model, @PathVariable("boardCode"), String boardCode){
 ```
