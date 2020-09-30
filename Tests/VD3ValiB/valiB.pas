
Program vlb;

Uses crt;

Var n,m,cs_oup: integer;
  a,v,list_oup: array [0..100000] Of integer;
  bg: array[0..10000,0..10000] Of integer;
  truyvet: array[0..10000,0..10000] Of integer;
  total_oup: integer;

Procedure nhap;

Var f: text;
  t: integer;
Begin
  assign(f,'vali.inp');
  reset(f);
  readln(f,n,m);
  t := 0;
  While Not(eof(f)) Do
    Begin
      inc(t);
      readln(f,a[t],v[t]);
    End;
  close(f);
End;

Procedure kiemtranhap;

Var t: integer;
Begin
  For t:=1 To n Do
    writeln(a[t],' - ',v[t]);
End;

Procedure khoitao;

Var i,j: integer;
Begin
  For j:= 0 To m Do
    bg[0][j] := 0;
  For i:=0 To n Do
    bg[i][0] := 0;

  // Khởi tạo dãy Lưu
  cs_oup := 0;
  total_oup := 0;
End;


Procedure xuly;

Var i,j: integer;
Begin
  For i:=1 To n Do
    For j:=1 To m Do
      Begin
        bg[i][j] := bg[i-1][j];
        truyvet[i][j] := truyvet[i-1][j];
        If (a[i] <= j) And (bg[i][j] <= (bg[i-1][j-a[i]]+v[i])) Then
          Begin
            bg[i][j] := bg[i-1][j-a[i]]+v[i];
            truyvet[i][j] := i;
          End;
      End;
End;

Procedure kiemtrakqxl;

Var i,j: integer;
Begin
  For i:=0 To n Do
    Begin
      For j:=0 To m Do
        write(bg[i][j]:3,' - ');
      writeln;
    End;
  writeln;
  For i:=0 To n Do
    Begin
      For j:=0 To m Do
        write(truyvet[i][j]:3,' - ');
      writeln;
    End;
End;

procedure xuatkq;
var tracer,cur_weight,i: integer;
    f:text;
begin
    total_oup := bg[n][m];
    tracer :=n;
    cur_weight := m;
    while tracer <> 0 do
        begin
            inc(cs_oup);
            list_oup[cs_oup] := truyvet[tracer][cur_weight];
            cur_weight := cur_weight - a[truyvet[tracer][cur_weight]];
            tracer := truyvet[tracer][cur_weight];
            writeln(tracer,' - ', cur_weight);
        end;

    //Tiến hành test xuất kết quả ra màn hình
    //writeln;
    writeln(total_oup);
    for i:=1 to cs_oup do
        write(list_oup[i],' - ');

    //Tiến hành xuất ra file
    assign(f,'vali.oup');
    rewrite(f);
    writeln(f,total_oup);
    for i:=cs_oup downto 1 do
        write(f,list_oup[i],' ');
    close(f);
end;



Begin
  clrscr;
  nhap;
  kiemtranhap;
  khoitao;
  xuly;
  kiemtrakqxl;
  xuatkq;
  readln;
End.
