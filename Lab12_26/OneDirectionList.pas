unit OneDirectionList;

interface

type
  TInfo = integer; //�������������� �����
  PElem = ^TElem; //���������

  //���������������� ������
  TElem = record
            info: TInfo;
            next: PElem;
          end;

  //���������������� ������
  Tlist = record
            first,last: PElem;
            prev,itr: PElem; //����� �� ��������� � ��� ��������
          end;

procedure Initialize( var list:TList);
function IsEmpty(list:TList): boolean;
procedure SetToFirst(var list:Tlist);
procedure GoToNext(var list:Tlist);
function EndReached(var list:Tlist):boolean;
function GetCurrent(list:TList):TInfo;
procedure AddToBegin(var list:TList; info:TInfo);
procedure AddToEnd(var list:TList; info:TInfo);
procedure AddBeforeCurrent(var list:TList; info:TInfo);
procedure DeleteCurrent (var list:TList);
implementation

 //������������ ������
  procedure Initialize( var list:TList);
  begin
    list.first := nil;
    list.last := nil;
    list.prev := nil;
    list.itr := nil;
  end;

  //�������� ������ �� �������
  function IsEmpty(list:TList): boolean;
  begin
    Result:= list.first = nil;
  end;

  //���������� ��������� �� ������
  //��������� �� ������ �������
  procedure SetToFirst(var list:Tlist);
  begin
    list.itr:= list.first;
    list.prev:= nil;
  end;

  //����������� � ���� ��������
  procedure GoToNext(var list:Tlist);
  begin
    if list.itr = nil then Exit;
    list.prev:= list.itr;
    list.itr:= list.itr^.next;
  end;

  //��������� ����� ������
  function EndReached(var list:Tlist):boolean;
  begin
    Result:= list.itr = nil;
  end;

  //������� �������� ��������
  function GetCurrent(list:TList):TInfo;
  begin
    if list.itr <> nil then
      Result:= list.itr^.info;
  end;

  //���������� �������
  //� ������
  procedure AddToBegin(var list:TList; info:TInfo);
  var
    p: PElem;
  begin
    new(p); //��������� ������
    p^.info := info;
    p^.next := list.first;
    list.first := p;
    if list.last = nil then
      list.last := p;
  end;

  //� �����
  procedure AddToEnd(var list:TList; info:TInfo);
  var
    p: PElem;


   begin

      new(p); //��������� ������
      p^.info := info;

      //���� ������ ����
      if list.first = nil then
        begin
          p^.next := list.first;
          list.first := p;
          list.last := p;
        end
      else
        begin
          list.last^.next := p;
          list.last := p;
        end;

   end;

  //������� ����� �������
  procedure AddBeforeCurrent(var list:TList; info:TInfo);
 var p: PElem;

 begin

  if list.itr = nil then Exit;

  new(p);
  p^.next := list.itr;
  p^.info := info;

  if list.prev = nil then
    begin
      list.first := p;
    end
  else
    begin
      list.prev^.next := p;
    end;

  list.prev := p;
 end;

  //�������� �������� ��������
  procedure DeleteCurrent (var list:TList);
   begin
    //���� �������� ������
    if list.itr = nil then Exit;

    if list.first = list.last then
    begin
      //���� �������
      dispose(list.first);
      Initialize(list);
    end
    else if list.itr = list.first then
    begin
      //� ������ ������
      list.first := list.first^.next;
      dispose(list.itr);
      list.itr := list.first;
    end
    else if  list.itr = list.last then
    begin
      //� ����� ������
      list.last := list.prev;
      list.last^.next := nil;
      dispose(list.itr);
      list.itr := nil; //�� ��� ����� ����������� �� �����
    end
    else
    begin
      //������ ������
      list.prev^.next := list.itr^.next;
      dispose(list.itr);
      list.itr := list.prev^.next;
    end;

   end;

   //����������� ������
   //����������� ������
   //������ ������� ������������ ���������� ���������� ��������

end.
