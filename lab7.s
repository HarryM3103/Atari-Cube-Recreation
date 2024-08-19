        .data
        .global uart_init
        .global gpio_btn_and_LED_init
        .global uart_interrupt_init
        .global gpio_interrupt_init
        .global timer_init
        .global output_character
        .global read_character
        .global read_string
        .global UART0_Handler
        .global Timer_Handler
        .global Switch_Handler
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
        .global lab7
        .global gen_random_board
        .global gen_random_player
        .global enable_timer
        .global disable_timer
        .global player
        .global mydata
        .global erase_display
        .global reset_cursor
        .global timer_cursor
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




board_side_1:                                  .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             | 6           |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "| 4           |             | 2           |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             | 5           |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD, 0

board_side_2:                                  .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             | 6           |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "| 1           |             | 3           |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             | 5           |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD, 0

board_side_3:                                   .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             | 6           |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "| 2           |             | 4           |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             | 5           |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD, 0

board_side_4:                                   .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             | 6           |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "| 3           |             | 1           |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             | 5           |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD, 0

board_side_5:                                   .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             | 1           |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "| 4           |             | 2           |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             | 3           |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD, 0


board_side_6:                                   .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             | 3           |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "| 4           |             | 2           |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             | 1           |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD, 0

main_game_board:                                .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|- - - - - - -|- - - - - - -|- - - - - - -|", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "|             |             |             |", 0xA, 0xD
                                                .string "+ - - - - - - - - - - - - - - - - - - - - +", 0xA, 0xD, 0

time:											.string "		Time: ", 0xA, 0xD, 0
moves:											.string	"		Moves:	", 0xA, 0xD, 0

player: .string "0", 0

press_enter: .string "Press enter to begin the round! [q to exit]", 0xA, 0xD,0
select_time: .string "Select your time mode:", 0xA, 0xD
             .string "SW2: Unlimited", 0xA, 0xD
             .string "SW3: 300 second timer", 0xA, 0xD
             .string "SW4: 200 second timer", 0xA, 0xD
             .string "SW5: 100 second timer", 0xA, 0xD, 0


red:    .string 27, "[41m             ", 0
blue:   .string 27, "[44m             ", 0
green:  .string 27, "[42m             ", 0
yellow: .string 27, "[43m             ", 0
purple: .string 27, "[45m             ", 0
white:  .string 27, "[47m             ", 0

revert_color:	.string 27, "[40m", 0
timer_cursor:	.string 27, "[20;23H", 0
move_cursor:	.string 27, "[21;24H", 0
reset_cursor:	.string 27, "[1;1H", 0
erase_display:  .string 27, "[2J", 0
hide_cursor:    .string 27, "[?25l", 0

player_red:             .string 27, "[41m   ", 0
player_blue:            .string 27, "[44m   ", 0
player_green:           .string 27, "[42m   ", 0
player_yellow:          .string 27, "[43m   ", 0
player_purple:          .string 27, "[45m   ", 0
player_white:           .string 27, "[47m   ", 0




Move_up: .string 27, "[6A", 0
Move_down: .string 27, "[6B", 0
Move_right: .string 27, "[14C", 0
Move_left: .string 27, "[14D", 0


grid_1_line_1: .string 27, "[4;7H", 0


grid_2_line_1: .string 27, "[4;21H", 0



grid_3_line_1: .string 27, "[4;34H", 0



grid_4_line_1: .string 27, "[10;7H", 0



grid_5_line_1: .string 27, "[10;21H", 0



grid_6_line_1: .string 27, "[10;34H", 0



grid_7_line_1: .string 27, "[16;7H", 0



grid_8_line_1: .string 27, "[16;21H", 0



grid_9_line_1: .string 27, "[16;34H", 0



game_paused:  .string "PAUSED", 0xA, 0xD, 0
game_over_text: .string " GAME OVER :(", 0xA, 0xD, 0
game_win_text:  .string "  YOU WIN :)", 0xA, 0xD, 0
game_restart_prompt:  .string "Press r to restart!", 0xA, 0xD
                      .string "Press q to quit!", 0xA, 0xD, 0
pause_game_location:    .string 27, "[10;19H", 0
game_over_location:     .string 27, "[10;16H", 0
game_win_location:      .string 27, "[10;16H", 0
restart_game_location:    .string 27, "[23;1H", 0

time_holder:     .string "  ", 0xA, 0xD, 0
null_holder:	 .string "", 0
move_holder:     .string "  ", 0xA, 0xD, 0

mydata: .byte   0x20    ; This is where you can store data.
                        ; The .byte assembler directive stores a byte
                        ; (initialized to 0x20) at the label mydata.
                        ; Halfwords & Words can be stored using the
                        ; directives .half & .word

        .text

ptr_to_start_game:		  .word press_enter
ptr_to_select_time:             .word select_time

ptr_to_main_game_board    .word main_game_board
ptr_to_side_1:            .word board_side_1
ptr_to_side_2:            .word board_side_2
ptr_to_side_3:            .word board_side_3
ptr_to_side_4:            .word board_side_4
ptr_to_side_5:            .word board_side_5
ptr_to_side_6:            .word board_side_6

ptr_to_time:			  .word time
ptr_to_time_holder                .word time_holder
ptr_to_move_holder:		  .word move_holder
ptr_to_moves:		      .word moves

ptr_to_player:                    .word player

ptr_to_pause_game:     .word game_paused
ptr_to_game_over_text: .word game_over_text
ptr_to_game_win_text:  .word game_win_text
ptr_to_game_win_location: .word game_win_location
ptr_to_move_up:        .word Move_up
ptr_to_move_down:   .word Move_down
ptr_to_move_right:   .word Move_right
ptr_to_move_left:   .word Move_left

ptr_to_red:                              .word red
ptr_to_blue:                             .word blue
ptr_to_green:                    .word green
ptr_to_yellow:                   .word yellow
ptr_to_purple:                   .word purple
ptr_to_white:                    .word white

ptr_to_player_red:              .word player_red
ptr_to_player_blue:             .word player_blue
ptr_to_player_green:              .word player_green
ptr_to_player_yellow:              .word player_yellow
ptr_to_player_purple:              .word player_purple
ptr_to_player_white:              .word player_white

ptr_to_revert_color:			 .word revert_color
ptr_to_reset_cursor			     .word reset_cursor
ptr_to_timer_cursor				 .word timer_cursor
ptr_to_move_cursor:                     .word move_cursor
ptr_to_erase_display:                    .word erase_display
ptr_to_hide_cursor:                     .word hide_cursor

ptr_to_grid_1_line_1:                    .word grid_1_line_1

ptr_to_grid_2_line_1:                    .word grid_2_line_1

ptr_to_grid_3_line_1:                    .word grid_3_line_1

ptr_to_grid_4_line_1:                    .word grid_4_line_1

ptr_to_grid_5_line_1:                    .word grid_5_line_1

ptr_to_grid_6_line_1:                    .word grid_6_line_1

ptr_to_grid_7_line_1:                    .word grid_7_line_1

ptr_to_grid_8_line_1:                    .word grid_8_line_1

ptr_to_grid_9_line_1:                    .word grid_9_line_1



ptr_to_pause_game_location:     .word pause_game_location
ptr_to_game_over_location:     .word game_over_location
ptr_to_restart_game_prompt:    .word game_restart_prompt
ptr_to_restart_game_location:	.word restart_game_location
ptr_to_mydata:          .word mydata


lab7:                                                           ; This is your m                                                                                                                                                                                                ain routine which                                                                                                                                  is called from
; your C wrapper.
        PUSH {r4-r12,lr}                ; Preserve registers to adhere to the AA
      	bl timer_init

restart_lab:
        ldr r4, ptr_to_side_1
        ldr r5, ptr_to_mydata


        LDRB r6, [r5]
        MOV r6, #0                      ;Initailize data byte that stores th                                                                                                                                                                                                e location of the                                                                                                                                  player
        STRB r6, [r5]

        LDRB r6, [r5, #1]
        MOV r6, #1                      ;Initailize data byte that stores curren                                                                                                                                 t grid position of player                                                                                                                                                                                                is pressed
        STRB r6, [r5, #1]

        LDRB r6, [r5, #2]
        MOV r6, #1                      ;Initailize data byte that stores what t                                                                                                                                                                                                he current side i                                                                                                                                 s.
        STRB r6, [r5, #2]

        LDRB r6, [r5, #3]
        MOV r6, #0                      ;Initailize data byte that stores the time mode                                                                                                                                s.
        STRB r6, [r5, #3]

        LDRB r6, [r5, #4]
        MOV r6, #0                      ;Initailize data byte that stores what the current side i                                                                                                                                 s.
        STRB r6, [r5, #4]


        LDR r6, [r5, #32]
        MOV r6, #0                      ;Initailize data byte that stores what                                                                                                                                  the current time.
        STR r6, [r5, #32]

        LDR r6, [r5, #28]
        MOV r6, #0                      ;Initailize data byte that stores what t                                                                                                                                 he current moves.
        STR r6, [r5, #28]

        LDRB r6, [r5, #6]
        MOV r6, #0                      ;Initailize data byte determining if the                                                                                                                                                                                                 game is paused
        STRB r6, [r5, #6]

        LDRB r6, [r5, #7]
        MOV r6, #0                      ;Initailize data byte determining if the                                                                                                                                                                                                 game is paused
        STRB r6, [r5, #7]

        LDRB r6, [r5, #8]
        MOV r6, #0                      ;Initailize data byte that stores number of red grids                                                                                                                                                                     is pressed
        STRB r6, [r5, #8]

        LDRB r6, [r5, #9]
        MOV r6, #0                      ;Initailize data byte that stores number of blue grids                                                                                                                                                                                     he current side i                                                                                                                                 s.
        STRB r6, [r5, #9]

        LDRB r6, [r5, #10]
        MOV r6, #0                      ;Initailize data byte that stores number of green grids                                                                                                                             the current time.
        STRB r6, [r5, #10]

        LDRB r6, [r5, #11]
        MOV r6, #0                     ;Initailize data byte that stores number of yellow grids                                                                                                                     he current moves.
        STRB r6, [r5, #11]

        LDRB r6, [r5, #12]
        MOV r6, #0                     ;Initailize data byte that stores number of purple grids                                                                                                                                                                                      game is paused
        STRB r6, [r5, #12]

        LDRB r6, [r5, #13]
        MOV r6, #0                     ;Initailize data byte that stores number of white grids                                                                                                                                                                                                game is paused
        STRB r6, [r5, #13]

        LDRB r6, [r5, #14]
        MOV r6, #0                     ;Initailize data byte that stores number of white grids                                                                                                                                                                                                game is paused
        STRB r6, [r5, #14]

        LDRB r6, [r5, #15]
        MOV r6, #0                     ;Initailize data byte that stores number of white grids                                                                                                                                                                                                game is paused
        STRB r6, [r5, #15]

        LDRB r6, [r5, #16]
        MOV r6, #0                     ;Initailize data byte that indicate timer banned, 0 for timer is on, 1 for timer is not needed for this round                                                                                                                                                                                 game is paused
        STRB r6, [r5, #16]

		LDRB r6, [r5, #17]
        MOV r6, #0                     ;Initailize data byte that stores number of sides completed                                                                                                                                                                               game is paused
        STRB r6, [r5, #17]

        LDRB r6, [r5, #18]
        MOV r6, #0                     ;Initailize data byte to check led dance                                                                                                                                                                             game is paused
        STRB r6, [r5, #18]

		;init bits for checking complete statue for each side
		LDRB r6, [r5, #19]
        MOV r6, #0                     ;Initailize data byte to check complete for side 1                                                                                                                                                                             game is paused
        STRB r6, [r5, #19]

        LDRB r6, [r5, #20]
        MOV r6, #0                     ;Initailize data byte to check complete for side 2                                                                                                                                                                             game is paused
        STRB r6, [r5, #20]

        LDRB r6, [r5, #21]
        MOV r6, #0                     ;Initailize data byte to check complete for side 3                                                                                                                                                                             game is paused
        STRB r6, [r5, #21]

        LDRB r6, [r5, #22]
        MOV r6, #0                     ;Initailize data byte to check complete for side 4                                                                                                                                                                             game is paused
        STRB r6, [r5, #22]

        LDRB r6, [r5, #23]
        MOV r6, #0                     ;Initailize data byte to check complete for side 5                                                                                                                                                                             game is paused
        STRB r6, [r5, #23]

        LDRB r6, [r5, #24]
        MOV r6, #0                     ;Initailize data byte to check complete for side 6                                                                                                                                                                             game is paused
        STRB r6, [r5, #24]

        LDRB r6, [r5, #25]
        MOV r6, #0
        STRB r6, [r5, #25]


        bl uart_init
        bl uart_interrupt_init
        bl gpio_btn_and_LED_init
        bl gpio_interrupt_init

        BL disable_timer

        MOV r4, #0x5000
    	MOVT r4, #0x4000        ;Move 0x40005000 into r4
    	LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    	AND r5, r5, #0xF0          ;ORR r5 with the contents of r0
    	STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

    	ldr r5, ptr_to_mydata




        ldr r4, ptr_to_erase_display
		MOV r0, r4
		BL output_string
		ldr r4, ptr_to_reset_cursor
		MOV r0, r4
		BL output_string

        ldr r6, ptr_to_hide_cursor
		MOV r0, r6
		BL output_string


		ldr r6, ptr_to_start_game
		MOV r0, r6
		BL output_string
		MOV r7, #0




wait_for_start:
        ADD r7, r7, #1
        LDRB r6, [r5, #2]               ;Load byte where the enter character is                                                           stored
        CMP r6, #0xD                    ;Check if the enter key is stored
        BNE wait_for_start              ;Branch back to the loop if the enter ke                                                          y has not been pressed
        LDRB r6, [r5, #2]
        MOV r6, #1                              ;Move 0 into r6
        STRB r6, [r5, #2]               ;Reset the byte back to 0

        ldr r6, ptr_to_select_time
        MOV r0, r6
        BL output_string
        BL read_from_push_btns
        STRB r0, [r5, #3]

        MOV r8, #0xFFFF
        MOVT r8, #0x0011
        ADD r7, r7, r8
        MOV r4, #0x1000
    	MOVT r4, #0x4003        ;Move to 0x40031000
    	STR r7, [r4, #0x028]   ;STRB r5 into offset 0x028

		BL enable_timer
        BL gen_random_board

        LDRB r6, [r5, #1]
        MOV r6, #5                      ;Initailize data byte that stores curren                                                                                                                                 t grid position of player                                                                                                                                                                                                is pressed
        STRB r6, [r5, #1]

        LDRB r6, [r5, #2]
        MOV r6, #1                      ;Initailize data byte that stores what t                                                                                                                                                                                                he current side i                                                                                                                                 s.
        STRB r6, [r5, #2]

        BL gen_random_player


		ldr r4, ptr_to_erase_display
		MOV r0, r4
		BL output_string
		ldr r4, ptr_to_reset_cursor
		MOV r0, r4
		BL output_string
        ldr r4, ptr_to_side_1
        MOV r0, r4
        BL output_game_board_string
        ldr r4, ptr_to_time
        MOV r0, r4
        BL output_string
        ldr r4, ptr_to_moves
        MOV r0, r4
        BL output_string
        ldr r4, ptr_to_grid_5_line_1
        MOV r0, r4
        BL output_string
        ldr r4, ptr_to_player
        MOV r0, r4
        BL output_player_string


        MOV r4, #0x0000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x00C]
        ORR r5, r5, #1
        STRB r5, [r4, #0x00C]

loop:
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
        CMP r6, #6
        BGE game_won
		LDRB r6, [r5]
		CMP r6, #0
		BEQ loop
		CMP r6, #1
		BEQ restart_lab
                CMP r6, #3
                BEQ game_end

                POP {r4-r12, lr}
                MOV pc, lr

game_won:
        MOV r4, #0x0000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x00C] ;LDRB r5 from r4 at offset 0x00C (Enable/Disable Timer                                                                                                                                                                                                )
        AND r5, r5, #0xFE   ;Disable the timer by writing a 0 to bit 0
        STRB r5, [r4, #0x00C] ;Store r5 back into r4 at offset 0x00C


        ldr r5, ptr_to_mydata
        MOV r6, #1
        STRB r6, [r5, #6]
        MOV r6, #1
        STRB r6, [r5, #25]
        MOV r6, #3
        STRB r6, [r5]
        ldr r6, ptr_to_game_win_location
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_game_win_text
        MOV r0, r6
        BL output_string

         MOV r4, #0x1000
   	 	MOVT r4, #0x4003        ;Move to 0x40031000
    	MOV r5, #0x0000
    	MOVT r5, #0x0100        ;Timer interval
    	STR r5, [r4, #0x028]   ;STRB r5 into offset 0x028
    	ldr r5, ptr_to_mydata
    	MOV r7, #1
    	STRB r7, [r5, #18]

        ldr r6, ptr_to_restart_game_location
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_restart_game_prompt
        MOV r0, r6
        BL output_string

        BL enable_timer

game_won_loop:
        ldr r5, ptr_to_mydata
        LDRB r6, [r5]
        CMP r6, #3
        BEQ game_won_loop ;CHange back to BEQ!!!
        CMP r6, #1
        BEQ restart_lab


		BL disable_timer
        POP {r4-r12, lr}
        MOV pc, lr







game_end:
        PUSH {r4-r12, lr}
        MOV r4, #0x0000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x00C] ;LDRB r5 from r4 at offset 0x00C (Enable/Disable Timer                                                                                                                                                                                                )
        AND r5, r5, #0xFE   ;Disable the timer by writing a 0 to bit 0
        STRB r5, [r4, #0x00C] ;Store r5 back into r4 at offset 0x00C



        ldr r5, ptr_to_mydata
        MOV r6, #1
        STRB r6, [r5, #6]
        MOV r6, #1
        STRB r6, [r5, #25]
        ldr r6, ptr_to_game_over_location
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_game_over_text
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_restart_game_location
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_restart_game_prompt
        MOV r0, r6
        BL output_string

game_end_loop:
        ldr r5, ptr_to_mydata
        LDRB r6, [r5]
        CMP r6, #3
        BEQ game_end_loop
        CMP r6, #1
        BEQ restart_lab


        POP {r4-r12, lr}
        MOV pc, lr



decide_grid:
        PUSH {r4-r12, lr}
        ldr r5, ptr_to_mydata           ;Load pointer to mydata in r5
        LDRB r6, [r5, #1]               ;Load the byte that contains the current grid the player is located into r6

        CMP r6, #1
        BEQ set_cursor_grid_1           ;If the player is in grid 1, branch to set_cursor_grid_1
        CMP r6, #2
        BEQ set_cursor_grid_2           ;If the player is in grid 2, branch to set_cursor_grid_2
        CMP r6, #3
        BEQ set_cursor_grid_3           ;If the player is in grid 3, branch to set_cursor_grid_3
        CMP r6, #4
        BEQ set_cursor_grid_4           ;If the player is in grid 4, branch to set_cursor_grid_4
        CMP r6, #5
        BEQ set_cursor_grid_5           ;If the player is in grid 5, branch to set_cursor_grid_5
        CMP r6, #6
        BEQ set_cursor_grid_6           ;If the player is in grid 6, branch to set_cursor_grid_6
        CMP r6, #7
        BEQ set_cursor_grid_7           ;If the player is in grid 7, branch to set_cursor_grid_7
        CMP r6, #8
        BEQ set_cursor_grid_8           ;If the player is in grid 8, branch to set_cursor_grid_8
        CMP r6, #9
        BEQ set_cursor_grid_9           ;If the player is in grid 9, branch to set_cursor_grid_9

set_cursor_grid_1:                      ;Place the cursor in the middle of grid 1
        ldr r5, ptr_to_grid_1_line_1
        MOV r0, r5
        BL output_string
        B exit_decide_grid

set_cursor_grid_2:                      ;Place the cursor in the middle of grid 2
        ldr r5, ptr_to_grid_2_line_1
        MOV r0, r5
        BL output_string
        B exit_decide_grid
set_cursor_grid_3:                      ;Place the cursor in the middle of grid 3
        ldr r5, ptr_to_grid_3_line_1
        MOV r0, r5
        BL output_string
        B exit_decide_grid
set_cursor_grid_4:                      ;Place the cursor in the middle of grid 4
        ldr r5, ptr_to_grid_4_line_1
        MOV r0, r5
        BL output_string
        B exit_decide_grid
set_cursor_grid_5:                      ;Place the cursor in the middle of grid 5
        ldr r5, ptr_to_grid_5_line_1
        MOV r0, r5
        BL output_string
        B exit_decide_grid
set_cursor_grid_6:                      ;Place the cursor in the middle of grid 6
        ldr r5, ptr_to_grid_6_line_1
        MOV r0, r5
        BL output_string
        B exit_decide_grid
set_cursor_grid_7:                      ;Place the cursor in the middle of grid 7
        ldr r5, ptr_to_grid_7_line_1
        MOV r0, r5
        BL output_string
        B exit_decide_grid
set_cursor_grid_8:                      ;Place the cursor in the middle of grid 8
        ldr r5, ptr_to_grid_8_line_1
        MOV r0, r5
        BL output_string
        B exit_decide_grid
set_cursor_grid_9:                      ;Place the cursor in the middle of grid 9
        ldr r5, ptr_to_grid_9_line_1
        MOV r0, r5
        BL output_string
        B exit_decide_grid

exit_decide_grid:                       ;Exit the decide_grid subroutine
        POP {r4-r12, lr}
        MOV pc, lr


decide_side:
        PUSH {r4-r12, lr}
        ldr r5, ptr_to_mydata           ;Load pointer to mydata in t5
        LDRB r6, [r5, #2]               ;Load the byte that contains the current side the player is located into r6

        CMP r6, #1
        BEQ set_side_1                  ;If side 1, branch to set_side_1
        CMP r6, #2
        BEQ set_side_2                  ;If side 2, branch to set_side_2
        CMP r6, #3
        BEQ set_side_3                  ;If side 3, branch to set_side_3
        CMP r6, #4
        BEQ set_side_4                  ;If side 4, branch to set_side_4
        CMP r6, #5
        BEQ set_side_5                  ;If side 5, branch to set_side_5
        CMP r6, #6
        BEQ set_side_6                  ;If side 6, branch to set_side_6


set_side_1:                             ;Moves the string location of side 1 into r0
        ldr r5, ptr_to_side_1
        MOV r0, r5
        B exit_side

set_side_2:                             ;Moves the string location of side 2 into r0
        ldr r5, ptr_to_side_2
        MOV r0, r5
        B exit_side
set_side_3:                             ;Moves the string location of side 3 into r0
        ldr r5, ptr_to_side_3
        MOV r0, r5
        B exit_side
set_side_4:                             ;Moves the string location of side 4 into r0
        ldr r5, ptr_to_side_4
        MOV r0, r5
        B exit_side
set_side_5:                             ;Moves the string location of side 5 into r0
        ldr r5, ptr_to_side_5
        MOV r0, r5
        B exit_side
set_side_6:                             ;Moves the string location of side 6 into r0
        ldr r5, ptr_to_side_6
        MOV r0, r5
        B exit_side

exit_side:                              ;Exit the decide_side subroutine
        POP {r4-r12, lr}
        MOV pc, lr


same_color_check:
        PUSH {r4-r12, lr}

        CMP r0, #1
        BEQ check_color_grid_1          ;If the new player location will be grid 1, branch to check_color_grid_1
        CMP r0, #2
        BEQ check_color_grid_2          ;If the new player location will be grid 2, branch to check_color_grid_2
        CMP r0, #3
        BEQ check_color_grid_3          ;If the new player location will be grid 3, branch to check_color_grid_3
        CMP r0, #4
        BEQ check_color_grid_4          ;If the new player location will be grid 4, branch to check_color_grid_4
        CMP r0, #5
        BEQ check_color_grid_5          ;If the new player location will be grid 5, branch to check_color_grid_5
        CMP r0, #6
        BEQ check_color_grid_6          ;If the new player location will be grid 6, branch to check_color_grid_6
        CMP r0, #7
        BEQ check_color_grid_7          ;If the new player location will be grid 7, branch to check_color_grid_7
        CMP r0, #8
        BEQ check_color_grid_8          ;If the new player location will be grid 8, branch to check_color_grid_8
        CMP r0, #9
        BEQ check_color_grid_9          ;If the new player location will be grid 9, branch to check_color_grid_9

check_color_grid_1:      ;Loads the color code of grid 1 into r0, then returning from the subroutine
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #46]
        B exit_check_color

check_color_grid_2:     ;Loads the color code of grid 2 into r0, then returning from the subroutine
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #60]
        B exit_check_color
check_color_grid_3:     ;Loads the color code of grid 3 into r0, then returning from the subroutine
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #74]
        B exit_check_color
check_color_grid_4:     ;Loads the color code of grid 4 into r0, then returning from the subroutine
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #316]
        B exit_check_color
check_color_grid_5:     ;Loads the color code of grid 5 into r0, then returning from the subroutine
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #330]
        B exit_check_color
check_color_grid_6:     ;Loads the color code of grid 6 into r0, then returning from the subroutine
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #344]
        B exit_check_color
check_color_grid_7:     ;Loads the color code of grid 7 into r0, then returning from the subroutine
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #586]
        B exit_check_color
check_color_grid_8:     ;Loads the color code of grid 8 into r0, then returning from the subroutine
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #600]
        B exit_check_color
check_color_grid_9:     ;Loads the color code of grid 9 into r0, then returning from the subroutine
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #614]
        B exit_check_color

exit_check_color:
        POP {r4-r12, lr}
        MOV pc, lr



swap_color:
        PUSH {r4-r12, lr}
        ldr r5, ptr_to_mydata   ;Load the pointer to mydata into r5
	LDRB r0, [r5, #1]       ;Load the byte that determines which grid the player is located into r0

        CMP r0, #1
        BEQ swap_grid_1         ;If the player is located in grid 1, branch to swap_grid_1
        CMP r0, #2
        BEQ swap_grid_2         ;If the player is located in grid 2, branch to swap_grid_2
        CMP r0, #3
        BEQ swap_grid_3         ;If the player is located in grid 3, branch to swap_grid_3
        CMP r0, #4
        BEQ swap_grid_4         ;If the player is located in grid 4, branch to swap_grid_4
        CMP r0, #5
        BEQ swap_grid_5         ;If the player is located in grid 5, branch to swap_grid_5
        CMP r0, #6
        BEQ swap_grid_6         ;If the player is located in grid 6, branch to swap_grid_6
        CMP r0, #7
        BEQ swap_grid_7         ;If the player is located in grid 7, branch to swap_grid_7
        CMP r0, #8
        BEQ swap_grid_8         ;If the player is located in grid 8, branch to swap_grid_8
        CMP r0, #9
        BEQ swap_grid_9         ;If the player is located in grid 9, branch to swap_grid_9

swap_grid_1:    ;Swaps the colors of the player and grid 1
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #46]
        ldr r6, ptr_to_player
        LDRB r1, [r6]
        STRB r1, [r5, #46]
        STRB r1, [r5, #91]
        STRB r1, [r5, #136]
        STRB r1, [r5, #181]
        STRB r1, [r5, #226]
        STRB r0, [r6]
        B exit_swap_color

swap_grid_2:    ;Swaps the colors of the player and grid 2
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #60]
        ldr r6, ptr_to_player
        LDRB r1, [r6]
        STRB r1, [r5, #60]
        STRB r1, [r5, #105]
        STRB r1, [r5, #150]
        STRB r1, [r5, #195]
        STRB r1, [r5, #240]
        STRB r0, [r6]
        B exit_swap_color
swap_grid_3:    ;Swaps the colors of the player and grid 3
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #74]
        ldr r6, ptr_to_player
        LDRB r1, [r6]
        STRB r1, [r5, #74]
        STRB r1, [r5, #119]
        STRB r1, [r5, #164]
        STRB r1, [r5, #209]
        STRB r1, [r5, #254]
        STRB r0, [r6]
        B exit_swap_color
swap_grid_4:    ;Swaps the colors of the player and grid 4
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #316]
        ldr r6, ptr_to_player
        LDRB r1, [r6]
        STRB r1, [r5, #316]
        STRB r1, [r5, #361]
        STRB r1, [r5, #406]
        STRB r1, [r5, #451]
        STRB r1, [r5, #496]
        STRB r0, [r6]
        B exit_swap_color
swap_grid_5:    ;Swaps the colors of the player and grid 5
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #330]
        ldr r6, ptr_to_player
        LDRB r1, [r6]
        STRB r1, [r5, #330]
        STRB r1, [r5, #375]
        STRB r1, [r5, #420]
        STRB r1, [r5, #465]
        STRB r1, [r5, #510]
        STRB r0, [r6]
        B exit_swap_color
swap_grid_6:    ;Swaps the colors of the player and grid 6
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #344]
        ldr r6, ptr_to_player
        LDRB r1, [r6]
        STRB r1, [r5, #344]
        STRB r1, [r5, #389]
        STRB r1, [r5, #434]
        STRB r1, [r5, #479]
        STRB r1, [r5, #524]
        STRB r0, [r6]
        B exit_swap_color
swap_grid_7:    ;Swaps the colors of the player and grid 7
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #586]
        ldr r6, ptr_to_player
        LDRB r1, [r6]
        STRB r1, [r5, #586]
        STRB r1, [r5, #631]
        STRB r1, [r5, #676]
        STRB r1, [r5, #721]
        STRB r1, [r5, #766]
        STRB r0, [r6]
        B exit_swap_color
swap_grid_8:    ;Swaps the colors of the player and grid 8
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #600]
        ldr r6, ptr_to_player
        LDRB r1, [r6]
        STRB r1, [r5, #600]
        STRB r1, [r5, #645]
        STRB r1, [r5, #690]
        STRB r1, [r5, #735]
        STRB r1, [r5, #780]
        STRB r0, [r6]
        B exit_swap_color
swap_grid_9:    ;Swaps the colors of the player and grid 9
        BL decide_side
        MOV r5, r0
        LDRB r0, [r5, #614]
        ldr r6, ptr_to_player
        LDRB r1, [r6]
        STRB r1, [r5, #614]
        STRB r1, [r5, #659]
        STRB r1, [r5, #704]
        STRB r1, [r5, #749]
        STRB r1, [r5, #794]
        STRB r0, [r6]
        B exit_swap_color

exit_swap_color:        ;Exits the subroutine, swap_color
        POP {r4-r12, lr}
        MOV pc, lr





UART0_Handler:
         PUSH {r4-r11, lr}                   ; Preserve registers to adhe                                                                                                                                                                                                re to the AAPCS

        ; Your code for your UART handler goes here.
        ; Remember to preserver registers r4-r11 by pushing then popping
        ; them to & from the stack at the beginning & end of the handler

        MOV r4, #0xC000
        MOVT r4, #0x4000         ;Move to UART base address
        LDRB r5, [r4, #0x044]    ;Load byte at offset 0x044
        ORR r5, r5, #16          ;ORR r5 with 16 to clear the UART interrupt
        STRB r5, [r4, #0x044]    ;Store r5 back into r4 at offset 0x044
        ldr r5, ptr_to_mydata    ;Load r5 with a pointer to mydata
        BL simple_read_character  ;Call simple_read_character

        LDRB r6, [r5, #6]    ;Store a 1 into the byte that communicates to the game
		CMP r6, #1
		BEQ game_paused_restart

        CMP r0, #0xD              ;Check if the character entered is "Enter"
        BEQ start_game            ;Branch to start_game
        CMP r0, #0x77
        BEQ w_press             ;Check if the user pressed the "w" key to move u                                                                                                                                 p
        CMP r0, #0x73
        BEQ s_press             ;Check if the user pressed the "s" key to move d                                                                                                                                 own
        CMP r0, #0x61
        BEQ a_press             ;Check if the uesr pressed the "a" key to move r                                                                                                                                 ight
        CMP r0, #0x64
        BEQ d_press             ;Check if the user pressed the "d" key to move l
		CMP r0, #0x20
		BEQ space_press
		B return_from_UART_HANDLER

game_paused_restart
		CMP r0, #0x72
		BEQ restart_game
                CMP r0, #0x71
		BEQ end_game
		B return_from_UART_HANDLER

start_game:
		ldr r4, ptr_to_mydata
        STRB r0, [r4, #2]       ;Store the "Enter" character into r4 at offset 2
        B return_from_UART_HANDLER      ;Return from the UART Handler

w_press:    ;Handles the user pressing the "w" key

        LDR r6, [r5, #28]       ;Load the move count into r6
        ADD r6, r6, #1          ;Increment the move count
        STR r6, [r5, #28]       ;Store the new move count into r5 at offset 4
        MOV r0, r6
        BL int2string_move_counter           ;Call int2string with the new move count
        ldr r5, ptr_to_move_cursor      ;Move the cursor to the move counter pos                                                                                                                                 ition
        MOV r0, r5
        BL output_string        ;Move the cursor
        ldr r5, ptr_to_move_holder      ;Move the cursor to the string holding t                                                                                                                                 he updated move count
        MOV r0, r5
        BL output_string        ;Update the move count

        ldr r5, ptr_to_mydata
        LDRB r6, [r5, #1]
        SUB r6, r6, #3
        CMP r6, #0
        BLE call_rotate_side_up

        CMP r0, #1
        BEQ return_from_UART_HANDLER


        ldr r5, ptr_to_mydata   ;Load the pointer to mydata in r5
        LDRB r6, [r5, #1]       ;Load the byte that determines the grid that the player is on into r6
        SUB r6, r6, #3          ;Subtract r6 by 3
        MOV r0, r6              ;Move r6 into r0
        BL same_color_check     ;Branch to same_color_check
        ldr r7, ptr_to_player
        LDRB r8, [r7]           ;Load the color code of the player
        CMP r8, r0              ;Compare the color of the player to the grid's color
        BEQ return_from_UART_HANDLER  ;If they are the same, exit the handler
        MOV r9, r6              ;Else, move the new grid location into r9



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
        ldr r6, ptr_to_move_up  ;Move the cursor up to the next grid
        MOV r0, r6
        BL output_string

        ldr r6, ptr_to_player
        MOV r0, r6
        BL output_player_string ;Reprint the player to the new grid

        ldr r5, ptr_to_mydata
        STRB r9, [r5, #1]       ;Store the new grid location into r9 at offset 1
        B return_from_UART_HANDLER ;Return from the UART Handler

call_rotate_side_up:
		BL rotate_side_up
		B return_from_UART_HANDLER

s_press:    ;Handles the user pressing the "s" key

        LDR r6, [r5, #28]       ;Load the move count into r6
        ADD r6, r6, #1          ;Increment the move count
        STR r6, [r5, #28]       ;Store the new move count into r5 at offset 4
        MOV r0, r6
        BL int2string_move_counter           ;Call int2string with the new move count
        ldr r5, ptr_to_move_cursor      ;Move the cursor to the move counter pos                                                                                                                                 ition
        MOV r0, r5
        BL output_string        ;Move the cursor
        ldr r5, ptr_to_move_holder      ;Move the cursor to the string holding t                                                                                                                                 he updated move count
        MOV r0, r5
        BL output_string        ;Update the move count

        ldr r5, ptr_to_mydata
        LDRB r6, [r5, #1]
        ADD r6, r6, #3
        CMP r6, #9
        BGT call_rotate_side_down

        CMP r0, #1
        BEQ return_from_UART_HANDLER

        ldr r5, ptr_to_mydata   ;Load the pointer to mydata into r5
        LDRB r6, [r5, #1]       ;Load the byte that determines the current grid the player is located into r6
        ADD r6, r6, #3          ;Add 3 to r6
        MOV r0, r6              ;Move r6 into r0
        BL same_color_check     ;Call the subroutine, same_color_check
        ldr r7, ptr_to_player
        LDRB r8, [r7]           ;Load the color code of the player
        CMP r8, r0              ;Compare the color of the player with the color of the grid
        BEQ return_from_UART_HANDLER    ;If they are the same, return from the Handler
        MOV r9, r6              ;Else, store r6 into r9





        ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Reset the cursor to the top left position
        BL decide_side          ;Call the subroutine that decides which side the player is currently on
        BL output_game_board_string  ;Reprint the game board
        ldr r6, ptr_to_time
        MOV r0, r6
        BL output_string        ;Reprint the time counter
        ldr r6, ptr_to_moves
        MOV r0, r6
        BL output_string        ;Reprint the move counter
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
        BL decide_grid          ;Check which grid the player is currently located at
        ldr r6, ptr_to_move_down
        MOV r0, r6
        BL output_string        ;Move the cursor down one grid

        ldr r6, ptr_to_player
        MOV r0, r6
        BL output_player_string ;Reprint the player at the new grid


        ldr r5, ptr_to_mydata
        STRB r9, [r5, #1]       ;Store the new grid location into r5 at offset 1
        B return_from_UART_HANDLER ;Return from the UART Handler

call_rotate_side_down:
		BL rotate_side_down
		B return_from_UART_HANDLER

a_press:    ;Handles the user pressing the "a" key

        LDR r6, [r5, #28]       ;Load the move count into r6
        ADD r6, r6, #1          ;Increment the move count
        STR r6, [r5, #28]       ;Store the new move count into r5 at offset 4
        MOV r0, r6
        BL int2string_move_counter           ;Call int2string with the new move count
        ldr r5, ptr_to_move_cursor      ;Move the cursor to the move counter pos                                                                                                                                 ition
        MOV r0, r5
        BL output_string        ;Move the cursor
        ldr r5, ptr_to_move_holder      ;Move the cursor to the string holding t                                                                                                                                 he updated move count
        MOV r0, r5
        BL output_string        ;Update the move count

        ldr r5, ptr_to_mydata
        LDRB r6, [r5, #1]
        SUB r6, r6, #1
        CMP r6, #0
        BEQ call_rotate_side_left
        CMP r6, #3
        BEQ call_rotate_side_left
        CMP r6, #6
        BEQ call_rotate_side_left

        CMP r0, #1
        BEQ return_from_UART_HANDLER


        ldr r5, ptr_to_mydata   ;Load the pointer to mydata into r5
        LDRB r6, [r5, #1]       ;Load the byte that determines the players grid location into r6
        SUB r6, r6, #1          ;Subtract 1 from r6
        MOV r0, r6              ;Move r6 into r0
        BL same_color_check     ;Call same_color_check to check if the new grid location is the same color as the player
        ldr r7, ptr_to_player
        LDRB r8, [r7]           ;Load the color code of the player into r8
        CMP r8, r0              ;Compare the color of the player with the color of the grid
        BEQ return_from_UART_HANDLER  ;If they are the same color, return from the UART_Handler
        MOV r9, r6              ;Move r6 into r9



        ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Reset the cursor to the top left of the display
        BL decide_side          ;Call decide_side
        BL output_game_board_string  ;Reprint the game board
        ldr r6, ptr_to_time
        MOV r0, r6
        BL output_string        ;Reprint the time cursor
        ldr r6, ptr_to_moves
        MOV r0, r6
        BL output_string        ;Reprint the move cursor
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
        BL decide_grid          ;Call decide_grid
        ldr r6, ptr_to_move_left
        MOV r0, r6
        BL output_string        ;Move the cursor one grid to the left

        ldr r6, ptr_to_player
        MOV r0, r6
        BL output_player_string ;Reprint the player at the new location

                ldr r5, ptr_to_mydata
        STRB r9, [r5, #1]       ;Store the new grid location into r5 at offset 1
        B return_from_UART_HANDLER ;Return from the UART Handler

call_rotate_side_left:
		BL rotate_side_left
		B return_from_UART_HANDLER

d_press:    ;Handles the user pressing the "d" key

        LDR r6, [r5, #28]       ;Load the move count into r6
        ADD r6, r6, #1          ;Increment the move count
        STR r6, [r5, #28]       ;Store the new move count into r5 at offset 4
        MOV r0, r6
        BL int2string_move_counter           ;Call int2string with the new move count
        ldr r5, ptr_to_move_cursor      ;Move the cursor to the move counter pos                                                                                                                                 ition
        MOV r0, r5
        BL output_string        ;Move the cursor
        ldr r5, ptr_to_move_holder      ;Move the cursor to the string holding t                                                                                                                                 he updated move count
        MOV r0, r5
        BL output_string        ;Update the move count




        ldr r5, ptr_to_mydata
        LDRB r6, [r5, #1]
        ADD r6, r6, #1
        CMP r6, #4
        BEQ call_rotate_side_right
        CMP r6, #7
        BEQ call_rotate_side_right
        CMP r6, #10
        BEQ call_rotate_side_right



        ldr r5, ptr_to_mydata   ;Load the pointer to mydata into r5
        LDRB r6, [r5, #1]       ;Load the byte that determines the grid location of the player into r6
        ADD r6, r6, #1          ;Add 1 to r6
        MOV r0, r6              ;Move r6 into r0
        BL same_color_check     ;Call same_color_check
        ldr r7, ptr_to_player
        LDRB r8, [r7]           ;Load the color code of the player
        CMP r8, r0              ;Check if the color of the player and the color of the grid are the same
        BEQ return_from_UART_HANDLER    ;if they are, return from the Handler
        MOV r9, r6      ;Else, store r6 into r9



        ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string        ;Erase the display
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string        ;Reset the cursor position to the top left of the display
        BL decide_side          ;Call decide_side
        BL output_game_board_string     ;Reprint the game board
        ldr r6, ptr_to_time
        MOV r0, r6
        BL output_string        ;Reprint the time counter
        ldr r6, ptr_to_moves
        MOV r0, r6
        BL output_string        ;Reprint the moves counter
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
        BL decide_grid          ;Call decide_grid
        ldr r6, ptr_to_move_right
        MOV r0, r6
        BL output_string        ;Move the cursor to the right one gird

        ldr r6, ptr_to_player
        MOV r0, r6
        BL output_player_string ;Reprint the player to the new location

        ldr r5, ptr_to_mydata
        STRB r9, [r5, #1]       ;Store r9 into r5 at offset 1
        B return_from_UART_HANDLER ;Return from the UART Handler

call_rotate_side_right:
		BL rotate_side_right
		B return_from_UART_HANDLER

space_press:
		BL swap_color
	ldr r6, ptr_to_erase_display
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_reset_cursor
        MOV r0, r6
        BL output_string
        BL decide_side
        BL output_game_board_string
        ldr r6, ptr_to_time
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_moves
        MOV r0, r6
        BL output_string
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

        BL decide_grid
        ldr r6, ptr_to_player
        MOV r0, r6
        BL output_player_string
        BL Checking_for_completed
        BL check_finished
        B return_from_UART_HANDLER
restart_game:
		ldr r5, ptr_to_mydata
		MOV r6, #1
		STRB r6, [r5]
		B return_from_UART_HANDLER

end_game:
        ldr r5, ptr_to_mydata
		MOV r6, #4
		STRB r6, [r5]

return_from_UART_HANDLER:
        POP {r4-r11, lr}
        BX lr           ; Return



        POP {r4-r11, lr}
        BX lr           ; Return


Switch_Handler:
                 PUSH {r4-r11, lr}                   ; Preserve registers to adh                                                                                                                                                                                                ere to the AAPCS

        ; Your code for your UART handler goes here.
        ; Remember to preserver registers r4-r11 by pushing then popping
        ; them to & from the stack at the beginning & end of the handler
    MOV r4, #0x5000
    MOVT r4, #0x4002            ;Move to the PortF address
    LDRB r5, [r4, #0x41C]       ;Load byte into r5 from r4 at offset 0x41C
    ORR r5, r5, #16             ;ORR r5 with 16 to clear the GPIO interrupt
    STRB r5, [r4, #0x41C]       ;Store r5 back into r4 at offset 0x41C
    ldr r5, ptr_to_mydata

    LDRB r6, [r5, #25]
    CMP r6, #1
    BEQ return_from_GPIO_HANDLER

    LDRB r6, [r5, #6]           ;Load byte into r6 that determines if that game                                                                                                                                                                                                 has already been                                                                                                                                  paused
    CMP r6, #1
    BEQ unpause_game            ;If the game has already been paused, proceed to                                                                                                                                                                                                 unpause_game

pause_game:        ;Handles pausing the game
    MOV r4, #0x0000
    MOVT r4, #0x4003
    LDRB r5, [r4, #0x00C] ;LDRB r5 from r4 at offset 0x00C (Enable/Disable Timer                                                                                                                                                                                                )
    AND r5, r5, #0xFE   ;Disable the timer by writing a 0 to bit 0
    STRB r5, [r4, #0x00C] ;Store r5 back into r4 at offset 0x00C


    ldr r5, ptr_to_mydata
    MOV r6, #1           ;Move 1 into r6
    STRB r6, [r5, #6]    ;Store a 1 into the byte that communicates to the game                                                                                                                                                                                                 that the game has                                                                                                                                  been paused

    ldr r7, ptr_to_pause_game_location
    MOV r0, r7
    BL output_string
    ldr r7, ptr_to_pause_game
    MOV r0, r7
    BL output_string    ;Print string to the user saying that game is paused
    ldr r7, ptr_to_restart_game_location
    MOV r0, r7
    BL output_string
    ldr r7, ptr_to_restart_game_prompt
    MOV r0, r7
    BL output_string
    B return_from_GPIO_HANDLER  ;Return from the GPIO Handler
unpause_game:   ;Handles unpausing the game
    ldr r5, ptr_to_mydata
    MOV r6, #0              ;Move 1 into r6
    STRB r6, [r5, #6]       ;Store a 1 into the byte that communicates to the ga

     ldr r6, ptr_to_erase_display
 	 MOV r0, r6
	 BL output_string        ;Erase the display
     ldr r6, ptr_to_reset_cursor
     MOV r0, r6
     BL output_string        ;Reset the cursor position to the top left of the display
     BL decide_side          ;Call decide_side
     BL output_game_board_string     ;Reprint the game board
     ldr r6, ptr_to_time
     MOV r0, r6
     BL output_string        ;Reprint the time counter
     ldr r6, ptr_to_moves
     MOV r0, r6
     BL output_string        ;Reprint the moves counter
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
     BL decide_grid          ;Call decide_grid
     ldr r6, ptr_to_player
     MOV r0, r6
     BL output_player_string ;Reprint the player to the new location

    MOV r4, #0x0000
    MOVT r4, #0x4003
    LDRB r5, [r4, #0x00C]   ;LDRB r5 from r4 at offset 0x00C (Enable/Disable Tim                                                                                                                                                                                                er)
    ORR r5, r5, #1          ;Enable the timer by writing a 1 to bit 0
    STRB r5, [r4, #0x00C]   ;Store r5 back into r4 at offset 0x00C


return_from_GPIO_HANDLER    ;Returns from the GPIO Handler
    POP {r4-r11, lr}
    BX lr           ; Return

        ; Your code for your UART handler goes here.
        ; Remember to preserver registers r4-r11 by pushing then popping
        ; them to & from the stack at the beginning & end of the handler

Timer2_Handler:
	   PUSH {r4-r12, lr}
	   MOV r4, #0x1000
       MOVT r4, #0x4003
       LDRB r5, [r4, #0x024]   ;CLEARS TIMER INTERRUPT
       ORR r5, r5, #1
       STRB r5, [r4, #0x024]

       ldr r5, ptr_to_mydata

		LDRB r6, [r5, #18]
        CMP r6, #1
        BEQ LED_dance_activate
        CMP r6, #2
        BEQ LED_dance_deactivate
        CMP r6, #3
        BEQ LED_dance_activate_1
        CMP r6, #4
        BEQ LED_dance_deactivate_1
        CMP r6, #5
        BEQ LED_dance_activate_2
        CMP r6, #6
        BEQ LED_dance_deactivate_2
        CMP r6, #7
        BEQ LED_dance_activate_3
        CMP r6, #8
        BEQ LED_dance_deactivate_3

        POP {r4-r12, lr}
	    BX lr

LED_dance_activate:
	;illuminating 4 lights at the same time
	MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    ORR r5, r5, #1          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

    ldr r5, ptr_to_mydata
    MOV r7, #2
    STRB r7, [r5, #18]
    POP {r4-r12, lr}
	BX lr

LED_dance_activate_1:
	;illuminating 4 lights at the same time
	MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    ORR r5, r5, #2          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

    ldr r5, ptr_to_mydata
    MOV r7, #4
    STRB r7, [r5, #18]
    POP {r4-r12, lr}
	BX lr

LED_dance_activate_2:
	;illuminating 4 lights at the same time
	MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    ORR r5, r5, #4          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

    ldr r5, ptr_to_mydata
    MOV r7, #6
    STRB r7, [r5, #18]
    POP {r4-r12, lr}
	BX lr

LED_dance_activate_3:
	;illuminating 4 lights at the same time
	MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    ORR r5, r5, #8          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

    ldr r5, ptr_to_mydata
    MOV r7, #8
    STRB r7, [r5, #18]
    POP {r4-r12, lr}
	BX lr




LED_dance_deactivate:
	;turn off all LEDs
	MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    AND r5, r5, #0xF0          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

    ldr r5, ptr_to_mydata
    MOV r7, #3
    STRB r7, [r5, #18]

	   POP {r4-r12, lr}
	   BX lr

LED_dance_deactivate_1:
	;turn off all LEDs
	MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    AND r5, r5, #0xF0          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

    ldr r5, ptr_to_mydata
    MOV r7, #5
    STRB r7, [r5, #18]

	   POP {r4-r12, lr}
	   BX lr

LED_dance_deactivate_2:
	;turn off all LEDs
	MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    AND r5, r5, #0xF0          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

    ldr r5, ptr_to_mydata
    MOV r7, #7
    STRB r7, [r5, #18]

	   POP {r4-r12, lr}
	   BX lr

LED_dance_deactivate_3:
	;turn off all LEDs
	MOV r4, #0x5000
    MOVT r4, #0x4000        ;Move 0x40005000 into r4
    LDRB r5, [r4, #0x3FC]   ;LDRB from r4 at offset 0x3FC into r5
    AND r5, r5, #0xF0          ;ORR r5 with the contents of r0
    STRB r5, [r4, #0x3FC]   ;STRB r5 into r5 at offset 0x3FC

    ldr r5, ptr_to_mydata
    MOV r7, #1
    STRB r7, [r5, #18]

	   POP {r4-r12, lr}
	   BX lr


Timer_Handler:
        PUSH {r4-r12, lr}
        MOV r4, #0x0000
        MOVT r4, #0x4003
        LDRB r5, [r4, #0x024]   ;CLEARS TIMER INTERRUPT
        ORR r5, r5, #1
        STRB r5, [r4, #0x024]

        ; Your code for your Timer handler goes here.  It is not needed for
        ; Lab #5, but will be used in Lab #6.  It is referenced here because
        ; the interrupt enabled startup code has declared Timer_Handler.
        ; This will allow you to not have to redownload startup code for
        ; Lab #6.  Instead, you can use the same startup code as for Lab #5.
        ; Remember to preserver registers r4-r11 by pushing then popping
        ; them to & from the stack at the beginning & end of the handler.


side_update:
        ldr r5, ptr_to_mydata
        LDR r6, [r5, #32]
        ADD r6, r6, #1
        STR r6, [r5, #32]
        MOV r0, r6
        BL int2string
        ldr r5, ptr_to_timer_cursor
        MOV r0, r5
        BL output_string
        ldr r5, ptr_to_time_holder
        MOV r0, r5
        BL output_string

        ldr r5, ptr_to_mydata
        LDRB r6, [r5, #3]
        CMP r6, #1
        BEQ timer_100
        CMP r6, #2
        BEQ timer_200
        CMP r6, #4
        BEQ timer_300
        CMP r6, #8
        BEQ return_from_TIMER_HANDLER

timer_100:
         LDR r6, [r5, #32]
         CMP r6, #100
         BEQ game_over
         B return_from_TIMER_HANDLER

timer_200:
        LDR r6, [r5, #32]
        CMP r6, #200
        BEQ game_over
        B return_from_TIMER_HANDLER
timer_300:
         LDR r6, [r5, #32]
         CMP r6, #300
         BEQ game_over
         B return_from_TIMER_HANDLER


game_over:
        MOV r6, #3
        STRB r6, [r5]

return_from_TIMER_HANDLER:
        POP {r4-r12, lr}
        BX lr           ; Return


output_game_board_string:       ;Responsible for printing the game board
        PUSH {r4-r12,lr}

        MOV r4, r0                      ;Move string pointer into r1
        MOV r5, #0                      ;Initialize counter into r2
loop_output_board_string:
        LDRB r0, [r4, r5]       ;Load byte from pointer location
        CMP r0, #0x30
        BEQ print_red
        CMP r0, #0x31
        BEQ print_blue
        CMP r0, #0x32
        BEQ print_green
        CMP r0, #0x33
        BEQ print_yellow
        CMP r0, #0x34
        BEQ print_purple
        CMP r0, #0x35
        BEQ print_white
        BL output_character     ;Call output_character
        ADD r5, r5, #1          ;Increment counter
        CMP r0, #0x00           ;Check if r0 is containing NULL character
        BNE loop_output_board_string  ;If it isn't, repeat loop
        POP {r4-r12,lr}   ; Restore registers all registers preserved in the
        mov pc, lr
print_red:
        ldr r6, ptr_to_red
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_revert_color
        MOV r0, r6
        BL output_string
        ADD r5, r5, #13
        B loop_output_board_string
print_blue:
        ldr r6, ptr_to_blue
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_revert_color
        MOV r0, r6
        BL output_string
        ADD r5, r5, #13
        B loop_output_board_string
print_green:
        ldr r6, ptr_to_green
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_revert_color
        MOV r0, r6
        BL output_string
        ADD r5, r5, #13
        B loop_output_board_string
print_yellow:
        ldr r6, ptr_to_yellow
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_revert_color
        MOV r0, r6
        BL output_string
        ADD r5, r5, #13
        B loop_output_board_string
print_purple:
        ldr r6, ptr_to_purple
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_revert_color
        MOV r0, r6
        BL output_string
        ADD r5, r5, #13
        B loop_output_board_string
print_white:
        ldr r6, ptr_to_white
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_revert_color
        MOV r0, r6
        BL output_string
        ADD r5, r5, #13
        B loop_output_board_string



output_player_string:           ;Responsible for printing the player to the game board
        PUSH {r4-r12,lr}

        MOV r4, r0                      ;Move string pointer into r1
        MOV r5, #0                      ;Initialize counter into r2
loop_output_player_string:
        LDRB r0, [r4, r5]       ;Load byte from pointer location
        CMP r0, #0x30
        BEQ print_player_red
        CMP r0, #0x31
        BEQ print_player_blue
        CMP r0, #0x32
        BEQ print_player_green
        CMP r0, #0x33
        BEQ print_player_yellow
        CMP r0, #0x34
        BEQ print_player_purple
        CMP r0, #0x35
        BEQ print_player_white
        BL output_character     ;Call output_character
        ADD r5, r5, #1          ;Increment counter
        CMP r0, #0x00           ;Check if r0 is containing NULL character
        BNE loop_output_player_string  ;If it isn't, repeat loop
        POP {r4-r12,lr}   ; Restore registers all registers preserved in the
        mov pc, lr
print_player_red:
		BL reset_RGB
        ldr r6, ptr_to_player_red
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_revert_color
        MOV r0, r6
        BL output_string
        ADD r5, r5, #1
        MOV r0, #1
        BL illuminate_RGB_LED
        B loop_output_player_string
print_player_blue:
		BL reset_RGB
        ldr r6, ptr_to_player_blue
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_revert_color
        MOV r0, r6
        BL output_string
        ADD r5, r5, #1
        MOV r0, #2
        BL illuminate_RGB_LED
        B loop_output_player_string
print_player_green:
		BL reset_RGB
        ldr r6, ptr_to_player_green
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_revert_color
        MOV r0, r6
        BL output_string
        ADD r5, r5, #1
        MOV r0, #3
        BL illuminate_RGB_LED
        B loop_output_player_string
print_player_yellow:
		BL reset_RGB
        ldr r6, ptr_to_player_yellow
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_revert_color
        MOV r0, r6
        BL output_string
        ADD r5, r5, #1
        MOV r0, #5
        BL illuminate_RGB_LED
        B loop_output_player_string
print_player_purple:
		BL reset_RGB
        ldr r6, ptr_to_player_purple
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_revert_color
        MOV r0, r6
        BL output_string
        ADD r5, r5, #1
        MOV r0, #4
        BL illuminate_RGB_LED
        B loop_output_player_string
print_player_white:
		BL reset_RGB
        ldr r6, ptr_to_player_white
        MOV r0, r6
        BL output_string
        ldr r6, ptr_to_revert_color
        MOV r0, r6
        BL output_string
        ADD r5, r5, #1
        MOV r0, #6
        BL illuminate_RGB_LED
        B loop_output_player_string


simple_read_character:
        PUSH {r4-r12, lr}

    MOV r1, #0xC000
    MOVT r1, #0x4000    ;Move 0x4000C000 into r1
    LDRB r0, [r1]       ;Load a byte from r1 into r0
    POP {r4-r12, lr}
    MOV pc, lr  ; Return
        .end
