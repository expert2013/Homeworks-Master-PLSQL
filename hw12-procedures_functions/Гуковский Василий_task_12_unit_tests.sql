--Заготовка под Unit-тесты

-- Проверка функции "Создание платежа"
declare 
v_payment_detail t_payment_detail_array := t_payment_detail_array(t_payment_detail(1,'TERMINAL_1'),
                                                                     t_payment_detail(2,'192.168.101.1'),
                                                                     t_payment_detail(3,'Перевод через Терминал 1')); 
v_payment_id payment.payment_id%type;                                                                      
begin
  v_payment_id := create_payment(p_payment_detail => v_payment_detail,
                                 p_summa => 150000,
                                 p_currency_id => 643,
                                 p_from_client_id => 1,
                                 p_to_client_id => 2,
                                 p_current_timestamp => systimestamp);
  dbms_output.put_line('Payment_id: '|| v_payment_id);
  commit;
end; 
/

select * from payment p where p.payment_id = 65;
select * from payment_detail pd  where pd.payment_id = 65 order by pd.field_id;

-- Проверка процедуры "Сброс платежа в "ошибочный статус""
declare 
v_payment_id payment.payment_id%type := 65;
v_reason payment.status_change_reason%type := 'недостаточно средств';
begin
  fail_payment(p_payment_id => v_payment_id,p_reason => v_reason,p_current_timestamp => systimestamp);
end;
/

select * from payment p where p.payment_id = 65;

-- Проверка процедуры "Отмена платежа с указанием причины"
declare
v_payment_id payment.payment_id%type := 65;
v_reason payment.status_change_reason%type := 'Причина: ошибка пользователя';
begin
  cancel_payment(p_payment_id => v_payment_id,p_reason => v_reason,p_current_timestamp => systimestamp);
end;
/

select * from payment p where p.payment_id = 65;

-- Проверка процедуры "Успешное завершение платежа"
declare
v_payment_id payment.payment_id%type := 65;
begin
  successful_finish_payment(p_payment_id => v_payment_id,p_current_timestamp => systimestamp);
end;
/

select * from payment p where p.payment_id = 65;

-- Проверка процедуры "Добавление или обновление платежа"
declare
v_payment_id payment.payment_id%type := 65;
v_payment_detail t_payment_detail_array := t_payment_detail_array(t_payment_detail(2,'192.168.101.2'),
                                                                     t_payment_detail(4,'Проверен через систему "АнтиФрод"'));
begin
  insert_or_update_payment_detail(p_payment_id => v_payment_id,p_payment_detail => v_payment_detail,p_current_timestamp => systimestamp);
end;
/

select * from payment_detail pd  where pd.payment_id = 65 order by pd.field_id;
      
-- Проверка процедуры "Удаление деталей платежа"
declare
v_payment_id payment.payment_id%type := 65;
v_delete_payment_detail t_number_array := t_number_array(2,3);
begin
 delete_payment_detail(p_payment_id => v_payment_id,p_delete_payment_detail => v_delete_payment_detail,p_current_timestamp => systimestamp); 
end;
/

select * from payment_detail pd  where pd.payment_id = 65 order by pd.field_id;