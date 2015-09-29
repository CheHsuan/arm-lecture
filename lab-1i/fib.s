	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r4, r5, r6, r7, lr}
	@r4 = -1 (previous)
	mov r4 , #0xFFFFFFFF
	@r5 = 1 (result)
	mov r5 , #1
	@r6 = 0 (i)
	mov r6, #0
	@r7 = 0 (sum)
	mov r7, #0
	@loop, compare r6 with r0
	cmp r6, r0
	ble .Loop
	mov r0, r5
	
	pop {r4, r5,r6, r7, pc}		@EPILOG

	@ END CODE MODIFICATION
.Loop:
	add r6, r6, #1
	add r7, r4, r5	
	mov r4, r5
	mov r5, r7
	cmp r6, r0
	ble .Loop
	mov r0, r5
	pop {r4, r5, r6,r7, pc}	

	.size fibonacci, .-fibonacci
	.end
