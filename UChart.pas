unit UChart;

interface

type
  TInfo = record   //���������� � ����������
    CntCompare: Integer;    //���������� ���������
    CntMove: Integer;       //���������� �����������
  end;

  //�� �������� ����� ������� ���������� ���������� � ����������
  function CulcSort(N: Integer): TInfo;

implementation



//������� ����� ��������� � �����������
function CulcSort(N: integer): TInfo;

  function CountStep(k: integer): integer; //�-� ��� ���������� ���� (3^k-1)/2
  var
    i: integer;
  begin
      Result:= 1;
      for i:= 1 to k do
          Result:= 3 * Result;
      Result:= (Result - 1) div 2;
  end;

var
  mas : array of Integer;
  i, k, step, p, l, T, el: integer;
  ok: Boolean;
begin
  SetLength(mas,N);
  for i:=0 to N-1 do  //������� � ��������� ������ ���������� ����������
    mas[i]:=  Random(100);

  with Result do
    begin
      CntCompare:= 0;    //���������
      CntMove:= 0;    //�����������
      T:= Trunc(Ln(n) / Ln(3)); // ���������� ���������� �����
      for k:= T downto 1 do
        begin
          step:= CountStep(k); //��������� ��������� ���
          for p := 1 to step do //��������� ���������� ��������� ��� ���� �����
            begin
              i:= step + p;
              while i <= N do
                begin
                  el:= mas[i];
                  l:= i - step;
                  ok:= False;
                  while (l >= 1) and not ok do
                    begin
                      Inc(CntCompare);    //����������� ������� ���������
                      if (el < mas[l]) then
                        begin
                          mas[l + step]:= mas[l];
                          Inc(CntMove); //����������� ������� �����������
                          l:= l - step;
                        end
                      else
                        ok:= True;
                    end;
                  Inc(CntCompare);    //����������� ������� ���������
                  if (l < i - step) then
                    begin
                      mas[l + step]:= el;
                      Inc(CntMove);  //����������� ������� �����������
                    end;
                  i:= i + step;
                end;
            end;
        end;
    end;
end;

end.
