        .data
        .global uart_init
        .global gpio_btn_and_LED_init
        .global uart_interrupt_init
        .global gpio_interrupt_init
        .global timer_init
        .global output_character
        .global read_character
        .global read_string
        .global Timer2_Handler
        .global output_string
        .global read_from_push_btns
        .global read_tiva_push_button
        .global div_and_mod
        .global string2int
        .global int2string
        .global int2string_move_counter
        .global illuminate_RGB_LED
        .global reset_RGB
        .global lab5
        .global gen_random_board
        .global gen_random_player
        .global enable_timer
        .global disable_timer
        .global player
        .global mydata
        .global erase_display
        .global reset_cursor
        .global main_game_board
        .global time
        .global moves
        .global move_cursor
        .global time_holder
        .global move_holder
        .global decide_grid
        .global decide_side
        .global simple_read_character
        .global same_color_check
        .global output_game_board_string
        .global output_player_string
        .global rotate_side_up
        .global rotate_side_down
        .global rotate_side_right
        .global rotate_side_left
        .global rotate_side_clockwise
        .global rotate_side_counter_clockwise
        .global check_finished
        .global LED_dance
        .global Timer_choose
        .global Checking_for_completed
        .global disable_timer
        .global wait_for_start
        .global time_holder


        .text

U0FR    .equ 0x18

ptr_to_mydata .word mydata
ptr_to_main_gameboard .word main_game_board
ptr_to_player .word player
ptr_to_erase_display .word erase_display
ptr_to_reset_cursor  .word reset_cursor
ptr_to_time:			  .word time
ptr_to_time_holder                .word time_holder
ptr_to_move_holder		  .word move_holder
ptr_to_moves:		      .word moves
ptr_to_move_cursor:                     .word move_cursor




uart_init:
        PUSH {r4-r12,lr}
        MOV r0, #0xE618
        MOVT r0, #0x400F    ;Move 0x400FE618 into r0
        MOV r1, #1          ;Move 1 into r1
        STR r1, [r0]        ;STR r1 into r0

        MOV r0, #0xE608
        MOVT r0, #0x400F    ;Move 0x400FE608 into r0
        MOV r1, #1          ;Move 1 into r1
        STR r1, [r0]        ;STR r1 into r0

        MOV r0, #0xC030
        MOVT r0, #0x4000    ;Move 0x4000C030 into r0
        MOV r1, #0          ;Move 0 into r1
        STR r1, [r0]        ;STR r1 into r0

        MOV r0, #0xC024
        MOVT r0, #0x4000    ;Move 0x4000C024 into r0
        MOV r1, #8          ;Move 8 into r1
        STR r1, [r0]        ;STR r1 into r0

        MOV r0, #0xC028
        MOVT r0, #0x4000    ;Move 0x4000C028 into r0
        MOV r1, #44         ;Move 44 into r1
        STR r1, [r0]        ;STR r1 into r0

        MOV r0, #0xCFC8
        MOVT r0, #0x4000    ;Move 0x4000CFC8 into r0
        MOV r1, #0          ;Move 0 into r1
        STR r1, [r0]        ;STR r1 into r0

        MOV r0, #0xC02C
        MOVT r0, #0x4000    ;Move 0x4000C02C into r0
        MOV r1, #0x60       ;Move 0x60 into r1
        STR r1, [r0]        ;STR r1 into r0

        MOV r0, #0xC030
        MOVT r0, #0x4000    ;Move 0x4000C030 into r0
        MOV r1, #0x301      ;Move 0x301 into r1
        STR r1, [r0]        ;STR r1 into r0

        MOV r0, #0x451C
        MOVT r0, #0x4000    ;Move 0x4000451C into r0
        LDR r2, [r0]        ;LDR r2 from r0
        MOV r1, #0x03       ;Move 0x03 into r1
        ORR r2, r2, r1      ;ORR r2 with r1
        STR r2, [r0]        ;STR r2 into r0

        MOV r0, #0x4420
        MOVT r0, #0x4000    ;Move 0x40004420 into r0
        LDR r2, [r0]        ;LDR r2 from r0
        MOV r1, #0x03       ;Move 0x03 into r1
        ORR r2, r2, r1      ;ORR r2 with r1
        STR r2, [r0]        ;STR r2 into r0

        MOV r0, #0x452C
        MOVT r0, #0x4000    ;Move 0x4000452C into r0
        LDR r2, [r0]        ;LDR r2 from r0
        MOV r1, #0x11       ;Move 0x11 into r1
        ORR r2, r2, r1      ;ORR r2 with r1
        STR r2, [r0]        ;STR r2 into r0

        POP {r4-r12,lr}   ; Restore registers all registers preserved in the
                                                        ; PUSH at the top of this routine from the stack.
        mov pc, lr



gpio_btn_and_LED_init:
        PUSH {r4-r12,lr}        ; Spill registers to stack

        ;portF_pin4_init
    MOV r4, #0xE608
    MOVT r4, #0x400F     ; Move address 0x400FE608 into r4
    LDRB r5, [r4]       ; Load byte from contents of r4 into r5
    ORR r5, r5, #32     ; Bit mask the contents of r5 with #32 to activate the clock for PortF
    STRB r5, [r4]       ; Store the contents of r5 back into r4

    MOV r4, #0x5000
    MOVT r4, #0x4002     ; Move address 0x40025000 into r4
    LDRB r5, [r4, #0x400]       ; Load byte from contents of r4 into r5 at offset 0x400
    AND r5, r5, #0xEF     ; Bit mask the contents of r5 with #32 to activate the clock for PortF
    STRB r5, [r4]       ; Store the contents of r5 back into r4

    MOV r4, #0x5000
    MOVT r4, #0x4002    ;Move address of Port F, 0x40025000 into r4
    LDRB r5, [r4, #0x51C]   ;Load byte from GPIO Digital addr, offset 0x51C
    ORR r5, r5, #16         ; OR the byte stored into r5 with 8 to enable pin 4 for digital i/o use
    STRB r5, [r4, #0x51C]   ;Store r5 back into r4

    MOV r4, #0x5000
    MOVT r4, #0x4002    ;Move address of Port F, 0x40025000 into r4
    LDRB r5, [r4, #0x510]   ;Load byte from GPIO Pull up resistor addr, offset 0x510
    ORR r5, r5, #16         ; OR the byte stored into r5 with 8 to enable pin 4's pullup resistor use
    STRB r5, [r4, #0x510]   ;Store r5 back into r4 at offset 0x510

    ;portF_RGB_init
    MOV r4, #0x5000
    MOVT r4, #0x4002    ;Move address of Port F, 0x40025000 into r4
    LDRB r5, [r4, #0x400]   ;Load byte from GPIO Pin Direction addr, offset 0x400
    ORR r5, r5, #0xE          ;AND the byte stored into r5 with 7 to turn pin 1, 2, 3 to an output
    STRB r5, [r4, #0x400]   ;Store r5 back into r4

    MOV r4, #0x5000
    MOVT r4, #0x4002    ;Move address of Port F, 0x40025000 into r4
    LDRB r5, [r4, #0x51C]   ;Load byte from GPIO Digital addr, offset 0x51C
    MOV r5, #0x1E        ; OR the byte stored into r5 with 7 to enable pins 1,2,3 for digital i/o use
    STRB r5, [r4, #0x51C]   ;Store r5 back into r4


    ;init for 4 buttons on Alice board
    MOV r4, #0xE608
    MOVT r4, #0x400F     ; Move address 0x400FE608 into r4
    LDRB r5, [r4]       ; Load byte from contents of r4 into r5
    ORR r5, r5, #8     ; Bit mask the contents of r5 with #8 to activate the clock for PortD
    STRB r5, [r4]       ; Store the contents of r5 back into r4

    MOV r4, #0x7000
    MOVT r4, #0x4000    ;Move address 0x40007000 into r4
    LDRB r5, [r4, #0x400]   ;Load byte from contents of r5 at offset 0x400 into r5
    AND r5, r5, #0xF0       ;AND the contents of r5 with 0xF0 to set push buttons as inputs
    STRB r5, [r4, #0x400]   ;Store r5 back into r5 at offset 0x400


    MOV r4, #0x7000
    MOVT r4, #0x4000        ;Move address of Port D
    LDRB r5, [r4, #0x51C]   ;Load byte from GPIO Digital addr, offset 0x51C
    ORR r5, r5, #0xF         ; OR the byte stored into r5 with 8 to enable pin 0-3 for digital i/o use
    STRB r5, [r4, #0x51C]   ;Store r5 back into r4

    ;MOV r4, #0x7000
    ;MOVT r4, #0x4000    ;Move address of Port D, 0x40027000 into r4
    ;LDRB r5, [r4, #0x510]   ;Load byte from GPIO Digital addr, offset 0x510
    ;ORR r5, r5, #0xF         ; 0-3 initialization
    ;STRB r5, [r4, #0x510]

    ;init for LED
    MOV r4, #0xE608
    MOVT r4, #0x400F     ; Move address 0x400FE608 into r4
    LDRB r5, [r4]       ; Load byte from contents of r4 into r5
    ORR r5, r5, #0x2A     ; Bit mask the contents of r5 with #1 to activate the clock for PortB
    STRB r5, [r4]       ; Store the contents of r5 back into r4

        MOV r4, #0x5000
    MOVT r4, #0x4000            ;Port B init
    LDRB r5, [r4, #0x400]   ;Load byte from GPIO Pin Direction addr, offset 0x400
    ORR r5, r5, #0xF       ;ORR the contents of r5 with 0xF to set LEDs as outputs
    STRB r5, [r4, #0x400]   ;Store r5 back into r4

    MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move address of Port B
    LDRB r5, [r4, #0x51C]   ;Load byte from GPIO Digital addr, offset 0x51C
    ORR r5, r5, #0xF         ; OR the byte stored into r5 with 8 to enable pin 0-3 for digital i/o use
    STRB r5, [r4, #0x51C]   ;Store r5 back into r4



        POP {r4-r12,lr}         ; Restore registers from stack
        MOV pc, lr

timer_init:
    PUSH {r4-r12, lr}
    MOV r4, #0xE000
    MOVT r4, #0x400F        ;Move to 0x400FE000
    LDRB r5, [r4, #0x604]   ;Load in r5 at offset, 0x604, RCGCTIMER
    ORR r5, r5, #1          ;OR r5 with 1 to enable bit 0 (Timer 0)
    STRB r5, [r4, #0x604]   ;STRB r5 into offset 0x604

    MOV r4, #0x0000
    MOVT r4, #0x4003        ;Move to 0x40030000
    LDRB r5, [r4, #0x00C]   ;Load in r5 at offset, 0x00C, GPTMCTL
    AND r5, r5, #0xFE        ;AND r5 with 0xFE to write 0 to bit 0
    STRB r5, [r4, #0x00C]   ;STRB r5 into offset 0x00C

    MOV r4, #0x0000
    MOVT r4, #0x4003        ;Move to 0x40030000
    LDRB r5, [r4, #0x000]   ;Load in r5 at offset, 0x000, GPTMCFG
    AND r5, r5, #0xF8       ;AND r5 with 0xF8 to write 0 to bit 0
    STRB r5, [r4, #0x000]   ;STRB r5 into offset 0x000

    MOV r4, #0x0000
    MOVT r4, #0x4003        ;Move to 0x40030000
    LDRB r5, [r4, #0x004]   ;Load in r5 at offset, 0x004, GPTMTAMR
    ORR r5, r5, #0x2          ;OR r5 with 2 to write 1 to bit 1
    STRB r5, [r4, #0x004]   ;STRB r5 into offset 0x00C

    MOV r4, #0x0000
    MOVT r4, #0x4003        ;Move to 0x40030000
    MOV r5, #0x0000
    MOVT r5, #0x0100       ;Timer interval
    STR r5, [r4, #0x028]   ;STRB r5 into offset 0x028

    MOV r4, #0x0000
    MOVT r4, #0x4003        ;Move to 0x40030000
    LDRB r5, [r4, #0x018]   ;Load in r5 at offset, 0x018, GPTMIMR
    ORR r5, r5, #1          ;OR r5 with 1 to write 1 to bit 0
    STRB r5, [r4, #0x018]   ;STRB r5 into offset 0x018

    MOV r4, #0xE000         ;Move to 0xE000E100
    MOVT r4, #0xE000
    LDR r5, [r4, #0x100]            ;LDR into r5
    MOV r6, #0x0000
    MOVT r6, #0x0008
    ORR r5, r5, r6         ;ORR r5 with 0x00080000
    STR r5, [r4, #0x100]

    ;timer1 init
    MOV r4, #0xE000
    MOVT r4, #0x400F        ;Move to 0x400FE000
    LDRB r5, [r4, #0x604]   ;Load in r5 at offset, 0x604, RCGCTIMER
    ORR r5, r5, #2          ;OR r5 with 2 to enable bit 1 (Timer 1)
    STRB r5, [r4, #0x604]   ;STRB r5 into offset 0x604


     MOV r4, #0x1000
    MOVT r4, #0x4003        ;Move to 0x40031000
    LDRB r5, [r4, #0x00C]   ;Load in r5 at offset, 0x00C, GPTMCTL
    AND r5, r5, #0xFE        ;AND r5 with 0xFE to write 0 to bit 0
    STRB r5, [r4, #0x00C]   ;STRB r5 into offset 0x00C

    MOV r4, #0x1000
    MOVT r4, #0x4003        ;Move to 0x40031000
    LDRB r5, [r4, #0x000]   ;Load in r5 at offset, 0x000, GPTMCFG
    AND r5, r5, #0xF8       ;AND r5 with 0xF8 to write 0 to bit 0
    STRB r5, [r4, #0x000]   ;STRB r5 into offset 0x000

    MOV r4, #0x1000
    MOVT r4, #0x4003        ;Move to 0x40031000
    LDRB r5, [r4, #0x004]   ;Load in r5 at offset, 0x004, GPTMTAMR
    ORR r5, r5, #0x2          ;OR r5 with 2 to write 1 to bit 1
    STRB r5, [r4, #0x004]   ;STRB r5 into offset 0x00C

    MOV r4, #0x1000
    MOVT r4, #0x4003        ;Move to 0x40031000
    MOV r5, #0x0000
    MOVT r5, #0x1111        ;Timer interval
    STR r5, [r4, #0x028]   ;STRB r5 into offset 0x028

    MOV r4, #0x1000
    MOVT r4, #0x4003        ;Move to 0x40031000
    LDRB r5, [r4, #0x018]   ;Load in r5 at offset, 0x018, GPTMIMR
    ORR r5, r5, #1          ;OR r5 with 1 to write 1 to bit 0
    STRB r5, [r4, #0x018]   ;STRB r5 into offset 0x018

    MOV r4, #0xE000         ;Move to 0xE000E100
    MOVT r4, #0xE000
    LDR r5, [r4, #0x100]            ;LDR into r5
    MOV r6, #0x0000
    MOVT r6, #0x0020
    ORR r5, r5, r6         ;ORR r5 with 0x00200000
    STR r5, [r4, #0x100]

    POP {r4-r12, lr}
    MOV pc, lr


    POP {r4-r12, lr}
    MOV pc, lr

uart_interrupt_init:
                PUSH {r4-r12,lr}
        ; Your code to initialize the UART0 interrupt goes here
        MOV r4, #0xC000
        MOVT r4, #0x4000                ;Load the UART base address, 0x4000C000
        LDRB r5, [r4, #0x038]   ;Load a byte at the offset 0x038 (UART Interrupt                                                           Mask Register)
        ORR r5, r5, #16                 ;ORR the byte with 16 to flip RXIM to 1
        STRB r5, [r4, #0x038]   ;Store the result back into r4 at the offset 0x0                                                          38

        MOV r4, #0xE000
        MOVT r4, #0xE000                ;Load the ENO base address, 0xE000E000
        LDRB r5, [r4, #0x100]   ;Load a byte at the offset 0x100 (Interrupt 0-31                                                           Set Enable Register)
        ORR r5, r5, #32                 ;ORR the byte with 32 to flip UART0 to 1
        STRB r5, [r4, #0x100]   ;Store the result back into r4 at offset 0x100



        POP {r4-r12,lr}
        MOV pc, lr


gpio_interrupt_init:

        PUSH {r4-r12,lr}            ; Preserve registers to adhere to the AAPCS


        ; Your code to initialize the SW1 interrupt goes here
        ; Don't forget to follow the procedure you followed in Lab #4
        ; to initialize SW1.

    MOV r4, #0xE608
    MOVT r4, #0x400F     ; Move address 0x400FE608 into r4
    LDRB r5, [r4]       ; Load byte from contents of r4 into r5
    ORR r5, r5, #32     ; Bit mask the contents of r5 with #32 to activate the clock for PortF
    STRB r5, [r4]       ; Store the contents of r5 back into r4

    MOV r4, #0x5000
    MOVT r4, #0x4002     ; Move address 0x40025000 into r4
    LDRB r5, [r4, #0x400]       ; Load byte from contents of r4 into r5 at offset 0x400
    AND r5, r5, #0xEF     ; Bit mask the contents of r5 with #32 to activate the clock for PortF
    STRB r5, [r4]       ; Store the contents of r5 back into r4

    MOV r4, #0x5000
    MOVT r4, #0x4002    ;Move address of Port F, 0x40025000 into r4
    LDRB r5, [r4, #0x51C]   ;Load byte from GPIO Digital addr, offset 0x51C
    ORR r5, r5, #16         ; OR the byte stored into r5 with 8 to enable pin 4 for digital i/o use
    STRB r5, [r4, #0x51C]   ;Store r5 back into r4

    MOV r4, #0x5000
    MOVT r4, #0x4002    ;Move address of Port F, 0x40025000 into r4
    LDRB r5, [r4, #0x510]   ;Load byte from GPIO Pull up resistor addr, offset 0x510
    ORR r5, r5, #16         ; OR the byte stored into r5 with 8 to enable pin 4's pullup resistor use
    STRB r5, [r4, #0x510]   ;Store r5 back into r4 at offset 0x510

    MOV r4, #0x5000
    MOVT r4, #0x4002    ;Move to address of PortF, 0x40025000
    LDRB r5, [r4, #0x404]       ;Load byte at offset 0x404 (GPIO Interrupt Sense Register)
    AND r5, r5, #0xEF           ;AND r5 with 0xEF to set bit 4 to 1
    STRB r5, [r4, #0x404]       ;Store r5 back into r4 at offset 0x404

    MOV r4, #0x5000
    MOVT r4, #0x4002    ;Move address to PORT F, 0x40025000
    LDRB r5, [r4, #0x408]       ;Load byte at offset 0x408 (GPIO Interrupt Both Edges Register)
    AND r5, r5, #0xEF           ;AND r5 with 0xEF to set bit 4 to 0
    STRB r5, [r4, #0x408]       ;Store r5 back into r4 at offset 0x408

    MOV r4, #0x5000
    MOVT r4, #0x4002    ;Move address to PORT F, 0x40025000
    LDRB r5, [r4, #0x40C]       ;Load byte at offset 0x40C (GPIO Interrupt Event Register)
    AND r5, r5, #0xEF           ;AND r5 with 0xEF to set bit 0
    STRB r5, [r4, #0x40C]       ;Store r5 back into r4 at offset 0x40C

    MOV r4, #0x5000
    MOVT r4, #0x4002    ;Move address to PORT F, 0x40025000
    LDRB r5, [r4, #0x410]       ;Load byte at offset 0x410 (GPIO Interrupt Mask Register)
    ORR r5, r5, #16                     ;ORR r5 with 16 to set bit 4 to 1
    STRB r5, [r4, #0x410]       ;Store r5 back into r4 at offset 0x410

    MOV r4, #0xE000
    MOVT r4, #0xE000    ;Move address to 0xE000E000
    LDR r5, [r4, #0x100]        ;Load register at offset 0x100
    MOV r6, #0x0000
    MOVT r6, #0x4000    ;Move 0x40000000 into r6
    ORR r5, r5, r6              ;ORR r5 with r6
    STR r5, [r4, #0x100]        ;STR r5 back into r4 at offset 0x100


    POP {r4-r12,lr}
    MOV pc, lr

read_from_push_btns:
    PUSH {r4-r12,lr}
read_alice:
    MOV r4, #0x7000
    MOVT r4, #0x4000    ;Move 0x40007000 into r4
    LDRB r0, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r0
    CMP r0, #0              ;Compare r0 to 0
    BEQ read_alice          ;If it is 0, repeat the subroutine
    ;MVN r0, r5
    POP {r4-r12,lr}
    MOV pc, lr

output_character:
        PUSH {r4-r12,lr}
Loop:
    MOV r1, #0xC000
    MOVT r1, #0x4000        ;Move 0x4000C000 into r1
    LDRB r2, [r1, #U0FR]    ;LDRB from r1 at offset 0x18 into r2
    AND r2, r2, #32         ;AND the contents of r2 with 32 to bit clear
    CMP r2, #32             ;Check if r2 is equal to 32
    BEQ Loop                ;If it is, loop back to the beginning of the subroutine
    STRB r0, [r1]           ;If not, STRB r0 into r1
    POP {r4-r12,lr}
    mov pc, lr




read_character:
        PUSH {r4-r12,lr}
Loop_2:
        MOV r1, #0xC000
        MOVT r1, #0x4000    ;Move ox4000C000 into r1
        LDRB r2, [r1, #U0FR]    ;LDRB from r1 at offset 0x18 into r2
        AND r2, r2, #16         ;And the contents of r2 with 16 to bit clear
        CMP r2, #16             ;Check if r2 is equal to 16
        BEQ Loop_2              ;If it is, loop back to the beginning of the subroutine
        LDRB r0, [r1]           ;If not, LDRB r0 into r1

    POP {r4-r12,lr}   ; Restore registers all registers preserved in th
    mov pc, lr



read_string:
        PUSH {r4-r12,lr}        ; Store any registers in the range of r4 through r12

        MOV r4, r0                      ;Move string pointer into r1
        MOV r5, #0                      ;Initialize counter
loop_read_string:
        BL read_character       ;Call read_character
        BL output_character
        STRB r0, [r4, r5]       ;Store character into string byte location
        ADD r5, r5, #1          ;Increment counter
        CMP r0, #0xD            ;Check if the character is "ENTER"
        BNE loop_read_string         ;If it isn't "ENTER", repeat the loop
        SUB r5, r5, #1          ;If it is "ENTER", subtract the counter by 1 to get back to the location where "ENTER" was stored in the string
        MOV r0, #0x00           ;Replce "ENTER" character with NULL
                        ;Move NULL into r0
        STRB r0, [r4, r5]       ;Store NULL at the end of the string
    POP {r4-r12,lr}
    mov pc, lr





output_string:
        PUSH {r4-r12,lr}

        MOV r4, r0                      ;Move string pointer into r1
        MOV r5, #0                      ;Initialize counter into r2
loop_output_string:
        LDRB r0, [r4, r5]       ;Load byte from pointer location
        BL output_character     ;Call output_character
        ADD r5, r5, #1          ;Increment counter
        CMP r0, #0x00           ;Check if r0 is containing NULL character
        BNE loop_output_string  ;If it isn't, repeat loop
        POP {r4-r12,lr}   ; Restore registers all registers preserved in the
                                                        ; PUSH at the top of this routine from the stack.
        mov pc, lr

;after the loop, re initialize the mydata
gen_random_board:
        PUSH {r4-r12, lr}
		;disable the timer 1



random_board_loop:
		ldr r5, ptr_to_mydata
		MOV r6, #1
		STRB r6, [r5, #1]

        BL get_random_color
	BL change_interval

        BL get_random_color
        BL change_interval

        BL get_random_color
        BL change_interval

        BL get_random_color
        BL change_interval

        BL get_random_color
        BL change_interval

        BL get_random_color
        BL change_interval

        BL get_random_color
        BL change_interval

        BL get_random_color
        BL change_interval

        BL get_random_color
        BL change_interval

        ldr r5, ptr_to_mydata
        LDRB r6, [r5, #2]
        ADD r6, r6, #1
        CMP r6, #7
        BEQ exit_random_board
        STRB r6, [r5, #2]
		B random_board_loop

exit_random_board:
        POP {r4-r12, lr}                ; Restore registers to adhere to the AAP                                                                                                                                                                                                CS
        MOV pc, lr

change_interval:
		PUSH {r4-r12, lr}

		MOV r4, #0x1000				;get current
        MOVT r4, #0x4003
        LDRB r6, [r4, #0x048]

        MOV r0, r6
        MOV r1, #10

        BL div_and_mod

		MOV r4, #0x1000
    	MOVT r4, #0x4003        ;get interval
    	LDR r5, [r4, #0x028]

    	ADD r5, r1, r5         ; adding timer interval with current
    	ADD r5, r5, #1234         ; adding timer interval with random number

    	STR r5, [r4, #0x028]   ;STRB r5 into offset 0x028

        POP {r4-r12, lr}
        MOV pc, lr

enable_timer:
        PUSH {r4-r12, lr}
        MOV r4, #0x1000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x00C]
        ORR r5, r5, #1
        STRB r5, [r4, #0x00C]
        POP {r4-r12, lr}
        MOV pc, lr

disable_timer:
        PUSH {r4-r12, lr}
        MOV r4, #0x1000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x00C] ;LDRB r5 from r4 at offset 0x00C (Enable/Disable Timer                                                                                                                                                                                                )
        AND r5, r5, #0xFE   ;Disable the timer by writing a 0 to bit 0
        STRB r5, [r4, #0x00C] ;Store r5 back into r4 at offset 0x00C
        POP {r4-r12, lr}
        MOV pc, lr

get_random_color:
        PUSH {r4-r12, lr}
        MOV r4, #0x1000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x048]
get_random_color_loop:
	ADD r5, r5, #1
        MOV r0, r5
        MOV r1, #6
        BL div_and_mod
        ADD r6, r1, #8
        ldr r7, ptr_to_mydata
        LDRB r8, [r7, r6]
        CMP r8, #9
        BEQ get_random_color_loop
        ADD r8, r8, #1
        STRB r8, [r7, r6]
        ADD r1, r1, #0x30
        BL decide_side
        BL decide_random_grid

        LDRB r5, [r7, #1]
        ADD r5, r5, #1
        STRB r5, [r7, #1]

        POP {r4-r12, lr}
        MOV pc, lr

decide_random_grid:
        PUSH {r4-r12, lr}
        ldr r5, ptr_to_mydata           ;Load pointer to mydata in r5
        LDRB r6, [r5, #1]               ;Load the byte that contains the current grid the player is located into r6
		MOV r4, r0


        CMP r6, #1
        BEQ set_random_grid_1           ;If the player is in grid 1, branch to set_random_grid_1
        CMP r6, #2
        BEQ set_random_grid_2           ;If the player is in grid 2, branch to set_random_grid_2
        CMP r6, #3
        BEQ set_random_grid_3           ;If the player is in grid 3, branch to set_random_grid_3
        CMP r6, #4
        BEQ set_random_grid_4           ;If the player is in grid 4, branch to set_random_grid_4
        CMP r6, #5
        BEQ set_random_grid_5           ;If the player is in grid 5, branch to set_random_grid_5
        CMP r6, #6
        BEQ set_random_grid_6           ;If the player is in grid 6, branch to set_random_grid_6
        CMP r6, #7
        BEQ set_random_grid_7           ;If the player is in grid 7, branch to set_random_grid_7
        CMP r6, #8
        BEQ set_random_grid_8           ;If the player is in grid 8, branch to set_random_grid_8
        CMP r6, #9
        BEQ set_random_grid_9           ;If the player is in grid 9, branch to set_random_grid_9

                                    ;Point to string of the chosen side                                                                                                                               ide

set_random_grid_1:                                 ;Insert color codes into grid 1
                MOV r5, r1
                STRB r5, [r4, #46]
                STRB r5, [r4, #91]
                STRB r5, [r4, #136]     ;Insert color codes at each row within the grid
                STRB r5, [r4, #181]
                STRB r5, [r4, #226]
                B exit_random_grid

set_random_grid_2:                                 ;Insert color codes into grid 2
                MOV r5, r1
                STRB r5, [r4, #60]
                STRB r5, [r4, #105]
                STRB r5, [r4, #150]     ;Insert color codes at each row within the grid
                STRB r5, [r4, #195]
                STRB r5, [r4, #240]
                B exit_random_grid

set_random_grid_3:                                 ;Insert color codes into grid 3
                MOV r5, r1
                STRB r5, [r4, #74]
                STRB r5, [r4, #119]
                STRB r5, [r4, #164]     ;Insert color codes at each row within the grid
                STRB r5, [r4, #209]
                STRB r5, [r4, #254]
                B exit_random_grid

set_random_grid_4:                                 ;Insert color codes into grid 4
                MOV r5, r1
                STRB r5, [r4, #316]
                STRB r5, [r4, #361]
                STRB r5, [r4, #406]     ;Insert color codes at each row within the grid
                STRB r5, [r4, #451]
                STRB r5, [r4, #496]
                B exit_random_grid


set_random_grid_5:                                 ;Insert color codes into grid 5
                MOV r5, r1
                STRB r5, [r4, #330]
                STRB r5, [r4, #375]
                STRB r5, [r4, #420]     ;Insert color codes at each row within the grid
                STRB r5, [r4, #465]
                STRB r5, [r4, #510]
                B exit_random_grid

set_random_grid_6:                                 ;Insert color codes into grid 6
                MOV r5, r1
                STRB r5, [r4, #344]
                STRB r5, [r4, #389]
                STRB r5, [r4, #434]     ;Insert color codes at each row within the grid
                STRB r5, [r4, #479]
                STRB r5, [r4, #524]
                B exit_random_grid
set_random_grid_7:                                 ;Insert color codes into grid 7
                MOV r5, r1
                STRB r5, [r4, #586]
                STRB r5, [r4, #631]
                STRB r5, [r4, #676]     ;Insert color codes at each row within the grid
                STRB r5, [r4, #721]
                STRB r5, [r4, #766]
                B exit_random_grid

set_random_grid_8:                                 ;Insert color codes into grid 8
                MOV r5, r1
                STRB r5, [r4, #600]
                STRB r5, [r4, #645]
                STRB r5, [r4, #690]     ;Insert color codes at each row within the grid
                STRB r5, [r4, #735]
                STRB r5, [r4, #780]
                B exit_random_grid

set_random_grid_9:                                 ;Insert color codes into grid 9
                MOV r5, r1
                STRB r5, [r4, #614]
                STRB r5, [r4, #659]
                STRB r5, [r4, #704]     ;Insert color codes at each row within the grid
                STRB r5, [r4, #749]
                STRB r5, [r4, #794]
                B exit_random_grid

exit_random_grid:
        POP {r4-r12, lr}
        MOV pc, lr


gen_random_player:
		PUSH {r4-r12, lr}
		ldr r5, ptr_to_player
		LDRB r6, [r5]
		MOV r0, #5
		BL decide_side
		LDRB r7, [r0, #330]
		CMP r7, #0x30
		BEQ change_player_red
		CMP r7, #0x31
		BEQ change_player_blue
		CMP r7, #0x32
		BEQ change_player_green
		CMP r7, #0x33
		BEQ change_player_yellow
		CMP r7, #0x34
		BEQ change_player_purple
		CMP r7, #0x35
		BEQ change_player_white


change_player_red:
		LDRB r6, [r5]
		CMP r6, r7
		BNE end_random_player
		MOV r6, #0x31
		STRB r6, [r5]
		B end_random_player
change_player_blue:
		LDRB r6, [r5]
		CMP r6, r7
		BNE end_random_player
		MOV r6, #0x30
		STRB r6, [r5]
		B end_random_player
change_player_green:
		LDRB r6, [r5]
		CMP r6, r7
		BNE end_random_player
		MOV r6, #0x31
		STRB r6, [r5]
		B end_random_player
change_player_purple:
		LDRB r6, [r5]
		CMP r6, r7
		BNE end_random_player
		MOV r6, #0x32
		STRB r6, [r5]
		B end_random_player
change_player_yellow:
		LDRB r6, [r5]
		CMP r6, r7
		BNE end_random_player
		MOV r6, #0x33
		STRB r6, [r5]
		B end_random_player
change_player_white:
		LDRB r6, [r5]
		CMP r6, r7
		BNE end_random_player
		MOV r6, #0x34
		STRB r6, [r5]
		B end_random_player

end_random_player:
	   POP {r4-r12, lr}
	   MOV pc, lr








		POP {r4-r12, lr}
		MOV pc, lr





check_finished:
	PUSH {r4-r12, lr}
	;load the number of sinished sides into r6
	ldr r5, ptr_to_mydata
	LDRB r6, [r5, #19]
	LDRB r7, [r5, #20]

	ADD r6, r6, r7
	LDRB r7, [r5, #21]
	ADD r6, r6, r7
	LDRB r7, [r5, #22]
	ADD r6, r6, r7
	LDRB r7, [r5, #23]
	ADD r6, r6, r7
	LDRB r7, [r5, #24]
	ADD r6, r6, r7

	CMP r6, #1
	BEQ One_LED

	CMP r6, #2
	BEQ Two_LED

	CMP r6, #3
	BEQ Three_LED

	CMP r6, #4
	BEQ Four_LED

	CMP r6, #5
	BEQ Five_LED

	CMP r6, #4
	BEQ LED_dance_on

	B complete_illuminate

One_LED:
	LDRB r6, [r5, #17]
    MOV r6, #0                     ;set the led dance bit to 0(dealing with the case when the number of finished sides change)                                                                                                                                                                              game is paused
    STRB r6, [r5, #17]

    MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    ORR r5, r5, #1          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

	B complete_illuminate

Two_LED:
	LDRB r6, [r5, #17]
    MOV r6, #0                     ;set the led dance bit to 0(dealing with the case when the number of finished sides change)                                                                                                                                                                              game is paused
    STRB r6, [r5, #17]

    MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    ORR r5, r5, #3          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

	B complete_illuminate


Three_LED:
	LDRB r6, [r5, #17]
    MOV r6, #0                     ;set the led dance bit to 0(dealing with the case when the number of finished sides change)                                                                                                                                                                              game is paused
    STRB r6, [r5, #17]

    MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    ORR r5, r5, #7          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

	B complete_illuminate

Four_LED:
	LDRB r6, [r5, #17]
    MOV r6, #0                     ;set the led dance bit to 0(dealing with the case when the number of finished sides change)                                                                                                                                                                              game is paused
    STRB r6, [r5, #17]

    MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    ORR r5, r5, #15          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

	B complete_illuminate

Five_LED:
	LDRB r6, [r5, #17]
    MOV r6, #0                     ;set the led dance bit to 0(dealing with the case when the number of finished sides change)                                                                                                                                                                              game is paused
    STRB r6, [r5, #17]

    MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    ORR r5, r5, #15          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

	B complete_illuminate

LED_dance_on:
	LDRB r6, [r5, #18]
    MOV r6, #1                     ;set the led dance bit to 1( do the dance in timer)                                                                                                                                                                                  game is paused
    STRB r6, [r5, #18]

    B complete_illuminate

complete_illuminate:
	POP {r4-r12, lr}
	MOV pc, lr



;the led dance(should be placed into timer)
LED_dance:
	PUSH {r4-r12, lr}



turn_on_all:
	;illuminating 4 lights at the same time
	MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    ORR r5, r5, #15          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC
turn_off_all:
	;turn off all LEDs
	MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    AND r5, r5, #0xF0          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

    POP {r4-r12,lr}
    MOV pc, lr
;after the loop, re initialize the mydata

Timer_choose:
	PUSH {r4-r12,lr}

    MOV r1, r0              ;Move contents of r0 into r1
    MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    ORR r5, r5, r1          ;ORR r5 with the contents of r1
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

    CMP r1, #1              ;Compare r1 to 1
    BEQ print_SW5           ;Branch to print_SW5 if equal to 1
    CMP r1, #2              ;Compare r1 to 2
    BEQ print_SW4           ;Branch to print_SW4 if equal to 2
    CMP r1, #4              ;Compare r1 to 4
    BEQ print_SW3           ;Branch to print_SW3 if equal to 4
    CMP r1, #8              ;Compare r1 to 8
    BEQ print_SW2           ;Branch to print_SW2 if equal to 8

print_SW2:
	;disable the timer
	BL disable_timer

	LDRB r6, [r5, #16]
    MOV r6, #1                     ;Set bit 16 to 1 (timer should not be displayed in this game)                                                                                                                                                                                               game is paused
    STRB r6, [r5, #16]

	B wait_for_start;back to the wait for start

print_SW3:
	;300 sec is selected
	ldr r5, ptr_to_mydata
    LDRB r6, [r5, #3]				;store 300 secs to the timer bit
    ADD r6, r6, #300
    STRB r6, [r5, #3]
    MOV r0, r6
    BL int2string

    B wait_for_start;back to the wait for start

print_SW4:
	;200 sec is selected
	ldr r5, ptr_to_mydata
    LDRB r6, [r5, #3]
    ADD r6, r6, #200				;store 200 secs to the timer bit
    STRB r6, [r5, #3]
    MOV r0, r6
    BL int2string

    B wait_for_start;back to the wait for start

print_SW5:
	;100 sec is selected
	ldr r5, ptr_to_mydata
    LDRB r6, [r5, #3]
    ADD r6, r6, #100				;store 100 secs to the timer bit
    STRB r6, [r5, #3]
    MOV r0, r6
    BL int2string

    B wait_for_start;back to the wait for start

	POP {r4-r12,lr}
    MOV pc, lr

;subroutine for checking completed sides
Checking_for_completed:
	PUSH {r4-r12, lr}
	BL decide_side        ;get the current side

Compare_1_2:
	LDRB r6, [r0, #46]  ;Grid 1 color code
	LDRB r7, [r0, #60]  ;Grid 2 color code
	CMP r6, r7          ;check if color codes for grids are same
	BEQ Compare_2_3     ;if yes check next
	B not_completed     ;else not completed

Compare_2_3:
	LDRB r6, [r0, #60] ;Grid 2 color code
	LDRB r7, [r0, #74] ;Grid 3 color code
	CMP r6, r7          ;check if color codes for grids are same
	BEQ Compare_3_4     ;if yes check next
	B not_completed     ;else not completed

Compare_3_4:
	LDRB r6, [r0, #74] ;Grid 3 color code
	LDRB r7, [r0, #316] ;Grid 4 color code
	CMP r6, r7          ;check if color codes for grids are same
	BEQ Compare_4_5     ;if yes check next
	B not_completed     ;else not completed

Compare_4_5:
	LDRB r6, [r0, #316] ;Grid 4 color code
	LDRB r7, [r0, #330] ;Grid 5 color code
	CMP r6, r7          ;check if color codes for grids are same
	BEQ Compare_5_6     ;if yes check next
	B not_completed     ;else not completed

Compare_5_6:
	LDRB r6, [r0, #330] ;Grid 5 color code
	LDRB r7, [r0, #344] ;Grid 6 color code
	CMP r6, r7          ;check if color codes for grids are same
	BEQ Compare_6_7     ;if yes check next
	B not_completed     ;else not completed

Compare_6_7:
	LDRB r6, [r0, #344] ;Grid 6 color code
	LDRB r7, [r0, #586] ;Grid 7 color code
	CMP r6, r7          ;check if color codes for grids are same
	BEQ Compare_7_8     ;if yes check next
	B not_completed     ;else not completed

Compare_7_8:
	LDRB r6, [r0, #586] ;Grid 7 color code
	LDRB r7, [r0, #600] ;Grid 8 color code
	CMP r6, r7          ;check if color codes for grids are same
	BEQ Compare_8_9     ;if yes check next
	B not_completed     ;else not completed

Compare_8_9:
	LDRB r6, [r0, #600] ;Grid 8 color code
	LDRB r7, [r0, #614] ;Grid 9 color code
	CMP r6, r7          ;check if color codes for grids are same
	BEQ finish_one_side ;one side completed if all sides are same
	B not_completed     ;else not completed

finish_one_side:
	MOV r4, #18			;move 18 into r4, since the statue bits for sides are from bit 19 to bit 24
	ldr r5, ptr_to_mydata  ;move the pointer to mydata
	LDRB r6, [r5,#2]    ;get the current side number
	ADD r4, r4, r6      ;add the current side number to the #18 to get offset for corresponding statue bit

	LDRB r6, [r5,r4]    ;get the side statue bit
	ORR r6, r6, #1      ;put 1 into it to indicate this side is completed
	STRB r6, [r5, r4]

    LDRB r6, [r5, #17]
    ADD r6, r6, #1
    STRB r6, [r5, #17]

not_completed:
	POP {r4-r12, lr}
	MOV pc, lr



int2string:
        PUSH {r4-r12,lr}        ; Store any registers in the range of r4 through                                                                                                                                  r12
                                                        ; that are used in your                                                                                                                                  routine.  Include lr if this
back:                                                ; routine calls another rou                                                                                                                                 tine.
                MOV r1, r0
        MOV r6, #0                              ;Initialize counter
        MOV r7, #0
        MOV r8, r1        ;move previse r1 into r8
        MOV r0, r8
        CMP r8, #10
        BEQ STORE_10
        MOV r7, #0x0101
        MOVT r7, #0x0000
        CMP r8, r7
        BEQ STORE_257

loop_Qstring:
        MOV r1, #10                             ;Store 10 as the divisor
        BL div_and_mod                  ;Call div_and_mod
        PUSH {r1}                                       ;Push value of r1 into s                                                                                                                                 tack
        ADD r6, r6, #1
        CMP r0, #0
        BNE loop_Qstring                ;If r0 isn't 0, continue loop
                MOV r7, #0
loop_storeQ:
                ldr r8, ptr_to_time_holder
                POP {r1}
                SUB r6, r6, #1
                ADD r1, r1, #0x30
                LDRB r2, [r8, r7]
                STRB r1, [r8, r7]
                ADD r7, r7, #1
                CMP r6, #0
                BNE loop_storeQ
                MOV r1, #0xA
                STRB r1, [r8, r7]
                ADD r7, r7, #1
                MOV r1, #0xD
                STRB r1, [r8, r7]
                ADD r7, r7, #1
                MOV r1, #0x00
                STRB r1, [r8, r7]
                ADD r7, r7, #1

                POP {r4-r12, lr}
                mov pc, lr
STORE_10:
    ldr r8, ptr_to_time_holder
    MOV r1, #0x31
    MOV r2, #0x30
    STRB r1, [r8, #0]
    STRB r2, [r8, #1]
    MOV r1, #0x00
    STRB r1, [r8, #2]
    B STOP_INT_2_STRING
STORE_257:
    ldr r8, ptr_to_time_holder
    MOV r1, #0x32
    MOV r2, #0x35
    MOV r3, #0x37
    STRB r1, [r8, #0]
    STRB r2, [r8, #1]
    STRB r2, [r8, #2]
    MOV r1, #0xA
    STRB r1, [r8, #3]
    MOV r1, #0xD
    STRB r1, [r8, #4]
    MOV r1, #0x00
    STRB r1, [r8, #5]


STOP_INT_2_STRING
                POP {r4-r12, lr}
                mov pc, lr




int2string_move_counter:
        PUSH {r4-r12,lr}        ; Store any registers in the range of r4 through                                                                                                                                  r12
                                                        ; that are used in your                                                                                                                                  routine.  Include lr if this
back_move:                                                ; routine calls another rou                                                                                                                                 tine.
                MOV r1, r0
        MOV r6, #0                              ;Initialize counter
        MOV r7, #0
        MOV r8, r1        ;move previse r1 into r8
        MOV r0, r8
        CMP r8, #10
        BEQ STORE_10_move
        MOV r7, #0x0101
        MOVT r7, #0x0000
        CMP r8, r7
        BEQ STORE_257_move

loop_Qstring_move:
        MOV r1, #10                             ;Store 10 as the divisor
        BL div_and_mod                  ;Call div_and_mod
        PUSH {r1}                                       ;Push value of r1 into s                                                                                                                                 tack
        ADD r6, r6, #1
        CMP r0, #0
        BNE loop_Qstring_move                ;If r0 isn't 0, continue loop
                MOV r7, #0
loop_storeQ_move:
                ldr r8, ptr_to_move_holder
                POP {r1}
                SUB r6, r6, #1
                ADD r1, r1, #0x30
                LDRB r2, [r8, r7]
                STRB r1, [r8, r7]
                ADD r7, r7, #1
                CMP r6, #0
                BNE loop_storeQ_move
                MOV r1, #0xA
                STRB r1, [r8, r7]
                ADD r7, r7, #1
                MOV r1, #0xD
                STRB r1, [r8, r7]
                ADD r7, r7, #1
                MOV r1, #0x00
                STRB r1, [r8, r7]
                ADD r7, r7, #1

                POP {r4-r12, lr}
                mov pc, lr
STORE_10_move:
    ldr r8, ptr_to_move_holder
    MOV r1, #0x31
    MOV r2, #0x30
    STRB r1, [r8, #0]
    STRB r2, [r8, #1]
    MOV r1, #0x00
    STRB r1, [r8, #2]
    B STOP_INT_2_STRING_move
STORE_257_move:
    ldr r8, ptr_to_move_holder
    MOV r1, #0x32
    MOV r2, #0x35
    MOV r3, #0x37
    STRB r1, [r8, #0]
    STRB r2, [r8, #1]
    STRB r2, [r8, #2]
    MOV r1, #0xA
    STRB r1, [r8, #3]
    MOV r1, #0xD
    STRB r1, [r8, #4]
    MOV r1, #0x00
    STRB r1, [r8, #5]


STOP_INT_2_STRING_move:
                POP {r4-r12, lr}
                mov pc, lr



		.end
