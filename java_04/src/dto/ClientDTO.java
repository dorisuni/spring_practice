package dto;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ClientDTO {
    private Long id;
    private String clientName;
    private String accountNumber;
    private String clientPass;
    private String clientCreatedAt;
    private long balance;

    private static long num = 1L;
    public ClientDTO() {
    }

    public ClientDTO(String clientName, String accountNumber, String clientPass) {
        LocalDateTime now = LocalDateTime.now();
        this.id = num++;
        this.clientName = clientName;
        this.accountNumber = accountNumber;
        this.clientPass = clientPass;
        this.clientCreatedAt = now.format(DateTimeFormatter.ofPattern("yyyy년MM월dd일 HH시mm분ss초"));

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getClientPass() {
        return clientPass;
    }

    public void setClientPass(String clientPass) {
        this.clientPass = clientPass;
    }

    public String getClientCreatedAt() {
        return clientCreatedAt;
    }

    public void setClientCreatedAt(String clientCreatedAt) {
        this.clientCreatedAt = clientCreatedAt;
    }

    public long getBalance() {
        return balance;
    }

    public void setBalance(long balance) {
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "ClientDTO{" +
                "id=" + id +
                ", clientName='" + clientName + '\'' +
                ", accountNumber='" + accountNumber + '\'' +
                ", clientPass='" + clientPass + '\'' +
                ", clientCreatedAt='" + clientCreatedAt + '\'' +
                ", balance=" + balance +
                '}';
    }
}
