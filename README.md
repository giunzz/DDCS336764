# **DDCS336764**

Hi! Welcome to my blog about **FPGA design**.
Dowload ModelSim tool here: [Link](https://drive.google.com/file/d/1DSxM6HUUa3EVzUdVeWLhLVng778VrWoI/view?usp=sharing)

---

## **Chapter 4: FPGA Design Examples**

In this chapter, I showcase my Verilog code and testbenches, along with visualizations in ModelSim for the following designs:

### 1. **Full Adder (4-bit)**
Implemented a 4-bit full adder to perform binary addition with carry propagation.
### 2. **Demux 1 to 8**
**1-to-8 Demux** design to distribute an input signal to one of the 8 output lines based on a 3-bit select input.

### 3. **Mux 8 to 1**
8-to-1 Multiplexer that selects one of 8 inputs based on a 3-bit select input.

### 4. **Decoder 3 to 8 (Enabled = 1)**
3-to-8 Decoder where one of 8 outputs is active based on a 3-bit input and the enable signal is set to 1.

### 5. **Decoder 3 to 8 (Enabled = 0)**
3-to-8 Decoder where the outputs are inactive because the enable signal is set to 0.

**You can view my full report here: [Report (PDF)](https://github.com/giunzz/DDCS336764/blob/main/Chapter%204/Quick%20Question.%20Chapter%2004.pdf)**

---

## **Chapter 5: Sequential Circuits**

In this chapter, I showcase my Verilog code and testbenches, along with simulation results for the following designs:

### 1. D Flip-Flop
Implemented and simulated a D Flip-Flop, demonstrating that the output Q follows the input D on the positive edge of the clock signal.   
### 2. 8-bit Shift Register
Designed and verified an 8-bit shift register using D Flip-Flops, showing the serial shifting of data bits with each clock pulse.   
### 3. 8-bit Synchronous Counter
Developed and simulated an 8-bit synchronous up/down counter utilizing T Flip-Flops, illustrating the counter incrementing on the clock's positive edge when in up-counting mode.   

**You can view my full report here: [Report (PDF)](https://github.com/giunzz/DDCS336764/blob/main/Chapter%205/Quick%20Question.%20Chapter%2005.pdf)**

## **Chapter 6: Synchronous Sequential Circuits**

In this chapter, I showcase my Verilog code and testbenches, along with simulation results for the following designs:

### 1. 8-bit Synchronous Counter

### 2. 8-bit Synchronous Up/Down Counter with UD Control

### 3. 8-bit Serial-In Parallel-Out (SIPO) Shift Register
- Developed and simulated an 8-bit SIPO shift register, with a state table and Verilog code for the module and testbench. 
- Simulation results show the serial input data being shifted in and available at the parallel output.   

### 4. Traffic Light Controller State Machine
- Designed and simulated a state machine model for a traffic light controller with two sets of lights and specified timing for green, yellow, and red states. 

- This includes a state diagram, state table, and Verilog code for the module and testbench, along with simulation results verifying the state transitions and output signals. 


**You can view my full report here: [Report (PDF)](https://github.com/giunzz/DDCS336764/blob/main/Chapter%206/Quick%20Question.%20Chapter%2006.pdf)**

## **Bonus**: Synchronous sequentail circuit - Finite state machine (FSM)
- State machine (I will update)
- Finite state machine (FSM) 1111: [Code](https://github.com/giunzz/DDCS336764/blob/main/Chapter%206/IC_Desgin/SeqDetector.v) , [Testbench](https://github.com/giunzz/DDCS336764/blob/main/Chapter%206/IC_Desgin/TB_SC1111.v)

- Traffic light: [Tutorial](https://github.com/giunzz/DDCS336764/blob/main/Chapter%206/DENGT.md)
