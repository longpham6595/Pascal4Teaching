
Program btmaudq;

Uses crt;

Var f: text;
  n,a,b,r,s,csl: integer;
  dd: array[1..100,1..100] Of boolean;
  ck: array[1..100] Of boolean;
  luuvet: array[1..100] Of integer;

Procedure khoitao;

Var p,q: integer;
Begin
  For p:=1 To 100 Do
    For q:=1 To 100 Do
      dd[p,q] := false;
End;

Procedure nhap;

Var p: integer;
Begin
  assign(f,'duongdi.inp');
  reset(f);
  readln(f,n,a,b);
  While Not(eof(f)) Do
    Begin
      readln(f,r,s);
      dd[r,s] := true;
      dd[s,r] := true;
    End;
  close(f);
  csl := 1;
  luuvet[1] := a;
  For p:=1 To 100 Do
    ck[p] := false;
  ck[a] := true;
End;

Procedure xuat;

Var p: integer;
Begin
  For p:=1 To csl Do
    write(luuvet[p],' ');
  writeln;
End;

Procedure xuly(x:integer);

Var p: integer;
Begin
  For p:=1 To n Do
    Begin
      If ((ck[p]=false) And (dd[x,p]=true) And (p<>b)) Then
        Begin
          inc(csl);
          luuvet[csl] := p;
          ck[p] := true;
          xuly(p);
          ck[p] := false;
          luuvet[csl] := 0;
          dec(csl);
        End
      Else
        If ((p=b) And (dd[x,p]=true)) Then
          Begin
            inc(csl);
            luuvet[csl] := p;
            xuat;
            luuvet[csl] := 0;
            dec(csl);
          End;
    End;
End;

Procedure xuatthunghiem;

Var k,p: integer;
Begin
  For k:=1 To n Do
    Begin
      For p:=1 To n Do
        write(dd[k,p],' ');
      writeln;
    End;
End;


Begin
  clrscr;
  khoitao;
  nhap;
  xuly(a);
  //xuatthunghiem;
  readln;
End.
