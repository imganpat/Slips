create table cp(client_no int references client(client_no), policy_no int references policy_info(policy_no));
insert into client values(01,'Rohan Mishra', 'Hadapsar,Pune','02/17/1995');
insert into client values(02,'Priya Yadav', 'Nerul,Mumbai','02/24/1998');

insert into policy_info values(1, 'Life Policy', 2000000, 3000, '01/01/2023');
insert into policy_info values(2, 'Child Policy', 800000, 1000, '06/17/2023');


create or replace function total_maturity_amount(cno in int) return int is
 amt int;
begin
 select maturity_amt into amt from policy_info where client_no = cno;
 return amt;
end;
/

declare 
 i int;
 tamt int;
begin 
i:=:i;
tamt:=total_maturity_amount(i);
dbms_output.put_line('Total Maturity AMount is '||tamt);
end;



