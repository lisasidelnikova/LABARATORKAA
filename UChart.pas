unit UChart;

interface

type
  TInfo = record   //информаци€ о сортировке
    CntCompare: Integer;    //количество сравнений
    CntMove: Integer;       //количество перемещений
  end;

  //по заданной длине массива возвращает информацию о сортировке
  function CulcSort(N: Integer): TInfo;

implementation



//считает число сравнений и перемещений
function CulcSort(N: integer): TInfo;

  function CountStep(k: integer): integer; //ф-€ дл€ вычислени€ шага (3^k-1)/2
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
  for i:=0 to N-1 do  //создаем и заполн€ем массив случайными значени€ми
    mas[i]:=  Random(100);

  with Result do
    begin
      CntCompare:= 0;    //сравнени€
      CntMove:= 0;    //перемещени€
      T:= Trunc(Ln(n) / Ln(3)); // определ€ем количество шагов
      for k:= T downto 1 do
        begin
          step:= CountStep(k); //вычисл€ем очередной шаг
          for p := 1 to step do //примен€ем сортировку вставками дл€ всех групп
            begin
              i:= step + p;
              while i <= N do
                begin
                  el:= mas[i];
                  l:= i - step;
                  ok:= False;
                  while (l >= 1) and not ok do
                    begin
                      Inc(CntCompare);    //”величиваем счетчик сравнений
                      if (el < mas[l]) then
                        begin
                          mas[l + step]:= mas[l];
                          Inc(CntMove); //”величиваем счетчик перемещений
                          l:= l - step;
                        end
                      else
                        ok:= True;
                    end;
                  Inc(CntCompare);    //”величиваем счетчик сравнений
                  if (l < i - step) then
                    begin
                      mas[l + step]:= el;
                      Inc(CntMove);  //”величиваем счетчик перемещений
                    end;
                  i:= i + step;
                end;
            end;
        end;
    end;
end;

end.
