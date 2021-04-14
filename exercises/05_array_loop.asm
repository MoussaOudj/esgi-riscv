# Exercise 3
#
# Objective: Add all the cells of an array with a loop!
#
# TODO: complete the hole program.
#
# Questions:
#
# - Succeed in making a loop in assembler.
# - How many instructions are such in total done with your loop?
#
# Bonus:
# - Make the loop with a counter in an exo 05_1_array_loop
# - How could we improve the performance of the loop?

.data

size_array_g: .word 8
array_g: .word 124, 256, 512, 2, 8, 4, 32, 1024

.text

######################
# Method with a loop #
######################

la t0, size_array_g # t0: size <- * size_array
lw t0, 0(t0) # t0 <- * size_array; t0 = array size

# We need a register for the sum
# a0: sum <- 0
li a0, 0

# To make a loop we need the base address of the array ...
la t1, array_g

# ... and calculate the end address.

# An alternate solution is to use a registry to make a counter from 0 to N
# array size (both solutions are fine) :)

# Be careful not to mix the two solutions.
slli t0, t0, 2 # multiply by 4 to respect the alignment
add t2, t1, t0 # get the end address by doing addrBase + size_array * 4

# copy the start address to have an iterator that we will be able to increment
# t3 = @addrIterator
mv t3, t1

for: # label for the start of the loop

  ## TODO: write a condition to know if we continue the loop.
  # PSEUDO CODE: if end address = current address then stop otherwise continue
  # If the test is successful we exit the loop by jumping to end_for
  # INSTRUCTION: `beq`
  ##

  ## TODO: load from memory the value at the current address in our array.
  # INSTRUCTION: ??? Hint: 32bits word memory load index
  ##

  ## TODO: addition between the value of the box in the array and our sum.
  # INSTRUCTION: ??? Hint: addition between two registers without immediate
  ##
  
  ## TODO: increment of the array address
  # INSTRUCTION: `addi ??, ??, 4`
  # /!\ REMINDER: integers on 32bits, so we index with step 4
  ##

  ##
  # We jump to the beginning of the loop to test if we continue.
  j for
  ##

end_for: # label for the loop output

# TODO: display the sum here!
# Hint: syscall printInt
