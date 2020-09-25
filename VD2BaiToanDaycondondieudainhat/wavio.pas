
Program wavio;

Uses crt;

Var sn: array[1..10000] Of integer;
  luu: array[1..10000] Of string;
  sopt: array[1..10000] Of integer;
  duyet: array [1..10000] Of integer;
  i,n,demtt,batdau,csl,csduyet: integer;
  ttht: string;
  f: text;
Procedure nhap;
Begin
  assign(f,'wavio.inp');
  reset(f);
  read(f,n);
  For i:=1 To n Do
    read(f,sn[i]);
  close(f);
  csl := 0;
End;
Procedure khoitao;

Var p: integer;
Begin
  demtt := 0;
  ttht := 'None';
  For p:=1 To csduyet Do
    duyet[p] := 0;
  csduyet := 0;
End;
Procedure switch(x:String);
Begin
  If x[1]='T' Then
    ttht := 'G'
  Else
    ttht := 'T';
End;
Procedure xuat(x:integer);

Var q,k: integer;
  st: string;
Begin
  inc(csl);
  sopt[csl] := csduyet;
  luu[csl] := '';
  For q:=1 To csduyet Do
    Begin
      str(sn[duyet[q]],st);
      st := ' '+st;
      luu[csl] := luu[csl]+st;
    End;
End;
Procedure xuly(x:integer);

Var p: integer;
Begin
  If (x=n+1) Or (demtt=3) Then
    xuat(csduyet)
  Else
    Begin
      If (demtt = 0) Then
        Begin
          inc(demtt);
          ttht := 'T';
          For p:=x+1 To n Do
            Begin
              If sn[x] < sn[p] Then
                Begin
                  inc(csduyet);
                  duyet[csduyet] := p;
                  xuly(p);
                  duyet[csduyet] := 0;
                  dec(csduyet);
                End;
              If (sn[x] > sn[p]) Then
                Begin
                  switch(ttht);
                  inc(demtt);
                  inc(csduyet);
                  duyet[csduyet] := p;
                  xuly(p);
                  switch(ttht);
                  dec(demtt);
                  duyet[csduyet] := 0;
                  dec(csduyet);
                End;
            End;
        End;
      If (demtt = 1) Then
        For p:= x+1 To n Do
          Begin
            If (sn[p] > sn[x]) Then
              Begin
                inc(csduyet);
                duyet[csduyet] := p;
                xuly(p);
                duyet[csduyet] := 0;
                dec(csduyet);
              End;
            If (sn[p] < sn[x]) Then
              Begin
                switch(ttht);
                inc(demtt);
                inc(csduyet);
                duyet[csduyet] := p;
                xuly(p);
                duyet[csduyet] := 0;
                dec(csduyet);
                switch(ttht);
                dec(demtt);
              End;
          End;

      If (demtt=2) Then
        For p:= x+1 To n Do
          Begin
            If sn[p] < sn[x] Then
              Begin
                inc(csduyet);
                duyet[csduyet] := p;
                xuly(p);
                duyet[csduyet] := 0;
                dec(csduyet);
              End;
            If sn[p] > sn[x] Then
              Begin
                inc(demtt);
                xuly(p);
                dec(demtt);
              End;
          End;

    End;
End;
Function findmax: integer;

Var csmax, iditem: integer;
Begin
  iditem := 1;
  csmax := 1;
  While iditem < csl Do
    Begin
      inc(iditem);
      If sopt[iditem] > sopt[csmax] Then
        csmax := iditem;
    End;
  findmax := csmax;
End;
Begin
  clrscr;
  nhap;
  khoitao;
  For i:=1 To n Do
    Begin
      batdau := i;
      inc(csduyet);
      duyet[csduyet] := i;
      xuly(i);
      khoitao;
    End;
  For i:=1 To csl Do
    Begin
      write(luu[i]:20);
      writeln(sopt[i]:3);
    End;
  writeln;
  write(sopt[findmax], ' -> ',luu[findmax]);
  readln;
End.
