unit UnitOperations;


interface

  uses
  UnitType;

  procedure Found (const f : TRealFile;var a1,a2:integer);
  procedure Sub (var f : TRealFile; k, num : integer);

implementation
  procedure Found (const f : TRealFile;var a1,a2:integer);
  var x : integer; flag : boolean; i, n : integer;
  begin
    flag := false;
     a1:= 0;
    n := FileSize(f);
    i := 0;
    while (i < n) and not flag do
    begin
      Seek (f, i);
      read (f, x);
      if ((x>-10)and(x<30)) then
      begin

        a1 := FilePos(f);
              a2:=x;
        flag := true;
      end
      else
        i := i + 1;
    end;


  end;

  procedure Sub (var f : TRealFile; k, num : integer);
  var i : integer; elem, x : integer;
  begin
      if num <> k + 1 then
      begin
        Seek (f, num - 1);
        read (f, elem);
        if num > k + 1 then
        begin
          for i := num -2 downto k do
          begin
            Seek(f, i);
            read(f, x);
            write(f, x);
          end;
        end
        else
        begin
          for i := num to k do
          begin
            Seek(f, i);
            read(f, x);
            Seek(f, i-1);
            write(f, x);
          end;
        end;
        Seek(f, k);
        write(f, elem);
      end;
  end;
end.
