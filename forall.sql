
declare
start_time timestamp;
end_time timestamp;

type virtual_table is table of forall_example%ROWTYPE index by binary_integer;
virtual_forall virtual_table;
begin

start_time := systimestamp;

for i in 1..100000 loop
  virtual_forall(i).num_col := 1;
  virtual_forall(i).char_col := 'forall';
end loop;

forall i in 1..virtual_forall.count
  insert into forall_example values (virtual_forall(i).num_col, virtual_forall(i).char_col);

end_time := systimestamp;

dbms_output.put_line(end_time - start_time);

end;