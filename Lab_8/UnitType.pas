unit UnitType;

interface

type
  TIntFile = file of integer;

type
  TRealFile = file of real;

type
  ty_Inum = record
    value: integer;
    position: integer;
  end;

type
  ty_Rnum = record
    value: real;
    position: integer;
  end;

implementation

end.
