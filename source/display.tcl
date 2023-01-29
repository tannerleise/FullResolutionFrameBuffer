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
# DMA Controller Operation
#--------------------------------------------
# We are going to do an inital load of the system before the loop
#Initial load seems to be working properly

#Clearing the status register
master_write_32 $mpath 0x10000000 0
#Setting the read register
master_write_32 $mpath 0x10000004 0x00000000
#Setting the write register
master_write_32 $mpath 0x10000008 0x20000000
#Setting the length register 
master_write_32 $mpath 0x1000000C 1228800
#We want to write the go bit here 0b1000 or 0x8
master_write_32 $mpath 0x10000018 0x0000029c



while {true} {
    set status [master_read_32 $mpath 0x10000000 1]
    set done [expr ($status & 0x1)]
    if {$done == 1} {
        master_write_32 $mpath 0x10000000 0
        master_write_32 $mpath 0x10000004 0x00000000
        master_write_32 $mpath 0x1000000C 1228800
        master_write_32 $mpath 0x10000018 0x0000029c
    }
}




# master_write_32 $mpath 0x10000008 0x00000000
# set z [master_read_32 $mpath 0x10000000 10]
# puts "We are writing to address $z"

# master_write_32 $mpath 0x10000000 0x00000000


 close_service master $mpath