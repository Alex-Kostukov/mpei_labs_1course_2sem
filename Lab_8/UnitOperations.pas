unit UnitOperations;

interface

uses
  UnitType;

function FindNum13(const f: TIntFile): ty_inum;
function FindNum26(const f: TRealFile): ty_rnum;

procedure Swap13(var f: TIntFile; inum: ty_inum);
procedure Swap26(var f: TRealFile; rnum: ty_rnum; k: integer);

implementation

function FindNum13(const f: TIntFile): ty_inum;
var
  a, counter: integer;
  inum: ty_inum;
begin
  begin
    seek(f, 0);
    counter := 0;
    while not eof(f) do
    begin
      read(f, a);
      if a mod 2 <> 0 then
      begin
        inum.value := a;
        inum.position := counter;
      end;
      counter := counter + 1;
    end;
    result := inum;
    exit;
  end;
  inum.position := -1;
  result := inum;
end;

function FindNum26(const f: TRealFile): ty_rnum;
var
  counter: integer;
  a: real;
  rnum: ty_rnum;
begin
  seek(f, FileSize(f) - 1);
  counter := FileSize(f) - 1;
  while counter <> 0 do
  begin
    read(f, a);
    if (a >= -50.6) and (a <= 71.2) then
    begin
      rnum.value := a;
      rnum.position := counter;
      result := rnum;
      exit;
    end;
    counter := counter - 1;
    seek(f, counter);
  end;
  rnum.position := -1;
  result := rnum;
end;

procedure Swap13(var f: TIntFile; inum: ty_inum);
var
  i: integer;
  a: integer;
begin
  if inum.position > 0 then
  begin
    for i := inum.position - 1 downto 0 do
    begin
      seek(f, i);
      read(f, a);
      write(f, a);
    end;
    seek(f, 0);
    write(f, inum.value);
  end;
end;

procedure Swap26(var f: TRealFile; rnum: ty_rnum; k: integer);
var
  i: integer;
  a: real;
begin
  if rnum.position <> k + 1 then
  begin
    if rnum.position > k + 1 then
      for i := rnum.position - 1 downto k do
      begin
        seek(f, i);
        read(f, a);
        write(f, a);
      end
    else
      for i := rnum.position to k do
      begin
        seek(f, i);
        read(f, a);
        seek(f, i - 1);
        write(f, a);
      end;
    seek(f, k);
    write(f, rnum.value);
  end;
end;

end.
