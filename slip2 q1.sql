create or replace  function total_supplier(iname in varchar) return int is
supplier_count int;
begin
select count(supplier_no) into supplier_count from supplier s, item i where s.item_no = i.item_no and item_name = iname;
return supplier_count;
end;
/

declare 
c int;
iname varchar(10); 
begin
iname:=:iname;
c:=total_supplier(iname);
dbms_output.put_line('Total Supplier:  '||c);
end;
/







create table item(item_no int primary key, item_name varchar2(10));
create table supplier(supplier_no int primary key, supplier_name varchar2(10), address varchar(20), city varchar2(10), item_no int references item(item_no))
create table si(item_no int references item(item_no), supplier_no int references supplier(supplier_no),rate int,  quantity int);

insert into item values(1, 'Phone');
insert into item values(2, 'Laptop');

insert into supplier values(01, 'Dhirubhai', 'Ambani villa, katraj',  'Pune', 1);
insert into supplier values(02, 'Gautam', 'Adani palace, Nerul',  'Mumbai', 2);

insert into si values(1, 01, 20000, 50);
insert into si values(2, 02, 60000, 10);
