unit USort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, TeEngine, Series, TeeProcs, Chart,
  ComCtrls;

const
  N = 13;   //���������� ��������� � ���������������� ������� ��� ����������
  ssleep = 700;   //�������� � ��
  tab = '       '; //������

type
  TIndex = 1..N;    //���-������� �������
  TElem = Integer;  //���-������� �������
  TMas = array[TIndex] of TElem;   //���-������

  procedure RandomFill(var mas: TMas);  //���������� ������� ���������� �������
  function ToString(mas: TMas): string;    //��������� ������ � ���� ������
  procedure ShellSort(var mas: TMas; var lb: TListBox); //���������� ����� � ������� �������� �� listbox

implementation

//���������� ������� ���������� ������� (� ��������� 1-99)
procedure RandomFill(var mas: TMas);
var
  i: Integer;
begin
  Randomize;
  for i:= 1 to N do
    mas[i]:= 1 + Random(99);
end;

//��������� ������ � ���� ������
function ToString(mas: TMas): string;
var
  i: Integer;
begin
  Result:= '';
  for i:= 1 to N do
    Result:= Result + IntToStr(mas[i]) + ' ';
end;

//�������� i-� ������ �� lb �� ������ tab
procedure Move(var lb: TListBox; i: Integer);
var
  s: string;
begin
  s:= tab + Trim(lb.Items[i-1]);
  lb.Items[i-1]:= s;
end;

//������� ������ i-� ������ �� lb
procedure MoveBack(var lb: TListBox; i: Integer);
var
  s: string;
begin
  s:= Trim(lb.Items[i-1]);
  lb.Items[i-1]:= s;
end;

//������ ������� i-� � j-� ������ �� lb
procedure Swap(var lb: TListBox; i,j: Integer);
var
  s: string;
begin
  s:= lb.Items[i-1];
  lb.Items[i-1]:= lb.Items[j-1];
  lb.Items[j-1]:= s;
end;

procedure ShellSort(var mas: TMas; var lb: TListBox);

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
  i, k, step, p, l, T: integer;
  el: TElem;
begin
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

                  //�������� � listbox
                  Move(lb,i);
                  Move(lb,l);
                  Application.ProcessMessages;   //����� �� listbox ����������� ���������
                  sleep(ssleep);

                  while (l >= 1) and (el < mas[l]) do
                    begin

                      //�������� � listbox
                      Move(lb,l);
                      Application.ProcessMessages;
                      if (l < i - step) then
                        sleep(ssleep);

                      mas[l + step]:= mas[l];

                      //�������� � listbox
                      Swap(lb,l+step,l);
                      Application.ProcessMessages;
                      sleep(ssleep);

                      //�������� � listbox
                      MoveBack(lb,l+step);
                      Application.ProcessMessages;

                      l:= l - step;
                    end;

                  if (l < i - step) then
                    begin
                      mas[l + step]:= el;

                      //�������� � listbox
                      MoveBack(lb,l+step);
                    end
                  else
                    begin
                      //�������� � listbox
                      MoveBack(lb,i);
                      MoveBack(lb,l);
                    end;

                  //�������� � listbox
                  Application.ProcessMessages;
                  sleep(ssleep);

                  i:= i + step;
                end;
          end;
      end;
 end;

end.
