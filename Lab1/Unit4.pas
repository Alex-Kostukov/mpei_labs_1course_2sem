unit Unit4;

interface

type
  TCharSet = array [0 .. 255] of boolean;

function GetUnionElements(a: TCharSet; b: TCharSet): TCharSet;
function GetIntersectionElements(a: TCharSet; b: TCharSet): TCharSet;
function GetDifferenceElements(a: TCharSet; b: TCharSet): TCharSet;
function SetArrayFalse(a: TCharSet): TCharSet;
procedure AddElementToSet(ch: char; var a: TCharSet);

implementation

procedure AddElementToSet(ch: char; var a: TCharSet);
begin
  a[ord(ch)] := true;
end;

function SetArrayFalse(a: TCharSet): TCharSet;
var
  i: integer;
begin
  for i := 0 to 255 do
    a[i] := false;
  SetArrayFalse := a;
end;

function GetDifferenceElements(a: TCharSet; b: TCharSet): TCharSet;
var
  c: TCharSet;
  i: integer;
begin
  c := SetArrayFalse(c);
  for i := 0 to 255 do
    if a[i] and not b[i] then
      c[i] := true;

  GetDifferenceElements := c;
end;

function GetIntersectionElements(a: TCharSet; b: TCharSet): TCharSet;
var
  c: TCharSet;
  i: integer;
begin
  c := SetArrayFalse(c);
  for i := 0 to 255 do
    if a[i] and b[i] then
      c[i] := true;

  GetIntersectionElements := c;
end;

function GetUnionElements(a: TCharSet; b: TCharSet): TCharSet;
var
  c: TCharSet;
  i: integer;
begin
  c := SetArrayFalse(c);
  for i := 0 to 255 do

    if (a[i] = true) or (b[i] = true) then
      c[i] := true;
  GetUnionElements := c;
end;

end.
