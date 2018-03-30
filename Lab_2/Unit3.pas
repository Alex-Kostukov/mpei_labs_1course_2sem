unit Unit3;

interface

type
  func = function(x: real): real;

function f26(x: real): real;
function f13(x: real): real;
function f5(x: real): real;
function f18(x: real): real;

procedure SolutionSec(x1, x2, e: real; f: func; var x: real; var n: integer);
procedure SolutionIt(x0, factor, e: real; f: func; var x: real; var n: integer);
procedure SolutionN(x0, e: real; f: func; var x: real; var n: integer);

implementation

function f26(x: real): real;
begin
  Result := exp(sqr(-sin(x))) + (3 / (7 * x)) / (1 + sqrt(x)) - x;
end;

function f13(x: real): real;
begin
  Result := 1 / ((1.2 * sin(x) / cos(x)) + sqrt(x + 1)) - x;
end;

function f5(x: real): real;
begin
  Result := 1 / ((sqrt(5) + sin(0.1 * x) + ln(1 + x)) - x);
end;

function f18(x: real): real;
begin

  Result := sqrt(exp(x / 3) - (6 * x * sin(x) / 7) - 0.3) - x;
end;

procedure SolutionSec(x1, x2, e: real; f: func; var x: real; var n: integer);
var
  x3: real;
begin
  x := 0;
  n := 0;
  repeat
    x3 := x2 - f(x2) * (x2 - x1) / (f(x2) - f(x1));

    x1 := x2;
    x2 := x3;

    n := n + 1;
  until (abs(x1 - x2) < e) or (n > 10000);

  x := x1;

end;

procedure SolutionIt(x0, factor, e: real; f: func; var x: real; var n: integer);
var
  x1: real;

begin
  x := 0;
  n := 0;
  repeat
    x1 := x0;
    x0 := factor * f(x1) + x1;

    n := n + 1;
  until (abs(x1 - x0) < e) or (n > 10000);

  x := (x1 + x0) / 2;

end;

procedure SolutionN(x0, e: real; f: func; var x: real; var n: integer);
var
  x1: real;

begin
  x := 0;
  n := 0;
  repeat
    x1 := x0;
    x0 := x1 - f(x1) * e / (f(x1 + e / 2) - f(x1 - e / 2));

    n := n + 1;
  until (abs(x1 - x0) < e) or (n > 10000);

  x := (x1 + x0) / 2;

end;

end.
