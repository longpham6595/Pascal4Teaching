program ct;
    uses crt;
    var s,a,b: integer;
begin
    clrscr;
    write('Nhap a: ');
    readln(a);
    write('Nhap b: ');
    readln(b);
    s := a+b;
    writeln('Tong cua hai so ',a,' va ',b,' la: ',s);
    readln
end.