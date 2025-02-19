create database BankApp

CREATE TABLE BankDetails (
    BankID INT PRIMARY KEY IDENTITY(1,1),
    BankName VARCHAR(255) NOT NULL,
    ISFCCode VARCHAR(255) NOT NULL,
    Branch VARCHAR(255) NOT NULL,
    BankAddress VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL
);

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

select * from BankDetails
select * from AccountHolderDetails

ALTER PROCEDURE InsertBankDetails  
(  
    @BankName VARCHAR(255),  
    @ISFCCode VARCHAR(255),  
    @Branch VARCHAR(255),  
    @BankAddress VARCHAR(255),  
    @City VARCHAR(255),  
    -- Output parameters for success/failure status  
    @isBankAdded BIT OUTPUT,  
    @bankAddedStatus VARCHAR(400) OUTPUT  
)  
AS  
BEGIN  
    SET @isBankAdded = 0;  
    SET @bankAddedStatus = 'Something went wrong in SP';  
    -- Check for empty fields  
    IF @BankName = '' OR @ISFCCode = '' OR @Branch = '' OR @BankAddress = '' OR @City = ''  
    BEGIN  
        SET @bankAddedStatus = 'All fields are required';  
        RETURN;  
    END  
    -- Check for duplicate ISFC Code  
    IF EXISTS (SELECT 1 FROM BankDetails WHERE ISFCCode = @ISFCCode)  
    BEGIN  
        SET @bankAddedStatus = CONCAT('Duplicate ISFC Code is not allowed (', @ISFCCode, ')');  
        RETURN;  
    END  
    DECLARE @noOfBanksAdded INT = 0;  
    -- Insert bank details  
    INSERT INTO BankDetails (BankName, ISFCCode, Branch, BankAddress, City)  
    VALUES (@BankName, @ISFCCode, @Branch, @BankAddress, @City);  
    SET @noOfBanksAdded = @@ROWCOUNT;  
    SET @isBankAdded = IIF(@noOfBanksAdded > 0, 1, 0);  
    -- Success message  
    IF (@isBankAdded = 1)  
    BEGIN  
        SET @bankAddedStatus = CONCAT(@BankName, ' has been successfully added to BankDetails');  
    END  
END;
DECLARE @isBankAdded BIT, @bankAddedStatus VARCHAR(400);
EXEC InsertBankDetails  
    @BankName = 'State Bank of India',  
    @ISFCCode = 'SBIN0001234',  
    @Branch = 'Mumbai Main',  
    @BankAddress = '123, MG Road, Mumbai',  
    @City = 'Mumbai',  
    @isBankAdded = @isBankAdded OUTPUT,  
    @bankAddedStatus = @bankAddedStatus OUTPUT; 

CREATE PROCEDURE GetAllBankDetails  
AS  
BEGIN  
    SET NOCOUNT ON;  
    SELECT BankID, BankName, ISFCCode, Branch, BankAddress, City  
    FROM BankDetails;  
END;
EXEC GetAllBankDetails;

CREATE PROCEDURE UpdateBankDetails  
(  
    @ID INT,  
    @BankName VARCHAR(255),  
    @ISFCCode VARCHAR(255),  
    @Branch VARCHAR(255),  
    @BankAddress VARCHAR(255),  
    @City VARCHAR(255),  
    -- Output parameters for success/failure status  
    @isBankUpdated BIT OUTPUT,  
    @bankUpdateStatus VARCHAR(400) OUTPUT  
)  
AS  
BEGIN  
    SET @isBankUpdated = 0;  
    SET @bankUpdateStatus = 'Something went wrong in SP';  
    -- Check if the bank ID exists  
    IF NOT EXISTS (SELECT 1 FROM BankDetails WHERE BankID = @ID)  
    BEGIN  
        SET @bankUpdateStatus = CONCAT('Bank ID ', @ID, ' not found.');  
        RETURN;  
    END  
    -- Check for empty fields  
    IF @BankName = '' OR @ISFCCode = '' OR @Branch = '' OR @BankAddress = '' OR @City = ''  
    BEGIN  
        SET @bankUpdateStatus = 'All fields are required';  
        RETURN;  
    END  
    -- Check for duplicate ISFC Code (excluding current record)  
    IF EXISTS (SELECT 1 FROM BankDetails WHERE ISFCCode = @ISFCCode AND BankID <> @ID)  
    BEGIN  
        SET @bankUpdateStatus = CONCAT('Duplicate ISFC Code is not allowed (', @ISFCCode, ')');  
        RETURN;  
    END  
    -- Update the record  
    UPDATE BankDetails  
    SET  
        BankName = @BankName,  
        ISFCCode = @ISFCCode,  
        Branch = @Branch,  
        BankAddress = @BankAddress,  
        City = @City  
    WHERE BankID = @ID;  
    -- Check if any row was affected  
    IF @@ROWCOUNT > 0  
    BEGIN  
        SET @isBankUpdated = 1;  
        SET @bankUpdateStatus = CONCAT('Bank details updated successfully for ID ', @ID);  
    END  
END;
--DECLARE @isBankUpdated BIT, @bankUpdateStatus VARCHAR(400);
/*EXEC UpdateBankDetails  
    @ID = 1,  
    @BankName = 'HDFC Bank',  
    @ISFCCode = 'HDFC0001234',  
    @Branch = 'Chennai Main',  
    @BankAddress = '456, Anna Salai, Chennai',  
    @City = 'Chennai',  
    @isBankUpdated = @isBankUpdated OUTPUT,  
    @bankUpdateStatus = @bankUpdateStatus OUTPUT; */

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
    @ATMPin CHAR(4),  -- Default PIN is 1234  
    @PhoneNumber VARCHAR(20),  
    @Email VARCHAR(255),  
    @Address VARCHAR(500),  

    -- Output parameters for success/failure status  
    @isAccountAdded BIT OUTPUT,  
    @accountAddedStatus VARCHAR(400) OUTPUT  
)  
AS  
BEGIN  
    SET @isAccountAdded = 0;  
    SET @accountAddedStatus = 'Something went wrong in SP';  
    -- Check for empty required fields  
    IF @AccountHolderName = '' OR @Gender = '' OR @AccountNumber = '' OR @PANCard = '' OR   
       @AadharCard = '' OR @ATMCardNumber = '' OR @CVV IS NULL OR @PhoneNumber = '' OR @Email = ''  
    BEGIN  
        SET @accountAddedStatus = 'All required fields must be provided';  
        RETURN;  
    END  
    -- Validate Gender  
    IF @Gender NOT IN ('Male', 'Female', 'Other')  
    BEGIN  
        SET @accountAddedStatus = 'Invalid gender value. Allowed: Male, Female, Other';  
        RETURN;  
    END  
    -- Check if BankID exists  
    IF NOT EXISTS (SELECT 1 FROM BankDetails WHERE BankID = @BankID)  
    BEGIN  
        SET @accountAddedStatus = CONCAT('Invalid BankID: ', @BankID);  
        RETURN;  
    END  
    -- Check for duplicate Account Number  
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE AccountNumber = @AccountNumber)  
    BEGIN  
        SET @accountAddedStatus = CONCAT('Duplicate Account Number not allowed (', @AccountNumber, ')');  
        RETURN;  
    END  
    -- Check for duplicate PAN Card  
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE PANCard = @PANCard)  
    BEGIN  
        SET @accountAddedStatus = CONCAT('Duplicate PAN Card not allowed (', @PANCard, ')');  
        RETURN;  
    END  
    -- Check for duplicate Aadhar Card  
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE AadharCard = @AadharCard)  
    BEGIN  
        SET @accountAddedStatus = CONCAT('Duplicate Aadhar Card not allowed (', @AadharCard, ')');  
        RETURN;  
    END  
    -- Check for duplicate ATM Card Number  
    IF EXISTS (SELECT 1 FROM AccountHolderDetails WHERE ATMCardNumber = @ATMCardNumber)  
    BEGIN  
        SET @accountAddedStatus = CONCAT('Duplicate ATM Card Number not allowed (', @ATMCardNumber, ')');  
        RETURN;  
    END  
    -- Insert account holder details  
    INSERT INTO AccountHolderDetails (AccountHolderName, Gender, AccountNumber, BankID, Balance, PANCard, AadharCard, ATMCardNumber, CVV, ATMPin, PhoneNumber, Email, Address, CreatedDate)  
    VALUES (@AccountHolderName, @Gender, @AccountNumber, @BankID, @Balance, @PANCard, @AadharCard, @ATMCardNumber, @CVV, @ATMPin, @PhoneNumber, @Email, @Address, GETDATE());  
    -- Check if insertion was successful  
    IF @@ROWCOUNT > 0  
    BEGIN  
        SET @isAccountAdded = 1;  
        SET @accountAddedStatus = CONCAT('Account created successfully for ', @AccountHolderName);  
    END  
END;
DECLARE @isAccountAdded BIT, @accountAddedStatus VARCHAR(400);
EXEC InsertAccountHolderDetails  
    @AccountHolderName = 'John Doe',  
    @Gender = 'Male',  
    @AccountNumber = '1234567890129',  
    @BankID = 4,  
    @Balance = 5000.00,  
    @PANCard = 'ABCDE1234h',  
    @AadharCard = '123456789014',  
    @ATMCardNumber = '4000123412341236',  
    @CVV = 123,  
    @ATMPin = '1234',  -- Will default to '1234'  
    @PhoneNumber = '9876543215',  
    @Email = 'john.doe@exampl.com',  
    @Address = '123, Main Street, New York',  
    @isAccountAdded = @isAccountAdded OUTPUT,  
    @accountAddedStatus = @accountAddedStatus OUTPUT;  
SELECT @isAccountAdded AS IsAccountAdded, @accountAddedStatus AS StatusMessage;

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
    ORDER BY CreatedDate DESC;  -- Latest accounts first  
END;
EXEC GetAllAccountHolders;

