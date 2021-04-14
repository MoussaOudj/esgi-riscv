# Exercise 2
# Notions:
#
# - be able to make a conditional jump in a program here.
# - test the equality between two registers.
# - carry out a conditional then unconditional branching.
# - then display a message according to the result.

# Objective of the program:
#
# Assign numbers in registers:
# - `t0` <- 5
# - `t1` <- 4
#
# Correct the lines with "???".
.data

msg_eq: .asciz "These numbers are equal!"
msg_neq: .asciz "These numbers are not equal"

.text

# In rust we would have surely done something like this
# ```rust
# let a = 4;
# let b = 5;
# let msg = if a == b { "These numbers are equal!" }
#                else { "These numbers are not equal" };
# println!(msg);
# ```

### Here you can use
# two instructions to write to load 5 into t0 and t1 into 4.

# start of the program.
main:
li t0, 4
li t1, 5

# `bne` Branch if Not Equals: Jump if our registers are not equal.
bne t0, t1, not_eq # if t0! = t1 jump not_eq

# Equal cases t0 == t1
la a0, msg_eq # msg <- "These numbers are equal!"
j end # We are done so we can get out of the if.

# Unequal cases t0 != T1
not_eq:
la a0, msg_neq # msg <- "These numbers are not equal"
###

end:

# Display:
#
# Here we want to display on the console via a system call.
# Take inspiration from 01_syscall, register a0 must contain the number of the
# syscall printString: 4 and a7 the string to display.

li a7, 4 # syscall number
ecall       # which instruction should we use to make a syscall?
