# Given a list of integers in ascending order find the two numbers that add up to a target varaible
# The numbers range from negative to positive and the same index cannot be used twice
# There is only one solution for the adding up to the target variable in each list
# Must be solved to minimize runtime and memory usage
  # Doing this involved cutting down the list and ignoring indexes that will never add up to the target

class Solution:

    # Given the list numbers and target number in the calling of the function.
    def twoSum(self, numbers: List[int], target: int) -> List[int]:

        # Because 0 creates obscure addition instances it is best to work out scenarios that add to zero first
        if target == 0:

            # This checks for two instances of zero in the list. If there are, our work is done and we return those indexes.
            if numbers.count(0) >= 2:
                return [numbers.index(0)+1,numbers.index(0)+2]

            # The only other way to get zero would be a negative number with its corresponding positive number so I use
            # the absolute value function to find a matching pair and return those indexes.
            else:
                for num in numbers:
                    if abs(num) in numbers:
                        return [numbers.index(num)+1, numbers.index(abs(num))+1]



# Because positive and negative numbers have different relationships in the direction they count,
# i decided to separate the two, this also saves on runtime and memory by ignoring larget parts of the list

        # Checks to see if the target is positive
        elif target > 0:

            # For loop iterating through the values of zero up to the target number
            for num1 in range(target + 1):

                # num2 is assigned the target minus the num1 iteration making it a subtraction remainder
                num2 = target - num1

                # With the two parts of the target, it is checked to see if both numbers are in the list.
                # If true, we have a solution!
                if num1 in numbers and num2 in numbers:

                    # Had to add an equal number clause in order to not return the same index ;)
                    if num1 == num2:
                        return [numbers.index(num1) + 1, numbers.index(num2) + 2]
                    else:
                        return [numbers.index(num1)+1, numbers.index(num2)+1]



        # All negative target values will pass through this section of code
        else:

            # The same process is applied here but I chose to rework it to act like the positive target sequence using abs()
            for num1 in range(abs(target) + 1):

                # num2 will always be negative or zero; num1 is really getting subtracted from the target, but rather than write double minus I added.
                num2 = target + num1

                # num1 must be converted to negative to fulfull reconvert it after the abs() above
                if -num1 in numbers and num2 in numbers:

                    # The same final process where equal number clauses cannot return the same index otherwise just return the indexes
                    if -num1 == num2:
                        return [numbers.index(-num1) + 1, numbers.index(-num1)+ 2]
                    else:
                        return [numbers.index(num2)+1, numbers.index(-num1)+1]
