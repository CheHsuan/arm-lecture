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
	push {r4, r5, r6, lr}
	@r4 = -1 (previous)
	@mov r4 , #0xFFFFFFFF
	mvn r4, #0x0
	@r5 = 1 (result)
	mov r5 , #1
	@r6 = 0 (sum)
	mov r6, #0
	@loop, compare r0 with #0
	add r0 , r0, #1
	subs r0, r0, #1
	bge .Loop
	mov r0, r5
	
	pop {r4, r5,r6, pc}		@EPILOG

	@ END CODE MODIFICATION
.Loop:
	add r6, r4, r5 @sum = result+previous	
	mov r4, r5 @previous = result
	mov r5, r6 @result = sum
	subs r0, r0, #1
	bge .Loop
	mov r0, r5
	pop {r4, r5, r6, pc}	

	.size fibonacci, .-fibonacci
	.end
