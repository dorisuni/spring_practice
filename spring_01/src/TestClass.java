public class TestClass {

    //필드
    private int num;
    private String name;

//    필드 : 속성값. 해당 자원이 가질 수 있는 구체적 정보(회원의 이름, 비번, 아이디 등)
//    생성자 : 해당 클래스 객체(인스턴스)를 만들 떄 정의하는 규칙
//    메서드 : 특정 기능을 수행하기 위한 코드 블록

    //기본 생성자
    public TestClass(){

    }

    // 매개변수가 있는 생성자


    public TestClass(int num, String name) {
        this.num = num;
        this.name = name;
    }

    // getter/setter method:필드는 private으로 보호하고, 필드값 접근을 위해 공개하는 method
    //getter: 필드값을 가져올 떄 (return 있음)
    //setter: 필드값을 저장할 때 (return 없고 매개변수 있음)

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static String testMethod1(){
        return "안녕하세요";
    }




}
