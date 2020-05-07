onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /DatapathTest/clk
add wave -noupdate -radix decimal /DatapathTest/Reset
add wave -noupdate -radix decimal /DatapathTest/dp/clk
add wave -noupdate -radix decimal /DatapathTest/dp/Reset
add wave -noupdate -radix decimal /DatapathTest/dp/zero
add wave -noupdate -radix decimal /DatapathTest/dp/ALUOp
add wave -noupdate -radix decimal /DatapathTest/dp/jumpSrc
add wave -noupdate -radix decimal /DatapathTest/dp/PCSrc
add wave -noupdate -radix decimal /DatapathTest/dp/RegWrite
add wave -noupdate -radix decimal /DatapathTest/dp/MemWrite
add wave -noupdate -radix decimal /DatapathTest/dp/MemtoReg
add wave -noupdate -radix decimal /DatapathTest/dp/MemRead
add wave -noupdate -radix decimal /DatapathTest/dp/RegDst
add wave -noupdate -radix decimal /DatapathTest/dp/ALUSrc
add wave -noupdate -radix decimal /DatapathTest/dp/pcIn
add wave -noupdate -radix decimal /DatapathTest/dp/pcOut
add wave -noupdate -radix decimal /DatapathTest/dp/pcNext
add wave -noupdate -radix decimal /DatapathTest/dp/branchOffset
add wave -noupdate -radix decimal /DatapathTest/dp/pcNotJump
add wave -noupdate -radix decimal /DatapathTest/dp/pcJump
add wave -noupdate -radix decimal /DatapathTest/dp/inst
add wave -noupdate -radix decimal /DatapathTest/dp/Read1
add wave -noupdate -radix decimal /DatapathTest/dp/Read2
add wave -noupdate -radix decimal /DatapathTest/dp/dataToReg
add wave -noupdate -radix decimal /DatapathTest/dp/branchORaw
add wave -noupdate -radix decimal /DatapathTest/dp/alu2
add wave -noupdate -radix decimal /DatapathTest/dp/ALUResult
add wave -noupdate -radix decimal /DatapathTest/dp/RAMRead
add wave -noupdate -radix decimal /DatapathTest/dp/shift_amount
add wave -noupdate -radix decimal /DatapathTest/dp/Reg1
add wave -noupdate -radix decimal /DatapathTest/dp/Reg2
add wave -noupdate -radix decimal /DatapathTest/dp/WriteRegAdr
add wave -noupdate -radix decimal /DatapathTest/dp/pcBranched
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/A
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/B
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/operation
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/shift_amount
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/C
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/zero
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/sign
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/carry
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/overflow
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/myor
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/myand
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/myxor
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/mynor
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/myadd
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/mysub
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/mymin
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/mydiv
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/mymul
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/mysra
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/mysrl
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/mysll
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/myaddof
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/mysubof
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/mymulof
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/myaddcarry
add wave -noupdate -radix decimal /DatapathTest/dp/ourAlu/myminuscarry
add wave -noupdate -radix decimal /DatapathTest/dp/rf/Reset
add wave -noupdate -radix decimal /DatapathTest/dp/rf/i
add wave -noupdate -radix decimal /DatapathTest/dp/rf/Read1
add wave -noupdate -radix decimal /DatapathTest/dp/rf/Read2
add wave -noupdate -radix decimal /DatapathTest/dp/rf/WriteReg
add wave -noupdate -radix decimal /DatapathTest/dp/rf/WriteData
add wave -noupdate -radix decimal /DatapathTest/dp/rf/RegWrite
add wave -noupdate -radix decimal /DatapathTest/dp/rf/clock
add wave -noupdate -radix decimal /DatapathTest/dp/rf/Data1
add wave -noupdate -radix decimal /DatapathTest/dp/rf/Data2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17195 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 309
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {9550 ns} {21814 ns}
