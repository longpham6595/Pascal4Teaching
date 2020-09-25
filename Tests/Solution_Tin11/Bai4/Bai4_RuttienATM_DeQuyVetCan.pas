
Program ex4;

Uses crt;

Var ST,SL,csm,i,j,PendingTotal,min,cs_fin: integer;
  Li,Si: array [1..6] Of integer;
  listOut: array [0..6] Of integer;
  fin_Check: array [1..100000] Of integer;
  saveOut: array [1..100000,0..6] Of integer;

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
  saveOut[csm][0] := 0;
  For t:=1 To SL Do
    Begin
      saveOut[csm][t] := listOut[t];
      saveOut[csm][0] := saveOut[csm][0] + listOut[t];
    End;
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
//writeln(t,' : ',listOut[1],' - ',listOut[2],' - ',listOut[3],' - ',listOut[4],' - ',listOut[5],' - ',listOut[6],' -> ',PendingTotal, ' <-> ', listOut[0],'.');
        unload(t);
        //delay(100);
      End;

  //Xử lý tạo mảng check để check số lượng trùng

End;

Function csmin: integer;

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

function check(x:integer):boolean;
var kq,per_item: boolean;
  t, k: integer;
begin
  //Mặc định kết quả là True tức là đây là chuỗi kết quả mới
  kq:= true;
  for t:= 1 to cs_fin do
    begin
      //Mặc định ban đầu chuỗi saveOut[x] và chuỗi saveOut[fin_Check[t]] là giống nhau
      per_item := true;
      for k:=1 to SL do
        if (saveOut[x][k] <> saveOut[fin_Check[t]][k]) Then
          //Nếu chuỗi có một phần tử khác nhau so với chuỗi t đang so sánh trong dãy kết quả thì trả về chuỗi này khác chuỗi t
          per_item := false;
      //Nếu chuỗi saveOut[x] và chuỗi saveOut[fin_Check[t]] là giống nhau thì trả về kết quả lặp
      if per_item Then
        kq := false;
    end;
    check := kq;
end;

Procedure cs_check;

Var t: integer;
Begin
  for t:=1 to csm do
   if check(t) Then
    begin
      inc(cs_fin);
      fin_Check[cs_fin] := t;
    end;
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
      k := csmin;
      writeln(f,cs_fin,' ',saveOut[k][0]);

      For t:= 1 To SL Do
        writeln(f,Li[t],' ',saveOut[k][t]);
    End;
  close(f);
  //Xác định xuất thành công
  writeln('Finished!!!');
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
  cs_check;
  xuat;

  //Xuất kiểm tra dữ liệu đầu ra
  For i:=1 To cs_fin Do
    Begin
      For j:= 0 To SL Do
        write(saveOut[fin_Check[i]][j],' - ');
      writeln();
    End;
  readln
End.
