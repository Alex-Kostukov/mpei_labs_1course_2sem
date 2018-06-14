unit OneDirectionList;

interface

type
  TInfo = integer; //Информационная часть
  PElem = ^TElem; //Указатель

  //Однонаправленный список
  TElem = record
            info: TInfo;
            next: PElem;
          end;

  //Однонапрлавенный список
  Tlist = record
            first,last: PElem;
            prev,itr: PElem; //Адрес до итератора и сам итератор
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

 //Иницилизация список
  procedure Initialize( var list:TList);
  begin
    list.first := nil;
    list.last := nil;
    list.prev := nil;
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
    list.prev:= nil;
  end;

  //Перемещение к след элементу
  procedure GoToNext(var list:Tlist);
  begin
    if list.itr = nil then Exit;
    list.prev:= list.itr;
    list.itr:= list.itr^.next;
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
    p^.next := list.first;
    list.first := p;
    if list.last = nil then
      list.last := p;
  end;

  //В конец
  procedure AddToEnd(var list:TList; info:TInfo);
  var
    p: PElem;


   begin

      new(p); //Выделение памяти
      p^.info := info;

      //Если список пуст
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

  //Вставка перед текущим
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

  //Удаление текущего элемента
  procedure DeleteCurrent (var list:TList);
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
      dispose(list.itr);
      list.itr := list.first;
    end
    else if  list.itr = list.last then
    begin
      //В конце списка
      list.last := list.prev;
      list.last^.next := nil;
      dispose(list.itr);
      list.itr := nil; //На шаг назад сместитьсчя не можем
    end
    else
    begin
      //Внутри списка
      list.prev^.next := list.itr^.next;
      dispose(list.itr);
      list.itr := list.prev^.next;
    end;

   end;

   //Продолжение лекции
   //Возрастания модуля
   //Список заранее отсортирован правильное добавление элемента

end.
