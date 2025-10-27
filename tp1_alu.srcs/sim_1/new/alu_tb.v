`timescale 1ns / 1ps

module alu_tb;

    reg  [3:0] operandoA;
    reg  [3:0] operandoB;
    reg  [5:0] operacion;
    wire [3:0] resultado;

    // Instancia de la ALU
    alu DUT (
        .i_operandoA(operandoA),
        .i_operandoB(operandoB),
        .i_operacion(operacion),
        .o_resultado(resultado)
    );

    initial begin
        // Inicialización
        operandoA = 4'b0101; // 5
        operandoB = 4'b0011; // 3

        // Pruebas de operaciones
        operacion = 6'b100000; #50; // ADD
        operacion = 6'b100010; #50; // SUB
        operacion = 6'b100100; #50; // AND
        operacion = 6'b100101; #50; // OR
        operacion = 6'b100110; #50; // XOR
        operacion = 6'b000011; #50; // SLL
        operacion = 6'b000010; #50; // SRL
        operacion = 6'b100111; #50; // NOR

        // Terminar simulación
        #10 $finish;
    end

    // Monitoreo en consola
    initial begin
        $monitor("t=%0t | A=%b | B=%b | op=%b | R=%b",
                 $time, operandoA, operandoB, operacion, resultado);
    end

endmodule
