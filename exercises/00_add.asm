# Exercise 0
# Make an addition in a register

.text # <- code segment for the code :)

# Exercise:
# We want to get the number 64 modify the code to be able to have 64
# in t0 at the end of the program.

# Questions: What is a register? (put an x in the correct answer)
#
# - [x] A memory in the 32-bit processor
# - [ ] A variable in memory

my_code: # <- Label allows a name to be associated with an address.

li t0, 32       # Load immediate: Load a number on max 12 bit in a register
addi t0, t0, 32 # Add operand 1 (t0) and an immediate and save the result (t0)
#     |   \ operand 1
#     destination

# Bonus:
# Have a 64 bits value (like 0xdeadbeef) in a register in a single instruction!
li t1, -559038737
