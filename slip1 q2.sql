declare
detail policy_info%rowtype;
cursor c is select * from policy_info where client_no=1 order by pdate;
Begin
open c;
loop
 fetch c into detail;
 exit when c%notfound;
 dbms_output.put_line(detail.policy_no||' '||detail.descr  || ' ' || detail.maturity_amt);
end loop;
close c;
end;
