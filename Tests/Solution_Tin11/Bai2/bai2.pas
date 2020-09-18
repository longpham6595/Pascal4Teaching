
Program bai2;

Uses crt;

Var s: AnsiString;
  f: text;
  counter: array [1..26] Of longint;


Procedure nhap;

Var s_temp: AnsiString;
Begin
  assign(f,'Bai2.inp');
  reset(f);
  s := '';
  While Not eof(f) Do
    Begin
      readln(f,s_temp);
      s := s + s_temp;
    End;
  close(f);
End;

Procedure xuly;

Var i: longint;
  p: integer;
Begin
  For i:=1 To 26 Do
    counter[i] := 0;
  For i := 1 To length(s) Do
    If pos(s[i],'abcdefghijklmnopqrstuvwxyz')<>0 Then
      Begin
        p := pos(s[i],'abcdefghijklmnopqrstuvwxyz');
        inc(counter[p]);
      End;
  //For i:=1 To 26 Do
  //  write(counter[i],' ');
End;

Procedure xuat;

Var i: integer;
  alphabet,str_oup,str_counter: string;
Begin

//Thực hiện xóa toàn bộ dữ liệu đã lưu của lần xử lý trước
  assign(f,'Bai2.oup');
  rewrite(f);
  close(f);

  assign(f,'Bai2.oup');
  append(f);

  alphabet := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  For i :=1 To 26 Do
    Begin
      str(counter[i],str_counter);
      str_oup := alphabet[i] + ' ' + str_counter;
      writeln(f,str_oup);
    End;
  close(f);
End;

Begin
  nhap;
  //write(s);
  xuly;
  xuat;
  //readln
End.
