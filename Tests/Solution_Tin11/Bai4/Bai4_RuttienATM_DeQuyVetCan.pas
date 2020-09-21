
Program ex4;

Uses crt;

Var ST,SL,csm,i,j,PendingTotal,min: integer;
  Li,Si: array [1..6] Of integer;
  listOut: array [1..6] Of integer;
  saveOut: array [1..100000,1..6] Of integer;

Procedure nhap;

Var f: text;
  t: integer;
Begin
  assign(f,'Bai4.inp');
  reset(f);
  readln(f,ST,SL);
  t := 0;
  While (Not eof(f)) Do
    Begin
      inc(t);
      readln(f,Li[t],Si[t]);
    End;
  close(f);
  csm := t;

  //Khởi tạo chỉ số lưu bằng 0
  csm := 0;
  //Khởi tạo PendingTotal bằng 0
  PendingTotal := 0;
  //Khởi tạo cho listOut bằng 0
  For i:=1 To 6 Do
    listOut[i] := 0;
End;








//Lưu dữ liệu khi nhận được kết quả thích hợp trong quá trình đệ quy vét cạn
Procedure saveOutcome;

Var t: integer;
Begin
  inc(csm);
  For t:=1 To SL Do
    saveOut[csm][t] := listOut[t];
End;

//Load trạng thái này lên để kiểm định
//Chỉ số đưa vào có mệnh giá tương ứng
Procedure load(x:integer);

Begin
  inc(listOut[x]);
  PendingTotal := PendingTotal + Li[x];
  If (PendingTotal = ST) Then
    saveOutcome;
End;







//Unload trạng thái xuống để trả lại trạng thái cũ trong quá trình đệ quy
Procedure unload(x:integer);

Begin
  dec(listOut[x]);
  PendingTotal := PendingTotal - Li[x];
End;

//Xử lý quá trình duyệt qua các kết quả khả dĩ
Procedure solver;

Var t: integer;
Begin
  For t :=1 To SL Do
    If ((Si[t] > listOut[t]) And (PendingTotal < ST)) Then
      Begin
        load(t);
        solver;
        writeln(t,' : ',listOut[1],' - ',listOut[2],' - ',listOut[3],' - ',
                listOut[4],' - ',listOut[5],' - ',listOut[6],' -> ',PendingTotal
                ,'.');
        unload(t);
        //delay(100);
      End;
End;

Function csmin:integer;

Var t,l,temp_kq,cs,min: integer;
Begin
  min := 0;
  For t:=1 To csm Do
    Begin
      temp_kq := 0;
      For l:=1 To SL Do
          temp_kq := temp_kq + saveOut[t][l];
      If ((min = 0) Or (temp_kq < min)) Then
        Begin
          cs := t;
          min := temp_kq;
        End;
    End;
  csmin := cs;
End;

Procedure xuat;

Var f: text;
  t,k: integer;
Begin
  assign(f,'Bai4.oup');
  rewrite(f);
  If csm = 0 Then
    writeln(f,csm)
  Else
        Begin
          writeln(f,csm,' ',min);
          k := csmin;
          For t:= 1 To SL Do
            writeln(f,Li[k],' ',saveOut[k][t]);
        End;
  close(f);
End;

Begin
  clrscr;
  nhap;

  //Test thử dữ liệu đầu vào
  writeln(ST,' - ',SL);
  For i:=1 To SL Do
    writeln(Li[i],' - ',Si[i]);

  For i:=1 To 6 Do
    write(listOut[i],' - ');
  writeln;

  solver;

  xuat;


  readln
End.
