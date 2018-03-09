unit Unit7;

interface

function Search(T, P: string): integer;

implementation

function Search(T, P: string): integer;
var
  V: array [chr(0) .. chr(255)] of integer;
  R, first: integer;
  n, m, i: integer;
  c: char;
begin
  n := Length(T);
  m := Length(P);
  for c := chr(0) to chr(255) do
    V[c] := 0;
  for i := 1 to m do
    V[P[i]] := V[P[i]] or (1 shl (m - i));
  first := 1 shl (m - 1);
  R := 0;
  for i := 1 to n do
  begin
    R := ((R shr 1) or first) and V[T[i]];
    if R and 1 = 1 then
    begin
      result := i - m + 1;
      exit;
    end;
  end;
  result := 0;
end;

end.
