BOOTSEG = 0x07c0
entry start
start:
	jmpi 	go,BOOTSEG	
go:	mov	ax, cs
	mov	ds, ax
	mov	es, ax
	mov	cx, #20	
	mov 	dx, #0x1004
	mov	bx, #0x000c
	mov	bp, #BootMessage
	mov	ax, #0x1301
	int	0x10		
loop0: jmp loop0
BootMessage:	.ascii	"Hello, OS world!"
	.byte 13,10
.org 510	
	.word 	0xAA55			
