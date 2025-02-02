# Ball and Pipe Control System (PID Kappa Tau Tuning Method & Ziegler-Nichols)
This project was completed as a part of Rowan Univeristy course ECE09321-2 (Kyle Naddio & Dr. Ghulam Rasool).

Team Members: Jason Boucher, James Lynch, Matt Reed, Gus Van Walsen, Ryan Bailey

The project consists of a collection of MATLAB codes to open serial communication with a ball and pipe system. The physical system is made of a vertical cylinder with a ping pong ball controlled by a fan on the bottom and height measured by a time of flight sensor on top. The objective is to balance the ball at a target altitude. 

Initially, the team set out to implement a PID control system with Kappa Tau tuning to specify a desired result. Unfortunately, due to a lack of supporting documentation online, the implementation of Kappa Tau tuning proved unsuccessful. As a result, the team decided to back track to a less particular but more well researched control method: Ziegler-Nichols. This method was chosen because it is the basis of Kappa Tau tuning, and therefore does not have signifigant differentiation in how it operates or is implemented. Nonetheless, below both Kappa-Tau and Ziegler-Nichols are reviewed and their intended function is described (even though Ziegler-Nichols is ultimately the method chosen for this project).

# Kappa Tau Overview
Kappa Tau tuning is a method of tuning a PID (proportional, integral, derivative) control system for desired system output. It is an evolution of the Ziegler-Nichols method (detailed below in a seperate section). Kappa Tau tuning was specifically designed to overcome a few shortcomings of the Ziegler-Nichols method, including a tendancy for high proportional gain and potential for error in systems with a lot of dead time. Though these were not massive concerns for this implementation, it felt pertanent to select a method that was more simple to implement but that came with fewer drawbacks.

Kappa Tau tuning uses a set of tuning rules that have been developed through thorough simulations to find generalized patterns and correlations that can be applied to a number of different systems. The result of these simulations are standardized tables with set values to select from when designing a control system. These systems are characterized by static gain KP, ultimate gain KU, and ultimate period TU. The controller parameters are given as a function of the gain ratio: 𝜅 = 1/(KP x KU). Since the values for Kappa Tau are all based on pre-determined tables with values generated from complex simulation, there is somewhat limited flexibility when it comes to the implementation of this tuning method. The best apparoach is a test and check method, where a set of values is selected and put to the test on the ball and pipe system. Moving down the tables found in Kappa Tau research should yeild the most ideal combinaition.

# Ziegler-Nichols Overview
As briefly mentioned above, due to limited availablity of supporting documentation, Kappa-Tau tuning was not implemented for this control system. Rather, Zielger-Nichols was chosen for control system tuning, due to it's simpilier assembly and abundance of information available online. Ziegler-Nichols is a method of PID tuning that attempts to produce ideal values for the three PID gain parameters (Kp - the controller proportional gain, Ti - the controller's integrator time constant, Td - the controller's derivative time constant). These values are determined using the period Tu of the oscillation frequency at the stability limit, and the gain margin Ku for loop stability. For a PID controller, Ti can be obtained by converting Pcr to a frequency and then multiplying it by two. Similarly, Td can also be obtained by the same method where the frequency is multiplied by 0.125.

# Control Method Theory
The Ziegler-Nichols method consists of three main parameters which allow control of the system response:

Kp: Proportional Gain (increasing this value reduces rise time)  
Ti: Integral Time Constant  
Td: Derivative Time Constant (increasing this value improves stability and reduces overshoot %)  

Depending on whether a control system is implemented with a P, PI, PD, or PID controller, the respective parameters would be included in the transfer function.  
The First step in the Ziegler-Nichols method is to set Kp to the maximum value your system will steadily oscilate at, making the system marginally stable. Because the system is now oscillating, the ultimate period Pcr can be measured. Both the value for Kp used to sustain oscillation and the value measured Pcr can then be used to determine the time constants Ti and Td.

# Usage & Implementation Guide
Located under the "system without PID controller" section is the transfer function for the ball and pipe system. In the section labeled "PID Controlled system" below lies the kcr and the Pcr of the system. The kcr value is the value needed to produce sustained oscillation in the step response of the system. The value labeled as Pcr is the period of these sustained oscillation. Using those values together, the "PID Controlled system" section is able to obtain the Kp, Ti, and Td values. After obtaining these values, uncomment the figure with the step response below and run the section. If the section produces a steady step response the tuning was successful.
