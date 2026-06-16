🏦 Online Banking System

A full-stack web-based banking application built with Java EE (JSP & Servlets) and MySQL, supporting multiple user roles including Customer, Staff, Loan Officer, and Admin.


📌 Features

👤 Customer


Register and login securely
View account details and balance
Deposit and withdraw funds
View full transaction history
Apply for loans
Raise, view, and track support tickets


🧑‍💼 Banking Staff


View and manage customer support tickets
Resolve and respond to complaints


🏛️ Loan Officer


View and manage loan applications
Approve or reject loan requests
Add, edit, and delete loan records


🔐 Admin


Manage all users
Access admin dashboard
Full system oversight



🛠️ Technologies Used

LayerTechnologyFrontendJSP, HTML, CSSBackendJava Servlets, JSPDatabaseMySQLConnectivityJDBCArchitectureMVC (Model-View-Controller)ServerApache TomcatIDEEclipse


📁 Project Structure

PROJECT/
├── src/
│   └── main/
│       ├── java/
│       │   ├── controller/       # Servlets for core logic
│       │   ├── model/            # Data models (User, Transaction, Loan, Ticket)
│       │   ├── dao/              # Data Access Objects
│       │   ├── servlet/          # Feature-specific servlets
│       │   ├── adminDAO/         # Admin data access
│       │   ├── adminModel/       # Admin models
│       │   └── database/         # DB connection class
│       └── webapp/
│           ├── *.jsp             # All JSP pages
│           ├── css/              # Stylesheets
│           └── images/           # Image assets


⚙️ How to Run


Clone the repository


bash   git clone https://github.com/bhathiya106/online-banking-system.git


Import into Eclipse

Open Eclipse → File → Import → Existing Maven Project
Select the cloned folder



Set up the database

Open MySQL and create a database (e.g. banking_db)
Import the SQL schema file if provided
Update DB credentials in src/main/java/database/DBconnection.java



Configure Tomcat

Add Apache Tomcat server in Eclipse
Right-click project → Run As → Run on Server



Access the app

Open browser and go to http://localhost:8080/PROJECT
