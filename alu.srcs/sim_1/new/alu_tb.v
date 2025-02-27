`timescale 1ns / 1ps

module alu_tb();

 reg [3:0] operandoA;
 reg [3:0] operandoB;
 reg [5:0] operacion;
 wire [3:0] resultado;
 
 alu DUT (
 .i_operandoA(operandoA),
 .i_operandoB(operandoB),
 .i_operacion(operacion),
 .o_resultado(resultado));
 
 initial begin
 
 operandoA=4'b0101;
 operandoB=4'b0011;
 operacion=6'b100000;  //suma
#10 operacion=6'b100010;  //resta
#10 operacion=6'b100100;  //and
#10 operacion=6'b100101;  //or
#10 operacion=6'b100110;  //xor
#10 operacion=6'b000011;  //sra
#10 operacion=6'b000010;  //srl
#10 operacion=6'b100111;  //nor
 
 end
endmodule
