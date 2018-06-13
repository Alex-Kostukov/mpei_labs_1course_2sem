unit Unit4;

interface

type
tinfo = integer;
tdeck = record
  mas:array of tinfo;
  k:integer;
end;

function IsEmptyDeck(const de:tdeck):boolean;
procedure AddBeginDeck(var de:tdeck; const n:tinfo);
procedure AddEndDeck(var de:tdeck; const n:tinfo);
procedure DeleteElemBeginDeck(var de:tdeck);
procedure DeleteElemEndDeck(var de:tdeck);
procedure DeleteListDeck(var de:tdeck);
procedure TopToTopDeck(var buf,de:tdeck);
procedure BottomToBottomDeck(var buf,de:tdeck);
procedure QuestDeck(var de:tdeck; var fl:boolean);

implementation

function IsEmptyDeck(const de:tdeck):boolean;
begin
  IsEmptyDeck := (de.k=0);
end;

function IsOneElemDeck(const de:tdeck):boolean;
begin
  IsOneElemDeck := (de.k = 1);
end;

procedure AddBeginDeck(var de:tdeck;const n:tinfo);
var i:integer;
begin
  de.k := de.k + 1;
  SetLength(de.mas,de.k);
  i := de.k-1;
  while i<>0 do
  begin
    de.mas[i] := de.mas[i-1];
    i := i-1;
  end;
  de.mas[0] := n;
end;

procedure AddEndDeck(var de:tdeck; const n:tinfo);
begin
  de.k := de.k+1;
  SetLength(de.mas,de.k);
  de.mas[de.k-1] := n;
end;

procedure DeleteElemBeginDeck(var de:tdeck);
var i:integer;
begin
  i := 0;
  if not(IsEmptyDeck(de)) then
  begin
    while (i<>(de.k-1)) do
    begin
      de.mas[i] := de.mas[i+1];
      i := i+1;
    end;
    de.mas[de.k-1] := 0;
    de.k := de.k-1;
    SetLength(de.mas,de.k);
  end;
end;

procedure DeleteElemEndDEck(var de:tdeck);
begin
  de.mas[de.k-1] := 0;
  de.k := de.k - 1;
  SetLength(de.mas,de.k);
end;

procedure DeleteListDeck(var de:tdeck);
begin
  while not(IsEmptyDeck(de)) do
    DeleteElemBeginDeck(de);
end;

procedure InitDeck(var de:tdeck);
begin
  SetLength(de.mas,0);
  de.k := 0;
end;

function GetInfoBeginDeck(const de:tdeck):tinfo;
begin
  GetInfoBeginDeck := de.mas[0];
end;

function GetInfoEndDeck(const de:tdeck):tinfo;
begin
  GetInfoEndDeck := de.mas[de.k-1];
end;

procedure TopToTopDeck(var buf,de:tdeck);
var n:tinfo;
begin
  n := GetInfoBeginDeck(de);
  DeleteElemBeginDeck(de);
  AddBeginDeck(buf,n);
end;

procedure BottomToBottomDeck(var buf,de:tdeck);
var n:tinfo;
begin
  n := GetInfoEndDeck(de);
  DeleteElemEndDeck(de);
  AddEndDeck(buf,n);
end;

procedure QuestDeck(var de:tdeck;var fl:boolean);
var  buf:tdeck;
    fl1:boolean;
begin
  if (IsEmptyDeck(de)) then
    fl := false
  else
    if ((GetInfoBeginDeck(de)>=-10) and (GetInfoBeginDeck(de)<=30)) and ((GetInfoEndDeck(de)>=-10) and (GetInfoEndDeck(de)<=30)) then
    begin
      DeleteElemBeginDeck(de);
      DeleteElemEndDeck(de);
    end
    else
    begin
      fl1 := true;
      InitDeck(buf);
      while (fl1) and not(IsOneElemDeck(de)) and not(IsEmptyDeck(de)) do
      begin
        if ((GetInfoBeginDeck(de)>=-10) and (GetInfoBeginDeck(de)<=30)) and ((GetInfoEndDeck(de)>=-10) and (GetInfoEndDeck(de)<=30)) then
          fl1 := false
        else
        begin
          TopToTopDeck(buf,de);
          BottomToBottomDeck(buf,de);
        end;
      end;
      if not(fl1) then
      begin
        DeleteElemBeginDeck(de);
        DeleteElemEndDeck(de);
        while not(IsEmptyDeck(buf)) do
        begin
          TopToTopDeck(de,buf);
          BottomToBottomDeck(de,buf);
        end;
      end
      else
      begin
        fl := false;
        while not(IsEmptyDeck(buf)) do
        begin
          TopToTopDeck(de,buf);
          BottomToBottomDeck(de,buf);
        end;
      end;
    end;
end;

//Дополнительные процедуры

procedure BottomToTopDeck(var buf,de:tdeck);
var n:tinfo;
begin
  n := GetInfoEndDeck(de);
  DeleteElemEndDeck(de);
  AddBeginDeck(buf,n);
end;

procedure TopToBottomDeck(var buf,de:tdeck);
var n:tinfo;
begin
  n := GetInfoBeginDeck(de);
  DeleteElemBeginDeck(de);
  AddEndDeck(buf,n);
end;


end.
