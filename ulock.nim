const
  UL_COMPARE_AND_WAIT* = 1
  UL_UNFAIR_LOCK* = 2
  UL_COMPARE_AND_WAIT_SHARED* = 3
  UL_UNFAIR_LOCK64_SHARED* = 4
  UL_COMPARE_AND_WAIT64* = 5
  UL_COMPARE_AND_WAIT64_SHARED* = 6

  ULF_WAKE_ALL* = 0x00000100
  ULF_WAKE_THREAD* = 0x00000200
  ULF_WAKE_ALLOW_NON_OWNER* = 0x00000400

  ULF_WAIT_WORKQ_DATA_CONTENTION* = 0x00010000
  ULF_WAIT_CANCEL_POINT* = 0x00020000
  ULF_WAIT_ADAPTIVE_SPIN* = 0x00040000

  ULF_NO_ERRNO* = 0x01000000

  UL_OPCODE_MASK* = 0x000000FF
  UL_FLAGS_MASK* = 0xFFFFFF00
  ULF_GENERIC_MASK* = 0xFFFF0000

  ULF_WAIT_MASK* = ULF_NO_ERRNO or ULF_WAIT_WORKQ_DATA_CONTENTION or
                  ULF_WAIT_CANCEL_POINT or ULF_WAIT_ADAPTIVE_SPIN
  ULF_WAKE_MASK* = ULF_NO_ERRNO or ULF_WAKE_ALL or ULF_WAKE_THREAD or
                  ULF_WAKE_ALLOW_NON_OWNER

type
  ULockOp* = enum
    CompareAndWait = 1
    UnfairLock = 2
    CompareAndWaitShared = 3
    UnfairLock64Shared = 4
    CompareAndWait64 = 5
    CompareAndWait64Shared = 6
  
  ULockFlags* = enum
    WakeAll = 0x00000100
    WakeThread = 0x00000200
    WakeAllowNonOwner = 0x00000400

    WaitWorkQDataContention = 0x00010000
    WaitCancelPoint = 0x00020000
    WaitAdaptiveSpin = 0x00040000


proc ulock_wait*(operation: uint32; address: pointer; value: uint64;
                timeout: uint32): cint {.importc:"__ulock_wait", cdecl.}
# Returns number of threads still waiting on ulock it seems. Returns -1 if there is an error or it times out

proc ulock_wait2*(operation: uint32; address: pointer; value: uint64;
                timeout: uint64; value2: uint64): cint {.importc:"__ulock_wait2", cdecl.}

proc ulock_wake*(operation: uint32; address: pointer; wake_value: uint64): cint {.importc:"__ulock_wake", cdecl.}