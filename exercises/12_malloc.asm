# Can you Reverse Engineer this program?

main:                                   # @main
        addi    sp, sp, -16
        sw      ra, 12(sp)                      # 4-byte Folded Spill
        sw      s0, 8(sp)                       # 4-byte Folded Spill
        addi    s0, sp, 16
        mv      a0, zero
        sw      a0, -12(s0)
        j       .LBB0_1
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
        addi    a0, zero, 1
        call    malloc
        j       .LBB0_1

# Fill the gap:
#
# ```
# #include "stdio.h"
# #include "stdlib.h"
#
# int main(void) {
#     ???
# }
# ```