--create database practise

-- QUERY 1
CREATE TABLE Interns
(
 intern_id bigint PRIMARY KEY IDENTITY(1,1),
intern_name varchar(500),
 salary decimal(18,2),
 email varchar(500),
 mobile_number varchar(20),
 joining_date datetime,
 internship_status bit DEFAULT 0,
 gpa decimal(18,2) CHECK (gpa BETWEEN 0 AND 10),
 perfomance_rating int CHECK (perfomance_rating BETWEEN 0 AND 10),
 working_hours int,
 study_field_id bigint
)
-- QUERY 2
 CREATE TABLE StudyFields(
 study_field_id bigint PRIMARY KEY IDENTITY(1,1),
 study_field_name varchar(100)
 )
 -- QUERY 3
 CREATE TABLE Skills
 (
 skill_id bigint PRIMARY KEY IDENTITY(1,1),
 skill_name varchar(50)
 )
 -- QUERY 4
 CREATE TABLE InternSkills
 (
 intern_skill_id bigint PRIMARY KEY IDENTITY(1,1),
intern_id bigint,
skill_id bigint
 )

INSERT INTO StudyFields (study_field_name) VALUES
('Computer Science'),
('Mechanical Engineering'),
('Electrical Engineering'),
('Civil Engineering'),
('Biotechnology'),
('Data Science'),
('Medicine'),
('Business Administration'),
('Psychology'),
('Environmental Science');

INSERT INTO Skills (skill_name) VALUES
('Java'),
('Python'),
('C#'),
('SQL'),
('JavaScript'),
('React'),
('Angular'),
('Node.js'),
('.NET Core'),
('Git');

INSERT INTO Interns (intern_name, salary, email, mobile_number, joining_date, internship_status, gpa,
perfomance_rating, working_hours, study_field_id) VALUES
('Alice Johnson', 15000.00, 'alice.johnson@example.com', '9876543210', '2025-01-01', 1, 8.5, 9, 40, 1),
('Bob Smith', 12000.00, 'bob.smith@example.com', '9876543211', '2025-01-02', 0, 7.8, 8, 35, 2),
('Charlie Brown', 14000.00, 'charlie.brown@example.com', '9876543212', '2025-01-03', 1, 8.2, 7, 40, 3),
('David Lee', 16000.00, 'david.lee@example.com', '9876543213', '2025-01-04', 0, 9.0, 10, 40, 4),
('Eva White', 11000.00, 'eva.white@example.com', '9876543214', '2025-01-05', 1, 7.5, 6, 35, 5),
('Frank Green', 14500.00, 'frank.green@example.com', '9876543215', '2025-01-06', 1, 8.8, 9, 40, 6),
('Grace Black', 15500.00, 'grace.black@example.com', '9876543216', '2025-01-07', 0, 9.2, 8, 40, 7),
('Henry Clark', 13000.00, 'henry.clark@example.com', '9876543217', '2025-01-08', 1, 7.9, 7, 35, 8),
('Ivy Turner', 12500.00, 'ivy.turner@example.com', '9876543218', '2025-01-09', 0, 8.1, 9, 40, 9),
('Jack Harris', 13500.00, 'jack.harris@example.com', '9876543219', '2025-01-10', 1, 7.6, 6, 40, 10),
('Karen Lewis', 11000.00, 'karen.lewis@example.com', '9876543220', '2025-01-11', 0, 8.3, 8, 35, 1),
('Liam Young', 14500.00, 'liam.young@example.com', '9876543221', '2025-01-12', 1, 8.7, 9, 40, 2),
('Mia Adams', 15000.00, 'mia.adams@example.com', '9876543222', '2025-01-13', 0, 8.4, 7, 40, 3),
('Noah Scott', 14000.00, 'noah.scott@example.com', '9876543223', '2025-01-14', 1, 7.7, 8, 35, 4),
('Olivia King', 12000.00, 'olivia.king@example.com', '9876543224', '2025-01-15', 0, 9.1, 10, 40, 5),
('Paul Hall', 13500.00, 'paul.hall@example.com', '9876543225', '2025-01-16', 1, 8.0, 6, 40, 6),
('Quincy Allen', 15000.00, 'quincy.allen@example.com', '9876543226', '2025-01-17', 0, 9.3, 9, 40, 7),
('Rachel Nelson', 15500.00, 'rachel.nelson@example.com', '9876543227', '2025-01-18', 1, 8.6, 7, 35, 8),
('Samuel Carter', 14500.00, 'samuel.carter@example.com', '9876543228', '2025-01-19', 0, 8.9, 10, 40, 9),
('Tina Mitchell', 11000.00, 'tina.mitchell@example.com', '9876543229', '2025-01-20', 1, 7.8, 8, 35, 10),
('Ursula Perez', 12000.00, 'ursula.perez@example.com', '9876543230', '2025-01-21', 0, 8.2, 9, 40, 1),
('Victor Roberts', 13000.00, 'victor.roberts@example.com', '9876543231', '2025-01-22', 1, 7.4, 7, 35, 2),
('Wendy Scott', 14000.00, 'wendy.scott@example.com', '9876543232', '2025-01-23', 0, 8.5, 8, 40, 3),
('Xander Evans', 12500.00, 'xander.evans@example.com', '9876543233', '2025-01-24', 1, 9.0, 9, 40, 4),
('Yasmine Torres', 13000.00, 'yasmine.torres@example.com', '9876543234', '2025-01-25', 0, 8.1, 6, 35, 5),
('Zane Parker', 11000.00, 'zane.parker@example.com', '9876543235', '2025-01-26', 1, 7.6, 7, 40, 6),
('Alice Gomez', 14000.00, 'alice.gomez@example.com', '9876543236', '2025-01-27', 0, 8.3, 8, 40, 7),
('Bob Foster', 14500.00, 'bob.foster@example.com', '9876543237', '2025-01-28', 1, 8.8, 9, 40, 8),
('Clara Bennett', 13500.00, 'clara.bennett@example.com', '9876543238', '2025-01-29', 0, 7.9, 7, 35, 9),
('Daniel Price', 16000.00, 'daniel.price@example.com', '9876543239', '2025-01-30', 1, 9.1, 10, 40, 10);

INSERT INTO InternSkills (intern_id, skill_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7),
(4, 8),
(4, 9),
(5, 10),
(6, 1),
(6, 3),
(7, 2),
(7, 4),
(8, 5),
(8, 7),
(9, 6),
(9, 8),
(10, 9),
(10, 1),
(11, 2),
(12, 4),
(12, 5),
(13, 6),
(13, 10),
(14, 1),
(14, 3),
(15, 7),
(15, 9),
(16, 2),
(16, 4),
(17, 8),
(17, 1),
(18, 5),
(18, 6),
(19, 3),
(19, 7),
(20, 4),
(20, 9),
(21, 2),
(21, 6),
(22, 8),
(22, 10),
(23, 3),
(23, 7),
(24, 1),
(24, 6),
(25, 2),
(25, 5),
(26, 7),
(26, 8),
(27, 3),
(27, 6),
(28, 9),
(28, 1),
(29, 4),
(29, 5),
(30, 2);

select * from Interns
select * from Skills
select * from InternSkills
select * from StudyFields

--getting Sp
sp_helptext GetAllInterns

delete from Interns where intern_id = 36  -- hard delete --delete permanemtly

-- add coulmn in table -- adding purpose is soft delete
alter table Interns
add isInternDeleted bit  default 0
-- add data in new created column
update Interns set isInternDeleted = 0 where isInternDeleted is null

-- staring store procedure

alter PROCEDURE GetAllInterns  -- get all interns
AS
BEGIN
    SELECT * FROM Interns where isInternDeleted = 0;
END;
exec GetAllInterns

CREATE PROCEDURE InsertStudyField  -- insert new study feild
    @study_field_name VARCHAR(100)
AS
BEGIN
    INSERT INTO StudyFields (study_field_name)
    VALUES (@study_field_name);
END;
exec InsertStudyField 'internet of things 2'

CREATE PROCEDURE InsertSkill  -- add new skill
    @skill_name VARCHAR(50)
AS
BEGIN
    INSERT INTO Skills (skill_name)
    VALUES (@skill_name);
END;
exec InsertSkill 'gsap'

alter PROCEDURE InsertIntern  -- insert intern
(   -- add new intern
    @intern_name VARCHAR(500),
    @salary DECIMAL(18,2),
    @email VARCHAR(500),
    @mobile_number VARCHAR(20),
    @joining_date DATETIME,
    @internship_status BIT,
    @gpa DECIMAL(18,2),
    @perfomance_rating INT,
    @working_hours INT,
    @study_field_id BIGINT,
	--parameter to check success fail status
	@isInternAdded bit output,
	@internAddedStatus varchar(400) output 
)
AS
BEGIN
	 set @isInternAdded   = 0
	 set @internAddedStatus  = 'somthing went wrong sp'

	--study feild validaion
	if not exists(select study_field_id from StudyFields where study_field_id = @study_field_id)  -- validation here because this is db level
	begin
	set @internAddedStatus = 'invalid study feild id'
	return
	end
	-- email and mobile no. unique validation
	if exists(select intern_id from Interns where mobile_number = @mobile_number)
	begin
	set @internAddedStatus = concat('duplicate mob no. is not allow (',@mobile_number,')')
	return
	end
	if exists(select intern_id from Interns where email = @email)
	begin
	set @internAddedStatus = concat('duplicate email is not allow (',@email,')')
	return
	end

	declare @noOfInternAdded int = 0

	INSERT INTO Interns (intern_name, salary, email, mobile_number, joining_date, internship_status, gpa, perfomance_rating, working_hours, study_field_id)
    VALUES (@intern_name, @salary, @email, @mobile_number, @joining_date, @internship_status, @gpa, @perfomance_rating, @working_hours, @study_field_id);

	set @noOfInternAdded = @@ROWCOUNT
	set @isInternAdded = IIF(@noOfInternAdded > 0 ,1,0)
	if(@isInternAdded = 1)
	begin
	set @internAddedStatus = concat(@intern_name,'has succesfully added as a intern')
	end
END;
--exec InsertIntern 'gautam3',15000,'gautamjain1@gamil.com','7570062267','2023-10-01 09:00:00',1,8.5,10,40,1
--DECLARE @isInternAdded BIT;
--DECLARE @internAddedStatus VARCHAR(400);
EXEC InsertIntern 
    @intern_name = 'John Doe',
    @salary = 1000.00,
    @email = 'johndoe@example.com',
    @mobile_number = '123-456-7890',
    @joining_date = '2023-10-01 09:00:00',
    @internship_status = 1,
    @gpa = 3.75,
    @perfomance_rating = 4,
    @working_hours = 40,
    @study_field_id = 1,
	@isInternAdded = @isInternAdded output,
	@internAddedStatus = @internAddedStatus output

create PROCEDURE SoftDelete  --- soft delete
(   
	@intern_id bigint,

    @isInterndeleted bit output,
	@interndeletedStatus varchar(400) output
)
AS
BEGIN
	 set @isInterndeleted = 0
	 set @interndeletedStatus = 'somthing went wrong , faild to remove item'

	 if not exists(select intern_id from Interns where intern_id = @intern_id)
	 begin
	 set @interndeletedStatus = 'unable to find  intern details'
	 end

	 if((select isInternDeleted from Interns where intern_id = @intern_id) =1)
	 begin
		SET @interndeletedStatus = 'iNTERNIS ALREADY DELETED'
		RETURN
	 end

	 declare @noOfInternDeleted int = 0

	 update Interns set isInternDeleted = 1 where intern_id = @intern_id
	 
	 set @noOfInternDeleted = @@ROWCOUNT

	 set @isInterndeleted = IIF(@noOfInternDeleted > 0 ,1,0)

	 if(@isInterndeleted = 1)
	 begin
	 set @interndeletedStatus = 'Intern DELETED'
	 end

END;
--DECLARE @isInterndeleted BIT; DECLARE @interndeletedStatus VARCHAR(400);
exec SoftDelete 36 , @isInterndeleted = @isInterndeleted output, @interndeletedStatus = @interndeletedStatus output

CREATE PROCEDURE AssignSkillsToIntern -- assign skill to intern
    @intern_id BIGINT,
    @skill_ids VARCHAR(MAX) -- Comma-separated list of skill IDs
AS
BEGIN
    DECLARE @skill_id INT;
    DECLARE @pos INT;
    -- Loop through the skill IDs and insert into InternSkills
    WHILE LEN(@skill_ids) > 0
    BEGIN
        SET @pos = CHARINDEX(',', @skill_ids);
        IF @pos = 0
        BEGIN
            SET @skill_id = CAST(@skill_ids AS INT);
            INSERT INTO InternSkills (intern_id, skill_id) VALUES (@intern_id, @skill_id);
            BREAK;
        END;
        SET @skill_id = CAST(LEFT(@skill_ids, @pos - 1) AS INT);
        INSERT INTO InternSkills (intern_id, skill_id) VALUES (@intern_id, @skill_id);
        SET @skill_ids = SUBSTRING(@skill_ids, @pos + 1, LEN(@skill_ids));
    END;
END;
exec AssignSkillsToIntern 31,'1,4,7'

CREATE PROCEDURE AddInternSkill --Add a New Intern Skill Assignment
    @intern_id BIGINT,
    @skill_id BIGINT
AS
BEGIN
    INSERT INTO InternSkills (intern_id, skill_id)
    VALUES (@intern_id, @skill_id);
END;

CREATE PROCEDURE GetAllStudyFields --Get All Study Fields
AS
BEGIN
    SELECT * FROM StudyFields;
END;

CREATE PROCEDURE GetInternDetailsById  --Get Intern Details By Id
    @intern_id BIGINT
AS
BEGIN
    SELECT 
        i.intern_id,
        i.intern_name,
        i.salary,
        i.email,
        i.mobile_number,
        i.joining_date,
        i.internship_status,
        i.gpa,
        i.perfomance_rating,
        i.working_hours,
        s.study_field_name,
        STRING_AGG(sk.skill_name, ', ') AS skills
    FROM Interns i
    JOIN StudyFields s ON i.study_field_id = s.study_field_id
    LEFT JOIN InternSkills isk ON i.intern_id = isk.intern_id
    LEFT JOIN Skills sk ON isk.skill_id = sk.skill_id
    WHERE i.intern_id = @intern_id
    GROUP BY i.intern_id, i.intern_name, i.salary, i.email, i.mobile_number, i.joining_date, i.internship_status, i.gpa, i.perfomance_rating, i.working_hours, s.study_field_name;
END;

CREATE PROCEDURE GetInternsByStudyField  --Get Intern Details by Study Field
    @study_field_id BIGINT
AS
BEGIN
    SELECT 
        i.intern_id,
        i.intern_name,
        i.salary,
        i.email,
        i.mobile_number,
        i.joining_date,
        i.internship_status,
        i.gpa,
        i.perfomance_rating,
        i.working_hours,
        s.study_field_name
    FROM Interns i
    JOIN StudyFields s ON i.study_field_id = s.study_field_id
    WHERE i.study_field_id = @study_field_id;
END;

CREATE PROCEDURE GetAllSkills --Get All Skills
AS
BEGIN
    SELECT * FROM Skills;
END;
--exec GetAllSkills

CREATE PROCEDURE GetSkillsForIntern --Get Skills for an Intern
    @intern_id BIGINT
AS
BEGIN
    SELECT sk.skill_name
    FROM InternSkills isk
    JOIN Skills sk ON isk.skill_id = sk.skill_id
    WHERE isk.intern_id = @intern_id;
END;

CREATE PROCEDURE UpdateInternDetails --Update Intern Details
    @intern_id BIGINT,
    @intern_name VARCHAR(500),
    @salary DECIMAL(18,2),
    @email VARCHAR(500)
AS
BEGIN
    UPDATE Interns
    SET 
        intern_name = @intern_name,
        salary = @salary,
        email = @email
    WHERE intern_id = @intern_id;
END;

CREATE PROCEDURE UpdateInternshipStatus --Update Internship Status
    @intern_id BIGINT,
    @internship_status BIT
AS
BEGIN
    UPDATE Interns
    SET internship_status = @internship_status
    WHERE intern_id = @intern_id;
END;

CREATE PROCEDURE DeleteInternById --  Delete Intern By Id
    @intern_id BIGINT
AS
BEGIN
    DELETE FROM InternSkills WHERE intern_id = @intern_id;
    DELETE FROM Interns WHERE intern_id = @intern_id;
END;
    @intern_id BIGINT
AS
BEGIN
    DELETE FROM InternSkills WHERE intern_id = @intern_id;
    DELETE FROM Interns WHERE intern_id = @intern_id;
END;

CREATE PROCEDURE RemoveSkillFromIntern --Remove Skill from Intern
    @intern_id BIGINT,
    @skill_id BIGINT
AS
BEGIN
    DELETE FROM InternSkills
    WHERE intern_id = @intern_id AND skill_id = @skill_id;
END;