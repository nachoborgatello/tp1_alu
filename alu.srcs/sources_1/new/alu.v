`timescale 1ns / 1ps

module alu(i_operandoA,i_operandoB,i_operacion,o_resultado);

  parameter tamanioEntrada=4;
  parameter tamanioSalida=4;
  parameter tamanioOperacion=6;


  input wire [tamanioEntrada-1:0] i_operandoA;
  input wire [tamanioEntrada-1:0] i_operandoB;
  input wire [tamanioOperacion-1:0] i_operacion;
  output wire [tamanioSalida-1:0] o_resultado;

  reg [tamanioSalida-1:0] temp;
  
  always @(*) 
  begin
    case(i_operacion)
      6'b100000 : temp = i_operandoA + i_operandoB;
      6'b100010 : temp = i_operandoA - i_operandoB;
      6'b100100 : temp = i_operandoA & i_operandoB;
      6'b100101 : temp = i_operandoA | i_operandoB;
      6'b100110 : temp = i_operandoA ^ i_operandoB;
      6'b000011 : temp = i_operandoA << i_operandoB;
      6'b000010 : temp = i_operandoA >> i_operandoB;
      6'b100111 : temp = ~(i_operandoA | i_operandoB);
      default   : temp = {tamanioSalida{1'b0}};   
    endcase
  end
  
  assign o_resultado = temp;

endmodule
