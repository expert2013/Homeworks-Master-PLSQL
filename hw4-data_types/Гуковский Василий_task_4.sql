/*�����: ��������� �������
�������� �������: ������������ ��������� ������.  
����� ��������� � ����� ������ � �������������� ���������: dbms_output.put_line().*/

-- �������� �������
declare
   c_created constant number(10) := 0;
   v_message varchar2(100 char) := '������ ������';
   v_current_date    date := sysdate;
begin
  dbms_output.put_line(v_message ||'. ������: '|| c_created || '. ' || to_char(v_current_date, 'yyyy-mm-dd'));
end;
/
-- ����� ������� � "��������� ������"
declare
   c_error constant number(10) := 2; 
   v_reason varchar2(50 char) := '������������ �������'; 
   v_message varchar2(100 char) := '����� ������� � "��������� ������" � ��������� �������. ������: '; 
   v_current_date    date := sysdate;
begin
  dbms_output.put_line(v_message || c_error ||'. �������: '|| v_reason || '. '|| TO_CHAR(v_current_date, 'YYYY-MM-DD HH24:MI:SS'));
end;
/
-- ������ ������� � ��������� �������
declare
   c_cancel constant number(10) := 3;
   v_reason varchar2(50 char) := '�������: ������ ������������';
   v_message varchar2(100 char) := '������ ������� � ��������� �������. ������: ';
   v_current_date    date := sysdate;
begin
  dbms_output.put_line(v_message || c_cancel ||'. '|| v_reason || '. '|| TO_CHAR(v_current_date, 'DD/MON/YY HH24:MI:SS'));
end;
/
-- �������� ���������� �������
declare
   c_success           constant number(10) := 1;
   v_message           varchar2(100 char) := '�������� ���������� �������. ������: ';
   v_current_timestamp timestamp := systimestamp;
begin
  dbms_output.put_line(v_message || c_success || '. '|| TO_CHAR(v_current_timestamp, 'DD/MM/YY HH24:MI:SS.SSSSS'));
end;
/
-- ���������� ��� ���������� �������
declare
   v_message varchar2(100 char) := '������ ������� ��������� ��� ��������� �� ������ id_����/��������';
   v_current_timestamp timestamp := systimestamp;
begin
  dbms_output.put_line(v_message || '. '|| TO_CHAR(v_current_timestamp,'YYYY-MM-DD HH24: MI: SS.FF'));
end;
/
-- �������� ������� �������
declare
   v_message varchar2(100 char) := '������ ������� ������� �� ������ id_�����';
   v_current_timestamp timestamp := systimestamp;
begin
  dbms_output.put_line(v_message || '. '|| TO_CHAR(v_current_timestamp,'DD-MM-RR HH.MI.SS.FF AM'));
end;
/
