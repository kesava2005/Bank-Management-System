package com.spring.boot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boot.UserCred;
import com.spring.boot.Dao.UserCredDao;
import com.spring.boot.AdminCred;
import com.spring.boot.BankUser;
import com.spring.boot.Funds;
import com.spring.boot.Transaction;
import com.spring.boot.Dao.AdminCredDao;
import com.spring.boot.Dao.BankUserDao;
import com.spring.boot.Dao.FundsDao;
import com.spring.boot.Dao.TransactionDao;
@Service
public class BankService {
    @Autowired
    private UserCredDao userCredDao;
    @Autowired
    private AdminCredDao adminCredDao;
    @Autowired
    private BankUserDao bankUserDao;
    @Autowired
    private FundsDao fundsDao;
    @Autowired
    private TransactionDao transactionDao; 
    public void insertUser(UserCred uc) {
        userCredDao.save(uc);
    }
    public Optional<UserCred> selectUser(long id) {
    	Optional<UserCred> uc = userCredDao.findById(id);
    	return uc;
    }
    public void insertUser(AdminCred ac) {
        adminCredDao.save(ac);
    }
    public Optional<AdminCred> selectAdmin(long id){
    	Optional<AdminCred> oac = adminCredDao.findById(id);
    	return oac;
    }
    public void insertBankUser(BankUser bu) {
    	bankUserDao.save(bu);
    }
    public Optional<BankUser> selectBankUser(long id){
    	Optional<BankUser> bu = bankUserDao.findById(id);
    	return bu;
    }
    public void deleteBankUser(long id) {
    	bankUserDao.deleteById(id);
    }
    public void UpdateBankUser(Optional<BankUser> obu,long id,String name,long number,String address,double balance) {
    	BankUser bu = obu.get();
    	bu.setUserName(name);
    	bu.setMobileNum(number);
    	bu.setAddress(address);
    	bu.setBalance(balance);
    	bankUserDao.save(bu);
    }
    public void addRequest(long id,long rid,double amount) {
    	Funds f = new Funds();
    	f.setUid(id);
    	f.setRid(rid);
    	f.setAmount(amount);
    	f.setStatus("Pending");
    	fundsDao.save(f);
    }
    public Optional<Funds> selectFund(long id){
    	return fundsDao.findById(id);
    }
    public void deleteFund(long id){
    	fundsDao.deleteById(id);
    }
    public void insertFund(Funds fund) {
    	fundsDao.save(fund);
    }
    public void insertTransaction(Transaction t) {
    	transactionDao.save(t);
    }
    public Optional<Transaction> getTransaction(long uid,long rid,double amount,String type,String staus){
    	Optional<Transaction> ot = transactionDao.findByUidAndRidAndAmountAndTypeAndStatus(uid, rid, amount,type, staus);
    	return ot;
    }
    public List<Transaction> getAll(){
    	List<Transaction> tlist = transactionDao.selectAll();
    	return tlist;
    }
}