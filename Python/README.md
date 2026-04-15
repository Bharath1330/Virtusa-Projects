# FareCalc Travel Optimizer

This is a simple Python project developed for a ride fare estimation use case.

## Problem Statement
The program calculates the final ride fare based on:
- distance in kilometers
- vehicle type
- hour of the day

It also applies surge pricing during peak hours (17-20 which is 5pm- 8pm).

## Vehicle Rates
- Economy - Rs. 10 per km
- Premium - Rs. 18 per km
- SUV - Rs. 25 per km

## Surge Pricing Rule
If the travel time is between 17 and 20 hours (5 PM to 8 PM), a 1.5x surge multiplier is applied.

## Features
- Uses dictionary mapping for vehicle rates
- Uses a function `calculate_fare(km, vehicle_type, hour)`
- Handles invalid vehicle type input
- Handles invalid numeric input using exception handling
- Prints a formatted price receipt

## How to Run
1. Open file using python. 
2. Enter the required inputs.
   
## Sample Input
- Distance: 10
- Vehicle Type: SUV
- Hour: 18

## Sample Output
```text
----- Price Receipt -----
Distance: 10.0 km
Vehicle Type: SUV
Hour: 18
Surge Pricing: Applied
Final Fare: Rs. 375.0
```

## Author
Suram Bharath Kumar
