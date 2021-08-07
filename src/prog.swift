/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Prog [V.V.V] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  raw_pointer.swift demonstration program

        Blablabla about the subject.

    DD/MM/YYYY > [V.V.V] :
    - Added something.
    - Added something else.

    DD/MM/YYYY > [V.V.V] :
    - Added something that wasn't before.
    - Fixed a bug.
    - Added something else.
    - Added something else again.

    BUGS : Active bugs in last version.
    NOTES : Notes.

    Contact : ...
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */




















// ---------------- EXECUTION ----------------

//presentation
print("I.A. > This is a basic demonstration of \"raw_pointer.swift\".")



//main loop
let MESSAGE_LENGTH_MAX = 100
var message = RawPointer(MESSAGE_LENGTH_MAX)
while true {

	//reset message
	message.reset()

	//get user input
	print("Prog > Write something : ", terminator: "")
	for i in 0..<(MESSAGE_LENGTH_MAX-1) { //-1 to leave the last byte at 0 ('\0')

		//get one character
		message._set(i, UInt8(getchar()) )

		//stop input at first line return
		if message._get(i) == UInt8(10) { //10 <=> '\n'
			message._set(i, UInt8(0)) // 0 <=> '\0'
			break
		}
	}

	//print message
	print("Prog > You said : \"\(message.toString())\".")

	//exit reply
	if message.compare("exit", 4) {
		print("Prog > Exiting program.")
		break
	}
}
