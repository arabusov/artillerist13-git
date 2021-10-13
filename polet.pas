uses crt, oglgraph;
type obj=record
x,typ,health,uvis,maxhp,gx,gy,speed : integer;
end;
Label levelstart;
var lev, numb, inp, inp3, inp4, inp5 : integer;
	inp1 : integer;
	rast, uron, snaryad : integer;
	gunx, a, v, dx, dy, t, x, y, g, q : integer;
	cheat, ex, zn, xs: integer;
	gm, gd : integer;
	allhp : integer;
	lev_str, s : string;
	M : byte;
	Logic, vict, moving : boolean;
	br : text; 
objs: array[1..10] of obj;

procedure menu  (var m : byte);
begin
	Repeat
	clrscr;
	gotoxy(15, 1);
	writeln('АРТИЛЛЕРИСТ');
	gotoxy(10, 5);writeln('1.Играть');
	gotoxy(10, 6);writeln('2.Об игре');
	gotoxy(10, 7); writeln('3.Выйти');
	gotoxy(8, 8);writeln('Выберите пункт меню');
	Read(M);
	Until M In [1..3]
End;
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
procedure field;
begin
rectangle(1, 500, getmaxx-1, getmaxy-1);
y:=1;
end;
procedure tank(nof : integer);
begin
{circle(objs[nof].x-60, 500-20, 10);
circle(objs[nof].x+60, 500-20, 10);
circle(objs[nof].x-40, 500-10, 10);
circle(objs[nof].x+40, 500-10, 10);
circle(objs[nof].x-20, 500-10, 10);
circle(objs[nof].x+20, 500-10, 10);
circle(objs[nof].x, 500-10, 10);
line(objs[nof].x-40, 500, objs[nof].x-60, 500-10);
line(objs[nof].x+40, 500, objs[nof].x+60, 500-10);
line(objs[nof].x-60, 500-30, objs[nof].x+60, 500-30);
line(objs[nof].x-40, 500, objs[nof].x+40, 500);
line(objs[nof].x-40, 500-30, objs[nof].x-20, 500-50);
line(objs[nof].x+20, 500-50, objs[nof].x-20, 500-50);
line(objs[nof].x+20, 500-50, objs[nof].x+40, 500-30);
line(objs[nof].x-30, 500-40, objs[nof].x-50, 500-50);}
circle(objs[nof].x-30, 500-10, 5);
circle(objs[nof].x+30, 500-10, 5);
circle(objs[nof].x-20, 500-5, 5);
circle(objs[nof].x+20, 500-5, 5);
circle(objs[nof].x-10, 500-5, 5);
circle(objs[nof].x+10, 500-5, 5);
circle(objs[nof].x, 500-5, 5);
line(objs[nof].x-20, 500, objs[nof].x-30, 500-5);
line(objs[nof].x+20, 500, objs[nof].x+30, 500-5);
line(objs[nof].x-30, 500-15, objs[nof].x+30, 500-15);
line(objs[nof].x-20, 500, objs[nof].x+20, 500);
line(objs[nof].x-20, 500-15, objs[nof].x-10, 500-25);
line(objs[nof].x+10, 500-25, objs[nof].x-10, 500-25);
line(objs[nof].x+10, 500-25, objs[nof].x+20, 500-15);
line(objs[nof].x-15, 500-20, objs[nof].x-25, 500-25);
objs[nof].speed:=40;
	objs[nof].gx:=60;
	objs[nof].gy:=50;
	end;
procedure house(nof : integer);
	begin
	rectangle(objs[nof].x-20, 480, objs[nof].x+20, 500);
	line(objs[nof].x-20,480,objs[nof].x,460);
	line(objs[nof].x,460,objs[nof].x+20,480);
	objs[nof].speed:=0;
	objs[nof].gx:=40;
	objs[nof].gy:=40;
	end;
procedure building(nof : integer);
	begin
	rectangle(objs[nof].x-40, 450, objs[nof].x+30, 500);
	rectangle(objs[nof].x-35, 455, objs[nof].x-25, 475);
	rectangle(objs[nof].x+25, 455, objs[nof].x+5, 475);
	objs[nof].speed:=0;
	objs[nof].gx:=80;
	objs[nof].gy:=50;
	end;
procedure bunker(nof : integer);
	begin
	rectangle(objs[nof].x-40, 480, objs[nof].x+30, 500);
	line(objs[nof].x, 480, objs[nof].x, 440);
	rectangle(objs[nof].x, 440, objs[nof].x+20, 450);
	setcolor(red);
	line(objs[nof].x,441, objs[nof].x+20, 441);
	line(objs[nof].x,443, objs[nof].x+20, 443);
	line(objs[nof].x,445, objs[nof].x+20, 445);
	line(objs[nof].x,447, objs[nof].x+20, 447);
	line(objs[nof].x,449, objs[nof].x+20, 449);
	setcolor(white);
	line(objs[nof].x,442, objs[nof].x+20, 442);
	line(objs[nof].x,444, objs[nof].x+20, 444);
	line(objs[nof].x,446, objs[nof].x+20, 446);
	line(objs[nof].x,448, objs[nof].x+20, 448);
	setfillstyle(1, lightblue);
	bar(objs[nof].x+1, 441, objs[nof].x+7, 447);
	objs[nof].speed:=0;
	objs[nof].gx:=80;
	objs[nof].gy:=60;
	end;	
procedure mishen(nof : integer);
		begin
		line(objs[nof].x,500,objs[nof].x,460);
		circle(objs[nof].x, 450, 10);
		circle(objs[nof].x, 450, 7);
		circle(objs[nof].x, 450, 5);
		circle(objs[nof].x, 450, 2);
		objs[nof].speed:=0;
		objs[nof].gx:=20;
		objs[nof].gy:=60;
		moving:=false;
		end;
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
procedure health;
var inph : integer;
begin
for inph:=1 to numb do
	begin
	if objs[inph].uvis=0 then
		begin
			setcolor(white);
			rectangle(objs[inph].x-round((objs[inph].maxhp*20)/2),510, round(objs[inph].x-(objs[inph].maxhp*20)/2)+(objs[inph].maxhp*20), 515);
			setfillstyle(1,red);
			bar(objs[inph].x-round((objs[inph].maxhp*20)/2)-1,511, objs[inph].x-round((objs[inph].maxhp*20)/2)-1+(objs[inph].health*20), 514);
		end;
	end;
end;
procedure fly;
var inp7 : integer;
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
	for inp7:=1 to numb do
		begin
			if (((x+gunx>objs[inp7].x-round(objs[inp7].gx/2)) and (x+gunx<objs[inp7].x+round(objs[inp7].gx/2)) and (y<objs[inp7].gy)) or (y<=-1)) then ex:=1; 
		end;
	until ex=1;
end;
procedure transportbtr(nof : integer);
	begin
  circle(objs[nof].x-19, 499-6, 6);
  circle(objs[nof].x+19, 499-6, 6);
  circle(objs[nof].x, 499-6, 6);
  line(objs[nof].x-13, 499-6, objs[nof].x-6, 499-6);
  line(objs[nof].x+13, 499-6, objs[nof].x+6, 499-6);
  line(objs[nof].x+25, 499-6, objs[nof].x+31, 499-12);
  line(objs[nof].x-25, 499-6, objs[nof].x-31, 499-12);
  line(objs[nof].x-31, 499-12, objs[nof].x-25, 499-20);
  line(objs[nof].x+31, 499-12, objs[nof].x+25, 499-20);
  line(objs[nof].x-25, 499-20, objs[nof].x+25, 499-20);
  line(objs[nof].x-19, 499-20, objs[nof].x-14, 499-26);
  line( objs[nof].x-14, 499-26, objs[nof].x-5, 499-26);
  line( objs[nof].x, 499-20, objs[nof].x-5, 499-26);
  objs[nof].speed:=40;
  objs[nof].gx:=90;
	objs[nof].gy:=40;
		end;
procedure paintobj;
var inp2 : integer;
begin
	for inp2:=1 to numb do
		if objs[inp2].uvis=0 then
			case objs[inp2].typ of 
			0 : mishen(inp2);
			1 : house(inp2);
			2 : building(inp2);
			3 : bunker(inp2); 
			4 : transportbtr(inp2);
			5 : tank(inp2);
			end;
end;
procedure move;
	var inpm : integer;
	begin
	for inpm:=1 to numb do
		begin
		if ((objs[inpm].speed>0) and (objs[inpm].health>0)) then moving:=true
			else moving:=false;
		if moving then
			begin
			zn:=random(4)-2;
			xs:=objs[inpm].x;
			while objs[inpm].x<>xs+zn*objs[inpm].speed do
				begin
				setcolor(black); 
				paintobj;
				objs[inpm].x:=objs[inpm].x+zn;
				setcolor(white);
				paintobj;
				delay(10);
				if (objs[inpm].x-gunx)<20 then 
					begin
					explode (gunx, 500);	
					writeln('УБИТ');
					repeat until keypressed;
					exit;
					end;
				end;
			end;
		end;
	end;
procedure nuclear(u, i : integer);
var r1, r2, y3, x3, j, i1 : integer;			
begin
r1:=10;
r2:=20;
for i1:=1 to 100 do
	begin
	setcolor(black);
	setlinestyle(0, 0, 1);
	setfillstyle(1,black);
	fillellipse(x3, y3-r1-15, r2, r1);
	setcolor(lightgray);
	setlinestyle(0, 0, 0);
	setfillstyle(1,lightgray);
	r1:=r1+round(i1/120);
	r2:=r2+round(i1/60);
	y3:=i-i1;
	for j:=1 to 40 do
		begin
		x3:=u+random(round(200/i1))-round(100/i1);
		fillellipse(x3, y3, 5, 5);
		end;
	setcolor(white);
	setlinestyle(0, 0, 1);
	setfillstyle(1,yellow);
	fillellipse(x3, y3-r1-15, r2, r1);	
	delay(5);
	end;
end;
procedure checkcheat;
		begin
		if cheat=666 then 
			begin
			rast:=200;
			uron:=3;
			snaryad:=2;
			v:=45;
			a:=45;
			writeln('Вы ввели чит-код. Теперь ваши обычные снаряды заменены');
			writeln('на тактические ядерные боеприпасы');
			end;
		end;
procedure anticheat;
	var inpa : integer;
	begin
		for inpa:=1 to numb do
		objs[inpa].uvis:=0; 
		vict:=false;
		rast:=60;
		uron:=1;
		snaryad:=1;
	end;
procedure maximalhp;
	var inpmh : integer;
	begin
	for inpmh:=1 to numb do
		begin
			case objs[inpmh].typ of 
			0 : objs[inpmh].maxhp:=1;
			1 : objs[inpmh].maxhp:=1;
			2 : objs[inpmh].maxhp:=3;
			3 : objs[inpmh].maxhp:=5;
			4 : objs[inpmh].maxhp:=2; 
			5 : objs[inpmh].maxhp:=4;
			end;
		end;
	end;
procedure garmhealth;
	var inp9: integer;
	begin
	for inp9:=1 to numb do
		if objs[inp9].health<0 then 
			objs[inp9].health:=0;
	end;
   
      
begin
Moving:=false;
Logic:=False;
Repeat
clrscr;
Menu(M);
Case M of 
1 :
	begin
	lev:=6;
	levelstart: 
	anticheat;
	clrscr;
	str(lev,lev_str);
	assign(br, './level/'+lev_str+'.txt');
	reset(br);
	read(br, numb);
	read(br, gunx);
	for inp:=1 to numb do
		begin
		read(br, objs[inp].x);
		read(br, objs[inp].typ);
		end;
	clrscr;
	repeat 
		readln(br, s);
		writeln(s);
	until eof(br);
	close(br);
	maximalhp;
	for inp5:=1 to numb do
		begin
		objs[inp5].health:=objs[inp5].maxhp;	
		end;	
	gd := Detect; 
	gm := DetectMode;	
	initgraph(gd, gm, '');
	field;
	paintobj;
	health;
	gun;
		repeat until keypressed;
		closegraph();
	randomize;
		repeat 
		garmhealth;
		writeln('Введите скорость и угол броска');
		readln(v,a);
		dx:=round(v*cos(a/57));
		dy:=round(v*sin(a/57));

		cheat:=v+a;
		checkcheat;
		gd := Detect; 
		gm := DetectMode;
		initgraph(gd, gm, '');
		cleardevice;
		field;
		paintobj;
		health;
		gun;
		
		fly;
		case snaryad of	
		1 : explode(x+gunx, 500-y);
		2 : nuclear(x+gunx, 500-y);
		end;
		
		
		if abs(x) < rast then
			begin
			writeln('УБИТ');
			repeat until keypressed;
			exit;
			end;
			
				
		for inp3:=1 to numb do
			if abs(x+gunx-objs[inp3].x) < rast then 
				begin
				objs[inp3].health:=objs[inp3].health-uron;
				//writeln('1');
				end;
				for inp1:=1 to numb do
			if objs[inp1].health <= 0 then 
			begin
				objs[inp1].uvis:=1;
				objs[inp1].gx:=0;
				objs[inp1].gy:=0;
			end;
		allhp:=0;
		move;
		for inp4:=1 to numb do 
			allhp:=allhp+objs[inp4].health;
			if allhp <= 0 then vict:=true;
			if vict=true then 
				begin
				writeln('Победа!!!');
				delay(1500);
				lev:=lev+1;
				closegraph();
				goto levelstart;
				end;
			closegraph();
		until q=1;
end;
2 :
begin
	clrscr;
	Writeln('АРТИЛЛЕРИСТ v1.3 Андрей Плотников, ФМШ г.Новосибирска, 2010 год');
	Writeln('Нажмите любую клавишу');
	repeat until keypressed;
end;
3 : Logic:=true;
End;
until Logic
end.
