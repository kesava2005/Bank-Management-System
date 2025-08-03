package com.spring.boot.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.boot.AdminCred;
import com.spring.boot.BankUser;
import com.spring.boot.Funds;
import com.spring.boot.Transaction;
import com.spring.boot.UserCred;
import com.spring.boot.service.BankService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class BankController {

    @Autowired
    private BankService bankService;
    HttpServletRequest request;
    ModelAndView modelAndView;
    AdminCred ac;
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView rootRedirect() {
        return new ModelAndView("Login.jsp");
    }
    @RequestMapping(value = "/UserRegister", method = RequestMethod.POST)
    public ModelAndView UserRegister(@RequestParam("uid") long id, @RequestParam("uname") String name, @RequestParam("pass") String pass) {
    	modelAndView = new ModelAndView("Register.jsp");
        UserCred uc = new UserCred();
        uc.setUid(id);
        uc.setUname(name);
        uc.setPass(pass);
        Optional<BankUser> obu = bankService.selectBankUser(id);
        Optional<UserCred> ouc = bankService.selectUser(id);
        if (obu.isPresent()) {
        	if(ouc.isPresent()) {
        		System.out.println("Entered");
        		modelAndView.addObject("errorMessage","User already exists with this id");
        	}
        	else {
        		bankService.insertUser(uc);
        		return new ModelAndView("Registered.jsp");
        	}
        }
        else {
        	modelAndView.addObject("errorMessage", "User doesn't have any account");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/UserLogin", method = RequestMethod.POST)
    public ModelAndView UserLogin(@RequestParam("uid") long id, @RequestParam("uname") String name, @RequestParam("pass") String pass, HttpServletRequest request) {
        modelAndView = new ModelAndView("Login.jsp");
        Optional<UserCred> ouc = bankService.selectUser(id);
        if (ouc.isPresent()) {
            UserCred uc = ouc.get();
            if (uc.getUid() == id && uc.getPass().equals(pass) && uc.getUname().equals(name)) {
            	HttpSession session = request.getSession();
            	session.removeAttribute("LoggedID"); // Remove existing LoggedID
                session.setAttribute("LoggedID", id); // Set new LoggedID
                session.removeAttribute("name");
                session.setAttribute("name", name);
                return new ModelAndView("User.jsp");
            }
            modelAndView.addObject("errorMessage", "Login failed: incorrect credentials.");
        } else {
            modelAndView.addObject("errorMessage", "There is no such user");
        }
        return modelAndView;
    }
    @RequestMapping(value = "/AdminRegister", method = RequestMethod.POST)
    public ModelAndView AdminRegister(@RequestParam("aid") long id, @RequestParam("aname") String name, @RequestParam("pass") String pass) {
        ac = new AdminCred();
        ac.setAid(id);
        ac.setAname(name);
        ac.setPass(pass);
        bankService.insertUser(ac);
        return new ModelAndView("Registered.jsp");
    }
    @RequestMapping(value="/AdminLogin",method=RequestMethod.POST)
    public ModelAndView AdminLogin(@RequestParam("aid") long id, @RequestParam("aname") String name, @RequestParam("pass") String pass,HttpServletRequest request) {
   	  Optional<AdminCred>oac = bankService.selectAdmin(id);
   	  modelAndView = new ModelAndView("Login.jsp");
   	  if(oac.isPresent()){
   		  ac = oac.get();
   		  if(ac.getAid()== id && ac.getPass().equals(pass) && ac.getAname().equals(name)) {
   			  HttpSession session = request.getSession();
              System.out.println("Entered");
              session.removeAttribute("LoggedID");
              session.setAttribute("LoggedID", id);
              session.removeAttribute("name");
              session.setAttribute("name", name);
   			  return new ModelAndView("Admin.jsp");
   		  }
   		modelAndView.addObject("errorMessage", "Login failed: incorrect credentials.");
   	  }
   	  else {
   		  modelAndView.addObject("errorMessage","There is no such admin");
   	  }
   	  return modelAndView;
   }
    @RequestMapping(value = "/CreateUser", method = RequestMethod.POST)
    public ModelAndView CreateUser(@RequestParam("uid") long id, @RequestParam("uname") String name, @RequestParam("mobileNum") long mobilenum, @RequestParam("address") String address, @RequestParam("balance") double balance,HttpServletRequest request) {
    	modelAndView = new ModelAndView("Create.jsp");
        Long lid = (Long) request.getSession().getAttribute("LoggedID");
        if (lid == null) {
        	modelAndView = new ModelAndView("Login.jsp");
            modelAndView.addObject("errorMessage", "No user is logged in.");
            return modelAndView;
        }
        Optional<BankUser> obu = bankService.selectBankUser(id);
        if (obu.isPresent()) {
            modelAndView.addObject("errorMessage", "There is an account with the given id");
        } else {
            BankUser bu = new BankUser();
            bu.setUserId(id);
            bu.setUserName(name);
            bu.setMobileNum(mobilenum);
            bu.setAddress(address);
            bu.setBalance(balance);
            bankService.insertBankUser(bu);
            modelAndView.addObject("Message", "Account has been created");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/DeleteUser", method = RequestMethod.POST)
    public ModelAndView DeleteUser(@RequestParam("uid") long id,HttpServletRequest request) {
        modelAndView = new ModelAndView("Delete.jsp");
        Long lid = (Long) request.getSession().getAttribute("LoggedID");
        if (lid == null) {
        	modelAndView = new ModelAndView("Login.jsp");
            modelAndView.addObject("errorMessage", "No user is logged in.");
            return modelAndView;
        }
        Optional<BankUser> obu = bankService.selectBankUser(id);
        if (obu.isPresent()) {
        	bankService.deleteBankUser(id);
            modelAndView.addObject("Message", "The account has been deleted");
        } else {
            modelAndView.addObject("errorMessage", "There is no such bank account");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/UpdateUser", method = RequestMethod.POST)
    public ModelAndView UpdateUser(@RequestParam("uid") long id, @RequestParam(value = "balance",required=false) String balancestr,@RequestParam(value = "uname",required=false) String name,@RequestParam(value = "mobilenum",required=false) String numberstr,@RequestParam(value= "address",required=false) String address,HttpServletRequest request) {
        modelAndView = new ModelAndView("Update.jsp");
        Long lid = (Long) request.getSession().getAttribute("LoggedID");
        if (lid == null) {
        	modelAndView = new ModelAndView("Login.jsp");
            modelAndView.addObject("errorMessage", "No user is logged in.");
            return modelAndView;
        }
        Optional<BankUser> obu = bankService.selectBankUser(id);
        if (obu.isPresent()) {
        	BankUser bu = obu.get();
            if(name!=null&&name!="") {
            	bu.setUserName(name);
            }
            if(numberstr!=null&&numberstr!="") {
            	long number = Long.parseLong(numberstr);
            	bu.setMobileNum(number);
            }
            if(address!=null&&address!="") {
            	bu.setAddress(address);
            }
            if(balancestr!=null&&balancestr!="") {
            	double balance = Double.parseDouble(balancestr);
            	bu.setBalance(balance);
            }
        	bankService.insertBankUser(bu);
            modelAndView.addObject("Message", "The account has been updated");
        } else {
            modelAndView.addObject("errorMessage", "There is no such bank account");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/DisplayUser", method = RequestMethod.POST)
    public ModelAndView DisplayUser(@RequestParam("uid") long id,HttpServletRequest request) {
        modelAndView = new ModelAndView("Details.jsp");
        Long lid = (Long) request.getSession().getAttribute("LoggedID");
        if (lid == null) {
        	modelAndView = new ModelAndView("Login.jsp");
            modelAndView.addObject("errorMessage", "No user is logged in.");
            return modelAndView;
        }
        Optional<BankUser> obu = bankService.selectBankUser(id);
        if (obu.isPresent()) {
            BankUser bu = obu.get();
            modelAndView.addObject("Message", "content");
            modelAndView.addObject("id", bu.getUserId());
            modelAndView.addObject("name", bu.getUserName());
            modelAndView.addObject("mobilenum", bu.getMobileNum());
            modelAndView.addObject("address", bu.getAddress());
            modelAndView.addObject("balance", bu.getBalance());
        } else {
            modelAndView.addObject("Message", "error");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/Display", method = RequestMethod.POST)
    public ModelAndView Display(HttpServletRequest request) {
    	modelAndView = new ModelAndView("UserDetails.jsp");
        Long id = (Long) request.getSession().getAttribute("LoggedID");
        if (id == null) {
        	modelAndView = new ModelAndView("Login.jsp");
            modelAndView.addObject("errorMessage", "No user is logged in.");
            return modelAndView;
        }
        Optional<BankUser> obu = bankService.selectBankUser(id);
        if (obu.isPresent()) {
            BankUser bu = obu.get();
            modelAndView.addObject("Message", "content");
            modelAndView.addObject("id", bu.getUserId());
            modelAndView.addObject("name", bu.getUserName());
            modelAndView.addObject("mobilenum", bu.getMobileNum());
            modelAndView.addObject("address", bu.getAddress());
            modelAndView.addObject("balance", bu.getBalance());
        } else {
            modelAndView.addObject("Message", "error");
        }
        return modelAndView;
    }
    @RequestMapping(value = "/Widthdraw", method=RequestMethod.POST)
    public ModelAndView Widthdraw(@RequestParam("amount") double amount ,HttpServletRequest request) {
    	modelAndView = new ModelAndView("UserOperations.jsp");
        Long lid = (Long) request.getSession().getAttribute("LoggedID");
        if (lid == null) {
        	modelAndView = new ModelAndView("Login.jsp");
            modelAndView.addObject("errorMessage", "No user is logged in.");
            return modelAndView;
        }
        HttpSession session = request.getSession();
    	long id = (Long) session.getAttribute("LoggedID");
    	Optional<BankUser> obu = bankService.selectBankUser(id);
    	BankUser bu = obu.get();
    	double balance = bu.getBalance();
    	Transaction t = new Transaction();
    	t.setUid(id);
    	t.setAmount(amount);
    	t.setType("Widthdraw");
    	if(balance<amount) {
    		t.setStatus("Insufficient Balance");
    		modelAndView.addObject("ErrorMessage","Insufficient Balance");
    		return modelAndView;
    	}
    	t.setStatus("Widthdrawn");
    	bankService.insertTransaction(t);
    	balance -= amount;
    	bu.setBalance(balance);
    	bankService.insertBankUser(bu);
    	modelAndView.addObject("Message","Widthdrawn Successfully");
    	return modelAndView;
    }
    @RequestMapping(value = "/Deposit", method=RequestMethod.POST)
    public ModelAndView Deposit(@RequestParam("amount") double amount ,HttpServletRequest request) {
    	modelAndView = new ModelAndView("UserOperations.jsp");
        Long lid = (Long) request.getSession().getAttribute("LoggedID");
        if (lid == null) {
        	modelAndView = new ModelAndView("Login.jsp");
            modelAndView.addObject("errorMessage", "No user is logged in.");
            return modelAndView;
        }
        HttpSession session = request.getSession();
    	long id = (Long) session.getAttribute("LoggedID");
    	Optional<BankUser> obu = bankService.selectBankUser(id);
    	BankUser bu = obu.get();
    	double balance = bu.getBalance();
    	balance += amount;
    	bu.setBalance(balance);
    	Transaction t = new Transaction();
    	t.setUid(id);
    	t.setAmount(amount);
    	t.setType("Deposit");
    	t.setStatus("Deposited");
    	bankService.insertTransaction(t);
    	bankService.insertBankUser(bu);
    	modelAndView.addObject("Message","Depositted Successfully");
    	return modelAndView;
    }
    @RequestMapping(value = "/FundRequest", method=RequestMethod.POST)
    public ModelAndView FundRequest(@RequestParam("rid") long rid,@RequestParam("amount") double amount ,HttpServletRequest request) {
    	modelAndView = new ModelAndView("UserOperations.jsp");
        Long lid = (Long) request.getSession().getAttribute("LoggedID");
        if (lid == null) {
        	modelAndView = new ModelAndView("Login.jsp");
            modelAndView.addObject("errorMessage", "No user is logged in.");
            return modelAndView;
        }
        HttpSession session = request.getSession();
    	long id = (Long) session.getAttribute("LoggedID");
    	Optional<BankUser> obu = bankService.selectBankUser(id);
    	Optional<BankUser> robu = bankService.selectBankUser(rid);
    	Optional<Funds> ofund = bankService.selectFund(id);
    	if(ofund.isPresent()) {
    		modelAndView.addObject("ErrorMessage","Previous transaction was pending");
    		return modelAndView;
    	}
    	if(robu.isEmpty()) {
    		modelAndView.addObject("ErrorMessage","No such receiver account");
    		return modelAndView;
    	}
    	BankUser bu = obu.get();
    	double balance = bu.getBalance();
    	if(balance<amount) {
    		modelAndView.addObject("ErrorMessage","Insufficient Balance");
    		return modelAndView;
    	}
    	bankService.addRequest(id,rid,amount);
    	Transaction t = new Transaction();
    	t.setUid(id);
    	t.setRid(rid);
    	t.setAmount(amount);
    	t.setType("Fund transfer");
    	t.setStatus("pending");
    	bankService.insertTransaction(t);
    	modelAndView.addObject("Message","Request sent Successfully");
    	return modelAndView;
    }
    @RequestMapping(value="/DisplayFund")
    public ModelAndView DisplayFund(@RequestParam("uid") long id,HttpServletRequest request) {
    	modelAndView = new ModelAndView("FundReq.jsp");
        Long lid = (Long) request.getSession().getAttribute("LoggedID");
        if (lid == null) {
        	modelAndView = new ModelAndView("Login.jsp");
            modelAndView.addObject("errorMessage", "No user is logged in.");
            return modelAndView;
        }
    	Optional<Funds> ofund = bankService.selectFund(id);
            if(ofund.isPresent()) {
            	Funds f = ofund.get();
            	modelAndView.addObject("Message", "content");
                modelAndView.addObject("uid", f.getUid());
                modelAndView.addObject("rid", f.getRid());
                modelAndView.addObject("amount", f.getAmount());
                modelAndView.addObject("status", f.getStatus());
            }
            else {
            	modelAndView.addObject("Message","error");
            }
       return modelAndView;
    }
    @RequestMapping(value = "/FundApproved")
    public ModelAndView FundApproved(@RequestParam("uid") long id, @RequestParam("rid") long rid, @RequestParam("amount") double amount,HttpServletRequest request) {
        modelAndView = new ModelAndView("FundReq.jsp");
        Optional<BankUser> obu = bankService.selectBankUser(id);
        Optional<BankUser> orbu = bankService.selectBankUser(rid);

        if (obu.isPresent() && orbu.isPresent()) {
            BankUser of = obu.get();
            BankUser rof = orbu.get();
            double oa = of.getBalance();
            double roa = rof.getBalance();
            oa -= amount;
            roa += amount;
            of.setBalance(oa);
            rof.setBalance(roa);
            bankService.insertBankUser(of);
            bankService.insertBankUser(rof);
            bankService.deleteFund(id);
            modelAndView.addObject("Message", "success");
            Transaction t = new Transaction();
            Optional<Transaction> ot = bankService.getTransaction(id,rid,amount,"Fund transfer","pending");
            if(ot.isPresent()) {
            	t = ot.get();
            	t.setStatus("Approved");
            	bankService.insertTransaction(t);
            }
            else {
            	System.out.println("Something wrong");
            }
        } else {
            modelAndView.addObject("Message", "error");
        }

        return modelAndView;
    }
    @RequestMapping(value="/FundRejected")
    public ModelAndView FundRejected(@RequestParam("uid") long id, @RequestParam("rid") long rid, @RequestParam("amount") double amount,HttpServletRequest request) {
        Long lid = (Long) request.getSession().getAttribute("LoggedID");
        modelAndView = new ModelAndView("FundReq.jsp");
        if (lid == null) {
        	modelAndView = new ModelAndView("Login.jsp");
            modelAndView.addObject("errorMessage", "No user is logged in.");
            return modelAndView;
        }
        modelAndView.addObject("Message", "Rejected");
        bankService.deleteFund(id);
        Optional<Transaction> ot = bankService.getTransaction(id,rid,amount,"Fund transfer","pending");
        if(ot.isPresent()) {
        	Transaction t = ot.get();
        	t.setStatus("Rejected");
        	bankService.insertTransaction(t);
        	modelAndView.addObject("Message","rejected");
        }
        else {
        	modelAndView.addObject("Message","error");
        }
        return modelAndView;
    }
    @RequestMapping(value="/DisplayTransactions")
    public ModelAndView DisplayTransactions(HttpServletRequest request) {
        Long lid = (Long) request.getSession().getAttribute("LoggedID");
        modelAndView = new ModelAndView("TransactionDetails.jsp");
        if (lid == null) {
        	modelAndView = new ModelAndView("Login.jsp");
            modelAndView.addObject("errorMessage", "No user is logged in.");
            return modelAndView;
        }
    	modelAndView = new ModelAndView("TransactionDetails.jsp");
    	List<Transaction> tlist = bankService.getAll();
    	if(tlist.isEmpty()) {
    		modelAndView.addObject("Message","No Transactions existed");
    	}
    	else {
    		modelAndView.addObject("Message","content");
    		modelAndView.addObject("transactions",tlist);
    	}
    	return modelAndView;
    }
}