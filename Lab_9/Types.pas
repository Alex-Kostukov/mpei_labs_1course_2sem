unit Types;

interface

type
  TStudent = record
    group: string[7];
    name: string[30];
    birthday: string[10];
    sex: (null, male, female);
    physics: integer;
    math: integer;
    informatics: integer;
    stipend: integer;
  end;

type
  TArrayOfStudents = array of TStudent;

implementation

end.
