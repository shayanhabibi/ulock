# ULock

Low level wrapper of darwin ulock operations.

See WaitOnAddress or Futex for similar Windows and Linux implementations.

These are culminated into a higher level library futexes.

They are maintained separately since the aim will be to provide access to all operations for a platforms specific primitive to be implemented by the user in their own liking.