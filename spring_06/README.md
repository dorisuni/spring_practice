#### Spring 페이지 연습하기
    - 구조는 다음과 같다.
1. req1
   + StudyService 클래스의 req1메서드 호출
2. req2
   1. req2 메서드에서 q1,q2값 출력하기
3. req3
   1. index.jsp에서 입력받은 정보를 콘솔창에 객체로 출력하기
4. req4
    * StudyDTO 객체를 리턴한다.
    * index.jsp에서 req4 주소를 요청하면
    * 서비스 클래스의 req4가 리턴한 객체 데이터 값을 req4.jsp에 출력함.
5. req5
    * StudyDTO가 담긴 리스트 객체를 리턴한다.
    * index.jsp에서 req5주소를 요청하면
    * 서비스 클래스의 req5메서드가 리턴한 객체 데이터 값을 req5.jsp에 출력함.