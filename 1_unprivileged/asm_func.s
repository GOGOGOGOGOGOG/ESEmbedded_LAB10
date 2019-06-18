.syntax unified

.global	read_sp
read_sp:
  mov r0,sp
  bx  lr 
.global	read_msp
read_msp:
	mrs r0,MSP
    bx lr

.global	read_psp
read_psp:
	mrs r0,PSP
	bx lr

.global	read_ctrl
read_ctrl:
	MRS r0, CONTROL 
	bx lr 

.global	start_user
start_user:
     mov r2, #0b0011 //把r2變成暫存器
	 ISB
	 MSR psp,r1  // 把psp設成 stack pointer 
     MSR CONTROL, r2  //注意順序 其定義因為是改成unpriviledged 若是把這一行放到前一行 就會出錯
     bx r0 //有無回傳都沒差

.global	sw_priv
sw_priv:
     mov r3,#0b0000 //把r3當作暫存器儲存要改變的bits
     MSR CONTROL, r3 //把unpriviledged 改成 priviledged 
     ISB 
     bx lr 
   
