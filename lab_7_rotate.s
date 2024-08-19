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
        .global illuminate_RGB_LED
        .global reset_RGB
        .global lab5
        .global player
        .global mydata
        .global erase_display
        .global reset_cursor
        .global main_game_board
        .global time
        .global moves
        .global move_cursor
        .global timer_cursor
        .global time_holder
        .global move_holder
        .global decide_grid
        .global decide_side
        .global same_color_check
        .global output_game_board_string
        .global output_player_string
        .global rotate_side_up
        .global rotate_side_down
        .global rotate_side_right
        .global rotate_side_left
        .global rotate_side_clockwise
        .global rotate_side_counter_clockwise


        .text

U0FR    .equ 0x18

ptr_to_mydata .word mydata
ptr_to_main_gameboard .word main_game_board
ptr_to_player .word player
ptr_to_erase_display .word erase_display
ptr_to_reset_cursor  .word reset_cursor
ptr_to_time:			  .word time
ptr_to_time_holder                .word time_holder
ptr_to_timer_cursor:		.word timer_cursor
ptr_to_move_holder		  .word move_holder
ptr_to_moves:		      .word moves
ptr_to_move_cursor:                     .word move_cursor


rotate_directions_clockwise:    ;Responsible for rotating direction codes clockwise
        PUSH {r4-r12, lr}
        MOV r4, r0

        LDRB r1, [r0, #151]     ;Load side direction from grid 2
        LDRB r2, [r0, #407]     ;Load side direction from grid 4
        LDRB r3, [r0, #435]     ;Load side direction from grid 6
        LDRB r4, [r0, #691]     ;Load side direction from grid 8

        STRB r1, [r0, #435]     ;Rotate side direction from grid 2 to grid 6
        STRB r3, [r0, #691]     ;Rotate side direction from grid 6 to grid 8
        STRB r4, [r0, #407]     ;Rotate side direction from grid 8 to grid 4
        STRB r2, [r0, #151]     ;Rotate side direction from grid 4 to grid 2


        POP {r4-r12, lr}
        MOV pc, lr

rotate_directions_counterclockwise:     ;Responsible for rotating direction codes counterclockwise
        PUSH {r4-r12, lr}
        MOV r4, r0

        LDRB r1, [r0, #151]     ;Load side direction from grid 2
        LDRB r2, [r0, #407]     ;Load side direction from grid 4
        LDRB r3, [r0, #435]     ;Load side direction from grid 6
        LDRB r4, [r0, #691]     ;Load side direction from grid 8

        STRB r1, [r0, #407]     ;Rotate side direction from grid 2 to grid 4
        STRB r2, [r0, #691]     ;Rotate side direction from grid 4 to grid 8
        STRB r4, [r0, #435]     ;Rotate side direction from grid 8 to grid 6
        STRB r3, [r0, #151]     ;Rotate side direction from grid 6 to grid 2


        POP {r4-r12, lr}
        MOV pc, lr



decide_rotate_side_up:          ;Decides the orientation of the cube  sides during upward rotation
        PUSH {r4-r12, lr}
        ldr r5, ptr_to_mydata   ;Load pointer to mydata
        LDRB r10, [r5, #2]      ;Preserve current side the player is rotating from
        BL decide_side          ;Get the pointer to the string of the side
        MOV r4, r0              ;Move the pointer to the string into r4
        LDRB r6, [r4, #407]     ;Get the side to the left of the player's current side
        SUB r6, r6, #0x30       ;Convert to interger
        STRB r6, [r5, #2]       ;Store the side into the current side byte
        BL decide_side          ; Get the pointer to the string of the side
        BL rotate_side_clockwise ;Rotate the side counter-clockwise
        LDRB r6, [r4, #435]     ;Get the side to the right of the player's current side
        SUB r6, r6, #0x30       ;Convert to integer
        STRB r6, [r5, #2]       ;Store the side into the current side byte
        BL decide_side          ;Get the pointer to the string of the side
        BL rotate_side_counter_clockwise ;Rotate the side clockwise

        LDRB r6, [r4, #151]
        SUB r6, r6, #0x30
        STRB r6, [r5, #2]
        BL decide_side
        LDRB r6, [r0, #691]
        SUB r6, r6, #0x30
        CMP r6, r10
        BNE rotate_directions_up
        STRB r10, [r5, #2]      ;Place the preserved side location back into the side byte
        POP {r4-r12, lr}
        MOV pc, lr

rotate_directions_up:
        BL decide_side
        BL rotate_directions_clockwise
        BL rotate_directions_clockwise    ;Place the preserved side location back into the side byte
        STRB r10, [r5, #2]      ;Place the preserved side location back into the side byte
        POP {r4-r12, lr}
        MOV pc, lr







decide_rotate_side_down:                 ;Decides the orientation of the cube sides during downward rotation
        PUSH {r4-r12, lr}
        ldr r5, ptr_to_mydata   ;Load pointer to mydata
        LDRB r10, [r5, #2]      ;Preserve current side the player is rotating from
        BL decide_side          ;Get the pointer to the string of the side


        MOV r4, r0              ;Move the pointer to the string into r4
        LDRB r6, [r4, #407]     ;Get the side to the left of the player's current side
        SUB r6, r6, #0x30       ;Convert to interger
        STRB r6, [r5, #2]       ;Store the side into the current side byte
        BL decide_side          ; Get the pointer to the string of the side
        BL rotate_side_counter_clockwise ;Rotate the side counter-clockwise
        LDRB r6, [r4, #435]     ;Get the side to the right of the player's current side
        SUB r6, r6, #0x30       ;Convert to integer
        STRB r6, [r5, #2]       ;Store the side into the current side byte
        BL decide_side          ;Get the pointer to the string of the side
        BL rotate_side_clockwise ;Rotate the side clockwise

        LDRB r6, [r4, #691]
        SUB r6, r6, #0x30
        STRB r6, [r5, #2]
        BL decide_side
        LDRB r6, [r0, #151]
        SUB r6, r6, #0x30
        CMP r6, r10
        BNE rotate_directions_down
        STRB r10, [r5, #2]      ;Place the preserved side location back into the side byte
        POP {r4-r12, lr}
        MOV pc, lr

rotate_directions_down:
        BL decide_side
        BL rotate_directions_clockwise
        BL rotate_directions_clockwise    ;Place the preserved side location back into the side byte
        STRB r10, [r5, #2]      ;Place the preserved side location back into the side byte
        POP {r4-r12, lr}
        MOV pc, lr


decide_rotate_side_right:                ;Decides the orientation of the cube  sides during right rotation
        PUSH {r4-r12, lr}
        ldr r5, ptr_to_mydata   ;Load pointer to mydata
        LDRB r10, [r5, #2]      ;Preserve current side the player is rotating from
        BL decide_side          ;Get the pointer to the string of the side
        MOV r4, r0              ;Move the pointer to the string into r4
        LDRB r6, [r4, #151]     ;Get the side to the left of the player's current side
        SUB r6, r6, #0x30       ;Convert to interger
        STRB r6, [r5, #2]       ;Store the side into the current side byte
        BL decide_side          ; Get the pointer to the string of the side
        BL rotate_side_clockwise ;Rotate the side counter-clockwise
        LDRB r6, [r4, #691]     ;Get the side to the right of the player's current side
        SUB r6, r6, #0x30       ;Convert to integer
        STRB r6, [r5, #2]       ;Store the side into the current side byte
        BL decide_side          ;Get the pointer to the string of the side
        BL rotate_side_counter_clockwise ;Rotate the side clockwise

        LDRB r6, [r4, #435]
        SUB r6, r6, #0x30
        STRB r6, [r5, #2]
        BL decide_side
        LDRB r6, [r0, #407]
        SUB r6, r6, #0x30
        CMP r6, r10
        BNE rotate_directions_right
        STRB r10, [r5, #2]      ;Place the preserved side location back into the side byte
        POP {r4-r12, lr}
        MOV pc, lr

rotate_directions_right:
        BL decide_side
        BL rotate_directions_clockwise
        BL rotate_directions_clockwise    ;Place the preserved side location back into the side byte
        STRB r10, [r5, #2]      ;Place the preserved side location back into the side byte
        POP {r4-r12, lr}
        MOV pc, lr

decide_rotate_side_left:                 ;Decides the orientation of the cube  sides during left rotation
        PUSH {r4-r12, lr}
        ldr r5, ptr_to_mydata   ;Load pointer to mydata
        LDRB r10, [r5, #2]      ;Preserve current side the player is rotating from
        BL decide_side          ;Get the pointer to the string of the side
        MOV r4, r0              ;Move the pointer to the string into r4
        LDRB r6, [r4, #151]     ;Get the side to the left of the player's current side
        SUB r6, r6, #0x30       ;Convert to interger
        STRB r6, [r5, #2]       ;Store the side into the current side byte
        BL decide_side          ; Get the pointer to the string of the side
        BL rotate_side_counter_clockwise ;Rotate the side counter-clockwise
        LDRB r6, [r4, #691]     ;Get the side to the right of the player's current side
        SUB r6, r6, #0x30       ;Convert to integer
        STRB r6, [r5, #2]       ;Store the side into the current side byte
        BL decide_side          ;Get the pointer to the string of the side
        BL rotate_side_clockwise ;Rotate the side clockwise

        LDRB r6, [r4, #407]
        SUB r6, r6, #0x30
        STRB r6, [r5, #2]
        BL decide_side
        LDRB r6, [r0, #435]
        SUB r6, r6, #0x30
        CMP r6, r10
        BNE rotate_directions_left
        STRB r10, [r5, #2]      ;Place the preserved side location back into the side byte
        POP {r4-r12, lr}
        MOV pc, lr

rotate_directions_left:
        BL decide_side
        BL rotate_directions_clockwise
        BL rotate_directions_clockwise    ;Place the preserved side location back into the side byte
        STRB r10, [r5, #2]      ;Place the preserved side location back into the side byte
        POP {r4-r12, lr}
        MOV pc, lr

animate_rotate_up:                      ;Subroutine responsible for animating upward rotations
        PUSH {r4-r12, lr}

        MOV r4, #0x0000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x00C] ;LDRB r5 from r4 at offset 0x00C (Enable/Disable Timer                                                                                                                                                                                                )
        AND r5, r5, #0xFE   ;Disable the timer by writing a 0 to bit 0
        STRB r5, [r4, #0x00C] ;Store r5 back into r4 at offset 0x00C


        BL decide_side
        ldr r5, ptr_to_mydata
        ldr r6, ptr_to_main_gameboard

        LDRB r7, [r0, #586]
        STRB r7, [r6, #46]
        STRB r7, [r6, #91]
        STRB r7, [r6, #136]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #181]
        STRB r7, [r6, #226]

        LDRB r7, [r0, #600]
        STRB r7, [r6, #60]
        STRB r7, [r6, #105]
        STRB r7, [r6, #150]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #195]
        STRB r7, [r6, #240]

        LDRB r7, [r0, #614]
        STRB r7, [r6, #74]
        STRB r7, [r6, #119]
        STRB r7, [r6, #164]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #209]
        STRB r7, [r6, #254]

        LDRB r7, [r0, #691]
        SUB r7, r7, #0x30
        LDRB r11, [r5, #2]
        STRB r7, [r5, #2]
        BL decide_side

        LDRB r7, [r0, #316]
        STRB r7, [r6, #316]
        STRB r7, [r6, #361]
        STRB r7, [r6, #406]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #451]
        STRB r7, [r6, #496]

        LDRB r7, [r0, #330]
        STRB r7, [r6, #330]
        STRB r7, [r6, #375]
        STRB r7, [r6, #420]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #465]
        STRB r7, [r6, #510]

        LDRB r7, [r0, #344]
        STRB r7, [r6, #344]
        STRB r7, [r6, #389]
        STRB r7, [r6, #434]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #479]
        STRB r7, [r6, #524]

        LDRB r7, [r0, #586]
        STRB r7, [r6, #586]
        STRB r7, [r6, #631]
        STRB r7, [r6, #676]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #721]
        STRB r7, [r6, #766]

        LDRB r7, [r0, #600]
        STRB r7, [r6, #600]
        STRB r7, [r6, #645]
        STRB r7, [r6, #690]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #735]
        STRB r7, [r6, #780]

        LDRB r7, [r0, #614]
        STRB r7, [r6, #614]
        STRB r7, [r6, #659]
        STRB r7, [r6, #704]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #749]
        STRB r7, [r6, #794]


        MOV r7, #0
        MOV r10, #0
loop_rotate_up:
        MOV r8, #0xFFFF
        MOVT r8, #0x000F
        ADD r7, r7, #1
        CMP r7, r8
        BNE loop_rotate_up
        STRB r11, [r5, #2]
        BL decide_side
        ldr r6, ptr_to_main_gameboard

		ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Move the cursor to the top left of the screen
        ldr r6, ptr_to_main_gameboard
        MOV r0, r6
        BL output_game_board_string     ;Reprint the gameboard
        CMP r10, #1
        BEQ rotate_up_part_1
        CMP r10, #2
        BEQ rotate_up_part_2
        MOV r7, #0
        ADD r10, r10, #1
        B loop_rotate_up



rotate_up_part_1:

		STRB r11, [r5, #2]
        BL decide_side
        ldr r6, ptr_to_main_gameboard

        LDRB r7, [r0, #316]
        STRB r7, [r6, #46]
        STRB r7, [r6, #91]
        STRB r7, [r6, #136]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #181]
        STRB r7, [r6, #226]

        LDRB r7, [r0, #330]
        STRB r7, [r6, #60]
        STRB r7, [r6, #105]
        STRB r7, [r6, #150]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #195]
        STRB r7, [r6, #240]

        LDRB r7, [r0, #344]
        STRB r7, [r6, #74]
        STRB r7, [r6, #119]
        STRB r7, [r6, #164]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #209]
        STRB r7, [r6, #254]



        LDRB r7, [r0, #586]
        STRB r7, [r6, #316]
        STRB r7, [r6, #361]
        STRB r7, [r6, #406]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #451]
        STRB r7, [r6, #496]

        LDRB r7, [r0, #600]
        STRB r7, [r6, #330]
        STRB r7, [r6, #375]
        STRB r7, [r6, #420]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #465]
        STRB r7, [r6, #510]

        LDRB r7, [r0, #614]
        STRB r7, [r6, #344]
        STRB r7, [r6, #389]
        STRB r7, [r6, #434]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #479]
        STRB r7, [r6, #524]

        ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Move the cursor to the top left of the screen
        ldr r6, ptr_to_main_gameboard
        MOV r0, r6
        BL output_game_board_string     ;Reprint the gameboard
        MOV r7, #0
        ADD r10, r10, #1
        B loop_rotate_up

rotate_up_part_2:
        MOV r4, #0x0000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x00C] ;LDRB r5 from r4 at offset 0x00C (Enable/Disable Timer                                                                                                                                                                                                )
        ORR r5, r5, #1   ;Disable the timer by writing a 0 to bit 0
        STRB r5, [r4, #0x00C] ;Store r5 back into r4 at offset 0x00C

        POP {r4-r12, lr}
        MOV pc, lr

animate_rotate_down:                    ;Subroutine responsible for animating downward rotations
        PUSH {r4-r12, lr}

        MOV r4, #0x0000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x00C] ;LDRB r5 from r4 at offset 0x00C (Enable/Disable Timer                                                                                                                                                                                                )
        AND r5, r5, #0xFE   ;Disable the timer by writing a 0 to bit 0
        STRB r5, [r4, #0x00C] ;Store r5 back into r4 at offset 0x00C


        BL decide_side
        ldr r5, ptr_to_mydata
        ldr r6, ptr_to_main_gameboard

        LDRB r7, [r0, #46]
        STRB r7, [r6, #586]
        STRB r7, [r6, #631]
        STRB r7, [r6, #676]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #721]
        STRB r7, [r6, #766]

        LDRB r7, [r0, #60]
        STRB r7, [r6, #600]
        STRB r7, [r6, #645]
        STRB r7, [r6, #690]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #735]
        STRB r7, [r6, #780]

        LDRB r7, [r0, #74]
        STRB r7, [r6, #614]
        STRB r7, [r6, #659]
        STRB r7, [r6, #704]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #749]
        STRB r7, [r6, #794]

        LDRB r7, [r0, #151]
        SUB r7, r7, #0x30
        LDRB r11, [r5, #2]
        STRB r7, [r5, #2]
        BL decide_side

        LDRB r7, [r0, #46]
        STRB r7, [r6, #46]
        STRB r7, [r6, #91]
        STRB r7, [r6, #136]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #181]
        STRB r7, [r6, #226]

        LDRB r7, [r0, #60]
        STRB r7, [r6, #60]
        STRB r7, [r6, #105]
        STRB r7, [r6, #150]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #195]
        STRB r7, [r6, #240]

        LDRB r7, [r0, #74]
        STRB r7, [r6, #74]
        STRB r7, [r6, #119]
        STRB r7, [r6, #164]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #209]
        STRB r7, [r6, #254]

        LDRB r7, [r0, #316]
        STRB r7, [r6, #316]
        STRB r7, [r6, #361]
        STRB r7, [r6, #406]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #451]
        STRB r7, [r6, #496]

        LDRB r7, [r0, #330]
        STRB r7, [r6, #330]
        STRB r7, [r6, #375]
        STRB r7, [r6, #420]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #465]
        STRB r7, [r6, #510]

        LDRB r7, [r0, #344]
        STRB r7, [r6, #344]
        STRB r7, [r6, #389]
        STRB r7, [r6, #434]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #479]
        STRB r7, [r6, #524]


        MOV r7, #0
        MOV r10, #0
loop_rotate_down:
        MOV r8, #0xFFFF
        MOVT r8, #0x000F
        ADD r7, r7, #1
        CMP r7, r8
        BNE loop_rotate_down
        STRB r11, [r5, #2]
        BL decide_side
        ldr r6, ptr_to_main_gameboard

		ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Move the cursor to the top left of the screen
        ldr r6, ptr_to_main_gameboard
        MOV r0, r6
        BL output_game_board_string     ;Reprint the gameboard
        CMP r10, #1
        BEQ rotate_down_part_1
        CMP r10, #2
        BEQ rotate_down_part_2
        MOV r7, #0
        ADD r10, r10, #1
        B loop_rotate_down



rotate_down_part_1:

	STRB r11, [r5, #2]
        BL decide_side
        ldr r6, ptr_to_main_gameboard

        LDRB r7, [r0, #316]
        STRB r7, [r6, #586]
        STRB r7, [r6, #631]
        STRB r7, [r6, #676]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #721]
        STRB r7, [r6, #766]

        LDRB r7, [r0, #330]
        STRB r7, [r6, #600]
        STRB r7, [r6, #645]
        STRB r7, [r6, #690]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #735]
        STRB r7, [r6, #780]

        LDRB r7, [r0, #344]
        STRB r7, [r6, #614]
        STRB r7, [r6, #659]
        STRB r7, [r6, #704]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #749]
        STRB r7, [r6, #794]



        LDRB r7, [r0, #46]
        STRB r7, [r6, #316]
        STRB r7, [r6, #361]
        STRB r7, [r6, #406]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #451]
        STRB r7, [r6, #496]

        LDRB r7, [r0, #60]
        STRB r7, [r6, #330]
        STRB r7, [r6, #375]
        STRB r7, [r6, #420]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #465]
        STRB r7, [r6, #510]

        LDRB r7, [r0, #74]
        STRB r7, [r6, #344]
        STRB r7, [r6, #389]
        STRB r7, [r6, #434]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #479]
        STRB r7, [r6, #524]

        ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Move the cursor to the top left of the screen
        ldr r6, ptr_to_main_gameboard
        MOV r0, r6
        BL output_game_board_string     ;Reprint the gameboard
        MOV r7, #0
        ADD r10, r10, #1
        B loop_rotate_down

rotate_down_part_2:
        MOV r4, #0x0000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x00C] ;LDRB r5 from r4 at offset 0x00C (Enable/Disable Timer                                                                                                                                                                                                )
        ORR r5, r5, #1   ;Disable the timer by writing a 0 to bit 0
        STRB r5, [r4, #0x00C] ;Store r5 back into r4 at offset 0x00C

        POP {r4-r12, lr}
        MOV pc, lr

animate_rotate_right:           ;Subroutine responsible for animating right rotations
        PUSH {r4-r12, lr}

        MOV r4, #0x0000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x00C] ;LDRB r5 from r4 at offset 0x00C (Enable/Disable Timer                                                                                                                                                                                                )
        AND r5, r5, #0xFE   ;Disable the timer by writing a 0 to bit 0
        STRB r5, [r4, #0x00C] ;Store r5 back into r4 at offset 0x00C


        BL decide_side
        ldr r5, ptr_to_mydata
        ldr r6, ptr_to_main_gameboard

        LDRB r7, [r0, #46]
        STRB r7, [r6, #74]
        STRB r7, [r6, #119]
        STRB r7, [r6, #164]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #209]
        STRB r7, [r6, #254]

        LDRB r7, [r0, #316]
        STRB r7, [r6, #344]
        STRB r7, [r6, #389]
        STRB r7, [r6, #434]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #479]
        STRB r7, [r6, #524]

        LDRB r7, [r0, #586]
        STRB r7, [r6, #614]
        STRB r7, [r6, #659]
        STRB r7, [r6, #704]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #749]
        STRB r7, [r6, #794]

        LDRB r7, [r0, #407]
        SUB r7, r7, #0x30
        LDRB r11, [r5, #2]
        STRB r7, [r5, #2]
        BL decide_side

        LDRB r7, [r0, #46]
        STRB r7, [r6, #46]
        STRB r7, [r6, #91]
        STRB r7, [r6, #136]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #181]
        STRB r7, [r6, #226]

        LDRB r7, [r0, #60]
        STRB r7, [r6, #60]
        STRB r7, [r6, #105]
        STRB r7, [r6, #150]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #195]
        STRB r7, [r6, #240]

        LDRB r7, [r0, #316]
        STRB r7, [r6, #316]
        STRB r7, [r6, #361]
        STRB r7, [r6, #406]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #451]
        STRB r7, [r6, #496]

        LDRB r7, [r0, #330]
        STRB r7, [r6, #330]
        STRB r7, [r6, #375]
        STRB r7, [r6, #420]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #465]
        STRB r7, [r6, #510]

        LDRB r7, [r0, #586]
        STRB r7, [r6, #586]
        STRB r7, [r6, #631]
        STRB r7, [r6, #676]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #721]
        STRB r7, [r6, #766]

        LDRB r7, [r0, #600]
        STRB r7, [r6, #600]
        STRB r7, [r6, #645]
        STRB r7, [r6, #690]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #735]
        STRB r7, [r6, #780]


        MOV r7, #0
        MOV r10, #0
loop_rotate_right:
        MOV r8, #0xFFFF
        MOVT r8, #0x000F
        ADD r7, r7, #1
        CMP r7, r8
        BNE loop_rotate_right
        STRB r11, [r5, #2]
        BL decide_side
        ldr r6, ptr_to_main_gameboard

		ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Move the cursor to the top left of the screen
        ldr r6, ptr_to_main_gameboard
        MOV r0, r6
        BL output_game_board_string     ;Reprint the gameboard
        CMP r10, #1
        BEQ rotate_right_part_1
        CMP r10, #2
        BEQ rotate_right_part_2
        MOV r7, #0
        ADD r10, r10, #1
        B loop_rotate_right



rotate_right_part_1:

	    STRB r11, [r5, #2]
        BL decide_side
        ldr r6, ptr_to_main_gameboard

        LDRB r7, [r0, #60]
        STRB r7, [r6, #74]
        STRB r7, [r6, #119]
        STRB r7, [r6, #164]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #209]
        STRB r7, [r6, #254]

        LDRB r7, [r0, #330]
        STRB r7, [r6, #344]
        STRB r7, [r6, #389]
        STRB r7, [r6, #434]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #479]
        STRB r7, [r6, #524]

        LDRB r7, [r0, #600]
        STRB r7, [r6, #614]
        STRB r7, [r6, #659]
        STRB r7, [r6, #704]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #749]
        STRB r7, [r6, #794]



        LDRB r7, [r0, #46]
        STRB r7, [r6, #60]
        STRB r7, [r6, #105]
        STRB r7, [r6, #150]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #195]
        STRB r7, [r6, #240]

        LDRB r7, [r0, #316]
        STRB r7, [r6, #330]
        STRB r7, [r6, #375]
        STRB r7, [r6, #420]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #465]
        STRB r7, [r6, #510]

        LDRB r7, [r0, #586]
        STRB r7, [r6, #600]
        STRB r7, [r6, #645]
        STRB r7, [r6, #690]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #735]
        STRB r7, [r6, #780]

        ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Move the cursor to the top left of the screen
        ldr r6, ptr_to_main_gameboard
        MOV r0, r6
        BL output_game_board_string     ;Reprint the gameboard
        MOV r7, #0
        ADD r10, r10, #1
        B loop_rotate_right

rotate_right_part_2:
        MOV r4, #0x0000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x00C] ;LDRB r5 from r4 at offset 0x00C (Enable/Disable Timer                                                                                                                                                                                                )
        ORR r5, r5, #1   ;Disable the timer by writing a 0 to bit 0
        STRB r5, [r4, #0x00C] ;Store r5 back into r4 at offset 0x00C

        POP {r4-r12, lr}
        MOV pc, lr



animate_rotate_left:            ;Subroutine responsible for animating left rotations
        PUSH {r4-r12, lr}

        MOV r4, #0x0000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x00C] ;LDRB r5 from r4 at offset 0x00C (Enable/Disable Timer                                                                                                                                                                                                )
        AND r5, r5, #0xFE   ;Disable the timer by writing a 0 to bit 0
        STRB r5, [r4, #0x00C] ;Store r5 back into r4 at offset 0x00C



        BL decide_side
        ldr r5, ptr_to_mydata
        ldr r6, ptr_to_main_gameboard



        LDRB r7, [r0, #74]
        STRB r7, [r6, #46]
        STRB r7, [r6, #91]
        STRB r7, [r6, #136]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #181]
        STRB r7, [r6, #226]

        LDRB r7, [r0, #344]
        STRB r7, [r6, #316]
        STRB r7, [r6, #361]
        STRB r7, [r6, #406]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #451]
        STRB r7, [r6, #496]

        LDRB r7, [r0, #614]
        STRB r7, [r6, #586]
        STRB r7, [r6, #631]
        STRB r7, [r6, #676]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #721]
        STRB r7, [r6, #766]

        LDRB r7, [r0, #435]
        SUB r7, r7, #0x30
        LDRB r11, [r5, #2]
        STRB r7, [r5, #2]
        BL decide_side

        LDRB r7, [r0, #60]
        STRB r7, [r6, #60]
        STRB r7, [r6, #105]
        STRB r7, [r6, #150]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #195]
        STRB r7, [r6, #240]

        LDRB r7, [r0, #74]
        STRB r7, [r6, #74]
        STRB r7, [r6, #119]
        STRB r7, [r6, #164]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #209]
        STRB r7, [r6, #254]

        LDRB r7, [r0, #330]
        STRB r7, [r6, #330]
        STRB r7, [r6, #375]
        STRB r7, [r6, #420]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #465]
        STRB r7, [r6, #510]

        LDRB r7, [r0, #344]
        STRB r7, [r6, #344]
        STRB r7, [r6, #389]
        STRB r7, [r6, #434]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #479]
        STRB r7, [r6, #524]

        LDRB r7, [r0, #600]
        STRB r7, [r6, #600]
        STRB r7, [r6, #645]
        STRB r7, [r6, #690]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #735]
        STRB r7, [r6, #780]

        LDRB r7, [r0, #614]
        STRB r7, [r6, #614]
        STRB r7, [r6, #659]
        STRB r7, [r6, #704]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #749]
        STRB r7, [r6, #794]


        MOV r7, #0
        MOV r10, #0
loop_rotate_left:
        MOV r8, #0xFFFF
        MOVT r8, #0x000F
        ADD r7, r7, #1
        CMP r7, r8
        BNE loop_rotate_left
        STRB r11, [r5, #2]
        BL decide_side
        ldr r6, ptr_to_main_gameboard

		ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Move the cursor to the top left of the screen
        ldr r6, ptr_to_main_gameboard
        MOV r0, r6
        BL output_game_board_string     ;Reprint the gameboard
        CMP r10, #1
        BEQ rotate_left_part_1
        CMP r10, #2
        BEQ rotate_left_part_2
        MOV r7, #0
        ADD r10, r10, #1
        B loop_rotate_left



rotate_left_part_1:

	    STRB r11, [r5, #2]
        BL decide_side
        ldr r6, ptr_to_main_gameboard

        LDRB r7, [r0, #60]
        STRB r7, [r6, #46]
        STRB r7, [r6, #91]
        STRB r7, [r6, #136]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #181]
        STRB r7, [r6, #226]

        LDRB r7, [r0, #330]
        STRB r7, [r6, #316]
        STRB r7, [r6, #361]
        STRB r7, [r6, #406]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #451]
        STRB r7, [r6, #496]

        LDRB r7, [r0, #600]
        STRB r7, [r6, #586]
        STRB r7, [r6, #631]
        STRB r7, [r6, #676]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #721]
        STRB r7, [r6, #766]



        LDRB r7, [r0, #74]
        STRB r7, [r6, #60]
        STRB r7, [r6, #105]
        STRB r7, [r6, #150]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #195]
        STRB r7, [r6, #240]

        LDRB r7, [r0, #344]
        STRB r7, [r6, #330]
        STRB r7, [r6, #375]
        STRB r7, [r6, #420]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #465]
        STRB r7, [r6, #510]

        LDRB r7, [r0, #614]
        STRB r7, [r6, #600]
        STRB r7, [r6, #645]
        STRB r7, [r6, #690]     ;Insert color codes at each row within the grid
        STRB r7, [r6, #735]
        STRB r7, [r6, #780]

        ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Move the cursor to the top left of the screen
        ldr r6, ptr_to_main_gameboard
        MOV r0, r6
        BL output_game_board_string     ;Reprint the gameboard
        MOV r7, #0
        ADD r10, r10, #1
        B loop_rotate_left

rotate_left_part_2:
        MOV r4, #0x0000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x00C] ;LDRB r5 from r4 at offset 0x00C (Enable/Disable Timer                                                                                                                                                                                                )
        ORR r5, r5, #1   ;Disable the timer by writing a 0 to bit 0
        STRB r5, [r4, #0x00C] ;Store r5 back into r4 at offset 0x00C

        POP {r4-r12, lr}
        MOV pc, lr



rotate_side_up:           ;Subroutine responsible for handling upwards rotations
        PUSH {r4-r12, lr}
        ldr r5, ptr_to_mydata
        LDRB r9, [r5, #2]
        BL decide_side
        MOV r10, r0
        LDRB r4, [r0, #151]
        SUB r4, r4, #0x30
        STRB r4, [r5, #2]
        BL decide_side

        LDRB r4, [r5, #1]
        ADD r4, r4, #6
        MOV r0, r4
        BL same_color_check
        ldr r7, ptr_to_player
        LDRB r8, [r7]
        CMP r8, r0
        BEQ exit_rotate_side_up_reset
        STRB r4, [r5, #1]

        LDRB r8, [r5, #2]
        STRB r9, [r5, #2]
        BL decide_rotate_side_up
        STRB r8, [r5, #2]

        MOV r7, #1
        STRB r7, [r5, #6]

        BL animate_rotate_up       ;Rotate the cube up



         ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Move the cursor to the top left of the screen
        BL decide_side          ;Check which side the player is currently on
        BL output_game_board_string     ;Reprint the gameboard
        ldr r6, ptr_to_time
        MOV r0, r6
        BL output_string        ;Reprint the time counter to the screen
        ldr r6, ptr_to_moves
        MOV r0, r6
        BL output_string        ;Reprint the moves counter to the screen
        ldr r5, ptr_to_move_cursor      ;Move the cursor to the move counter pos                                                                                                                                 ition
        MOV r0, r5
        BL output_string        ;Move the cursor
        ldr r5, ptr_to_move_holder      ;Move the cursor to the string holding t                                                                                                                                 he updated move count
        MOV r0, r5
        BL output_string        ;Update the move count
        ldr r5, ptr_to_timer_cursor
        MOV r0, r5
        BL output_string
        ldr r5, ptr_to_time_holder
        MOV r0, r5
        BL output_string
        BL decide_grid          ;Check which grid the player is currently at

        ldr r6, ptr_to_player
        MOV r0, r6
        BL output_player_string ;Reprint the player to the new grid

        ldr r5, ptr_to_mydata
        MOV r7, #0
        STRB r7, [r5, #6]

        B exit_rotate_side_up

exit_rotate_side_up_reset:
        ldr r5, ptr_to_mydata
        STRB r9, [r5, #2]
exit_rotate_side_up:
        MOV r0, #1
        POP {r4-r12, lr}
        MOV pc, lr



rotate_side_left:               ;Subroutine responsible for handling left rotations
        PUSH {r4-r12, lr}

        ldr r5, ptr_to_mydata
        LDRB r9, [r5, #2]
        BL decide_side
        LDRB r4, [r0, #407]
        SUB r4, r4, #0x30
        STRB r4, [r5, #2]
        BL decide_side

        LDRB r4, [r5, #1]
        ADD r4, r4, #2
        MOV r0, r4
        BL same_color_check
        ldr r7, ptr_to_player
        LDRB r8, [r7]
        CMP r8, r0
        BEQ exit_rotate_side_left_reset
        STRB r4, [r5, #1]

        LDRB r8, [r5, #2]
        STRB r9, [r5, #2]
        BL decide_rotate_side_left
        STRB r8, [r5, #2]

        MOV r7, #1
        STRB r7, [r5, #6]

        BL animate_rotate_left  ;Rotate the cube to the left

         ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Move the cursor to the top left of the screen
        BL decide_side          ;Check which side the player is currently on
        BL output_game_board_string     ;Reprint the gameboard
        ldr r6, ptr_to_time
        MOV r0, r6
        BL output_string        ;Reprint the time counter to the screen
        ldr r6, ptr_to_moves
        MOV r0, r6
        BL output_string        ;Reprint the moves counter to the screen
        ldr r5, ptr_to_move_cursor      ;Move the cursor to the move counter pos                                                                                                                                 ition
        MOV r0, r5
        BL output_string        ;Move the cursor
        ldr r5, ptr_to_move_holder      ;Move the cursor to the string holding t                                                                                                                                 he updated move count
        MOV r0, r5
        BL output_string        ;Update the move count
         ldr r5, ptr_to_timer_cursor
        MOV r0, r5
        BL output_string
        ldr r5, ptr_to_time_holder
        MOV r0, r5
        BL output_string
        BL decide_grid          ;Check which grid the player is currently at

        ldr r6, ptr_to_player
        MOV r0, r6
        BL output_player_string ;Reprint the player to the new grid

        ldr r5, ptr_to_mydata
        MOV r7, #0
        STRB r7, [r5, #6]
        B exit_rotate_side_left

exit_rotate_side_left_reset:
        ldr r5, ptr_to_mydata
        STRB r9, [r5, #2]
exit_rotate_side_left
		MOV r0, #1
        POP {r4-r12, lr}
        MOV pc, lr


rotate_side_right:              ;Subroutine responsible for handling right rotations
        PUSH {r4-r12, lr}

        ldr r5, ptr_to_mydata
        LDRB r9, [r5, #2]
        BL decide_side
        LDRB r4, [r0, #435]
        SUB r4, r4, #0x30
        STRB r4, [r5, #2]
        BL decide_side

        LDRB r4, [r5, #1]
        SUB r4, r4, #2
        MOV r0, r4
        BL same_color_check
        ldr r7, ptr_to_player
        LDRB r8, [r7]
        CMP r8, r0
        BEQ exit_rotate_side_right_reset
        STRB r4, [r5, #1]

        LDRB r8, [r5, #2]
        STRB r9, [r5, #2]
        BL decide_rotate_side_right
        STRB r8, [r5, #2]

        MOV r7, #1
        STRB r7, [r5, #6]

        BL animate_rotate_right ;Rotate the cube to the right

         ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Move the cursor to the top left of the screen
        BL decide_side          ;Check which side the player is currently on
        BL output_game_board_string     ;Reprint the gameboard
        ldr r6, ptr_to_time
        MOV r0, r6
        BL output_string        ;Reprint the time counter to the screen
        ldr r6, ptr_to_moves
        MOV r0, r6
        BL output_string        ;Reprint the moves counter to the screen
        ldr r5, ptr_to_move_cursor      ;Move the cursor to the move counter pos                                                                                                                                 ition
        MOV r0, r5
        BL output_string        ;Move the cursor
        ldr r5, ptr_to_move_holder      ;Move the cursor to the string holding t                                                                                                                                 he updated move count
        MOV r0, r5
        BL output_string        ;Update the move count
         ldr r5, ptr_to_timer_cursor
        MOV r0, r5
        BL output_string
        ldr r5, ptr_to_time_holder
        MOV r0, r5
        BL output_string
        BL decide_grid          ;Check which grid the player is currently at

        ldr r6, ptr_to_player
        MOV r0, r6
        BL output_player_string ;Reprint the player to the new grid

        ldr r5, ptr_to_mydata
        MOV r7, #0
        STRB r7, [r5, #6]
        B exit_rotate_side_right

exit_rotate_side_right_reset:
        ldr r5, ptr_to_mydata
        STRB r9, [r5, #2]
exit_rotate_side_right
		MOV r0, #1
        POP {r4-r12, lr}
        MOV pc, lr


rotate_side_down:                       ;Subroutine responsible for handling downwards rotations
        PUSH {r4-r12, lr}

        ldr r5, ptr_to_mydata
        LDRB r9, [r5, #2]
        BL decide_side
        LDRB r4, [r0, #691]
        SUB r4, r4, #0x30
        STRB r4, [r5, #2]
        BL decide_side

        LDRB r4, [r5, #1]
        SUB r4, r4, #6
        MOV r0, r4
        BL same_color_check
        ldr r7, ptr_to_player
        LDRB r8, [r7]
        CMP r8, r0
        BEQ exit_rotate_side_down_reset
        STRB r4, [r5, #1]

        LDRB r8, [r5, #2]
        STRB r9, [r5, #2]
        BL decide_rotate_side_down
        STRB r8, [r5, #2]

		MOV r7, #1
        STRB r7, [r5, #6]
        BL animate_rotate_down         ;Rotate the cube down

         ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Move the cursor to the top left of the screen
        BL decide_side          ;Check which side the player is currently on
        BL output_game_board_string     ;Reprint the gameboard
        ldr r6, ptr_to_time
        MOV r0, r6
        BL output_string        ;Reprint the time counter to the screen
        ldr r6, ptr_to_moves
        MOV r0, r6
        BL output_string        ;Reprint the moves counter to the screen
        ldr r5, ptr_to_move_cursor      ;Move the cursor to the move counter pos                                                                                                                                 ition
        MOV r0, r5
        BL output_string        ;Move the cursor
        ldr r5, ptr_to_move_holder      ;Move the cursor to the string holding t                                                                                                                                 he updated move count
        MOV r0, r5
        BL output_string        ;Update the move count
         ldr r5, ptr_to_timer_cursor
        MOV r0, r5
        BL output_string
        ldr r5, ptr_to_time_holder
        MOV r0, r5
        BL output_string
        BL decide_grid          ;Check which grid the player is currently at

        ldr r6, ptr_to_player
        MOV r0, r6
        BL output_player_string ;Reprint the player to the new grid

        ldr r5, ptr_to_mydata
        MOV r7, #0
        STRB r7, [r5, #6]
        B exit_rotate_side_down


exit_rotate_side_down_reset:
        ldr r5, ptr_to_mydata
        STRB r9, [r5, #2]
exit_rotate_side_down:
	MOV r0, #1
        POP {r4-r12, lr}
        MOV pc, lr


read_tiva_pushbutton:
    PUSH {r4-r12,lr}        ; Spill registers to stack
read_sw1:
    MOV r4, #0x5000
    MOVT r4, #0x4002    ;Move address of Port F, 0x40025000 into r4
    LDRB r0, [r4, #0x3FC]   ;Load byte from GPIO Data Register addr, offset 0x400
    AND r0, r0, #16
    LSR r0, r0, #4          ;Logically shift to the right 3 bits
    CMP r0, #1
    BEQ read_sw1
    MOV r0, #1

STOP_BUTTON:
    POP {r4-r12,lr}         ; Restore registers from stack
    MOV pc, lr



illuminate_RGB_LED:
    PUSH {r4-r12,lr}        ; Spill registers to stack
    MOV r1, r0          ;Move contents of r0 into r1
start_led:
    MOV r4, #0x5000
    MOVT r4, #0x4002    ;Move address of Port F, 0x40025000 into r4
    LDRB r5, [r4, #0x3FC]   ;Load byte from GPIO Data Register addr, offset 0x400

    CMP r1, #1
    BEQ make_red
    CMP r1, #2
    BEQ make_blue
    CMP r1, #3
    BEQ make_green
    CMP r1, #4
    BEQ make_purple
    CMP r1, #5
    BEQ make_yellow
    CMP r1, #6
    BEQ make_white

make_red:
    ORR r5, r5, #2          ;Make LED Red
    STRB r5, [r4, #0x3FC]   ;Store r5 into r4 at offset 0x3FC to make the LED red
    B STOP_RGB               ;If it is, end the program

make_blue:
    ORR r5, r5, #4          ;Make LED Blue
    STRB r5, [r4, #0x3FC]   ;Store r5 into r4 at offset 0x3FC to make the LED blue
    B STOP_RGB                ;If it is, end the program


make_green:
    ORR r5, r5, #8          ;Make LED Green
    STRB r5, [r4, #0x3FC]   ;Store r5 into r4 at offset 0x3FC to make the LED green
    B STOP_RGB                ;If it is, end the program


make_purple:
    ORR r5, r5, #6          ;Make LED Purple
    STRB r5, [r4, #0x3FC]   ;Store r5 into r4 at offset 0x3FC to make the LED purple
    B STOP_RGB               ;If it is, end the program


make_yellow:
    ORR r5, r5, #10          ;Make LED Yellow
    STRB r5, [r4, #0x3FC]   ;Store r5 into r4 at offset 0x3FC to make the LED yellow
    B STOP_RGB                ;If it is, end the program


make_white:
    ORR r5, r5, #14          ;Make LED White
    STRB r5, [r4, #0x3FC]   ;Store r5 into r4 at offset 0x3FC to make the LED white
    B STOP_RGB                ;If it is, end the program
          ; Your code is placed here

STOP_RGB:
    POP {r4-r12,lr}         ; Restore registers from stack
    MOV pc, lr


reset_RGB:

		PUSH {r4-r12, lr}

        MOV r0, #0x5000
        MOVT r0, #0x4002    ;Move address of Port F, 0x40025000 into r4
        LDRB r2, [r0, #0x3FC]   ;Load byte from GPIO Data Register addr, offset 0x400
        AND r2, r2, #16          ;Reset LEDS to turn them off
        STRB r2, [r0, #0x3FC]   ;Store r5 back into r4
		POP {r4-r12, lr}
		MOV pc, lr


string2int:

        PUSH {r4-r12,lr}        ; Store any registers in the range of r4 through r12
                                                        ; that are used in your routine.  Include lr if this
                                                        ; routine calls another routine.

                ; Your code for your string2int routine is placed here
        MOV r5, r0
        MOV r2, #0                                      ;Initialize r2
        MOV r3, #0
        MOV r4, #10                                   ;Initialize counter
        MOV r11, #1                                     ;Store 1 in r11
        LDRB r0, [r5, r3]                       ;Load first byte from string
        CMP r0, #0x2D
        BNE loop_2int_dividend
        RSB r11, r11, #0
        ADD r3, r3, #1
        LDRB r0, [r5, r3]
loop_2int_dividend:
        SUB r0, r0, #48                         ;Subtract 48 from int string
        MUL r2, r2, r4                         ;Multiply r2 by 10
        ADD r2, r2, r0                          ;Add result to r0
        ADD r3, r3, #1                          ;Increment Counter
        LDRB r0, [r5, r3]                       ;Load next byte in int string
        CMP r0, #0x00                           ;Check if the next byte is NULL
        BNE loop_2int_dividend          ;If not, repeat loop
        MUL r2, r2, r11                         ;Multiply r2 by r11, if negative sign is present, r11 is -1, if not, r11 is 1
        MOV r1, r2                              ;If it is, store int value in r2 into r1                              ;Move divisor int value into r1
        POP {r4-r12,lr}   ; Restore registers all registers preserved in the
                                                        ; PUSH at the top of this routine from the stack.
        mov pc, lr





dividend_less:
        RSB r0, r0, #0 ; Reverse subtract r0 with 0
        EOR r3, r3, #1 ; XOR the value of R3 with 1
        B part_one ;Branch back to the div_mod routine

divisor_less:
        RSB r1, r1, #0 ; Reverse subtract r1 with 0
        EOR r3, r3, #1 ; XOR the value of R3 with 1
        B part_one         ; Branch back to the div_mod routine

sign:
        RSB r2, r2, #0 ;Reverse subtract r2 with 0
        B STOP             ; Branch to the STOP subroutine

div_and_mod:
        PUSH {r4-r12,lr}
                ; Your code for your div_and_mod routine is placed here
        MOV r2, #0 ; Move 0 into r2
        MOV r3, #0 ; Move 0 into r3
part_one:
        CMP r0, #0 ; Compare r0 with 0
        BLT dividend_less ; If less than 0, branch to subroutine
        CMP r1, #0 ; Compare r1 with 0
        BLT divisor_less ; If less than 0, branch to subroutine
        CMP r0, r1 ; Compare r0 with r1
        BLT STOP ; Branch to subroutine

LOOP:
        ADD r2, r2, #1 ; Increment r2
        SUB r0, r0, r1 ; Subtract r1 from r0
        CMP r0, r1 ; Compare r0 to r1
        BGE LOOP ; If r0 is greater than r1, continue loop again
        CMP r3, #0 ; Compare r3 to 0
        BGT sign ; If greater than 0, branch to subroutine

STOP:
        MOV r1, r0 ; Move r0 into r1
        MOV r0, r2 ; Move r2 into r0

        POP {r4-r12,lr}   ; Restore registers all registers preserved in the
                                                        ; PUSH at the top of this routine from the stack.
        mov pc, lr

rotate_side_clockwise:          ;Responsible for rotating cube sides clockwise
        PUSH {r4-r12, lr}

        LDRB r1,[r0, #46]
        LDRB r2, [r0, #60]
        LDRB r3, [r0, #74]
        LDRB r4, [r0, #316]
        LDRB r6, [r0, #344]
        LDRB r7, [r0, #586]
        LDRB r8, [r0, #600]
        LDRB r9, [r0, #614]

        STRB r1, [r0, #74]      ;Rotate grid 1 to grid 3
        STRB r1, [r0, #119]
        STRB r1, [r0, #164]
        STRB r1, [r0, #209]
        STRB r1, [r0, #254]

        STRB r2, [r0, #344]     ;Rotate grid 2 to grid 6
        STRB r2, [r0, #389]
        STRB r2, [r0, #434]
        STRB r2, [r0, #479]
        STRB r2, [r0, #524]

        STRB r3, [r0, #614]     ;Rotate grid 3 to grid 9
        STRB r3, [r0, #659]
        STRB r3, [r0, #704]
        STRB r3, [r0, #749]
        STRB r3, [r0, #794]

        STRB r9, [r0, #586]     ;Rotate grid 9 to grid 7
        STRB r9, [r0, #631]
        STRB r9, [r0, #676]
        STRB r9, [r0, #721]
        STRB r9, [r0, #766]


        STRB r6, [r0, #600]     ;Rotate grid 6 to grid 8
        STRB r6, [r0, #645]
        STRB r6, [r0, #690]
        STRB r6, [r0, #735]
        STRB r6, [r0, #780]

        STRB r3, [r0, #614]     ;Rotate grid 3 to grid 9
        STRB r3, [r0, #659]
        STRB r3, [r0, #704]
        STRB r3, [r0, #749]
        STRB r3, [r0, #794]

        STRB r7, [r0, #46]      ;Rotate grid 7 to grid 1
        STRB r7, [r0, #91]
        STRB r7, [r0, #136]
        STRB r7, [r0, #181]
        STRB r7, [r0, #226]


        STRB r8, [r0, #316]     ;Rotate grid 8 to grid 4
        STRB r8, [r0, #361]
        STRB r8, [r0, #406]
        STRB r8, [r0, #451]
        STRB r8, [r0, #496]


        STRB r9, [r0, #586]     ;Rotate grid 9 to grid 7
        STRB r9, [r0, #631]
        STRB r9, [r0, #676]
        STRB r9, [r0, #721]
        STRB r9, [r0, #766]

        STRB r1, [r0, #74]      ;Rotate grid 1 to grid 3
        STRB r1, [r0, #119]
        STRB r1, [r0, #164]
        STRB r1, [r0, #209]
        STRB r1, [r0, #254]

        STRB r4, [r0, #60]     ;Rotate grid 4 to grid 2
        STRB r4, [r0, #105]
        STRB r4, [r0, #150]
        STRB r4, [r0, #195]
        STRB r4, [r0, #240]

        STRB r7, [r0, #46]    ;Rotate grid 7 to grid 1
        STRB r7, [r0, #91]
        STRB r7, [r0, #136]
        STRB r7, [r0, #181]
        STRB r7, [r0, #226]


        LDRB r1, [r0, #151]     ;Load side direction from grid 2
        LDRB r2, [r0, #407]     ;Load side direction from grid 4
        LDRB r3, [r0, #435]     ;Load side direction from grid 6
        LDRB r4, [r0, #691]     ;Load side direction from grid 8

        STRB r1, [r0, #435]     ;Rotate side direction from grid 2 to grid 6
        STRB r3, [r0, #691]     ;Rotate side direction from grid 6 to grid 8
        STRB r4, [r0, #407]     ;Rotate side direction from grid 8 to grid 4
        STRB r2, [r0, #151]     ;Rotate side direction from grid 4 to grid 2


        POP {r4-r12, lr}
        MOV pc, lr


rotate_side_counter_clockwise:           ;Responsible for rotating cube sides counter-clockwise
        PUSH {r4-r12, lr}

        LDRB r1,[r0, #46]
        LDRB r2, [r0, #60]
        LDRB r3, [r0, #74]
        LDRB r4, [r0, #316]
        LDRB r6, [r0, #344]
        LDRB r7, [r0, #586]
        LDRB r8, [r0, #600]
        LDRB r9, [r0, #614]

        STRB r1, [r0, #586]      ;Rotate grid 1 to grid 7
        STRB r1, [r0, #631]
        STRB r1, [r0, #676]
        STRB r1, [r0, #721]
        STRB r1, [r0, #766]

        STRB r2, [r0, #316]     ;Rotate grid 2 to grid 4
        STRB r2, [r0, #361]
        STRB r2, [r0, #406]
        STRB r2, [r0, #451]
        STRB r2, [r0, #496]

        STRB r3, [r0, #46]     ;Rotate grid 3 to grid 1
        STRB r3, [r0, #91]
        STRB r3, [r0, #136]
        STRB r3, [r0, #181]
        STRB r3, [r0, #226]

        STRB r6, [r0, #60]     ;Rotate grid 6 to grid 2
        STRB r6, [r0, #105]
        STRB r6, [r0, #150]
        STRB r6, [r0, #195]
        STRB r6, [r0, #240]


        STRB r9, [r0, #74]     ;Rotate grid 9 to grid 3
        STRB r9, [r0, #119]
        STRB r9, [r0, #164]
        STRB r9, [r0, #209]
        STRB r9, [r0, #254]

        STRB r8, [r0, #344]     ;Rotate grid 8 to grid 6
        STRB r8, [r0, #389]
        STRB r8, [r0, #434]
        STRB r8, [r0, #479]
        STRB r8, [r0, #524]

        STRB r7, [r0, #614]      ;Rotate grid 7 to grid 9
        STRB r7, [r0, #659]
        STRB r7, [r0, #704]
        STRB r7, [r0, #749]
        STRB r7, [r0, #794]


        STRB r4, [r0, #600]     ;Rotate grid 4 to grid 8
        STRB r4, [r0, #645]
        STRB r4, [r0, #690]
        STRB r4, [r0, #735]
        STRB r4, [r0, #780]


        LDRB r1, [r0, #151]     ;Load side direction from grid 2
        LDRB r2, [r0, #407]     ;Load side direction from grid 4
        LDRB r3, [r0, #435]     ;Load side direction from grid 6
        LDRB r4, [r0, #691]     ;Load side direction from grid 8

        STRB r1, [r0, #407]     ;Rotate side direction from grid 2 to grid 4
        STRB r2, [r0, #691]     ;Rotate side direction from grid 4 to grid 8
        STRB r4, [r0, #435]     ;Rotate side direction from grid 8 to grid 6
        STRB r3, [r0, #151]     ;Rotate side direction from grid 6 to grid 2


        POP {r4-r12, lr}
        MOV pc, lr

        .end
