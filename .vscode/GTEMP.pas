
Program ct;

Uses crt;

Var i,n,csl: integer;
  f: text;
  sn,s1,s2,s: array [0..10000] Of longint;
  s1luu,s2luu,sluu: array [0..10000] Of string;


Procedure nhap;
Begin
  assign(f,'wavio.inp');
  reset(f);
  readln(f,n);
  For i:=1 To n Do
    read(f,sn[i]);
  close(f);
  csl := 0;
End;

Procedure xulymang_1;

Var max,csltam,p: integer;
Begin
  For i:=1 To n Do
    Begin
      s1[i] := 1;
      str(sn[i],s1luu[i]);
    End;
  i := 1;
  Repeat
    inc(i);
    max := 1;
    For p:=1 To i-1 Do
      If (sn[p]<sn[i]) And (max<(s1[p]+1)) Then
        Begin
          max := s1[p]+1;
          csltam := p;
        End;
    If csltam>0 Then
      Begin
        s1luu[i] := s1luu[csltam]+' '+s1luu[i];
        s1[i] := s1[csltam]+1;
        csltam := 0;
      End
    Else
      csltam := 0;
  Until i>n;
End;
Procedure xulymang_2;

Var p,max,csltam: integer;
Begin
  For p:=1 To n Do
    Begin
      s2[p] := 1;
      str(sn[p],s2luu[p]);
    End;
  i := n;
  csltam := 0;
  While i>0 Do
    Begin
      dec(i);
      max := 1;
      For p:=n Downto (i+1) Do
        If (sn[p]<sn[i]) And (max<(s2[p]+1)) Then
          Begin
            csltam := p;
            max := s2[p]+1;
          End;
      If csltam <> 0 Then
        Begin
          s2[i] := max;
          s2luu[i] := s2luu[i]+' '+s2luu[csltam];
        End;
      csltam := 0;
    End;
End;
Procedure xuly;

Var p,t,csm: integer;
Begin
  For p:=1 To n Do
    Begin
      t := pos(' ',s2luu[p]);
      If t=0 Then
        s2luu[p] := ''
      Else
        delete(s2luu[p],1,t-1);
    End;
  For p:=1 To n Do
    Begin
      s[p] := s1[p]+s2[p]-1;
      sluu[p] := s1luu[p]+s2luu[p];
    End;
  csm := 1;
  For p:=2 To n Do
    If s[csm]<s[p] Then
      csm := p;
  writeln(s[csm]);
  write(sluu[csm]);
End;
Begin
  clrscr;
  nhap;
  xulymang_1;
  xulymang_2;
  xuly;
  readln;
End.
