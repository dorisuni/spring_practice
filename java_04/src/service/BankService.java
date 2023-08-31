package service;

import dto.AccountDTO;
import dto.ClientDTO;
import repository.BankRepository;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Scanner;

public class BankService {
    Scanner scanner = new Scanner(System.in);
    BankRepository bankRepository = new BankRepository();
    DecimalFormat df = new DecimalFormat("###,###");
    public void makeClient() {
        System.out.println("이름을 입력하세요>");
        String bankName = scanner.nextLine();
        boolean check = true;
        String bankAccount = "";
        while(check){
            System.out.println("희망하는 계좌번호를 입력하세요");
            String bankAccount1 = scanner.nextLine();
            String checkedBankAccount = checkAccount(bankAccount1);
            if(checkedBankAccount != null) {
                bankAccount = checkedBankAccount;
                check = false;
            }else{
                System.out.println("이미 같은 계좌번호가 존재합니다. 다른 계좌번호를 입력하세요.");
            }
        }
        System.out.println("비밀번호를 입력하세요");
        String bankPass = scanner.nextLine();

        ClientDTO clientDTO = new ClientDTO(bankName, bankAccount, bankPass);
        boolean result = bankRepository.makeClient(clientDTO);
        if (result) {
            System.out.println("계좌 생성 성공!");
            System.out.println(clientDTO);
        } else {
            System.out.println("계좌 생성 실패!");
        }

    }

    //전체 고객 리스트
    public void findClientAll() {
        List<ClientDTO> clientDTOList = bankRepository.findClientAll();
        for (ClientDTO clientDTO : clientDTOList) {
            System.out.println(clientDTO);
        }
    }

    public String checkAccount(String bankAccount) {
        ClientDTO result = bankRepository.findByAccount(bankAccount);
        if (result == null) {
            return bankAccount;
        } else {
            return null;
        }
    }

    public void checkBalance() {
        System.out.println("계좌번호를 입력하세요.");
        String bankAccount = scanner.nextLine();
        ClientDTO client = bankRepository.findByAccount(bankAccount);
        if(client ==null){
            System.out.println("해당 계좌가 없습니다.");
        }else{
            System.out.println("현재 잔액: "+df.format(client.getBalance())+"원");
        }
    }

    public void deposit() {
        String forBugFix;
        System.out.println("계좌번호를 입력하세요.");
        String bankAccount = scanner.nextLine();
        long bankBalance = 0;
        boolean run = true;
        while(run){
            System.out.println("입금금액을 입력하세요.");
            long bankBalance1 = scanner.nextLong();
            forBugFix = scanner.nextLine();
            if(bankBalance1>0){
                bankBalance = bankBalance1;
                run = false;
            }else{
                System.out.println("입금액은 0보다 커야 합니다.");
            }
        }

        boolean result = bankRepository.deposit(bankAccount, bankBalance);
        if (result) {
            System.out.println("입금 완료!");
        } else {
            System.out.println("입금 실패!");
        }


    }


    public void withdraw() {
        String forBugFix;
        System.out.println("출금 계좌번호를 입력하세요.");
        String bankAccount = scanner.nextLine();
        System.out.println("비밀번호를 입력하세요.");
        String bankPassword = scanner.nextLine();
        System.out.println("출금 금액을 입력하세요.");
        long bankBalance = scanner.nextLong();
        forBugFix = scanner.nextLine();

        int result = bankRepository.withdraw(bankAccount,bankPassword, bankBalance);
        if (result == 1) {
            System.out.println("출금 완료!");
        } else if(result == 2){
            System.out.println("잔액이 부족합니다!");
        } else if(result == 3){
            System.out.println("비밀번호가 틀렸습니다!");
        } else if(result == 4){
            System.out.println("출금 실패!");
        }else if(result == 5){
            System.out.println("해당 계좌가 존재하지 않습니다.");
        }
    }

    public void check() {
        String forBugFix;
        System.out.println("조회를 원하는 계좌번호를 입력하세요.");
        String bankAccount = scanner.nextLine();
        ClientDTO result = bankRepository.findByAccount(bankAccount);
        if (result == null) {
            System.out.println("계좌번호가 존재하지 않습니다.");
        } else {
            boolean run = true;

            while (run) {
                System.out.println("====== 조회관리 ======");
                System.out.println("1.전체내역 2.입금내역 3.출금내역 4.종료");
                System.out.print("선택>  ");
                int sel = scanner.nextInt();
                forBugFix = scanner.nextLine();
                if (sel == 1) {
                    System.out.println("=======전체내역=======");
                    System.out.println("계좌번호\t입금금액\t출금금액\t입출금일시");
                    for (AccountDTO accountDTO : bankRepository.findAllAccount(bankAccount)) {
                        String formattedString = String.format("%s\t%d\t%d\t%s", accountDTO.getAccountNumber(), accountDTO.getDeposit(), accountDTO.getWithdraw(), accountDTO.getBankingAt());
                        System.out.println(formattedString);
                    }


                } else if (sel == 2) {
                    System.out.println("=======입금내역=======");
                    for (AccountDTO accountDTO : bankRepository.findAllAccount(bankAccount)) {
                        if (accountDTO.getDeposit() != 0) {
                            String formattedString = String.format("%s\t%d\t%s", accountDTO.getAccountNumber(), accountDTO.getDeposit(), accountDTO.getBankingAt());
                            System.out.println(formattedString);
                        }
                    }
                } else if (sel == 3) {
                    System.out.println("=======출금내역=======");
                    for (AccountDTO accountDTO : bankRepository.findAllAccount(bankAccount)) {
                        if (accountDTO.getWithdraw() != 0) {
                            String formattedString = String.format("%s\t%d\t%s", accountDTO.getAccountNumber(), accountDTO.getWithdraw(), accountDTO.getBankingAt());
                            System.out.println(formattedString);
                        }
                    }
                } else if (sel == 4) {
                    System.out.println("종료합니다!");
                    run = false;
                }
            }
        }

    }
}

