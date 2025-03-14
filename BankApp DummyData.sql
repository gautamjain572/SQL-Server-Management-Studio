--1 create database ---------------------
create database BankApp

--2 create table BankDetails ------------
CREATE TABLE BankDetails (
    BankID INT PRIMARY KEY IDENTITY(1,1),
    BankName VARCHAR(255) NOT NULL,
    ISFCCode VARCHAR(255) NOT NULL,
    Branch VARCHAR(255) NOT NULL,
    BankAddress VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL
);

--3 create table AccountHolderDetails ----
CREATE TABLE AccountHolderDetails (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    AccountHolderName VARCHAR(255) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    AccountNumber VARCHAR(50) UNIQUE NOT NULL,
    BankID INT NOT NULL,  -- Foreign key referencing BankDetails
    Balance DECIMAL(18,2) DEFAULT 0.00,
	PANCard VARCHAR(10) UNIQUE NOT NULL,
    AadharCard VARCHAR(12) UNIQUE NOT NULL,
    ATMCardNumber VARCHAR(20) UNIQUE NOT NULL,
    CVV INT CHECK (CVV BETWEEN 100 AND 999),
    ATMPin CHAR(4) NOT NULL,
    PhoneNumber VARCHAR(20) UNIQUE NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Address VARCHAR(500),
    CreatedDate DATETIME DEFAULT GETDATE(),
	CONSTRAINT FK_Bank FOREIGN KEY (BankID) REFERENCES BankDetails(BankID) ON DELETE CASCADE ON UPDATE CASCADE
);

--4 insert dummy data table 1 ------------
INSERT INTO BankDetails ( BankName, ISFCCode, Branch, BankAddress, City)
VALUES
( 'Kotak Mahindra Bank', 'KKBK0005678', 'JP Nagar', '89 JP Nagar, Bangalore', 'Bangalore'),
( 'Yes Bank', 'YESB0004321', 'Goregaon', '12 Goregaon East, Mumbai', 'Mumbai'),
( 'Canara Bank', 'CNRB0008765', 'Tambaram', '67 GST Road, Chennai', 'Chennai'),
( 'Bank of Baroda', 'BARB0001234', 'Karol Bagh', '99 Karol Bagh, New Delhi', 'New Delhi'),
( 'IndusInd Bank', 'INDU0003456', 'Salt Lake', '55 Salt Lake Sector 5, Kolkata', 'Kolkata'),
( 'Union Bank of India', 'UBIN0006789', 'Vashi', '23 Vashi, Navi Mumbai', 'Navi Mumbai'),
( 'IDBI Bank', 'IBKL0009123', 'Anna Nagar', '77 Anna Nagar, Chennai', 'Chennai'),
( 'Federal Bank', 'FDRL0004567', 'Electronic City', '101 Electronic City, Bangalore', 'Bangalore'),
( 'South Indian Bank', 'SIBL0007890', 'Ernakulam', '88 MG Road, Kochi', 'Kochi'),
( 'Bank of India', 'BKID0002345', 'Sector 18', '110 Sector 18, Noida', 'Noida'),
( 'Central Bank of India', 'CBIN0001111', 'Patna Junction', '75 Station Road, Patna', 'Patna'),
( 'UCO Bank', 'UCBA0005432', 'Hazratganj', '29 Hazratganj, Lucknow', 'Lucknow'),
( 'RBL Bank', 'RATN0006789', 'Chandni Chowk', '88 Chandni Chowk, Delhi', 'New Delhi'),
( 'Bandhan Bank', 'BDBL0009876', 'Howrah', '19 GT Road, Howrah', 'Howrah'),
( 'Karur Vysya Bank', 'KVBL0002222', 'Rajajinagar', '42 Rajajinagar, Bangalore', 'Bangalore');

--5 insert dummy data table 2 -----------
INSERT INTO AccountHolderDetails (AccountHolderName, Gender, AccountNumber, BankID, Balance, PANCard, AadharCard, ATMCardNumber, CVV, ATMPin, PhoneNumber, Email, Address, CreatedDate)
VALUES
('Rajesh Kumar', 'Male', 'ACC100001', 1, 50000.75, 'ABCDE1234F', '123456789012', '4000111122223333', 123, '5678', '9876543210', 'rajesh.kumar@example.com', '12 MG Road, Navi Mumbai', GETDATE()),
('Anita Sharma', 'Female', 'ACC100002', 2, 75000.00, 'FGHIJ5678K', '234567890123', '5000222233334444', 234, '6789', '8765432109', 'anita.sharma@example.com', '45 Anna Nagar, Chennai', GETDATE()),
('Vikram Singh', 'Male', 'ACC100003', 3, 120000.25, 'KLMNO9012P', '345678901234', '6000333344445555', 345, '7890', '7654321098', 'vikram.singh@example.com', '78 Electronic City, Bangalore', GETDATE()),
('Priya Iyer', 'Female', 'ACC100004', 4, 25000.50, 'PQRST3456Z', '456789012345', '7000444455556666', 456, '8901', '6543210987', 'priya.iyer@example.com', '99 MG Road, Kochi', GETDATE()),
('Rohan Mehta', 'Male', 'ACC100005', 5, 86000.75, 'UVWXY6789A', '567890123456', '8000555566667777', 567, '9012', '5432109876', 'rohan.mehta@example.com', '101 Sector 18, Noida', GETDATE()),
('Sneha Verma', 'Female', 'ACC100006', 6, 45000.00, 'BCDEF1234B', '678901234567', '9000666677778888', 678, '0123', '4321098765', 'sneha.verma@example.com', '34 Station Road, Patna', GETDATE()),
('Amit Desai', 'Male', 'ACC100007', 7, 62000.40, 'CDEFG5678C', '789012345678', '1000777788889999', 789, '1234', '3210987654', 'amit.desai@example.com', '29 Hazratganj, Lucknow', GETDATE()),
('Pooja Nair', 'Female', 'ACC100008', 8, 98000.30, 'DEFGH9012D', '890123456789', '2000888899990000', 890, '2345', '2109876543', 'pooja.nair@example.com', '88 Chandni Chowk, Delhi', GETDATE()),
('Suresh Patil', 'Male', 'ACC100009', 9, 53000.20, 'EFGHI2345E', '901234567890', '3000999900001111', 901, '3456', '1098765432', 'suresh.patil@example.com', '19 GT Road, Howrah', GETDATE()),
('Kavita Joshi', 'Female', 'ACC100010', 10, 110000.60, 'FGHIJ6789F', '012345678901', '4100111122223344', 321, '4567', '9988776655', 'kavita.joshi@example.com', '42 Rajajinagar, Bangalore', GETDATE());

-- SP1 -----------------------------------
CREATE PROCEDURE GetAllBankDetails
AS  
BEGIN  
    SET NOCOUNT ON;  
    SELECT BankID, BankName, ISFCCode, Branch, BankAddress, City  
    FROM BankDetails;  
END;

-- SP2 ------------------------------------
CREATE PROCEDURE InsertBankDetails
(  
    @BankName VARCHAR(255),  
    @ISFCCode VARCHAR(255),  
    @Branch VARCHAR(255),  
    @BankAddress VARCHAR(255),  
    @City VARCHAR(255),  
    @isBankAdded BIT OUTPUT,  
    @bankAddedStatus VARCHAR(400) OUTPUT  
)  
AS  
BEGIN  
    SET @isBankAdded = 0;  
    SET @bankAddedStatus = 'Something went wrong in SP';  
    IF @BankName = '' OR @ISFCCode = '' OR @Branch = '' OR @BankAddress = '' OR @City = ''  
    BEGIN  
        SET @bankAddedStatus = 'All fields are required';  
        RETURN;  
    END    
    IF EXISTS (SELECT 1 FROM BankDetails WHERE ISFCCode = @ISFCCode) 
    BEGIN  
        SET @bankAddedStatus = CONCAT('Duplicate ISFC Code is not allowed (', @ISFCCode, ')');  
        RETURN;  
    END  
    DECLARE @noOfBanksAdded INT = 0;  
    INSERT INTO BankDetails (BankName, ISFCCode, Branch, BankAddress, City)  
    VALUES (@BankName, @ISFCCode, @Branch, @BankAddress, @City);  
    SET @noOfBanksAdded = @@ROWCOUNT;  
    SET @isBankAdded = IIF(@noOfBanksAdded > 0, 1, 0);  
    IF (@isBankAdded = 1)  
    BEGIN  
        SET @bankAddedStatus = CONCAT(@BankName, ' has been successfully added to BankDetails');  
    END  
END;

-- SP3 ------------------------------------
CREATE PROCEDURE UpdateBankDetails  
(  
    @ID INT,  
    @BankName VARCHAR(255),  
    @ISFCCode VARCHAR(255),  
    @Branch VARCHAR(255),  
    @BankAddress VARCHAR(255),  
    @City VARCHAR(255),  
    @isBankUpdated BIT OUTPUT,  
    @bankUpdateStatus VARCHAR(400) OUTPUT  
)  
AS  
BEGIN  
    SET @isBankUpdated = 0;  
    SET @bankUpdateStatus = 'Something went wrong in SP';  
    IF NOT EXISTS (SELECT 1 FROM BankDetails WHERE BankID = @ID)  
    BEGIN  
        SET @bankUpdateStatus = CONCAT('Bank ID ', @ID, ' not found.');  
        RETURN;  
    END  
    IF @BankName = '' OR @ISFCCode = '' OR @Branch = '' OR @BankAddress = '' OR @City = ''  
    BEGIN  
        SET @bankUpdateStatus = 'All fields are required';  
        RETURN;  
    END  
    IF EXISTS (SELECT 1 FROM BankDetails WHERE ISFCCode = @ISFCCode AND BankID <> @ID)  
    BEGIN  
        SET @bankUpdateStatus = CONCAT('Duplicate ISFC Code is not allowed (', @ISFCCode, ')');  
        RETURN;  
    END  
    UPDATE BankDetails  
    SET  
        BankName = @BankName,  
        ISFCCode = @ISFCCode,  
        Branch = @Branch,  
        BankAddress = @BankAddress,  
        City = @City  
    WHERE BankID = @ID;   
    IF @@ROWCOUNT > 0  
    BEGIN  
        SET @isBankUpdated = 1;  
        SET @bankUpdateStatus = CONCAT('Bank details updated successfully for ID ', @ID);  
    END  
END;

-- SP4 -------------------------
CREATE PROCEDURE GetAllAccountHolders  
AS  
BEGIN  
    SELECT  
        AccountID,  
        AccountHolderName,  
        Gender,  
        AccountNumber,  
        BankID,  
        Balance,  
        PANCard,  
        AadharCard,  
        ATMCardNumber,  
        CVV,  
        ATMPin,  
        PhoneNumber,  
        Email,  
        Address,  
        CreatedDate  
    FROM AccountHolderDetails  
    ORDER BY CreatedDate DESC;
END;

-- SP5 -------------------------
CREATE PROCEDURE InsertAccountHolderDetails  
(  
    @AccountHolderName VARCHAR(255),  
    @Gender VARCHAR(10),  
    @AccountNumber VARCHAR(50),  
    @BankID INT,  
    @Balance DECIMAL(18,2) = 0.00,  
    @PANCard VARCHAR(10),  
    @AadharCard VARCHAR(12),  
    @ATMCardNumber VARCHAR(20),  
    @CVV INT,  
    @ATMPin CHAR(4),  
    @PhoneNumber VARCHAR(20),  
    @Email VARCHAR(255),  
    @Address VARCHAR(500),   
    @isAccountAdded BIT OUTPUT,  
    @accountAddedStatus VARCHAR(400) OUTPUT  
)  
AS  
BEGIN  
    SET @isAccountAdded = 0;  
    SET @accountAddedStatus = 'Something went wrong in SP';  
    IF @AccountHolderName = '' OR @Gender = '' OR @AccountNumber = '' OR @PANCard = '' OR   --here @AccountNumber should be need to null 
       @AadharCard = '' OR @ATMCardNumber = '' OR @CVV IS NULL OR @PhoneNumber = '' OR @Email = ''  -- also add mob or email uique validations
    BEGIN  
        SET @accountAddedStatus = 'All required fields must be provided';  
        RETURN;  
    END  
    IF @Gender NOT IN ('Male', 'Female', 'Other')  
    BEGIN  
        SET @accountAddedStatus = 'Invalid gender value. Allowed: Male, Female, Other';  
        RETURN;  
    END   
    IF NOT EXISTS (SELECT 1 FROM BankDetails WHERE BankID = @BankID)  
    BEGIN  
        SET @accountAddedStatus = CONCAT('Invalid BankID: ', @BankID);  
        RETURN;  
    END   
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE AccountNumber = @AccountNumber)  
    BEGIN  
        SET @accountAddedStatus = CONCAT('Duplicate Account Number not allowed (', @AccountNumber, ')');  
        RETURN;  
    END  
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE PANCard = @PANCard)  
    BEGIN  
        SET @accountAddedStatus = CONCAT('Duplicate PAN Card not allowed (', @PANCard, ')');  
        RETURN;  
    END  
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE AadharCard = @AadharCard)  
    BEGIN  
        SET @accountAddedStatus = CONCAT('Duplicate Aadhar Card not allowed (', @AadharCard, ')');  
        RETURN;  
    END   
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE ATMCardNumber = @ATMCardNumber)  
    BEGIN  
        SET @accountAddedStatus = CONCAT('Duplicate ATM Card Number not allowed (', @ATMCardNumber, ')');  
        RETURN;  
    END 
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE PhoneNumber = @PhoneNumber)  
    BEGIN  
        SET @accountAddedStatus = CONCAT('Duplicate Phone Number not allowed (', @PhoneNumber, ')');  
        RETURN;  
    END
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE Email = @Email)  
    BEGIN  
        SET @accountAddedStatus = CONCAT('Duplicate Email not allowed (', @Email, ')');  
        RETURN;  
    END
    INSERT INTO AccountHolderDetails (AccountHolderName, Gender, AccountNumber, BankID, Balance, PANCard, AadharCard, ATMCardNumber, CVV, ATMPin, PhoneNumber, Email, Address, CreatedDate)  
    VALUES (@AccountHolderName, @Gender, @AccountNumber, @BankID, @Balance, @PANCard, @AadharCard, @ATMCardNumber, @CVV, @ATMPin, @PhoneNumber, @Email, @Address, GETDATE()); 
    IF @@ROWCOUNT > 0  
    BEGIN  
        SET @isAccountAdded = 1;  
        SET @accountAddedStatus = CONCAT('Account created successfully for ', @AccountHolderName);  
    END  
END;

-- SP6 -----------------------
CREATE PROCEDURE UpdateAccountHolderDetails
(
    @AccountID INT,
    @AccountHolderName VARCHAR(255),
    @Gender VARCHAR(10),
    @AccountNumber VARCHAR(50),
    @BankID INT,
    @PANCard VARCHAR(10),
    @AadharCard VARCHAR(12),
    @ATMCardNumber VARCHAR(20),
    @CVV INT,
    @ATMPin CHAR(4),
    @PhoneNumber VARCHAR(20),
    @Email VARCHAR(255),
    @Address VARCHAR(500),
    @isUpdateSuccessful BIT OUTPUT,
    @updateStatusMessage VARCHAR(400) OUTPUT
)
AS
BEGIN
    SET @isUpdateSuccessful = 0;
    SET @updateStatusMessage = 'Something went wrong. Please try again.';
    IF NOT EXISTS (SELECT 1 FROM AccountHolderDetails WHERE AccountID = @AccountID)
    BEGIN
        SET @updateStatusMessage = 'Invalid Account ID.';
        RETURN;
    END
    IF @Gender NOT IN ('Male', 'Female', 'Other')
    BEGIN
        SET @updateStatusMessage = 'Invalid gender. It must be Male, Female, or Other.';
        RETURN;
    END
    IF NOT EXISTS (SELECT 1 FROM BankDetails WHERE BankID = @BankID)
    BEGIN
        SET @updateStatusMessage = 'Invalid Bank ID.';
        RETURN;
    END
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE AccountNumber = @AccountNumber AND AccountID <> @AccountID)
    BEGIN
        SET @updateStatusMessage = 'Account Number already exists.';
        RETURN;
    END
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE PANCard = @PANCard AND AccountID <> @AccountID)
    BEGIN
        SET @updateStatusMessage = 'PAN Card already exists.';
        RETURN;
    END
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE AadharCard = @AadharCard AND AccountID <> @AccountID)
    BEGIN
        SET @updateStatusMessage = 'Aadhar Card already exists.';
        RETURN;
    END
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE ATMCardNumber = @ATMCardNumber AND AccountID <> @AccountID)
    BEGIN
        SET @updateStatusMessage = 'ATM Card Number already exists.';
        RETURN;
    END
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE PhoneNumber = @PhoneNumber AND AccountID <> @AccountID)
    BEGIN
        SET @updateStatusMessage = 'Phone Number already exists.';
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE Email = @Email AND AccountID <> @AccountID)
    BEGIN
        SET @updateStatusMessage = 'Email already exists.';
        RETURN;
    END
    IF @CVV < 100 OR @CVV > 999
    BEGIN
        SET @updateStatusMessage = 'Invalid CVV. It must be a 3-digit number.';
        RETURN;
    END
    UPDATE AccountHolderDetails
    SET 
        AccountHolderName = @AccountHolderName,
        Gender = @Gender,
        AccountNumber = @AccountNumber,
        BankID = @BankID,
        PANCard = @PANCard,
        AadharCard = @AadharCard,
        ATMCardNumber = @ATMCardNumber,
        CVV = @CVV,
        ATMPin = @ATMPin,
        PhoneNumber = @PhoneNumber,
        Email = @Email,
        Address = @Address
    WHERE AccountID = @AccountID;
    IF @@ROWCOUNT > 0
    BEGIN
        SET @isUpdateSuccessful = 1;
        SET @updateStatusMessage = 'Account details updated successfully.';
    END
END;

-- SP7 ----------------------------
CREATE PROCEDURE WithdrawAmount
(
    @ATMCardNumber VARCHAR(20),
    @CVV INT,
    @ATMPin CHAR(4),
    @WithdrawalAmount DECIMAL(18,2),
    @isWithdrawalSuccessful BIT OUTPUT,
    @withdrawalStatusMessage VARCHAR(400) OUTPUT
)
AS
BEGIN
    SET @isWithdrawalSuccessful = 0;
    SET @withdrawalStatusMessage = 'Something went wrong. Please try again.';
    IF NOT EXISTS (
        SELECT 1 FROM AccountHolderDetails 
        WHERE ATMCardNumber = @ATMCardNumber AND CVV = @CVV AND ATMPin = @ATMPin
    )
    BEGIN
        SET @withdrawalStatusMessage = 'Invalid ATM details. Please check your ATM Card Number, CVV, or PIN.';
        RETURN;
    END
    DECLARE @CurrentBalance DECIMAL(18,2);
    SELECT @CurrentBalance = Balance 
    FROM AccountHolderDetails 
    WHERE ATMCardNumber = @ATMCardNumber;
    IF @CurrentBalance < @WithdrawalAmount
    BEGIN
        SET @withdrawalStatusMessage = 'Insufficient balance. Withdrawal failed.';
        RETURN;
    END
    UPDATE AccountHolderDetails
    SET Balance = Balance - @WithdrawalAmount
    WHERE ATMCardNumber = @ATMCardNumber;
    IF @@ROWCOUNT > 0
    BEGIN
        SET @isWithdrawalSuccessful = 1;
        SET @withdrawalStatusMessage = CONCAT('Withdrawal of ', @WithdrawalAmount, ' successful. Remaining balance: ', @CurrentBalance - @WithdrawalAmount);
    END
END;

-- SP8 ----------------------------------
CREATE PROCEDURE DepositAmount
(
    @AccountNumber VARCHAR(50),
    @AccountHolderName VARCHAR(255),
    @DepositAmount DECIMAL(18,2), 
    @isDepositSuccessful BIT OUTPUT,
    @depositStatusMessage VARCHAR(400) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    SET @isDepositSuccessful = 0;
    SET @depositStatusMessage = 'Something went wrong. Please try again.';
    IF NOT EXISTS (
        SELECT 1 FROM AccountHolderDetails 
        WHERE AccountNumber = @AccountNumber AND AccountHolderName = @AccountHolderName
    )
    BEGIN
        SET @depositStatusMessage = 'Invalid Account Number or Account Holder Name.';
        RETURN;
    END
    IF @DepositAmount IS NULL OR @DepositAmount <= 100
    BEGIN
        SET @depositStatusMessage = 'Invalid deposit amount. It must be greater than ₹100.';
        RETURN;
    END
    UPDATE AccountHolderDetails
    SET Balance = Balance + @DepositAmount
    WHERE AccountNumber = @AccountNumber;
    IF @@ROWCOUNT > 0
    BEGIN
        SET @isDepositSuccessful = 1;
        SET @depositStatusMessage = 'Deposit successful.';
    END
END;

-- view in sql
select * from BankDetails
select * from AccountHolderDetails