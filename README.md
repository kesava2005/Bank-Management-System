# 🏦 Bank Management System

A full-stack Java-based banking application that supports core banking operations for both users and administrators. Built using **Spring Boot**, **Spring MVC**, **Hibernate (JPA)**, **MySQL**, and **JSP**, this project implements real-world banking features like fund transfers, transaction tracking, and admin approvals.

---

## 🔑 Key Features

### 👤 User Functionalities
- Register and log in securely
- View account balance and profile
- Deposit and withdraw money
- Request fund transfers to other users
- View transaction history

### 🛡️ Admin Functionalities
- View and manage all registered users
- Approve or reject pending fund transfer requests
- Monitor user activities

---

## 🧰 Tech Stack

| Layer         | Technologies Used                       |
|--------------|------------------------------------------|
| Frontend      | JSP, HTML, CSS, Bootstrap                |
| Backend       | Java, Spring Boot, Spring MVC            |
| ORM & DB      | Hibernate (JPA), MySQL                   |
| Build Tool    | Maven                                   |
| Server        | Apache Tomcat 10                         |

---

## 📁 Folder Structure

```
BankManagement/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/bankmanagement/...
│       ├── resources/
│       │   ├── application.properties
│       └── webapp/
│           └── WEB-INF/
│               └── views/         # JSP Files
├── pom.xml
```

---

## ⚙️ Getting Started

### ✅ Prerequisites
- Java 17+
- Maven
- MySQL
- IDE (IntelliJ, Eclipse, etc.)

### 🚀 Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/kesava2005/Bank-Management-System.git
   ```

2. **Configure MySQL Database**
   - Create a database (e.g., `bankdb`)
   - Set your DB credentials in `application.properties`:
     ```properties
     spring.datasource.url=jdbc:mysql://localhost:3306/bankdb
     spring.datasource.username=root
     spring.datasource.password=yourpassword
     spring.jpa.hibernate.ddl-auto=update
     ```

3. **Build and Run**
   ```bash
   mvn clean install
   mvn spring-boot:run
   ```

4. **Access the application**
   ```
   http://localhost:8080/
   ```

---

## 🔮 Future Enhancements

- Convert to RESTful API (in progress)
- React frontend integration
- Docker support
- Unit testing and validation
- Email/SMS notifications

---

## 👨‍💻 Author

**Varati Kesava**  
Java Full Stack | Spring Boot | MERN Stack | ML Projects
