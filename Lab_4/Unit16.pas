unit Unit16;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.Grids, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  typeStringArray = array of string;

type
  typeSetOfChar = set of char;

type
  typeSetArray = array of typeSetOfChar;

function Hash1(inputSet: typeSetOfChar): string;
function Hash2(inputSet: typeSetOfChar; key: integer): string;
function Hash3(inputSet: typeSetOfChar; key: integer): string;
procedure GetAmountOfEqualsAndColls(inputArray: typeSetArray;
  hashedArray: typeStringArray; var equals, colls: integer);

implementation

procedure GetAmountOfEqualsAndColls(inputArray: typeSetArray;
  hashedArray: typeStringArray; var equals, colls: integer);
var
  i, j: integer;
begin
  equals := 0;
  colls := 0;

  for i := 0 to length(hashedArray) - 1 do
    for j := i + 1 to length(hashedArray) do
      if hashedArray[i] = hashedArray[j] then
        if inputArray[i] = inputArray[j] then
          equals := equals + 1
        else
          colls := colls + 1;
end;

function Hash1(inputSet: typeSetOfChar): string;
var
  sum: integer;
  ch: char;
begin
  sum := 0;
  for ch in inputSet do
    sum := sum + ord(ch);
  Hash1 := IntToStr(sum);
end;

function Hash2(inputSet: typeSetOfChar; key: integer): string;
var
  m: int64;
  ch: char;
begin
  m := 1;
  for ch in inputSet do
    m := m * ord(ch);
  Hash2 := IntToStr(trunc(m / key));
end;

function Hash3(inputSet: typeSetOfChar; key: integer): string;
var
  ch: char;
  str: string;
begin
  str := '';
  for ch in inputSet do
    str := str + chr(key * (ord(ch) shr 1)) + chr(key + (ord(ch) shl 1));
  Hash3 := str;
end;

end.
