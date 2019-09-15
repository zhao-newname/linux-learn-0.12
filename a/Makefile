CC	:= as86
CFLAGS	:= -0 -a -m 

LD	:= ld86
LDFLAGS	:= -0 -s -m 

DD	:= dd
QEMU	:= qemu-system-i386



boot.img: boot.bin
	$(DD) bs=32 if=./$< of=./$@ skip=1

boot.bin: boot.o
	$(LD) $(LDFLAGS) -o $@ $<

boot.o:
	$(CC) $(CFLAGS) -o $@ *.s

TERMINAL := xfce4-terminal 
GDB	:= gdb

qemu:
	$(QEMU) -parallel stdio -hda ./boot.img -serial null

debug:
	$(QEMU) -S -s -parallel stdio -hda ./boot.img -serial null &
	sleep 2
	$(TERMINAL) -e "$(GDB) -q -x ./gdbinit"

clean:
	rm -rf boot.o boot.bin boot.img

