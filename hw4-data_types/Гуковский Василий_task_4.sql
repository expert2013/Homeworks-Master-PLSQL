/*Автор: Гуковский Василий
Описание скрипта: Демонстрация анонимных блоков.  
Вывод сообщений в буфер вывода с использованием процедуры: dbms_output.put_line().*/

-- Создание платежа
declare
   c_created constant number(10) := 0;
   v_message varchar2(100 char) := 'Платеж создан';
   v_current_date    date := sysdate;
begin
  dbms_output.put_line(v_message ||'. Статус: '|| c_created || '. ' || to_char(v_current_date, 'yyyy-mm-dd'));
end;
/
-- Сброс платежа в "ошибочный статус"
declare
   c_error constant number(10) := 2; 
   v_reason varchar2(50 char) := 'недостаточно средств'; 
   v_message varchar2(100 char) := 'Сброс платежа в "ошибочный статус" с указанием причины. Статус: '; 
   v_current_date    date := sysdate;
begin
  dbms_output.put_line(v_message || c_error ||'. Причина: '|| v_reason || '. '|| TO_CHAR(v_current_date, 'YYYY-MM-DD HH24:MI:SS'));
end;
/
-- Отмена платежа с указанием причины
declare
   c_cancel constant number(10) := 3;
   v_reason varchar2(50 char) := 'Причина: ошибка пользователя';
   v_message varchar2(100 char) := 'Отмена платежа с указанием причины. Статус: ';
   v_current_date    date := sysdate;
begin
  dbms_output.put_line(v_message || c_cancel ||'. '|| v_reason || '. '|| TO_CHAR(v_current_date, 'DD/MON/YY HH24:MI:SS'));
end;
/
-- Успешное завершение платежа
declare
   c_success           constant number(10) := 1;
   v_message           varchar2(100 char) := 'Успешное завершение платежа. Статус: ';
   v_current_timestamp timestamp := systimestamp;
begin
  dbms_output.put_line(v_message || c_success || '. '|| TO_CHAR(v_current_timestamp, 'DD/MM/YY HH24:MI:SS.SSSSS'));
end;
/
-- Добавление или обновление платежа
declare
   v_message varchar2(100 char) := 'Данные платежа добавлены или обновлены по списку id_поля/значение';
   v_current_timestamp timestamp := systimestamp;
begin
  dbms_output.put_line(v_message || '. '|| TO_CHAR(v_current_timestamp,'YYYY-MM-DD HH24: MI: SS.FF'));
end;
/
-- Удаление деталей платежа
declare
   v_message varchar2(100 char) := 'Детали платежа удалены по списку id_полей';
   v_current_timestamp timestamp := systimestamp;
begin
  dbms_output.put_line(v_message || '. '|| TO_CHAR(v_current_timestamp,'DD-MM-RR HH.MI.SS.FF AM'));
end;
/
