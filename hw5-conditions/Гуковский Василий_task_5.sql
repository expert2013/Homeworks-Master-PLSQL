/*Автор: Гуковский Василий
Описание скрипта: Демонстрация анонимных блоков.  
Вывод сообщений в буфер вывода с использованием процедуры: dbms_output.put_line().*/

-- Создание платежа
declare
   c_created constant number(10) := 0;
   v_message varchar2(100 char) := 'Платеж создан';
   v_current_date    date := sysdate;
   v_payment_id number(38) := 123456780;
begin
  dbms_output.put_line(v_message ||'. Статус: '|| c_created);
  dbms_output.put_line(to_char(v_current_date, 'yyyy-mm-dd'));
  dbms_output.put_line(v_payment_id);
end;
/
-- Сброс платежа в "ошибочный статус"
declare
   c_error constant number(10) := 2; 
   v_reason varchar2(50 char) := 'недостаточно средств'; 
   v_message varchar2(100 char) := 'Сброс платежа в "ошибочный статус" с указанием причины. Статус: '; 
   v_current_date    date := sysdate;
   v_payment_id number(38) := 123456781;
begin
  dbms_output.put_line(v_message || c_error ||'. Причина: '|| v_reason);
  dbms_output.put_line(to_char(v_current_date, 'yyyy-mm-dd hh24:mi:ss'));
  dbms_output.put_line(v_payment_id);
  
  if v_payment_id is null then
    dbms_output.put_line('ID объекта не может быть пустым');
  end if;
  
  if v_reason is null then
    dbms_output.put_line('Причина не может быть пустой');
  end if;
end;
/
-- Отмена платежа с указанием причины
declare
   c_cancel constant number(10) := 3;
   v_reason varchar2(50 char) := 'Причина: ошибка пользователя';
   v_message varchar2(100 char) := 'Отмена платежа с указанием причины. Статус: ';
   v_current_date    date := sysdate;
   v_payment_id number(38) := 123456782;
begin
  dbms_output.put_line(v_message || c_cancel ||'. '|| v_reason);
  dbms_output.put_line(to_char(v_current_date, 'dd/mon/yy hh24:mi:ss'));
  dbms_output.put_line(v_payment_id);
  if v_payment_id is null then
    dbms_output.put_line('ID объекта не может быть пустым');
  end if;
  
  if v_reason is null then
    dbms_output.put_line('Причина не может быть пустой');
  end if;
end;
/
-- Успешное завершение платежа
declare
   c_success           constant number(10) := 1;
   v_message           varchar2(100 char) := 'Успешное завершение платежа. Статус: ';
   v_current_timestamp timestamp := systimestamp;
   v_payment_id number(38) := 123456783;
begin
  dbms_output.put_line(v_message || c_success);
  dbms_output.put_line(to_char(v_current_timestamp, 'dd/mm/yy hh24:mi:ss.sssss'));
  dbms_output.put_line(v_payment_id);
  if v_payment_id is null then
    dbms_output.put_line('ID объекта не может быть пустым');
  end if;
end;
/
-- Добавление или обновление платежа
declare
   v_message varchar2(100 char) := 'Данные платежа добавлены или обновлены по списку id_поля/значение';
   v_current_timestamp timestamp := systimestamp;
   v_payment_id number(38) := 123456784;
begin
  dbms_output.put_line(v_message);
  dbms_output.put_line(to_char(v_current_timestamp,'yyyy-mm-dd hh24: mi: ss.ff'));
  dbms_output.put_line(v_payment_id);
  if v_payment_id is null then
    dbms_output.put_line('ID объекта не может быть пустым');
  end if;
end;
/
-- Удаление деталей платежа
declare
   v_message varchar2(100 char) := 'Детали платежа удалены по списку id_полей';
   v_current_timestamp timestamp := systimestamp;
   v_payment_id number(38) := 123456785;
begin
  dbms_output.put_line(v_message);
  dbms_output.put_line(to_char(v_current_timestamp,'dd-mm-rr hh.mi.ss.ff am'));
  dbms_output.put_line(v_payment_id);
  if v_payment_id is null then
    dbms_output.put_line('ID объекта не может быть пустым');
  end if;
end;
/
