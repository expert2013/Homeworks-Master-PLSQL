/*Автор: Гуковский Василий
Описание скрипта: Демонстрация анонимных блоков.  
Вывод сообщений в буфер вывода с использованием процедуры: dbms_output.put_line().*/

-- Создание платежа
declare
   c_created constant payment.status%type := 0;
   v_message varchar2(100 char) := 'Платеж создан';
   v_current_date    date := sysdate;
   v_payment_id payment.payment_id%type := 123456780;
   v_payment_detail t_payment_detail_array := t_payment_detail_array(t_payment_detail(1,'TERMINAL_1'),
                                                                     t_payment_detail(2,'192.168.101.1'),
                                                                     t_payment_detail(3,'Перевод через Терминал 1'));
begin

  if v_payment_detail is not empty then
        
    for i in v_payment_detail.first..v_payment_detail.last loop
      
      if (v_payment_detail(i).field_id is null) then
        dbms_output.put_line('ID поля не может быть пустым');
      end if;
      
      if (v_payment_detail(i).field_value is null) then
        dbms_output.put_line('Значение в поле не может быть пустым');
      end if;
      
      dbms_output.put_line('Field_id: '|| v_payment_detail(i).field_id|| '. Value: '||v_payment_detail(i).field_value);    
    end loop;
  
  else
      dbms_output.put_line('Коллекция не содержит данных'); 
  end if;
  
  dbms_output.put_line(v_message ||'. Статус: '|| c_created);
  dbms_output.put_line(to_char(v_current_date, 'yyyy-mm-dd'));
  dbms_output.put_line(v_payment_id);
end;
/
-- Сброс платежа в "ошибочный статус"
declare
   c_error constant payment.status%type := 2; 
   v_reason payment.status_change_reason%type := 'недостаточно средств'; 
   v_message varchar2(100 char) := 'Сброс платежа в "ошибочный статус" с указанием причины. Статус: '; 
   v_current_date    date := sysdate;
   v_payment_id payment.payment_id%type := 123456781;
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
   c_cancel constant payment.status%type := 3;
   v_reason payment.status_change_reason%type := 'Причина: ошибка пользователя';
   v_message varchar2(100 char) := 'Отмена платежа с указанием причины. Статус: ';
   v_current_date    date := sysdate;
   v_payment_id payment.payment_id%type := 123456782;
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
   c_success           constant payment.status%type := 1;
   v_message           varchar2(100 char) := 'Успешное завершение платежа. Статус: ';
   v_current_timestamp timestamp := systimestamp;
   v_payment_id payment.payment_id%type := 123456783;
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
   v_payment_id payment.payment_id%type := 123456784;
   v_payment_detail t_payment_detail_array := t_payment_detail_array(t_payment_detail(2,'192.168.101.2'),
                                                                     t_payment_detail(4,'Проверен через систему "АнтиФрод"'));
begin
  if v_payment_detail is not empty then
        
    for i in v_payment_detail.first..v_payment_detail.last loop
      
      if (v_payment_detail(i).field_id is null) then
        dbms_output.put_line('ID поля не может быть пустым');
      end if;
      
      if (v_payment_detail(i).field_value is null) then
        dbms_output.put_line('Значение в поле не может быть пустым');
      end if;
      
      dbms_output.put_line('Field_id: '|| v_payment_detail(i).field_id|| '. Value: '||v_payment_detail(i).field_value);    
    end loop;
  
  else
      dbms_output.put_line('Коллекция не содержит данных'); 
  end if;  

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
   v_payment_id payment.payment_id%type := 123456785;
   v_delete_payment_detail t_number_array := t_number_array(2,3);
begin
   if v_payment_id is null then
    dbms_output.put_line('ID объекта не может быть пустым');
   end if;
   
   if v_delete_payment_detail is empty then        
      dbms_output.put_line('Коллекция не содержит данных'); 
   end if;    
   
  dbms_output.put_line(v_message);
  dbms_output.put_line(to_char(v_current_timestamp,'dd-mm-rr hh.mi.ss.ff am'));
  dbms_output.put_line(v_payment_id);
  dbms_output.put_line('Количество удаленных полей: '|| v_delete_payment_detail.count());
  
end;
/
