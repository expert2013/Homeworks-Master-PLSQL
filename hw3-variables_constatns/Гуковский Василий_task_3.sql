/*Автор: Гуковский Василий
Описание скрипта: Демонстрация анонимных блоков.  
Вывод сообщений в буфер вывода с использованием процедуры: dbms_output.put_line().*/

-- Создание платежа
declare
   c_created constant number(1) := 0;
   v_message varchar2(50) := 'Платеж создан';
begin
  dbms_output.put_line(v_message ||'. Статус: '|| c_created);
end;
/
-- Сброс платежа в "ошибочный статус"
declare
   c_error constant number(1) := 2; 
   v_reason varchar2(50) := 'недостаточно средств'; 
   v_message varchar2(130) := 'Сброс платежа в "ошибочный статус" с указанием причины. Статус: '; 
begin
  dbms_output.put_line(v_message || c_error ||'. Причина: '|| v_reason);
end;
/
-- Отмена платежа с указанием причины
declare
   c_cancel constant number(1) := 3;
   v_reason varchar2(100) := 'Причина: ошибка пользователя';
   v_message varchar2(100) := 'Отмена платежа с указанием причины. Статус: ';
begin
  dbms_output.put_line(v_message || c_cancel ||'. '|| v_reason);
end;
/
-- Успешное завершение платежа
declare
   c_success constant number(1) := 1;
   v_message varchar2(100) := 'Успешное завершение платежа. Статус: ';
begin
  dbms_output.put_line(v_message || c_success);
end;
/
-- Добавление или обновление платежа
declare
   v_message varchar2(130) := 'Данные платежа добавлены или обновлены по списку id_поля/значение';
begin
  dbms_output.put_line(v_message);
end;
/
-- Удаление деталей платежа
declare
   v_message varchar2(130) := 'Детали платежа удалены по списку id_полей';
begin
  dbms_output.put_line(v_message);
end;
/
