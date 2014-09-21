SetMouseDelay, 1

x0 := 0
x1 := 0
y0 := 0
y1 := 0
orderx := 0
ordery := 300
green := 0x6aa34c
yellow := 0x36d0d8
red := 0x65e44d5
orange := 0x2264f0
blue := 0xbd9435
black := 0x000000


$F1::
if(x0 == 0){
	MouseGetPos, x0, y0
	return
}else if (x1 == 0){
	MouseGetPos, x1, y1
	return
}
Loop
{
    if not GetKeyState("F1", "P")  
        break
	randx := 0
	randy := 0
	;Random, randx, 1, x1-x0
	;Random, randy, 1, y1-y0
    PixelSearch px, py, x0+randx, y0+randy, x1, y1, black,220, Fast
	MouseClickDrag, L, px, py, x0+orderx, y0+ordery
	if(orderx+x0 < x1){
		orderx += 20
	}else if(ordery+y0 < y1){
		ordery += 30
		orderx = 0
	}else{
		orderx = 0
	}
}
return