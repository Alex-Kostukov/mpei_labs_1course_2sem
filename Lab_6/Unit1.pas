unit Unit1;

interface

type
  vector = array of real;

type
  matrix = array of vector;

function GetMultiplicationOfColls(a: matrix): vector;
procedure SolveVar26Task1(var a: matrix);

function IsNumInRowDivisible(a: vector; inputNum: integer): boolean;
function IsRowDivisible(a: vector; inputNum: integer): boolean;

function GetNumTask2_13(a: matrix; inputNum: integer): integer;
function GetNumTask2_26(a: matrix; m, n: integer): integer;

implementation

function IsRowDivisible(a: vector; inputNum: integer): boolean;
var
  j: integer;
begin
  for j := 0 to High(a) do
  begin
    if (trunc(a[j]) mod inputNum <> 0) and (a[j] <> 0) then
    begin
      result := false;
      exit;
    end;
  end;
  result := true;
end;

function GetNumTask2_13(a: matrix; inputNum: integer): integer;
var
  i: integer;
begin
  for i := 0 to High(a) do
    if IsNumInRowDivisible(a[i], inputNum) then
    begin
      result := i + 1;
      exit;
    end;
  result := -1;
end;

function GetNumTask2_26(a: matrix; m, n: integer): integer;
begin

end;

function IsNumInRowDivisible(a: vector; inputNum: integer): boolean;
var
  j: integer;
begin
  for j := 0 to High(a) do
  begin
    if (trunc(a[j]) mod inputNum = 0) and (a[j] <> 0) then
    begin
      result := true;
      exit;
    end;
  end;
  result := false;
end;

procedure SolveVar26Task1(var a: matrix);
var
  i, j: integer;
begin
  for i := 0 to High(a) do
    for j := 0 to High(a[i]) do
    begin
      if a[i, j] > 0 then
        a[i, j] := 2 * a[i, j];
      if a[i, j] < 0 then
        a[i, j] := 0;
    end;
end;

function GetMultiplicationOfColls(a: matrix): vector;
var
  i, j: integer;
  multiple: real;
  isPositiveExists: boolean;
begin
  setLength(result, length(a));
  for i := 0 to High(a) do
  begin
    result[i] := 0;
    isPositiveExists := false;
    multiple := 1;
    for j := 0 to High(a[i]) do
      if a[i, j] > 0 then
      begin
        multiple := multiple * a[i, j];
        isPositiveExists := true;
      end;
    if isPositiveExists then
      result[i] := multiple;
  end;
end;

end.
