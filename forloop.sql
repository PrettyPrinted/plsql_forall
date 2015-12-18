create table forall_example (num_col number, char_col varchar2(20));

declare
start_time timestamp;
end_time timestamp;
begin

start_time := systimestamp;

for i in 1..100000 loop
  insert into forall_example values (1, 'loop insert');
end loop;

end_time := systimestamp;

dbms_output.put_line(end_time - start_time);

end;
