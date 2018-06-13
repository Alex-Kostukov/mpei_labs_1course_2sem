unit Unit3;

interface

type
tinfo = integer;
tqueue = record
  mas:array of tinfo;
  k:integer;
end;

function IsEmptyQueue(const qu:tqueue):boolean;
procedure AddQueue(var qu:tqueue; const n:tinfo);
procedure DeleteElemQueue(var qu:tqueue);
procedure DeleteListQueue(var qu:tqueue);
procedure TopToBottomQueue(var qu,buf:tqueue);
procedure QuestQueue(var qu:tqueue;var fl:boolean);

implementation

function IsEmptyQueue(const qu:tqueue):boolean;
begin
  IsEmptyQueue := (qu.k=0);
end;

function IsOneElemQueue(const qu:tqueue):boolean;
begin
  IsOneElemQueue := (qu.k = 1);
end;

procedure AddQueue(var qu:tqueue; const n:tinfo);
begin
  qu.k := qu.k+1;
  SetLength(qu.mas,qu.k);
  qu.mas[qu.k-1] := n;
end;

procedure DeleteElemQueue(var qu:tqueue);
var i:integer;
begin
  i := 0;
  if not(IsEmptyQueue(qu)) then
  begin
    while (i<>(qu.k-1)) do
    begin
      qu.mas[i] := qu.mas[i+1];
      i := i+1;
    end;
    qu.mas[qu.k-1] := 0;
    qu.k := qu.k-1;
    SetLength(qu.mas,qu.k);
  end;
end;

procedure DeleteListQueue(var qu:tqueue);
begin
  while not(IsEmptyQueue(qu)) do
    DeleteElemQueue(qu);
end;

procedure InitQueue(var qu:tqueue);
begin
  SetLength(qu.mas,0);
  qu.k := 0;
end;

function TakeInfoBeginQueue(const qu:tqueue):tinfo;
begin
  TakeInfoBeginQueue := qu.mas[0];
end;

procedure TopToBottomQueue(var qu,buf:tqueue);
var n:tinfo;
begin
  n := TakeInfoBeginQueue(qu);
  DeleteElemQueue(qu);
  AddQueue(buf,n);
end;

procedure QuestQueue(var qu:tqueue;var fl:boolean);
var buf:tqueue;
  fl1:boolean;
begin
  if IsEmptyQueue(qu) then
    fl := false
  else
    if (TakeInfoBeginQueue(qu)>=-10) and (TakeInfoBeginQueue(qu)<=30) then
      DeleteElemQueue(qu)
    else
    begin
      fl1 := true;
      InitQueue(buf);
      TopToBottomQueue(qu,buf);
      while (fl1) and not(IsEmptyQueue(qu)) do
        if (TakeInfoBeginQueue(qu)>=-10) and (TakeInfoBeginQueue(qu)<=30) then
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

//Дополнительные процедуры

procedure AddtoBeginQueue(var qu:tqueue;const n:tinfo);
var buf:tqueue;
begin
  InitQueue(buf);
  AddQueue(buf,n);
  while not(IsEmptyQueue(qu)) do
    TopToBottomQueue(qu,buf);
  qu := buf;
end;

procedure AddMiddleQueue( var qu:tqueue; const n:tinfo; const o:tinfo);
var  buf:tqueue;
      fl:boolean;
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
  while not(IsOneElemQueue(qu)) do
    TopToBottomQueue(qu,buf);
  DeleteElemQueue(qu);
  qu := buf;
end;

procedure DeleteMiddleQueue(var qu:tqueue;const n:tinfo);
var buf:tqueue;
     fl:boolean;
begin
  if TakeInfoBeginQueue(qu) = n then
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
  TakeInfoEndQueue := qu.mas[qu.k-1];
end;

end.
