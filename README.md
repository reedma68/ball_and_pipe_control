# Ball and Pipe Control System (PID Kappa Tau Tuning Method & Ziegler-Nichols)
The project consists of a collection of MATLAB codes to open serial communication with a ball and pipe system. The physical system is made of a vertical cylinder with a ping pong ball controlled by a fan on the bottom and height measured by a time of flight sensor on top. The objective is to balance the ball at a target altitude. 

Initially, the team set out to implement a PID control system with Kappa Tau tuning to specify a desired result. Unfortunately, due to a lack of supporting documentation online, the implementation of Kappa Tau tuning proved unsuccessful. As a result, the team decided to back track to a less particular but more well researched control method: Ziegler-Nichols. This method was chosen because it is the basis of Kappa Tau tuning, and therefore does not have signifigant differentiation in how it operates or is implemented. Nonetheless, below both Kappa-Tau and Ziegler-Nichols are reviewed and their intended function is described (even though Ziegler-Nichols is ultimately the method chosen for this project).

# Kappa Tau Overview
Kappa Tau tuning is a method of tuning a PID (proportional, integral, derivative) control system for desired system output. It is an evolution of the Ziegler-Nichols method (detailed below in a seperate section). Kappa Tau tuning was specifically designed to overcome a few shortcomings of the Ziegler-Nichols method, including a tendancy for high proportional gain and potential for error in systems with a lot of dead time. Though these were not massive concerns for this implementation, it felt pertanent to select a method that was more simple to implement but that came with fewer drawbacks.

Kappa Tau tuning uses a set of tuning rules that have been developed through thorough simulations to find generalized patterns and correlations that can be applied to a number of different systems. The result of these simulations are standardized tables with set values to select from when designing a control system. These systems are characterized by static gain KP, ultimate gain KU, and ultimate period TU. The controller parameters are given as a function of the gain ratio: 𝜅 = 1/(KP x KU). Since the values for Kappa Tau are all based on pre-determined tables with values generated from complex simulation, there is somewhat limited flexibility when it comes to the implementation of this tuning method. The best apparoach is a test and check method, where a set of values is selected and put to the test

# Ziegler-Nichols Overview

# Control Method Theory


# Usage & Implementation Guide

