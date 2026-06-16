package model;

public class User {

    // Personal Details
    private String fullName;
    private String dateOfBirth;
    private String nic;
    private String address;
    private String contactNumber;
    private String email;

    // Banking Details
    private String accountNumber;
    private String branchName;

    // Login Credentials
    private String username;
    private String password;

    // Constructor
    public User(String fullName, String dateOfBirth, String nic, String address,
                String contactNumber, String email, String accountNumber,
                String branchName, String username, String password) {
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.nic = nic;
        this.address = address;
        this.contactNumber = contactNumber;
        this.email = email;
        this.accountNumber = accountNumber;
        this.branchName = branchName;
        this.username = username;
        this.password = password;
    }
    
    public User() {
        // default constructor
    }

    // Getters and Setters
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(String dateOfBirth) { this.dateOfBirth = dateOfBirth; }

    public String getNic() { return nic; }
    public void setNic(String nic) { this.nic = nic; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getContactNumber() { return contactNumber; }
    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getAccountNumber() { return accountNumber; }
    public void setAccountNumber(String accountNumber) { this.accountNumber = accountNumber; }

    public String getBranchName() { return branchName; }
    public void setBranchName(String branchName) { this.branchName = branchName; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
