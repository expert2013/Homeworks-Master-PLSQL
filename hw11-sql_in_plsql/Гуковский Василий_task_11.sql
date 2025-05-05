/*Автор: Гуковский Василий
Описание скрипта: Демонстрация анонимных блоков.  
Вывод сообщений в буфер вывода с использованием процедуры: dbms_output.put_line().*/

-- Создание платежа
declare
   c_created constant payment.status%type := 0;
   v_message varchar2(100 char) := 'Платеж создан';
   v_current_date    date := sysdate;
   v_payment_id payment.payment_id%type := 7;
   v_summa number(30,2)  :=100000;
   v_currency_id number(3) := 643;
   v_from_client_id number(30);
   v_to_client_id number(30); 
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
  
  -- Создание платежа
  insert into payment(payment_id,
                      create_dtime,
                      summa,
                      currency_id,
                      from_client_id,
                      to_client_id )
              values(payment_seq.nextval,v_current_date,v_summa,v_currency_id,1,2) 
              returning  payment_id into v_payment_id;   
   dbms_output.put_line('Payment_id of new payment: '||v_payment_id);
   
   -- Добавление данных платежа              
                        
  insert into payment_detail(payment_id,
                              field_id,
                              field_value)    
  select v_payment_id, value(t).field_id, value(t).field_value 
  from table(v_payment_detail)t;                           
  
end;
/
-- Сброс платежа в "ошибочный статус"
declare
   c_error constant payment.status%type := 2; 
   v_reason payment.status_change_reason%type := 'недостаточно средств'; 
   v_message varchar2(100 char) := 'Сброс платежа в "ошибочный статус" с указанием причины. Статус: '; 
   v_current_date    date := sysdate;
   v_payment_id payment.payment_id%type := 7;
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
 
  update payment p set p.status = c_error, p.status_change_reason = v_reason
  where p.payment_id = v_payment_id
  and p.status = 0;
end;
/
-- Отмена платежа с указанием причины
declare
   c_cancel constant payment.status%type := 3;
   v_reason payment.status_change_reason%type := 'Причина: ошибка пользователя';
   v_message varchar2(100 char) := 'Отмена платежа с указанием причины. Статус: ';
   v_current_date    date := sysdate;
   v_payment_id payment.payment_id%type := 7;
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
  
  update payment p set p.status = c_cancel, p.status_change_reason = v_reason
  where p.payment_id = v_payment_id
  and p.status = 0;
end;
/
-- Успешное завершение платежа
declare
   c_success           constant payment.status%type := 1;
   v_message           varchar2(100 char) := 'Успешное завершение платежа. Статус: ';
   v_current_timestamp timestamp := systimestamp;
   v_payment_id payment.payment_id%type := 7;
begin
  dbms_output.put_line(v_message || c_success);
  dbms_output.put_line(to_char(v_current_timestamp, 'dd/mm/yy hh24:mi:ss.sssss'));
  dbms_output.put_line(v_payment_id);
  if v_payment_id is null then
    dbms_output.put_line('ID объекта не может быть пустым');
  end if;
  
  update payment p set p.status = c_success
  where p.payment_id = v_payment_id
  and p.status = 0;
end;
/
-- Добавление или обновление платежа
declare
   v_message varchar2(100 char) := 'Данные платежа добавлены или обновлены по списку id_поля/значение';
   v_current_timestamp timestamp := systimestamp;
   v_payment_id payment.payment_id%type := 7;
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
  
  --Вставка / обновление данных
  merge into payment_detail o
  using (select v_payment_id payment_id
        ,value(t).field_id field_id
        ,value(t).field_value field_value
        from table(v_payment_detail)t ) n
  on (o.payment_id = n.payment_id and o.field_id = n.field_id)  
  when matched then
    update  set o.field_value = n.field_value
  when not matched then  
    insert (payment_id, field_id, field_value)
    values (n.payment_id, n.field_id, n.field_value);
end;
/

-- Удаление деталей платежа
declare
   v_message varchar2(100 char) := 'Детали платежа удалены по списку id_полей';
   v_current_timestamp timestamp := systimestamp;
   v_payment_id payment.payment_id%type := 7;
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
  
  delete payment_detail pd
  where pd.payment_id = v_payment_id
  and pd.field_id in (select value(t) from table(v_delete_payment_detail)t);
  
end;
/
