# Import the sys module to get the command-line arguments
import sys

# Import the json module to encode the result as a JSON string
import json

def multiply_by_2(num):
    # Multiply the number by 2
    result = num * 2

    # Return the result as a JSON string
    return json.dumps(result)

# Get the number to pass to the function from the command-line arguments
num = int(sys.argv[1])

# Call the function and print the result as a JSON string
print(multiply_by_2(num))
