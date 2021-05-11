# Can you Reverse Engineer this program?

main:                                   # @main
        addi    sp, sp, -16
        sw      ra, 12(sp)                      # 4-byte Folded Spill
        sw      s0, 8(sp)                       # 4-byte Folded Spill
        addi    s0, sp, 16
        mv      a0, zero
        sw      a0, -16(s0)                     # 4-byte Folded Spill
        sw      a0, -12(s0)
        lui     a0, %hi(.L.str)
        addi    a0, a0, %lo(.L.str)
        call    printf
        lw      a0, -16(s0)                     # 4-byte Folded Reload
        lw      s0, 8(sp)                       # 4-byte Folded Reload
        lw      ra, 12(sp)                      # 4-byte Folded Reload
        addi    sp, sp, 16
        ret
.L.str:
        .asciz  "Hello, world!"

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