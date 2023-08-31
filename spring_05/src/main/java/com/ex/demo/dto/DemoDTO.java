package com.ex.demo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
//롬복이라는 어노테이션을 쓰는거임.
//커뮤니티에서 쓸 때는 겟터셋터투스트링을 다 해줘야함
//편한 이유는 변수 값이 바뀌어도 사용할 수 있는거임. (자동으로 정의하므로)
public class DemoDTO {
    private String param1;
    private String param2;




//    @Override //Override Annotation 오버라이드 어노테이션. 메소드를 재정의를 할 때 사용한다.
//    public String toString() {
//        return "DemoDTO{" +
//                "param1='" + param1 + '\'' +
//                ", param2='" + param2 + '\'' +
//                '}';
//    }
//
//    public void setParam1(String param1) {
//        this.param1 = param1;
//    }
//
//    public void setParam2(String param2) {
//        this.param2 = param2;
//    }
}
