#singleinstance, force
#MaxThreadsPerHotKey, 2

*XButton1::
liga := !liga
while liga
{
	send, {f9}
}
return

end::
pause