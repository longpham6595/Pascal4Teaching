
Program ct3;

Uses crt;

Var st: string;

Procedure nhap;
Begin
  write('Nhap chuoi: ');
  readln(st);
End;

Function check_counter: integer;

Var i,j,csl,p: integer;
  sluu: array [1..10000] Of string;
  st_temp: string;
  ck_status: boolean;
Begin
  csl := 1;
  For i:= length(st) Downto 1 Do
    For j:= 1 To (length(st)-(i-1)) Do
      Begin
        st_temp := copy(st,j,i);
        //writeln(st_temp);
        ck_status := true;
        For p:= 1 To csl Do
          If sluu[p] = st_temp Then
            ck_status := false;
        If ck_status Then
          Begin
            inc(csl);
            sluu[csl] := st_temp;
          End;
      End;
  check_counter := csl-1;
End;


Procedure xuat;
Begin
  writeln('So thanh luy toi da co the xay dung: ',check_counter);
End;



Begin
  clrscr;
  nhap;
  xuat;
  readln
End.
