
Program ct;

Uses crt;

Var i, n: longint;

Function dequi(x:longint): longint;
Begin
  If (x=1) Or (x=2) Then
    dequi := 1
  Else
    dequi := dequi(x-1) + dequi(x-2);
End;
Begin
  clrscr;
  write('Nhap so thu tu cua so fibonacci: ');
  readln(n);
  writeln('So hang thu ',n,' cua day fibonacci la: ',dequi(n));
  writeln('Day fibonacci la: ');
  For i:=1 To n-1 Do
    write(dequi(i),' <-> ');
  write(dequi(n));
  readln
End.
