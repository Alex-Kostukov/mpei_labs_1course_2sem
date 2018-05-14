unit UnitFunc;

interface

uses
  UnitType;

type
  ty_range = record
    value1: integer;
    value2: integer;
  End;

function CheckingTask13(const a: TMas; n1, n2: integer;
  range: ty_range): boolean;
function CheckingTask26(const a: TMas; n1, n2: integer;
  range: ty_range): boolean;

function SolveTask13_2(const a: TMas; n1, n2: integer): integer;
function SolveTask26_2(const a: TMas; n1, n2: integer): integer;

implementation

function CheckingTask26(const a: TMas; n1, n2: integer;
  range: ty_range): boolean;
begin
  if n1 = n2 then
    result := (a[n1] >= range.value1) and (a[n1] <= range.value2)
  else if n1 < n2 then
    if (a[n1] >= range.value1) and (a[n1] <= range.value2) then
      result := CheckingTask26(a, n1 + 1, n2, range)
    else
      result := false;

end;

function SolveTask26_2(const a: TMas; n1, n2: integer): integer;
begin
  if n1 <> n2 then
    if sqrt(abs(a[n1])) < n1 then
      result := a[n1] + SolveTask26_2(a, n1 + 1, n2)
    else
      result := SolveTask26_2(a, n1 + 1, n2)
  else if sqrt(abs(a[n1])) < n1 then
    result := a[n1]
  else
    result := 0;
end;

function CheckingTask13(const a: TMas; n1, n2: integer;
  range: ty_range): boolean;
begin
  if n1 = n2 then
    CheckingTask13 := ((abs(a[n1]) >= range.value1) and
      (abs(a[n1]) <= range.value2))
  else
    CheckingTask13 := ((abs(a[n1]) >= range.value1) and
      (abs(a[n1]) <= range.value2)) or CheckingTask13(a, n1 + 1, n2, range);
end;

function SolveTask13_2(const a: TMas; n1, n2: integer): integer;
begin
  if n1 <> n2 then
    if a[n1] > n1 then
      result := 1 + SolveTask13_2(a, n1 + 1, n2)
    else
      result := SolveTask13_2(a, n1 + 1, n2)
  else if a[n1] > n1 then
    result := 1
  else
    result := 0;
end;

end.
