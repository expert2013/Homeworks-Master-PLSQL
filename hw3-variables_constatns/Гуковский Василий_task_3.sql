/*�����: ��������� �������
�������� �������: ������������ ��������� ������.  
����� ��������� � ����� ������ � �������������� ���������: dbms_output.put_line().*/

-- �������� �������
declare
   c_created constant number(1) := 0;
   v_message varchar2(50) := '������ ������';
begin
  dbms_output.put_line(v_message ||'. ������: '|| c_created);
end;
/
-- ����� ������� � "��������� ������"
declare
   c_error constant number(1) := 2; 
   v_reason varchar2(50) := '������������ �������'; 
   v_message varchar2(130) := '����� ������� � "��������� ������" � ��������� �������. ������: '; 
begin
  dbms_output.put_line(v_message || c_error ||'. �������: '|| v_reason);
end;
/
-- ������ ������� � ��������� �������
declare
   c_cancel constant number(1) := 3;
   v_reason varchar2(100) := '�������: ������ ������������';
   v_message varchar2(100) := '������ ������� � ��������� �������. ������: ';
begin
  dbms_output.put_line(v_message || c_cancel ||'. '|| v_reason);
end;
/
-- �������� ���������� �������
declare
   c_success constant number(1) := 1;
   v_message varchar2(100) := '�������� ���������� �������. ������: ';
begin
  dbms_output.put_line(v_message || c_success);
end;
/
-- ���������� ��� ���������� �������
declare
   v_message varchar2(130) := '������ ������� ��������� ��� ��������� �� ������ id_����/��������';
begin
  dbms_output.put_line(v_message);
end;
/
-- �������� ������� �������
declare
   v_message varchar2(130) := '������ ������� ������� �� ������ id_�����';
begin
  dbms_output.put_line(v_message);
end;
/
