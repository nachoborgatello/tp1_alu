# TP1 - ALU en Verilog

## 🧠 Descripción
Trabajo práctico realizado para la materia **Arquitectura de Computadoras**, que consiste en la implementación de una **Unidad Aritmético-Lógica (ALU)** parametrizable en **Verilog**, junto con los módulos **Latch** y **Top** para su integración en FPGA.

El diseño permite realizar operaciones aritméticas y lógicas básicas utilizando interruptores y botones de la placa **Basys3**.

---

## ⚙️ Módulos principales

### 🔹 Módulo ALU
Realiza operaciones entre dos operandos de 4 bits según un código de operación de 6 bits.

Operaciones soportadas:

| Operación | Código | Descripción         |
|:----------:|:-------:|:-------------------|
| ADD | 100000 | Suma |
| SUB | 100010 | Resta |
| AND | 100100 | AND bit a bit |
| OR  | 100101 | OR bit a bit |
| XOR | 100110 | XOR bit a bit |
| SRA | 000011 | Desplazamiento izquierda |
| SRL | 000010 | Desplazamiento derecha |
| NOR | 100111 | NOR bit a bit |

---

### 🔹 Módulo Latch
Registra los valores de entrada (operandos y operación) a partir de los **botones** de la placa:
- **BTN1:** Guarda Operando A  
- **BTN2:** Guarda Operando B  
- **BTN3:** Guarda Código de Operación  
- **BTN4:** Resetea los registros  

Las entradas provienen de los **switches** (`i_sw`) y se actualizan en el flanco positivo del reloj (`i_clk`).

---

### 🔹 Módulo Top
Integra los módulos **Latch** y **ALU**, conectando los botones, interruptores y LEDs de la Basys3.  
Los resultados de la ALU se muestran en los LEDs.

---

## 🧪 Simulación
Las pruebas se realizaron mediante **Testbench** en **Vivado**, verificando todas las operaciones aritméticas y lógicas definidas.
