# Welcome to my solution to NeetCode.io problems
# This program determines if the given string is a valid palindrome
# The palindrome takes alphanumeric values and must rid of non-alphanumeric values
# If a palindrome, return True, if not, return False

class Solution:
    def isPalindrome(self, s: str) -> bool:

        # Assigned the alphanumeric-string to a variable and made it lower case
        final_word = ''.join(ele for ele in s if ele.isalnum()).lower()

        # Made a reversed version of the alphanumeric variable
        reverse = "".join(reversed(final_word))

        # Checked to see if they equaled, if so then it is a palindromic sequence!
        if final_word == reverse:
            return True
        else:
            return False
