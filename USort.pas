unit USort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, TeEngine, Series, TeeProcs, Chart,
  ComCtrls;

const
  N = 13;   //количество элементов в демонстрационном массиве для сортировки
  ssleep = 700;   //задержка в мс
  tab = '       '; //отступ

type
  TIndex = 1..N;    //тип-индексы массива
  TElem = Integer;  //тип-элемент массива
  TMas = array[TIndex] of TElem;   //тип-массив

  procedure RandomFill(var mas: TMas);  //заполнение массива случайными числами
  function ToString(mas: TMas): string;    //возвращат массив в виде строки
  procedure ShellSort(var mas: TMas; var lb: TListBox); //сортировка шелла с выводом процесса на listbox

implementation

//заполнение массива случайными числами (в диапазоне 1-99)
procedure RandomFill(var mas: TMas);
var
  i: Integer;
begin
  Randomize;
  for i:= 1 to N do
    mas[i]:= 1 + Random(99);
end;

//возвращат массив в виде строки
function ToString(mas: TMas): string;
var
  i: Integer;
begin
  Result:= '';
  for i:= 1 to N do
    Result:= Result + IntToStr(mas[i]) + ' ';
end;

//сдвигает i-ю строку на lb на отступ tab
procedure Move(var lb: TListBox; i: Integer);
var
  s: string;
begin
  s:= tab + Trim(lb.Items[i-1]);
  lb.Items[i-1]:= s;
end;

//удаляет отступ i-й строки на lb
procedure MoveBack(var lb: TListBox; i: Integer);
var
  s: string;
begin
  s:= Trim(lb.Items[i-1]);
  lb.Items[i-1]:= s;
end;

//меняет местами i-ю и j-ю строки на lb
procedure Swap(var lb: TListBox; i,j: Integer);
var
  s: string;
begin
  s:= lb.Items[i-1];
  lb.Items[i-1]:= lb.Items[j-1];
  lb.Items[j-1]:= s;
end;

procedure ShellSort(var mas: TMas; var lb: TListBox);

  function CountStep(k: integer): integer; //ф-я для вычисления шага (3^k-1)/2
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
    T:= Trunc(Ln(n) / Ln(3)); // определяем количество шагов
    for k:= T downto 1 do
      begin
        step:= CountStep(k); //вычисляем очередной шаг
        for p := 1 to step do //применяем сортировку вставками для всех групп
          begin
            i:= step + p;
              while i <= N do
                begin
                  el:= mas[i];
                  l:= i - step;

                  //действия с listbox
                  Move(lb,i);
                  Move(lb,l);
                  Application.ProcessMessages;   //чтобы на listbox применились изменения
                  sleep(ssleep);

                  while (l >= 1) and (el < mas[l]) do
                    begin

                      //действия с listbox
                      Move(lb,l);
                      Application.ProcessMessages;
                      if (l < i - step) then
                        sleep(ssleep);

                      mas[l + step]:= mas[l];

                      //действия с listbox
                      Swap(lb,l+step,l);
                      Application.ProcessMessages;
                      sleep(ssleep);

                      //действия с listbox
                      MoveBack(lb,l+step);
                      Application.ProcessMessages;

                      l:= l - step;
                    end;

                  if (l < i - step) then
                    begin
                      mas[l + step]:= el;

                      //действия с listbox
                      MoveBack(lb,l+step);
                    end
                  else
                    begin
                      //действия с listbox
                      MoveBack(lb,i);
                      MoveBack(lb,l);
                    end;

                  //действия с listbox
                  Application.ProcessMessages;
                  sleep(ssleep);

                  i:= i + step;
                end;
          end;
      end;
 end;

end.
