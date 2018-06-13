unit Unit2;

interface

type
tinfo = integer;
tstack = record
  mas:array of tinfo;
  k:integer;
end;

function IsEmptyStack(const st:tstack):boolean;
procedure AddStack(var st:tstack; const n:tinfo);
procedure TopToTopStack(var buf,st:tstack);
procedure DeleteElemStack(var st:tstack);
procedure DeleteListStack(var st:tstack);
procedure QuestStack(var st:tstack; var fl:boolean);

implementation

function IsEmptyStack(const st:tstack):boolean;
begin
  IsEmptyStack := (st.k = 0);
end;

function IsEndStack(const st:tstack):boolean;
begin
  IsEndStack := (st.k = 1);
end;

procedure AddStack(var st:tstack;const n:tinfo);
var i:integer;
begin
  st.k := st.k + 1;
  SetLength(st.mas,st.k);
  i := st.k-1;
  while i<>0 do
  begin
    st.mas[i] := st.mas[i-1];
    i := i-1;
  end;
  st.mas[0] := n;
end;

procedure DeleteElemStack(var st:tstack);
var i:integer;
begin
  i := 0;
  if not(IsEmptyStack(st)) then
  begin
    while (i<>(st.k-1)) do
    begin
      st.mas[i] := st.mas[i+1];
      i := i+1;
    end;
    st.mas[st.k-1] := 0;
    st.k := st.k-1;
    SetLength(st.mas,st.k);
  end;
end;

procedure DeleteListStack(var st:tstack); //
begin
  while not(IsEmptyStack(st)) do
    DeleteElemStack(st);
end;

procedure InitStack(var st:tstack);
begin
  SetLength(st.mas,0);
  st.k := 0;
end;

function GetInfoBeginStack(const st:tstack):tinfo;
begin
  GetInfoBeginStack := st.mas[0];
end;

procedure TopToTopStack(var buf,st:tstack);     //
var n:tinfo;
begin
  n := GetInfoBeginStack(st);
  DeleteElemStack(st);
  AddStack(buf,n);
end;

procedure QuestStack(var st:tstack; var fl:boolean); //
var  buf:tstack;
   fl1:boolean;
begin
  if IsEmptyStack(st) then
    fl := false
  else
    if (GetInfoBeginStack(st)>=-10) and (GetInfoBeginStack(st)<=30) then
      DeleteElemStack(st)
    else
    begin
      InitStack(buf);
      fl1 := true;
      TopToTopStack(buf,st);
      while (fl1) and not(IsEmptyStack(st)) do
      begin
        if (GetInfoBeginStack(st)>=-10) and (GetInfoBeginStack(st)<=30) then
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

procedure AddToEndStack(var st:tstack; n:tinfo);  //
var buf:tstack;
begin
  InitStack(buf);
  while not(IsEmptyStack(st)) do
    TopToTopStack(buf,st);
  AddStack(st,n);
  while not(IsEmptyStack(Buf)) do
    TopToTopStack(st,buf);
end;

procedure DeleteEndStack(var st:tstack);   //
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

procedure AddMiddleStack(var st:tstack;const o,n:tinfo); //
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
  InitStack(buf);
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
