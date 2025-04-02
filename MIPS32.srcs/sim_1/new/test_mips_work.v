`timescale 1ns / 1ps
module test_mips32;
reg clk1, clk2;

  integer k;

  pipe_mips32 mips(clk1, clk2);

  initial begin
    clk1 = 0;
    clk2 = 0;

    // Slower clock for debugging
    repeat (20) begin
      #10 clk1 = ~clk1;
      #10 clk2 = ~clk2;
    end
  end
initial
    begin
        for(k=0; k<31; k=k+1) 
            mips.r_bank[k]=k;
        mips.mem[0] = 32'h28010078;                   //ADDI R1,R0,10
        mips.mem[1] = 32'h0c631800;                   //ADDI R2,R0,20
        mips.mem[2] = 32'h20220000;                   //ADDI R3,R0,25
        mips.mem[3] = 32'h0c631800;                   //OR R7,R7,R7
        mips.mem[4] = 32'h2842002d;                   //OR R7,R7,R7
        mips.mem[5] = 32'h0c631800;                   //ADDI R4,R1,R2
        mips.mem[6] = 32'h24220001;                   //OR R7,R7,R7
        mips.mem[7] = 32'hfc000000;                   //ADDI R5,R4,R3
        //mips.mem[8] = 32'h;                   HLT
        mips.mem[120] = 85;
        mips.HALTED = 0;
        mips.PC = 0;
        mips.TAKEN_BRANCH = 0;
        
        #500
        $display ("mem[120]: %4d \nmem[121]: %4d", mips.mem[120], mips.mem[121]);
        //for (k=0; k<6; k=k+1) $display ("R%1d - %2d", k, mips.r_bank[k]);
    end
initial begin
    $dumpfile ("mips.vcd");
    $dumpvars(0, test_mips32);
    #600 $finish;
end
endmodule
