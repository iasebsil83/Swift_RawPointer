#executables
run: lib/raw_pointer.swift lib/include_IO.h src/prog.swift again

	@#create temporary all-in-one swift source file
	@cat lib/raw_pointer.swift >  run.swift
	@cat src/prog.swift        >> run.swift

	@#compilation
	@echo "compiling prog :"
	@echo "    lib/raw_pointer.swift"
	@echo "    src/prog.swift"
	swiftc run.swift -import-objc-header lib/include_IO.h



	@#RESET

	@#remove temporary files
	@rm -f run.swift again



#empty file created to relaunch compilation (even if no source file is modified)
again:
	@touch again
