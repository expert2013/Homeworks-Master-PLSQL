/*�����: ��������� �������
�������� �������: ������������ ��������� ������.  
����� ��������� � ����� ������ � �������������� ���������: dbms_output.put_line().*/

-- �������� �������
declare
   c_created constant number(10) := 0;
   v_message varchar2(100 char) := '������ ������';
   v_current_date    date := sysdate;
   v_payment_id number(38) := 123456780;
begin
  dbms_output.put_line(v_message ||'. ������: '|| c_created);
  dbms_output.put_line(to_char(v_current_date, 'yyyy-mm-dd'));
  dbms_output.put_line(v_payment_id);
end;
/
-- ����� ������� � "��������� ������"
declare
   c_error constant number(10) := 2; 
   v_reason varchar2(50 char) := '������������ �������'; 
   v_message varchar2(100 char) := '����� ������� � "��������� ������" � ��������� �������. ������: '; 
   v_current_date    date := sysdate;
   v_payment_id number(38) := 123456781;
begin
  dbms_output.put_line(v_message || c_error ||'. �������: '|| v_reason);
  dbms_output.put_line(to_char(v_current_date, 'yyyy-mm-dd hh24:mi:ss'));
  dbms_output.put_line(v_payment_id);
  
  if v_payment_id is null then
    dbms_output.put_line('ID ������� �� ����� ���� ������');
  end if;
  
  if v_reason is null then
    dbms_output.put_line('������� �� ����� ���� ������');
  end if;
end;
/
-- ������ ������� � ��������� �������
declare
   c_cancel constant number(10) := 3;
   v_reason varchar2(50 char) := '�������: ������ ������������';
   v_message varchar2(100 char) := '������ ������� � ��������� �������. ������: ';
   v_current_date    date := sysdate;
   v_payment_id number(38) := 123456782;
begin
  dbms_output.put_line(v_message || c_cancel ||'. '|| v_reason);
  dbms_output.put_line(to_char(v_current_date, 'dd/mon/yy hh24:mi:ss'));
  dbms_output.put_line(v_payment_id);
  if v_payment_id is null then
    dbms_output.put_line('ID ������� �� ����� ���� ������');
  end if;
  
  if v_reason is null then
    dbms_output.put_line('������� �� ����� ���� ������');
  end if;
end;
/
-- �������� ���������� �������
declare
   c_success           constant number(10) := 1;
   v_message           varchar2(100 char) := '�������� ���������� �������. ������: ';
   v_current_timestamp timestamp := systimestamp;
   v_payment_id number(38) := 123456783;
begin
  dbms_output.put_line(v_message || c_success);
  dbms_output.put_line(to_char(v_current_timestamp, 'dd/mm/yy hh24:mi:ss.sssss'));
  dbms_output.put_line(v_payment_id);
  if v_payment_id is null then
    dbms_output.put_line('ID ������� �� ����� ���� ������');
  end if;
end;
/
-- ���������� ��� ���������� �������
declare
   v_message varchar2(100 char) := '������ ������� ��������� ��� ��������� �� ������ id_����/��������';
   v_current_timestamp timestamp := systimestamp;
   v_payment_id number(38) := 123456784;
begin
  dbms_output.put_line(v_message);
  dbms_output.put_line(to_char(v_current_timestamp,'yyyy-mm-dd hh24: mi: ss.ff'));
  dbms_output.put_line(v_payment_id);
  if v_payment_id is null then
    dbms_output.put_line('ID ������� �� ����� ���� ������');
  end if;
end;
/
-- �������� ������� �������
declare
   v_message varchar2(100 char) := '������ ������� ������� �� ������ id_�����';
   v_current_timestamp timestamp := systimestamp;
   v_payment_id number(38) := 123456785;
begin
  dbms_output.put_line(v_message);
  dbms_output.put_line(to_char(v_current_timestamp,'dd-mm-rr hh.mi.ss.ff am'));
  dbms_output.put_line(v_payment_id);
  if v_payment_id is null then
    dbms_output.put_line('ID ������� �� ����� ���� ������');
  end if;
end;
/
