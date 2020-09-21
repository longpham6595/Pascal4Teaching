
Program ex3;

Uses crt;

Var m,n: int64;
  f: text;
Procedure nhap;
Begin
  assign(f,'Bai3.inp');
  reset(f);
  read(f,m,n);
  close(f);
End;

Function ktdx(x:integer): boolean;

Var kq: boolean;
  st: string;
  i: integer;
Begin
  str(x,st);
  kq := true;
  If length(st) > 1 Then
    For i:= 1 To (length(st) Div 2) Do
      If st[i] <> st[length(st)-i+1] Then
        kq := false;
  ktdx := kq;
End;

Procedure xuat;

Var f: text;
Begin
  assign(f,'bai3.oup');
  rewrite(f);
  close(f);

  assign(f,'bai3.oup');
  append(f);
  While (m <= n) Do
    Begin
      If ktdx(m) Then
        writeln(f,m);
      inc(m);
    End;
  close(f);
End;



Begin
  clrscr;
  nhap;
  //writeln(ktdx(1));
  xuat;
  writeln('Program Finished!!');
  readln
End.
