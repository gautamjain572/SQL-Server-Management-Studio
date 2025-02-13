alter procedure xpindia_new_designation  -- create store
(
	@designation_name varchar(500)
)
as
begin -- start {
declare @is_desgination_created bit = 0;  -- declare variable
declare @vc_creation_status varchar(200) = 'somthing went wrong!';

declare @no_of_desgination_added int = 0;

declare @canProccedForAaddingDegination bit = 0; -- for adding validations

	if(  (@designation_name is not null or @designation_name <> '') and   -- <> = not equal to
	     (select count(designation_id) from designation where designation_name = @designation_name) = 0) 
	begin
	set @canProccedForAaddingDegination = 1;
	end

   if(@canProccedForAaddingDegination =1)
   begin
   INSERT INTO designation(designation_name)
   values(@designation_name)

   set @no_of_desgination_added = @@ROWCOUNT

      if(@no_of_desgination_added = 1)
      begin 
      set @is_desgination_created = 1
      set @vc_creation_status = concat(@designation_name,' is succesfully created')
      end
      else
      begin 
      set @is_desgination_created = 0
      set @vc_creation_status = 'somthing went wrong!'
      end
   end

select @is_desgination_created as created,@vc_creation_status as createdstatus
end;  -- end }
exec xpindia_new_designation 'CEO0' -- exexcution command

create procedure get_all_emp_details  -- create store to get data
as
begin
select * from employees
end
--exec get_all_emp_details

create procedure get_all_emp_details_by_id (@emp_id bigint) -- get by id
as
begin
select * from employees where employee_id = @emp_id
end
exec get_all_emp_details
--exec get_all_emp_details_by_id 1

create procedure get_all_emp_details_by_id_yearOfJoinung (@emp_year int)  -- get by joining year
as
begin
select * from employees where year(dt_joining_date) = @emp_year
end
--exec get_all_emp_details_by_id_yearOfJoinung 2021

create procedure get_all_emp_details_join  -- joins
as
begin
select * from employees e join designation d on d.designation_id = e.designation_id
end
exec get_all_emp_details_join