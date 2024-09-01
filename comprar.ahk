#singleinstance, force

*XButton2::
while GetKeyState("XButton2", "P")
{
	send, {f5}
	sleep, 10
}
return

end::
suspend