unit TwoDirectionList;

interface
type
  TInfo = integer; //Информационная часть
  PElem = ^TElem; //Указатель

  //Однонаправленный список
  TElem = record
            info: TInfo;
            next, prev: PElem;
          end;

  //Однонапрлавенный список
  Tlist = record
            first,last: PElem;
            itr: PElem; //сам итератор
          end;

procedure Initialize( var list:TList);
function IsEmpty(list:TList): boolean;
procedure SetToFirst(var list:Tlist);
procedure SetToLast(var list:TList);
procedure GoToNext(var list:Tlist);
procedure GoToPrev(var list:Tlist);
function EndReached(var list:Tlist):boolean;
function GetCurrent(list:TList):TInfo;
procedure AddToBegin(var list:TList; info:TInfo);
procedure AddToEnd(var list:TList; info:TInfo);
procedure AddBeforeCurrent(var list:TList; info:TInfo);
procedure DeleteCurrent (var list:TList);
implementation

 //Иницилизация список
  procedure Initialize( var list:TList);
  begin
    list.first := nil;
    list.last := nil;
    list.itr := nil;
  end;

  //Проверка списка на пустоту
  function IsEmpty(list:TList): boolean;
  begin
    Result:= list.first = nil;
  end;

  //Пермещение итератора по списку
  //Установка на первый элемент
  procedure SetToFirst(var list:Tlist);
  begin
    list.itr:= list.first;
  end;

  procedure SetToLast(var list:TList);
  begin
    list.itr:= list.last;
  end;
  //Перемещение к след элементу
  procedure GoToNext(var list:Tlist);
  begin
    if list.itr = nil then Exit;
    list.itr:= list.itr^.next;
  end;

 procedure GoToPrev(var list:Tlist);
  begin
    if list.itr = nil then Exit;
    list.itr:= list.itr^.prev;
  end;
  //Достигнут конец списка
  function EndReached(var list:Tlist):boolean;
  begin
    Result:= list.itr = nil;
  end;

  //Текущее значение элемента
  function GetCurrent(list:TList):TInfo;
  begin
    if list.itr <> nil then
      Result:= list.itr^.info;
  end;

  //Добавление элемнта
  //В начало
  procedure AddToBegin(var list:TList; info:TInfo);
  var
    p: PElem;
  begin
    new(p); //Выделение памяти
    p^.info := info;
    if list.first = nil then
    begin
      p^.next := nil;
      p^.prev := nil;
      list.first := p;
      list.last := p;
    end
    else
    begin
      p^.next := list.first;
      p^.prev := nil;
      list.first^.prev:= p;
      list.first := p;
    end;

  end;

  //В конец
  procedure AddToEnd(var list:TList; info:TInfo);
  var
    p: PElem;


   begin

      new(p); //Выделение памяти
      p^.info := info;
      if list.last  = nil then
      begin
        p^.next := nil;
        p^.prev := nil;
        list.first := p;
        list.last := p;
      end
      else
      begin
        p^.next := nil;
        p^.prev := list.last;
        list.last^.next := p;
        list.last := p;
      end;


   end;

  //Вставка перед текущим
  procedure AddBeforeCurrent(var list:TList; info:TInfo);
 var p: PElem;

 begin

  if list.itr = nil then Exit;

  new(p);
  p^.info := info;

  if list.itr = list.first then
    begin
      p^.prev := nil;
      p^.next := list.first;
      list.first^.prev := p;
      list.first := p;
      list.itr := p;
    end
  else
    begin
      list.itr^.prev^.next := p;
      p^.next := list.itr^.prev;
      p^.next := list.itr;
      list.itr^.prev := p;
      list.itr := p;
    end;
 end;

  //Удаление текущего элемента
  procedure DeleteCurrent (var list:TList);
   var
    p: PElem;
   begin
    //Если итератор пустой
    if list.itr = nil then Exit;

    if list.first = list.last then
    begin
      //Один элемент
      dispose(list.first);
      Initialize(list);
    end
    else if list.itr = list.first then
    begin
      //В начале списка
      list.first := list.first^.next;
      list.first^.prev := nil;
      dispose(list.itr);
      list.itr := list.first;
    end
    else if  list.itr = list.last then
    begin
      //В конце списка
      list.last := list.last^.prev;
      list.last^.next := nil;
      dispose(list.itr);
      list.itr := list.last; //На шаг назад сместитьсчя можем
    end
    else
    begin
      //Внутри списка
      list.itr^.prev^.next := list.itr^.next;
      list.itr^.prev^.prev := list.itr^.prev;
      p:= list.itr^.next;
      dispose(list.itr);
      list.itr := p;
    end;

   end;

   //Продолжение лекции
   //Возрастания модуля
   //Список заранее отсортирован правильное добавление элемента

end.
