/* 1) Создайте тип record с тремя полями. Тип полей на ваш выбор.
Одно поле без ограничений и без значения по умолчанию.
Одно поле с ограничением на not null и значением по умолчанию.
Одно поле без ограничений и со значением по умолчанию.*/

declare
  type t_rec is record(
  id number,
  name varchar2(200 char) not null := 'First Record',
  info varchar2(500 char) := 'Описание записи типа Record');

/* 2) Создайте несколько переменных с этим типом в обычном анонимном блоке.*/
v_rec t_rec;
v_rec2 t_rec;
v_rec3 t_rec;

begin
/* 3) Присвойте значения первому полю всех переменных из п.2.*/  
  v_rec.id := 123456780;
  v_rec2.id := 123456781;
  v_rec3.id := 123456782;
  
/* 4) Выведите значения полей в буфер вывода.*/
  dbms_output.put_line(v_rec.id);
  dbms_output.put_line(v_rec2.id);
  dbms_output.put_line(v_rec3.id);
  
/* 5) Присвойте одной из переменных значение null. 
 Попробуйте сделать условие, если переменная равна null, то выводится сообщение “It’s null”. 
 Если не null, то сообщение “It’s not null”. Можно использовать case из предыдущей лекции.*/
  v_rec := null;
  case 
     when v_rec.id is null then
       dbms_output.put_line('It’s null');
     when v_rec.name is null then
       dbms_output.put_line('It’s null');
     when v_rec.info is null  then
       dbms_output.put_line('It’s null');
     else
       dbms_output.put_line('It’s not null'); 
  end case; 
 
end;  
/

/* 6) Создайте запись с использованием rowtype от таблицы payment_detail_field. 
Создайте переменную, через select получите в неё строку из таблицы, выведите несколько полей в буфер вывода.
Пункт с повышенной сложностью (необязательный)*/

declare 
  v_payment_detail_field payment_detail_field%rowtype;
begin
  select * into v_payment_detail_field 
  from payment_detail_field p
  where p.field_id=1; 
  dbms_output.put_line(v_payment_detail_field.field_id);
  dbms_output.put_line(v_payment_detail_field.name);
  dbms_output.put_line(v_payment_detail_field.description);
end;
/         
























