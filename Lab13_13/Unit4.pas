unit Unit4;

interface

type
tinfo=integer;
TDeck =^PDeck;
PDeck = record
  info:tinfo;
  next,prev:tdeck;
end;

function IsEmptyDeck(const de1,de2:tdeck):boolean;
procedure AddBeginDeck(var de1,de2:tdeck; const n:tinfo);
procedure AddEndDeck(var de1,de2:tdeck; const n:tinfo);
procedure DeleteElemBeginDeck(var de1,de2:tdeck);
procedure DeleteElemEndDeck(var de1,de2:tdeck);
procedure DeleteListDeck(var de1,de2:tdeck);
procedure TopToTopDeck(var buf1,buf2,de1,de2:tdeck);
procedure BottomToBottomDeck(var buf1,buf2,de1,de2:tdeck);
procedure QuestDeck(var de1,de2:tdeck; var fl:boolean);

implementation

function IsEmptyDeck(const de1,de2:tdeck):boolean;
begin
  IsEmptyDeck := (de1=de2) and (de1 = nil);
end;

procedure AddBeginDeck(var de1,de2:tdeck; const n:tinfo);
var k:tdeck;
begin
  new(k);
  k^.info := n;
  if IsEmptyDeck(de1,de2) then
  begin
    k^.next := nil;
    k^.prev := nil;
    de1 := k;
    de2 := k;
  end
  else
  begin
    k^.next := de1;
    de1^.prev := k;
    k^.prev := nil;
    de1 := k;
  end;
end;

procedure AddEndDeck(var de1,de2:tdeck; const n:tinfo);
var k:tdeck;
begin
  new(k);
  k^.info := n;
  if IsEmptyDeck(de1,de2) then
  begin
    k^.next := nil;
    k^.prev := nil;
    de1 := k;
    de2 := k;
  end
  else
  begin
    k^.prev := de2;
    de2^.next := k;
    k^.next := nil;
    de2 := k;
  end;
end;

procedure DeleteElemBeginDeck(var de1,de2:tdeck);
var k:tdeck;
begin
  if not(IsEmptyDeck(de1,de2)) then
  begin
    if de1=de2 then
    begin
      de1 := nil;
      de2 := nil;
    end
    else
    begin
      k := de1;
      de1 := de1^.next;
      k^.next := nil;
      de1^.prev := nil;
      dispose(k);
    end;
  end;
end;

procedure DeleteElemEndDeck(var de1,de2:tdeck);
var k:tdeck;
begin
  if not( IsEmptyDeck(de1,de2)) then
  begin
    if de1=de2 then
    begin
      de1 := nil;
      de2 := nil;
    end
    else
    begin
    k := de2;
    de2 := de2^.prev;
    k^.prev := nil;
    de2^.next := nil;
    dispose(k);
    end;
  end;
end;

procedure DeleteListDeck(var de1,de2:tdeck);
begin
  while not(IsEmptyDeck(de1,de2)) do
    DeleteElemBeginDeck(de1,de2);
end;

function GetInfoBeginDeck(const de1,de2:tdeck):tinfo;
begin
  GetInfoBeginDeck := de1^.info;
end;

function GetInfoEndDeck(const de1,de2:tdeck):tinfo;
begin
  GetInfoEndDeck := de2^.info;
end;

procedure TopToTopDeck(var buf1,buf2,de1,de2:tdeck);
var n:tinfo;
begin
  n := GetInfoBeginDeck(de1,de2);
  DeleteElemBeginDeck(de1,de2);
  AddBeginDeck(buf1,buf2,n);
end;

procedure BottomToBottomDeck(var buf1,buf2,de1,de2:tdeck);
var n:tinfo;
begin
  n := GetInfoEndDeck(de1,de2);
  DeleteElemEndDeck(de1,de2);
  AddEndDeck(buf1,buf2,n);
end;

procedure InitDeck(var de1,de2:tdeck);
begin
  de1 := nil;
  de2 := nil;
end;

function IsOneElemDeck(const de1,de2:tdeck):boolean;
begin
  IsOneElemDeck := de1=de2;
end;

procedure QuestDeck(var de1,de2:tdeck; var fl:boolean);
var buf1,buf2:tdeck;
    fl1:boolean;
begin
  if de1 = de2 then
    fl := false
  else
    if ((GetInfoBeginDeck(de1,de2) mod 2 <> 0)) and ((GetInfoEndDeck(de1,de2) mod 2 <> 0 )) then
    begin
      DeleteElemBeginDeck(de1,de2);
      DeleteElemEndDeck(de1,de2);
    end
    else
    begin
      fl1 := true;
      InitDeck(buf1,buf2);
      while (fl1) and not(IsOneElemDeck(de1,de2)) and not(IsEmptyDeck(de1,de2)) do
      begin
        if ((GetInfoBeginDeck(de1,de2) mod 2 <> 0)) and ((GetInfoEndDeck(de1,de2) mod 2 <> 0 )) then
          fl1 := false
        else
        begin
          TopToTopDeck(buf1,buf2,de1,de2);
          BottomToBottomDeck(buf1,buf2,de1,de2);
        end;
      end;
      if not(fl1) then
      begin
        DeleteElemBeginDeck(de1,de2);
        DeleteElemEndDeck(de1,de2);
        while not(IsEmptyDeck(buf1,buf1)) do
        begin
          TopToTopDeck(de1,de2,buf1,buf2);
          BottomToBottomDeck(de1,de2,buf1,buf2);
        end;
      end
      else
      begin
        fl := false;
        while not(IsEmptyDeck(buf1,buf2)) do
        begin
          TopToTopDeck(de1,de2,buf1,buf2);
          BottomToBottomDeck(de1,de2,buf1,buf2);
        end;
      end;
    end;
end;

//Дополнительные процедуры

procedure BottomToTopDeck(var buf1,buf2,de1,de2:tdeck);
var n:tinfo;
begin
  n := GetInfoEndDeck(de1,de2);
  DeleteElemEndDeck(de1,de2);
  AddBeginDeck(buf1,buf2,n);
end;

procedure TopToBottomDeck(var buf1,buf2,de1,de2:tdeck);
var n:tinfo;
begin
  n := GetInfoBeginDeck(de1,de2);
  DeleteElemBeginDeck(de1,de2);
  AddEndDeck(buf1,buf2,n);
end;

end.
