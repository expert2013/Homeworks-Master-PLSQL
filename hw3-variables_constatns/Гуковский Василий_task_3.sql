/*�����: ��������� �������
�������� �������: ������������ ��������� ������.  
����� ��������� � ����� ������ � �������������� ���������: dbms_output.put_line().*/

declare
c_create number(1) := 0;
c_success number(1) := 1;
c_reset number(1) := 2;
c_cancel number(1) := 3;

v_balance varchar2(50) := '������������ �������'; 
v_error varchar2(50) := '������ ������������';

v_add_payments varchar2(120) := '������ ������� ��������� ��� ��������� �� ������ id_����/��������';
v_del_payments varchar2(100) := '������ ������� ������� �� ������ id_�����';
begin
-- �������� �������
begin
  dbms_output.put_line('������ ������. ������: '|| c_create);
end;

-- ����� ������� � "��������� ������"
begin
  dbms_output.put_line('����� ������� � "��������� ������" � ��������� �������. ������: '|| c_reset ||'. �������: '|| v_balance);
end;

-- ������ ������� � ��������� �������
begin
  dbms_output.put_line('������ ������� � ��������� �������. ������: '|| c_cancel ||'. �������: ' || v_error);
end;

-- �������� ���������� �������
begin
  dbms_output.put_line('�������� ���������� �������. ������: '|| c_success);
end;

-- ���������� ��� ���������� �������
begin
  dbms_output.put_line(v_add_payments);
end;

-- �������� ������� �������
begin
  dbms_output.put_line(v_del_payments);
end;

end;
/





