import java.util.Arrays;

// Press Shift twice to open the Search Everywhere dialog and type `show whitespaces`,
// then press Enter. You can now see whitespace characters in your code.
public class Main {
    public static void main(String[] args) {
//        System.out.println("hello world");
//        System.out.println();
//        //soutm:현재 작업중인 class.method 이름을 표시
//        System.out.println("Main.main");
//        //soutp: 매개변수의 값을 출력할 떄
//        System.out.println("args = " + Arrays.toString(args));
        //구구단 출력해보기
//        for(int i=1;i<10;i++){
//            for(int j=1;j<10;j++){
//                //soutv: 직전에 선언된 변수값 출력할 떄
//                System.out.println("j = " + j);
//                System.out.println("i = " + i);
//                System.out.println(i + " * " + j + "=" +i*j);
//
//                }
//            }
//

        //TestClass의 testMethod1을 호출하고 호출결과 출력
        //TestClass의 객체 생성
        //기본 생성자로 객체 만들기
        String s = TestClass.testMethod1();
        System.out.println(s);

        TestClass testClass1 = new TestClass();
        //testCalss의 객체에 num, name 필드값 지정하기
        // 값 지정 전에 필드값 확인(get)
        System.out.println(testClass1.getNum());
        System.out.println(testClass1.getName());
        // num = 100, name=이름1 이라는 값을 담기
        testClass1.setNum(100);
        testClass1.setName("이름1");
        //값 담은 후 확인
        System.out.println(testClass1.getNum());
        System.out.println(testClass1.getName());

        //매개변수 있는 생성자로 객체 만들기
        TestClass testClass2 = new TestClass(10, "이름");
        System.out.println(testClass2.getNum());

        //num,name 필드값 확인
        System.out.println(testClass2.getNum());
        System.out.println(testClass2.getName());

        //필드값 변경하기
        testClass2.setNum(1000);
        testClass2.setName("이름333");
        System.out.println(testClass2.getNum());
        System.out.println(testClass2.getName());

    }
}
