package repository;

import dto.AccountDTO;
import dto.ClientDTO;

import java.util.ArrayList;
import java.util.List;

public class BankRepository {
    List<ClientDTO> clientDTOList = new ArrayList<>();
    List<AccountDTO> bankingDTOList = new ArrayList<>();


    public List<ClientDTO> findClientAll() {
        return clientDTOList;
    }

    public List<AccountDTO> findAccountAll() {
        return bankingDTOList;
    }

    public boolean makeClient(ClientDTO clientDTO) {
//
        return clientDTOList.add(clientDTO);
    }


    //Account로 중복찾기
    public ClientDTO findByAccount(String bankAccount) {
        for (ClientDTO clientDTO : clientDTOList) {
            if (clientDTO.getAccountNumber().equals(bankAccount)) {
                return clientDTO;
            }
        }
        return null;
    }

    public boolean deposit(String bankAccount, long bankBalalce) {
        ClientDTO checkAccount = findByAccount(bankAccount);

        if (checkAccount == null) {
            System.out.println("해당 계좌가 존재하지 않습니다.");
        } else {
            for (int i = 0; i < clientDTOList.size(); i++) {
                if (checkAccount.getId().equals(clientDTOList.get(i).getId())) {
                    clientDTOList.get(i).setBalance(checkAccount.getBalance() + bankBalalce);
                    AccountDTO accountDTO = new AccountDTO(bankAccount, bankBalalce, 0);
                    bankingDTOList.add(accountDTO);
                    return true;
                }
            }
        }
        return false;
    }

    public int withdraw(String bankAccount, String bankPassword, long bankBalalce) {
        ClientDTO checkAccount = findByAccount(bankAccount);
        if (checkAccount == null) {
            return 5;
        } else {
            for (int i = 0; i < clientDTOList.size(); i++) {
                if (checkAccount.getId().equals(clientDTOList.get(i).getId()) && checkAccount.getClientPass().equals(bankPassword)) {
                    if (clientDTOList.get(i).getBalance() >= bankBalalce) {
                        clientDTOList.get(i).setBalance(checkAccount.getBalance() - bankBalalce);
                        AccountDTO accountDTO = new AccountDTO(bankAccount, 0, bankBalalce);
                        bankingDTOList.add(accountDTO);
                        return 1;
                    } else {
                        return 2;
                    }

                } else {
                    return 3;
                }
            }
        }
        return 4;
    }


    public List<AccountDTO> findAllAccount(String bankAccount) {
        List<AccountDTO> array = new ArrayList<>();
        for (AccountDTO accountDTO : bankingDTOList) {
            if (accountDTO.getAccountNumber().equals(bankAccount)) {
                array.add(accountDTO);
            }
        }
        return array;
    }

}
