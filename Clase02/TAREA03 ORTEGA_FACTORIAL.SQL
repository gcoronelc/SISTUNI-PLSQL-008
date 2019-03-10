create or replace function SCOTT.F_FACTORIAL (facto number) return number
is

   temp number;
   suma number := 1;

begin
  temp := facto;
  while temp>0 loop
      suma := temp*suma;
      temp := temp-1;
  end loop;
  return suma;
end;


select SCOTT.F_FACTORIAL(5) from dual
