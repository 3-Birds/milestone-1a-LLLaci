#Write a Python function to find the maximum element in a list of numbers without using the built-in `max()` function.
#If the input list is None or it is empty list, the return value must be None.

# Requirements:
# - Returns greatest element of a list of numbers
# - In case of None input returns None
# - In case of Empty input string, returns None

def get_max(numbers: list):
    if (numbers == None):
        return(None)
    elif (len(numbers) == 0):
        return(None)
    else:
        try:
            greatest_number = numbers[0]
            for n in numbers:
                if n > greatest_number:
                    greatest_number = n
            return(greatest_number)
        except:
            return(None)
