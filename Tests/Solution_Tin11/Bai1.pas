
Program ex1;

Uses crt;

Var a,b: integer;

Function ucln(x,y:integer): integer;

Var p,q: integer;
Begin
  p := x;
  q := y;
  //Xử lý bằng giải thuật euclide
  While p<>q Do
    If p>q Then
      p := p-q
    Else
      q := q-p;
  ucln := p;
End;





Begin
  clrscr;
  write('Nhap a,b cach nhau mot khoang cach: ');
  readln(a,b);
  writeln(a,'/',b);
  write(ucln(a,b));


  readln
End.
