unit Unit2;

interface


type
tinfo = integer;
TStack =^PStack;
PStack = record
  info:tinfo;
  next: tstack;
end;

function IsEmptyStack(const st:tstack):boolean;
procedure AddStack(var st:tstack; const n:tinfo);
procedure TopToTopStack(var buf,st:tstack);
procedure DeleteElemStack(var st:tstack);
procedure DeleteListStack(var st:tstack);
procedure QuestStack(var st:tstack; var fl:boolean);
function IsEndStack(const st:tstack):boolean;


implementation

procedure InitStack(var st:tstack);
begin
  st := nil;
end;

function IsEmptyStack(const st:tstack):boolean;
begin
  IsEmptyStack := (st=nil);
end;

procedure AddStack(var st:tstack; const n:tinfo);
var k:tstack;
begin
  new(k);
  k^.info := n;
  k^.next := st;
  st := k;
end;

procedure DeleteElemStack(var st:tstack);
var k:tstack;
begin
  if not(IsEmptyStack(st)) then
  begin
    k := st;
    st := st^.next;
    k^.next := nil;
    dispose(k);
  end;
end;

function GetInfoBeginStack(const st:tstack):tinfo;
begin
  GetInfoBeginStack := st^.info;
end;

procedure TopToTopStack(var buf,st:tstack); //
var n:tinfo;
begin
  n := GetInfoBeginStack(st);
  DeleteElemStack(st);
  AddStack(buf,n);
end;

procedure DeleteListStack(var st:tstack);   //
begin
  while not(IsEmptyStack(st)) do
    DeleteElemStack(st);
end;

function IsEndStack(const st:tstack):boolean;
begin
  IsEndStack := (st^.next = nil)
end;

procedure QuestStack(var st:tstack; var fl:boolean); //
var  buf:tstack;
   fl1:boolean;
begin
  if IsEmptyStack(st) then
    fl := false
  else
    if (GetInfoBeginStack(st)mod 2 <> 0) then
      DeleteElemStack(st)
    else
    begin
      InitStack(buf);
      fl1 := true;
      TopToTopStack(buf,st);
      while (fl1) and not(IsEmptyStack(st)) do
      begin
        if (GetInfoBeginStack(st)mod 2 <> 0) then
          fl1 := false
        else
          TopToTopStack(buf,st);
      end;
      if not(fl1) then
      begin
        DeleteElemStack(st);
        while not(IsEmptyStack(buf)) do
          TopToTopStack(st,buf);
      end
      else
      begin
        fl := false;
        while not(IsEmptyStack(buf)) do
          TopToTopStack(st,buf);
      end;
    end;
end;

//Дополнительные процедуры

procedure AddToEndStack(var st:tstack; n:tinfo); //
var buf:tstack;
begin
  InitStack(buf);
  while not(IsEmptyStack(st)) do
    TopToTopStack(buf,st);
  AddStack(st,n);
  while not(IsEmptyStack(Buf)) do
    TopToTopStack(st,buf);
end;

procedure DeleteEndStack(var st:tstack); //
var buf:tstack;
begin
  if (IsEndStack(st)) then
    DeleteElemStack(st)
  else
  begin
    InitStack(buf);
    while not(IsEndStack(st)) do
      TopToTopStack(buf,st);
    DeleteElemStack(st);
    while not(IsEmptyStack(Buf)) do
      TopToTopStack(st,buf);
  end;
end;

function GetInfoEndStack(var st:tstack): tinfo; //
var buf:tstack;
begin
  if (IsEmptyStack(st)) then
    GetInfoEndStack := 0
  else
  begin
    InitStack(buf);
    while not(IsEndStack(st)) do
      TopToTopStack(buf,st);
    GetInfoEndStack := GetInfoBeginStack(st);
    while not(IsEmptyStack(Buf)) do
      TopToTopStack(st,buf);
  end;
end;

procedure AddMiddleStack(var st:tstack;const o,n:tinfo);  //
var  buf:tstack;
      fl:boolean;
begin
  InitStack(buf);
  fl := true;
  while (fl) and not(IsEmptyStack(st)) do
  begin
    if (GetInfoBeginStack(st) = o) then
      fl := false;
    TopToTopStack(buf,st);
  end;
  AddStack(st,n);
  while not(IsEmptyStack(Buf)) do
    TopToTopStack(st,buf);
end;

procedure DeleteMiddleStack(var st:tstack; const n:tinfo); //
var  buf:tstack;
      fl:boolean;
begin
  buf := nil;
  fl := true;
  while (fl) and not(IsEmptyStack(st)) do
  begin
    if (GetInfoBeginStack(st) = n) then
      fl := false
    else
      TopToTopStack(buf,st);
  end;
  DeleteElemStack(st);
  while not(IsEmptyStack(Buf)) do
    TopToTopStack(st,buf);
end;

end.
