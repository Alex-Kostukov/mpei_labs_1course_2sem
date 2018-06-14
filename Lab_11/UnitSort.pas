unit UnitSort;

interface

uses
 System.SysUtils;

 procedure SortByDirectMerge(NameOfInputFile, NameOfOutputFile: string);
 procedure SortByNaturalMerge(NameOfInputFile, NameOfOutputFile: string);

implementation

 procedure SortByDirectMerge(NameOfInputFile, NameOfOutputFile: string);
  const
    IntermediateFile1 = 'file1.txt';
    IntermediateFile2 = 'file2.txt';
  var
    finp, fout, fin1, fin2: TextFile;
    s,n,i,j,v1,v2,w1,w2:integer;
    eof1, eof2, add:boolean;
  begin
    AssignFile(finp, NameOfInputFile);
    Reset(finp);
    AssignFile(fin1, IntermediateFile1);
    Rewrite(fin1);
    AssignFile(fin2, IntermediateFile2);
    Rewrite(fin2);

    s:=0;
    while not eof(finp) do
     begin
       read(finp,v1);
       write(fin1, ' ',v1);
       if eof(finp) then break;
       read(finp,v2);
       write(fin2, ' ',v2);
       s:=s+1;
     end;

    CloseFile(finp);
    CloseFile(fin1);
    CloseFile(fin2);

    AssignFile(fin1,IntermediateFile1);
    reset(fin1);
    AssignFile(fin2,IntermediateFile2);
    reset(fin2);
    AssignFile(fout,NameOfOutputFile);
    rewrite(fout);

    for i := 1 to s do
      begin
        read(fin1,v1);
        read(fin2,v2);
        if v1<v2 then
          write(fout,' ',v1,' ',v2)
        else
          write(fout,' ',v2,' ',v1);
      end;
    if not eof(fin1) then
      begin
        read(fin1,v1);
        write(fout,' ',v1);
      end;

    CloseFile(fin1);
    CloseFile(fin2);
    CloseFile(fout);

    NameOfInputFile:=NameOfOutputFile;
    n:=1;
    repeat
      s:=s div 2;
      n:=n*2;

      AssignFile(finp, NameOfInputFile);
      Reset(finp);
      AssignFile(fin1, IntermediateFile1);
      Rewrite(fin1);
      AssignFile(fin2, IntermediateFile2);
      Rewrite(fin2);

      for i := 1 to s do
       begin
         for j := 1 to n do
           begin
             read(finp,v1);
             write(fin1,' ',v1);
           end;
         for j := 1 to n do
           begin
             read(finp,v2);
             write(fin2,' ',v2);
           end;
       end;

      i:=1;
      while not eof(finp) and (i<=n) do
       begin
         read(finp,v1);
         write(fin1,' ',v1);
         i:=i+1;
       end;
      while not eof(finp) do
       begin
         read(finp, v2);
         write(fin2,' ',v2);
       end;

      CloseFile(fin1);
      CloseFile(fin2);
      CloseFile(finp);

      AssignFile(fin1,IntermediateFile1);
      reset(fin1);
      AssignFile(fin2,IntermediateFile2);
      reset(fin2);
      AssignFile(fout,NameOfOutputFile);
      rewrite(fout);

      eof1:=false;
      eof2:=false;
      read(fin1,v1);
      read(fin2,v2);

      for i := 1 to s do
        begin
          w1 := 0;
          w2 := 0;
          while (w1<n) and (w2<n) do
            if v1<v2 then
              begin
                write(fout,' ',v1);
                w1:=w1+1;
                if eof(fin1) then
                  eof1:=true;
                read(fin1,v1);
              end
            else
              begin
                write(fout,' ',v2);
                w2:=w2+1;
                if eof(fin2) then
                  eof2:=true;
                read(fin2,v2);
              end;


      while w1<n do
        begin
           write(fout,' ',v1);
           w1:=w1+1;
           if eof(fin1) then
             eof1:=true;
           read(fin1,v1);
        end;

      while w2<n do
        begin
           write(fout,' ',v2);
           w2:=w2+1;
           if eof(fin2) then
             eof2:=true;
           read(fin2,v2);
        end;
      end;

      if eof1 and eof2 then
        add:=false
      else
        add:=true;

      while not eof1 and not eof2 do
        if v1<v2 then
          begin
            write(fout,' ',v1);
            if eof(fin1) then
              eof1:=true;
            read(fin1,v1);
          end
        else
         begin
           write(fout,' ',v2);
            if eof(fin2) then
              eof2:=true;
            read(fin2,v2);
         end;

      while not eof1 do
        begin
          write(fout,' ',v1);
          if eof(fin1) then
            eof1:=true;
          read(fin1,v1);
        end;

       while not eof2 do
        begin
           write(fout,' ',v2);
            if eof(fin2) then
              eof2:=true;
            read(fin2,v2);
        end;

       CloseFile(fin1);
       CloseFile(fin2);
       CloseFile(fout);
    until (s=0) or (s=1) and not add;

    DeleteFile(IntermediateFile1);
    DeleteFile(IntermediateFile2);
  end;

 procedure SortByNaturalMerge(NameOfInputFile, NameOfOutputFile: string);
  const
    IntermediateFile1 = 'file1.txt';
    IntermediateFile2 = 'file2.txt';
  var
    finp, fout, fin1, fin2: TextFile;
    s,v1,v2,vp1,vp2:integer;
    file1, eof1, eof2, eos1, eos2:boolean;
 begin
     //разделение
   repeat
     //открыли
     AssignFile(finp, NameOfInputFile);
     AssignFile(fin1, IntermediateFile1);
     AssignFile(fin2, IntermediateFile2);
     Reset(finp);
     Rewrite(fin1);
     Rewrite(fin2);
     //file1 обеспечивает выбор файла для записи текущей серии
     file1:=true;
     //общее количество серий в 2 файлах
     s:=1;
     read(finp,v1);
     while not eof(finp) do
      begin
        read(finp,v2);
        if file1 then
         write(fin1,' ',v1)
        else
         write(fin2,' ',v1);
        if v1>v2 then
         begin
           file1:=not file1;
           s:=s+1;
         end;
        v1:=v2;
      end;
     //дописываем оставшееся число
     if file1 then
      write(fin1,' ',v1)
     else
      write(fin2,' ',v1);
   //закрыли
   CloseFile(finp);
   CloseFile(fin1);
   CloseFile(fin2);
    {слияние}
   //открыли
   AssignFile(fin1, IntermediateFile1);
   AssignFile(fin2, IntermediateFile2);
   Reset(fin1);
   Reset(fin2);
   AssignFile(fout,NameOfOutputFile);
   Rewrite(fout);

   eof1:=false;
   eof2:=false;
   // если 1 серия, то файл 2 пуст
   if s=1 then
     eof2:=true;
   read(fin1,v1);
   read(fin2,v2);
   while not eof1 and not eof2  do
    begin
      eos1:=false;
      eos2:=false;
      while not eos1 and not eos2 do
       begin
        if v1<v2 then
         begin
           write(fout,' ', v1);
           if eof(fin1) then
            begin
              eos1:=true;
              eof1:=true;
              break;
            end;
           vp1:=v1;
           read(fin1,v1);
           if vp1>v1 then
          eos1:=true;
       end
      else
       begin
         //то же самое, но для 2 файла
         write(fout,' ', v2);
         if eof(fin2) then
          begin
            eos2:=true;
            eof2:=true;
            break;
          end;
         vp2:=v2;
         read(fin2,v2);
         if vp2>v2 then
          eos2:=true;
       end;
    end;
   // в одном из файлов серия закончилась - записываем серию из другого файла
   while not eos1 do
    begin
      write(fout,' ',v1);
      if eof(fin1) then
       begin
         eof1:=true;
         eos1:=true;
         break;
       end;
      vp1:=v1;
      read(fin1,v1);
      if vp1>v1 then eos1:=true;
    end;

   while not eos2 do
    begin
      //то же самое, но для 2 файла
      write(fout,' ',v2);
      if eof(fin2) then
       begin
         eof2:=true;
         eos2:=true;
         break;
       end;
      vp2:=v2;
      read(fin2,v2);
      if vp2>v2 then eos2:=true;
    end;
    end;
    //достигнут конец из файлов - дописываем до конца данные из другого файла
    while not eof1 do
     begin
       write(fout,' ',v1);
       if eof(fin1) then eof1:=true;
       read(fin1,v1);
     end;

    while not eof2 do
     begin
     // то же самое, но для 2 файла
       write(fout,' ',v2);
       if eof(fin2) then eof2:=true;
       read(fin2,v2);
     end;
    //закрываемся
    CloseFile(fout);
    CloseFile(fin1);
    CloseFile(fin2);

    NameOfInputFile:=NameOfOutputFile;
   until s<=2;
   DeleteFile(IntermediateFile1);
   DeleteFile(IntermediateFile2);
 end;

 end.
