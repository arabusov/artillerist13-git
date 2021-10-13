uses crt, oglgraph;
var gunx, gm, gd, x1, y1, x2, y2, x3, y3, x4, y4, v, a, yy, x, t, y, ex, g, dx, dy : integer;
	f : text;
reliefx  : array[0..16] of integer;
reliefy  : array[0..16] of integer;
procedure gun;
		begin
		circle(gunx, 495, 5);
		line(gunx-10, 490, gunx+20, 480);
		line(gunx+20, 480, gunx+17, 475);
		line(gunx+17, 475, gunx-13, 485);
		line(gunx-10, 490, gunx-13, 485);
		line(gunx-3, 495, gunx-20, 500);
		line(gunx-6, 490, gunx-23, 495);
		line(gunx-20, 500, gunx-23, 495);		
		end;
procedure explode(u, i : integer);					
begin		
setcolor(white);
setfillstyle(0, white);
fillellipse(u-15, i+20, 30, 30);
delay(150);
setcolor(red);
fillellipse(u+10, i-10, 20, 20);
delay(150);
setcolor(yellow);
fillellipse(u-5, i-15, 20, 20);
end;		
function placecheck(xx0 : integer) : integer;
	var ii0 : integer;
	begin
	repeat 
	if ((xx0>=reliefx[ii0]) and (xx0<=reliefx[ii0+1])) then
			placecheck:=reliefy[ii0];
	ii0:=ii0+1;
	until placecheck<>0;
	end;

procedure fly;
var inp7, yyy : integer;
begin
y:=5;
x:=0;
ex:=0;
t:=0;
	repeat
	g:=10;
	setcolor(white);
	circle(x+gunx,500-y,3);
	delay(50);
	setcolor(black);
	circle(x+gunx,500-y,3);
	x:=round(dx*t/1);
	y:=round((dy*t-(t*t))/1);
	t:=t+1;
	yyy:=placecheck(x+gunx);
	if y>=yyy then ex:=1;
	until ex=1;
end;



BEGIN
assign(f, 'relief.txt');
	reset(f);
	read(f, reliefx[1]);
	read(f, reliefy[1]);
	read(f, reliefx[2]);
	read(f, reliefy[2]);
	read(f, reliefx[3]);
	read(f, reliefy[3]);
	read(f, reliefx[4]);
	read(f, reliefy[4]);
	gd := Detect; 
	gm := DetectMode;	
	initgraph(gd, gm, '');
gunx:=40;
line(reliefx[1],reliefy[1],reliefx[2],reliefy[2]);
line(reliefx[3],reliefy[3],reliefx[2],reliefy[2]);
line(reliefx[3],reliefy[3],reliefx[4],reliefy[4]);
gun;
writeln('Введите скорость и угол броска');
		readln(v,a);
		dx:=round(v*cos(a/57));
		dy:=round(v*sin(a/57));
fly;
explode(x, y);
repeat until keypressed;
closegraph;
	
END.
