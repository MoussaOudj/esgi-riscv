# Go on https://godbolt.org/, what's the RISC-V 32 bits output of this C code?
#
# ```
# #include "stdio.h"
# #include "stdlib.h"
#
# int main(void) {
#     return 0;
# }
# ```
#
# Can you Reverse Engineer this program?

main:                                   # @main
        addi    sp, sp, -16
        sw      ra, 12(sp)                      # 4-byte Folded Spill
        sw      s0, 8(sp)                       # 4-byte Folded Spill
        addi    s0, sp, 16
        mv      a0, zero
        sw      a0, -12(s0)
        addi    a0, zero, 42
        lw      s0, 8(sp)                       # 4-byte Folded Reload
        lw      ra, 12(sp)                      # 4-byte Folded Reload
        addi    sp, sp, 16
        ret

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