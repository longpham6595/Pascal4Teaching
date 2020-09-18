
Program ex1;

Uses crt;

Var a,b,c,d,tskq,mskq: integer;
  f: text;

  // Đọc file
Procedure nhap;
Begin
  assign(f,'bai1.inp');
  reset(f);
  readln(f,a,b);
  readln(f,c,d);
  close(f);
End;



Function ucln(x,y:integer): integer;

Var p,q: integer;
Begin
  p := x;
  q := y;
  //Xử lý bằng giải thuật euclide
  While p<>q Do
    Begin
      If p>q Then
        p := p-q
      Else
        q := q-p;
      If p = 0 Then
        q := 0;
      If q = 0 Then
        p := 0;
    End;
  ucln := p;
End;

//Xuất kết quả ra file
Procedure xuat;
Begin
  assign(f,'Bai1.oup');
  rewrite(f);
  If (b<>0) And (d<>0) Then
    write(f,tskq,' ',mskq)
  Else
    write(f,'-1');
  close(f);
End;



Begin
  clrscr;
  //write('Nhap a,b cach nhau mot khoang cach: ');
  //readln(a,b);
  //write('Nhap c,d cach nhau mot khoang cach: ');
  //readln(c,d);
  //writeln(a,'/',b);
  //writeln(ucln(a,b));
  //writeln(c,'/',d);
  //writeln(ucln(c,d));
  //writeln(ucln(a*d+b*c,b*d));
  nhap;
  If (b <>0) And (d<>0) Then
    Begin
      tskq := (a*d+b*c) Div ucln(a*d+b*c,b*d);
      mskq := b*d Div ucln(a*d+b*c,b*d);
      write(a,'/',b,' + ',c,'/',d,' = ',tskq,'/',mskq);
    End;
  xuat;
  readln
End.
