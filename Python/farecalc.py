rates = {
    "ECONOMY": 10,
    "PREMIUM": 18,
    "SUV": 25
}

def calculate_fare(km, vehicle_type, hour):
    base_fare = km * rates[vehicle_type]

    if 17 <= hour <= 20:
        return base_fare * 1.5
    else:
        return base_fare

try:
    km = float(input("Enter distance in km: "))
    vehicle_type = input("Enter vehicle type (Economy/Premium/SUV): ").strip().upper()
    hour = int(input("Enter hour of day (0-23): "))

    if km <= 0:
        print("Invalid distance entered")
    elif hour < 0 or hour > 23:
        print("Invalid hour entered")
    elif vehicle_type not in rates:
        print("Service Not Available")
    else:
        fare = calculate_fare(km, vehicle_type, hour)

        print("\n----- Price Receipt -----")
        print("Distance:", km, "km")
        print("Vehicle Type:", vehicle_type)
        print("Hour:", hour)

        if 17 <= hour <= 20:
            print("Surge Pricing: Applied")
        else:
            print("Surge Pricing: Not Applied")

        print("Final Fare: Rs.", round(fare, 2))

except ValueError:
    print("Invalid input! Please enter numbers correctly.")

