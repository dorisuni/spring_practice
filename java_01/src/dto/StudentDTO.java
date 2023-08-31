package dto;

public class StudentDTO {
    private Long id; // 학생 관리번호
    private String studentName;
    private String studentMajor;
    private String studentMobile;

    // 증가값을 유지하기 위해 static으로 선언
    //static은 초기값을 계속 유지할 수 있다.
    private static long num = 1L;
    // 기본생성자
    public StudentDTO() {
    }

    public StudentDTO(String studentName, String studentMajor, String studentMobile) {
        //객체를 생성하면서 num값을 하나 증가시킨 결과를 id에 저장한것임.

        this.id = num++;
        this.studentName = studentName;
        this.studentMajor = studentMajor;
        this.studentMobile = studentMobile;
    }

    // getter/setter
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentMajor() {
        return studentMajor;
    }

    public void setStudentMajor(String studentMajor) {
        this.studentMajor = studentMajor;
    }

    public String getStudentMobile() {
        return studentMobile;
    }

    public void setStudentMobile(String studentMobile) {
        this.studentMobile = studentMobile;
    }

    // toString
    @Override
    public String toString() {
        return "StudentDTO{" +
                "id=" + id +
                ", studentName='" + studentName + '\'' +
                ", studentMajor='" + studentMajor + '\'' +
                ", studentMobile='" + studentMobile + '\'' +
                '}';
    }
}
