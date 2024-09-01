*Space::
state := 0
while(GetKeyState("space","P")) { ;
	state := !state ;
	if (state)
		send, {Space down}
	else
		send, {Space up} 
}
return

del::
suspend