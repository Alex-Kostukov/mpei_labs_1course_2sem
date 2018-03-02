unit Unit8;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

procedure DeleteAllOccurencesOfSpace(var d: string);
procedure DeleteUndueWords(c: char; var d: string);
procedure DeleteWordsVariant13(var d: string);
procedure DeleteWordsVariant26(n: integer; var d: string);

implementation

procedure DeleteWordsVariant26(n: integer; var d: string);

var
  i, index, wordLength: integer;
begin
  i := 1;

  while i <= d.Length do
  begin
    index := i;
    wordLength := 0;
    while index <= d.Length do
    begin
      if d[index] = ' ' then
        break;
      index := index + 1;
      wordLength := wordLength + 1;
    end;

    if wordLength <> n then
      Delete(d, i, index - i)
    else
      i := index;

    i := i + 1;

  end;
end;

procedure DeleteAllOccurencesOfSpace(var d: string);

var
  index: integer;
begin
  if d.Length = 0 then
    exit;

  repeat
    index := Pos('  ', d);
    Delete(d, index, 1);
  until index = 0;

  if d[1] = ' ' then
    Delete(d, 1, 1);
end;

procedure DeleteUndueWords(c: char; var d: string);

var
  i, index: integer;
  isSymbolInWord: boolean;
begin
  i := 1;
  index := 1;

  while i <= d.Length do
  begin
    isSymbolInWord := false;

    for index := i to d.Length do
    begin
      if d[index] = c then
        isSymbolInWord := true;
      if d[index] = ' ' then
        break;
    end;

    if isSymbolInWord then
      Delete(d, i, index - i)
    else
      i := index;

    i := i + 1;

  end;
end;

procedure DeleteWordsVariant13(var d: string);

var
  i, index, wordLength: integer;
begin
  i := 1;
  index := 1;

  while i < d.Length do
  begin
    index := i;
    wordLength := 0;
    while index <= d.Length do
    begin
      if d[index] = ' ' then
        break;
      index := index + 1;
      wordLength := wordLength + 1;
    end;

    if wordLength mod 2 = 0 then
    begin
      Delete(d, i + trunc(wordLength / 2), trunc(wordLength / 2));
      i := i + trunc(wordLength / 2) + 1;
    end
    else
    begin
      Delete(d, i + trunc((wordLength + 1) / 2), trunc(wordLength / 2));
      i := i + trunc((wordLength + 1) / 2) + 1;
    end;

  end;
end;

end.
