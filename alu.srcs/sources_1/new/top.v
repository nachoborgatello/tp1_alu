`timescale 1ns / 1ps
module top(
    //Boton del centro para reset. Boton de arriba para el codigo de operacion. Boton de la izquierda para el operando A. Boton de la derecha para el operando B 
    input wire i_boton1, i_boton2, i_boton3, i_boton4,      // Botones
    input wire [5:0] i_switches,                            // Interruptores
    input wire i_clk,                                     // Señal de reloj
   //input wire i_reset,                                     // Señal de reinicio asincrónico (activo en bajo)
    output wire [3:0] o_alu_output                         // Salida de la ALU
);
  
     wire [3:0] o_operandoA;                          // Registro para operandos A
     wire [3:0] o_operandoB;                          // Registro para operandos B
     wire [5:0] o_codigoOperacion;                    // Registro para el código de operación
  
    // Instancia el módulo de control de registros
    latch instanciaLatch (
        .i_btn1(i_boton1),
        .i_btn2(i_boton2),
        .i_btn3(i_boton3),
        .i_btn4(i_boton4),
        .i_sw(i_switches),
        .i_clk(i_clk),
        .o_opA(o_operandoA),
        .o_opB(o_operandoB),
        .o_opcode(o_codigoOperacion)
    );

    // Instancia el módulo de la ALU
    alu instanciaALU (
        .i_operandoA(o_operandoA),
        .i_operandoB(o_operandoB),
        .i_operacion(o_codigoOperacion),
        .o_resultado(o_alu_output)
    );
    
    
endmodule
