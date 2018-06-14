unit UnitSort;

interface
  procedure SortByChanging(var y:array of Variant; n:integer);
  procedure SortByChoosing(var y:array of Variant; n:integer);
  procedure SortByIncluding(var y:array of Variant; n:integer);
  procedure QuickSort(var y:array of Variant; n1, n2:integer);

implementation
  procedure SortByChanging(var y:array of Variant; n:integer);
  var
   i,j: integer;
   x:variant;
Begin
for i := 0 to n - 2 do
    for j := 0 to n - i - 2 do
      if y[j] > y[j + 1] then
       begin
         x:=y[j+1];
         y[j+1]:=y[j];
         y[j]:=x;
       end;
  end;

  procedure SortByChoosing(var y:array of Variant; n:integer);
  var
   i,j:integer;
   k:integer;
   x:variant;
  begin
   for i:=0 to n-1 do
    begin   	// i - номер текущего шага
     k:=i;
     x:=y[i];
     for j:=i+1 to n-1 do	// цикл выбора наименьшего элемента
      if (y[j] < x) then
        begin
          k:=j;
          x:=y[j];	        // k - индекс наименьшего элемента
        end;
     y[k] := y[i];
     y[i] := x;
    end;
  end;

  procedure SortByIncluding(var y:array of Variant; n:integer);
  var
    i,j:integer;
    x:variant;
  begin
    for i := 1 to n-1 do
      begin
        x:=y[i];
        j:=i-1;
      while (j>=0) and (y[j]>x) do
        begin
          y[j+1]:=y[j];
          j:=j-1;
        end;
      y[j+1]:=x;
    end;
  end;

  procedure QuickSort(var y:array of Variant; n1, n2:integer);
  var
    i,j:integer;
    x,k:variant;
  begin
    if n2-n1=1 then
     begin
       if y[n1]>y[n2] then
        begin
          x:=y[n1];
          y[n1]:=y[n2];
          y[n2]:=x;
        end;
     end
    else if (n2-n1)>1 then
     begin
       k:=y[(n1+n2)div 2];
       i:=n1;
       j:=n2;
       repeat
         while (y[i]<k) do i:=i+1;
         while (y[j]>k) do j:=j-1;
         if i<=j then
           begin
             x:=y[i];
             y[i]:=y[j];
             y[j]:=x;
             i:=i+1;
             j:=j-1;
           end;
       until i>j;
     QuickSort(y, n1, j);
     QuickSort(y, i, n2);
     end;
  end;
end.
