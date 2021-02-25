/******************************************************************************************************************************************************************/
/*                                          Example of pointer manipulation in Swift and comparison with C.                                                       */
/*                                                                                                                                                                */
/*                                       In this example we allocated 16 bytes as 4 Int32 and give them values.                                                   */
/*                                                                                                                                                                */
/*******************************************************************************************************//*********************************************************/
//                                               SWIFT                                                  //                            C                           //
/*******************************************************************************************************//*********************************************************/
                                                                                                        // |                                                      //
//allocation                                                                                            // |//allocation                                          //
let memlen = MemoryLayout<Int32>.stride * 4                                                             // |int memlen = 4;                                       //
let ptr = UnsafeMutableRawPointer.allocate(byteCount: memlen, alignment: MemoryLayout<Int32>.alignment) // |int* ptr = malloc(memlen); //considering that         //
                                                                                                        // |                           //allocation never fails   //
                                                                                                        // |                                                      //
                                                                                                        // |                                                      //
//write into allocated memory                                                                           // |//write into allocated memory                         //
ptr.advanced(by: 0*MemoryLayout<Int32>.stride).storeBytes(of: 7, as: Int32.self)                        // |ptr[0] = 7;                                           //
ptr.advanced(by: 1*MemoryLayout<Int32>.stride).storeBytes(of: 25, as: Int32.self)                       // |ptr[1] = 25;                                          //
ptr.advanced(by: 2*MemoryLayout<Int32>.stride).storeBytes(of: 1000, as: Int32.self)                     // |ptr[2] = 1000;                                        //
ptr.advanced(by: 3*MemoryLayout<Int32>.stride).storeBytes(of: -3000, as: Int32.self)                    // |ptr[3] = -3000;                                       //
                                                                                                        // |                                                      //
                                                                                                        // |                                                      //
                                                                                                        // |                                                      //
//show data                                                                                             // |//show data                                           //
for idx in 0..<4 {                                                                                      // |for(int idx=0; idx < 4; idx++){                       //
    let value = ptr.advanced(by: idx * MemoryLayout<Int32>.stride).load(as: Int32.self)                 // |   int value = ptr[idx];                              //
    print("Int32 \(idx) : \(value)")                                                                    // |   printf("Int32 %i : %i\n", idx, value);             //
}                                                                                                       // |}                                                     //
                                                                                                        // |                                                      //
                                                                                                        // |                                                      //
                                                                                                        // |                                                      //
//show raw data                                                                                         // |//show raw data                                       //
let bufPtr = UnsafeRawBufferPointer(start: ptr, count: memlen)                                          // |char* bufPtr = ptr;                                   //
for (index,byte) in bufPtr.enumerated() {                                                               // |for(int index=0; index < memlen; index++){            //
    print("byte \(index): \(byte)")                                                                     // |    printf("byte %i : %02x\n", index, bufPtr[index]); //
}                                                                                                       // |}                                                     //
                                                                                                        // |                                                      //
                                                                                                        // |                                                      //
                                                                                                        // |                                                      //
//free data                                                                                             // |//free data                                           //
ptr.deallocate()                                                                                        // |free(ptr);                                            //
                                                                                                        // |                                                      //
/******************************************************************************************************************************************************************/
