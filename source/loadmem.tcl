set master_path [lindex [get_service_paths master] 0]
set mpath [claim_service master $master_path ""]

# Locate JTAG path
set jpath [lindex [get_service_paths jtag_debug] 0]

# Reset system
jtag_debug_reset_system $jpath
puts "System reset......"

# Test clock is running and reset is high
set clk [jtag_debug_sense_clock $jpath]
if {$clk == 1} {
puts "Clocking running properly."
} else {
puts "Clocking appears to not be running."
}
set rst [jtag_debug_sample_reset $jpath]
puts "Reset level is $rst (should be 1)."


# Hopefully telling the dma what to write to
# ------------------------------------------
#The size of the length register is 640 x 480 x 4

#--------------------------------------------
#Loading the SDRAM
#--------------------------------------------
# So not surper sure if this is gonna work but we gonna take a stab at it

for {set i 0} {$i < 1228800} {incr i 4} {
    if {$i < 1228800/3} {
        master_write_32 $mpath $i 0x000000FF
    } elseif {$i < 2457600/3} {
        master_write_32 $mpath $i 0x0000FF00  
    } else {
        master_write_32 $mpath $i 0x00FF0000
    }

}
# for {set i 0} {$i < 1228800} {incr i 4} {
#     master_write_32 $mpath $i 0x000000FF
# }


 close_service master $mpath