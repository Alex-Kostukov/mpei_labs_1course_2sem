unit Unit3;

interface

type
  TCharSet = record
    s: array [1 .. 256] of char;
    n: integer;
  end;

function GetUnionElements(a: TCharSet; b: TCharSet): TCharSet;
function GetIntersectionElements(a: TCharSet; b: TCharSet): TCharSet;
function GetDifferenceElements(a: TCharSet; b: TCharSet): TCharSet;
function CheckElementUnique(ch: char; a: TCharSet): boolean;
procedure AddElementToSet(ch: char; var a: TCharSet);

implementation

procedure AddElementToSet(ch: char; var a: TCharSet);
begin
  if CheckElementUnique(ch, a) then
  begin
    a.n := a.n + 1;
    a.s[a.n] := ch;
  end;
end;

function CheckElementUnique(ch: char; a: TCharSet): boolean;
var
  i: integer;
begin
  for i := 1 to a.n do
    if a.s[i] = ch then
    begin
      CheckElementUnique := false;
      Exit;
    end;
  CheckElementUnique := true;
end;

function GetDifferenceElements(a: TCharSet; b: TCharSet): TCharSet;
var
  c: TCharSet;
  i, j: integer;
  isElementExistsInB: boolean;
begin
  c.n := 0;

  for i := 1 to a.n do
  begin
    isElementExistsInB := false;

    for j := 1 to b.n do
      if a.s[i] = b.s[j] then
      begin
        isElementExistsInB := true;
        continue;
      end;

    if (not isElementExistsInB) and CheckElementUnique(a.s[i], c) then
    begin
      c.n := c.n + 1;
      c.s[c.n] := a.s[i];
    end;
  end;
  GetDifferenceElements := c;
end;

function GetIntersectionElements(a: TCharSet; b: TCharSet): TCharSet;
var
  c: TCharSet;
  i, j: integer;
begin
  c.n := 0;

  for i := 1 to a.n do
    for j := 1 to b.n do
      if (a.s[i] = b.s[j]) and (CheckElementUnique(a.s[i], c)) then
      begin
        c.n := c.n + 1;
        c.s[c.n] := a.s[i];
      end;

  GetIntersectionElements := c;
end;

function GetUnionElements(a: TCharSet; b: TCharSet): TCharSet;
var
  c: TCharSet;
  i: integer;
begin
  c.n := 0;
  for i := 1 to a.n do
    if CheckElementUnique(a.s[i], c) then
    begin
      c.n := c.n + 1;
      c.s[c.n] := a.s[i];
    end;

  for i := 1 to b.n do
    if CheckElementUnique(b.s[i], c) then
    begin
      c.n := c.n + 1;
      c.s[c.n] := b.s[i];
    end;

  GetUnionElements := c;
end;

end.
