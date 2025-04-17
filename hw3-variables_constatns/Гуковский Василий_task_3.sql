/*Автор: Гуковский Василий
Описание скрипта: Демонстрация анонимных блоков.  
Вывод сообщений в буфер вывода с использованием процедуры: dbms_output.put_line().*/

declare
c_create number(1) := 0;
c_success number(1) := 1;
c_reset number(1) := 2;
c_cancel number(1) := 3;

v_balance varchar2(50) := 'недостаточно средств'; 
v_error varchar2(50) := 'ошибка пользователя';

v_add_payments varchar2(120) := 'Данные платежа добавлены или обновлены по списку id_поля/значение';
v_del_payments varchar2(100) := 'Детали платежа удалены по списку id_полей';
begin
-- Создание платежа
begin
  dbms_output.put_line('Платеж создан. Статус: '|| c_create);
end;

-- Сброс платежа в "ошибочный статус"
begin
  dbms_output.put_line('Сброс платежа в "ошибочный статус" с указанием причины. Статус: '|| c_reset ||'. Причина: '|| v_balance);
end;

-- Отмена платежа с указанием причины
begin
  dbms_output.put_line('Отмена платежа с указанием причины. Статус: '|| c_cancel ||'. Причина: ' || v_error);
end;

-- Успешное завершение платежа
begin
  dbms_output.put_line('Успешное завершение платежа. Статус: '|| c_success);
end;

-- Добавление или обновление платежа
begin
  dbms_output.put_line(v_add_payments);
end;

-- Удаление деталей платежа
begin
  dbms_output.put_line(v_del_payments);
end;

end;
/





