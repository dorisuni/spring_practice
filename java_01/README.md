## 프로젝트 구조
- oooMain Class
    - 사용자가 기능선택을 하도록 보여지는 화면
    - 웹기준으로는 시작화면
- oooService Class
  - 기능 처리 담당
  - 입력 또는 계산 등을 처리
- oooRepository Class
    - DB 역할
    - 정보를 저장할 리스트 객체 관리
- oooDTO class
    - Service<-> Repository 간에 객체를 주고 받을 때 활용하는 전달을 위한 클래스
    - DTO(Data Transfer Object), VO와 동일한 역할
  

### Wrapper 클래스 타입, Primitive 타입
1. Primitive 타입
- int, long, double, boolean 등 기본 변수 타입
2. Wrapper 클래스 타입
- Integer, Long, Double, Boolean 등 클래스 타입
- 클래스 객체 처럼 사용이 가능함.(null 가능)
- List, Map과 같은 객체 사용시 <> 내에 기본형 타입을 사용하는 경우 Wrapper 클래스 이름을 사용.
  - 정수를 담는 ArrayList: 
    - List<**Integer**> list = new ArrayList<>(); 