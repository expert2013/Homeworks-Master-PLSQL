/*�����: ��������� �������
�������� �������: ������������ ��������� ������.  
����� ��������� � ����� ������ � �������������� ���������: dbms_output.put_line().*/

-- �������� �������
declare
   c_created constant number(10) := 0;
   v_message varchar2(100 char) := '������ ������';
   v_current_date    date := sysdate;
begin
  dbms_output.put_line(v_message ||'. ������: '|| c_created);
  dbms_output.put_line(to_char(v_current_date, 'yyyy-mm-dd'));
end;
/
-- ����� ������� � "��������� ������"
declare
   c_error constant number(10) := 2; 
   v_reason varchar2(50 char) := '������������ �������'; 
   v_message varchar2(100 char) := '����� ������� � "��������� ������" � ��������� �������. ������: '; 
   v_current_date    date := sysdate;
begin
  dbms_output.put_line(v_message || c_error ||'. �������: '|| v_reason);
  dbms_output.put_line(to_char(v_current_date, 'yyyy-mm-dd hh24:mi:ss'));
end;
/
-- ������ ������� � ��������� �������
declare
   c_cancel constant number(10) := 3;
   v_reason varchar2(50 char) := '�������: ������ ������������';
   v_message varchar2(100 char) := '������ ������� � ��������� �������. ������: ';
   v_current_date    date := sysdate;
begin
  dbms_output.put_line(v_message || c_cancel ||'. '|| v_reason);
  dbms_output.put_line(to_char(v_current_date, 'dd/mon/yy hh24:mi:ss'));
end;
/
-- �������� ���������� �������
declare
   c_success           constant number(10) := 1;
   v_message           varchar2(100 char) := '�������� ���������� �������. ������: ';
   v_current_timestamp timestamp := systimestamp;
begin
  dbms_output.put_line(v_message || c_success);
  dbms_output.put_line(to_char(v_current_timestamp, 'dd/mm/yy hh24:mi:ss.sssss'));
end;
/
-- ���������� ��� ���������� �������
declare
   v_message varchar2(100 char) := '������ ������� ��������� ��� ��������� �� ������ id_����/��������';
   v_current_timestamp timestamp := systimestamp;
begin
  dbms_output.put_line(v_message);
  dbms_output.put_line(to_char(v_current_timestamp,'yyyy-mm-dd hh24: mi: ss.ff'));
end;
/
-- �������� ������� �������
declare
   v_message varchar2(100 char) := '������ ������� ������� �� ������ id_�����';
   v_current_timestamp timestamp := systimestamp;
begin
  dbms_output.put_line(v_message);
  dbms_output.put_line(to_char(v_current_timestamp,'dd-mm-rr hh.mi.ss.ff am'));
end;
/
