unit Unit3;

interface

type
tinfo = Real;
PElem = ^TElem;
TElem = record
  info: tinfo;
  next: PElem;
end;
TQueue = record
  head,tail:PElem;
end;

function IsEmptyQueue(const qu:tqueue):boolean;
procedure AddQueue(var qu:tqueue; const n:tinfo);
procedure DeleteElemQueue( var qu:tqueue);
procedure DeleteListQueue(var qu:tqueue);
procedure TopToBottomQueue(var qu,buf:tqueue);
procedure QuestQueue(var qu:tqueue; var fl:boolean);

implementation

function IsEmptyQueue(const qu:tqueue):boolean;
begin
  IsEmptyQueue := (qu.tail=nil);
end;

procedure AddQueue(var qu:tqueue;const n:tinfo);
var k:PElem;
begin
  new(k);
  k^.info := n;
  k^.next := nil;
  if IsEmptyQueue(qu) then
  begin
    qu.head := k;
    qu.tail := k;
  end
  else
  begin
    qu.tail^.next := k;
    qu.tail := k;
  end;
end;

procedure DeleteElemQueue(var qu:tqueue);
var k:PElem;
begin
  if not(IsEmptyQueue(qu)) then
    if qu.head^.next = nil then
    begin
      qu.head := nil;
      qu.tail := nil;
    end
    else
    begin
      k := qu.head;
      qu.head := qu.head^.next;
      k^.next := nil;
      dispose(k);
    end;
end;

procedure InitQueue(var qu:tqueue);
begin
  qu.tail := nil;
end;

procedure DeleteListQueue(var qu:tqueue);
begin
  while not(IsEmptyQueue(qu)) do
    DeleteElemQueue(qu);
end;

function TakeInfoBeginQueue(const qu:tqueue):tinfo;
begin
  TakeInfoBeginQueue := qu.head^.info;
end;

procedure TopToBottomQueue(var qu,buf:tqueue);
var n:tinfo;
begin
  n := TakeInfoBeginQueue(qu);
  DeleteElemQueue(qu);
  AddQueue(buf,n);
end;

procedure QuestQueue(var qu:tqueue;var fl:boolean);
var  buf:tqueue;
   fl1:boolean;
begin
  if IsEmptyQueue(qu) then
    fl := false
  else
    if (TakeInfoBeginQueue(qu)>=-50.6) and (TakeInfoBeginQueue(qu)<=71.2) then
      DeleteElemQueue(qu)
    else
    begin
      fl1 := true;
      InitQueue(buf);
      TopToBottomQueue(qu,buf);
      while (fl1) and not(IsEmptyQueue(qu)) do
        if (TakeInfoBeginQueue(qu)>=-50.6) and (TakeInfoBeginQueue(qu)<=71.2) then
          fl1 := false
        else
          TopToBottomQueue(qu,buf);
      if not(fl1) then
      begin
        DeleteElemQueue(qu);
        while not(IsEmptyQueue(qu)) do
          TopToBottomQueue(qu,buf);
        qu := buf;
      end
      else
      begin
        fl := false;
        qu := buf;
      end;
    end;
end;

//Дополнительные процелуры

procedure AddtoBeginQueue(var qu:tqueue;const n:tinfo);
var buf:tqueue;
begin
  AddQueue(buf,n);
  while not(IsEmptyQueue(qu)) do
    TopToBottomQueue(qu,buf);
  qu := buf;
end;

procedure AddMiddleQueue(var qu:tqueue;const n:tinfo;const o:tinfo);
var buf:tqueue;
    fl : boolean;
begin
  InitQueue(buf);
  fl := true;
  while fl and not(IsEmptyQueue(qu)) do
  begin
    if TakeInfoBeginQueue(qu) = o then
      fl := false;
    TopToBottomQueue(qu,buf);
  end;
  if not(fl) then
  begin
    AddQueue(buf,n);
    while not(IsEmptyQueue(qu)) do
      TopToBottomQueue(qu,buf);
    qu := buf;
  end
  else
    qu := buf;
end;

procedure DeleteEndQueue(var qu:tqueue);
var buf:tqueue;
begin
  InitQueue(buf);
  while (qu.head<>qu.tail) do
    TopToBottomQueue(qu,buf);
  DeleteElemQueue(qu);
  qu := buf;
end;

procedure DeleteMiddleQueue(var qu:tqueue; const n:tinfo);
var buf:tqueue;
    fl : boolean;
begin
  if (TakeInfoBeginQueue(qu) = n) then
    DeleteElemQueue(qu)
  else
  begin
    InitQueue(buf);
    fl := true;
    TopToBottomQueue(qu,buf);
    while (fl) and not(IsEmptyQueue(qu)) do
      if TakeInfoBeginQueue(qu) = n then
        fl := false
      else
        TopToBottomQueue(qu,buf);
    if not (fl) then
    begin
      DeleteElemQueue(qu);
      while not(IsEmptyQueue(qu)) do
        TopToBottomQueue(qu,buf);
      qu := buf;
    end
    else
      qu := buf;
  end;
end;

function TakeInfoEndQueue(const qu:tqueue):tinfo;
begin
  TakeInfoEndQueue := qu.tail^.info;
end;

end.
