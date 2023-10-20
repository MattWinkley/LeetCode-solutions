# Given a singly-linked list, the the value n-node from the end of the list must be removed and the head returned
# Because it works from the end of the list, the easy way to solve is to first count the lenght of the list be iteration
# Next there were several oddities that came to mind like when the list length is 1 or 2
# These were solved outside the while loop in simple if/elif statements
# A while loop was called for lists larger and iterated through each item
# I set a count variable that increments for each iteration in order to track when the Nth node appears
# A special if statement was made for when the Nth element is the last node in the list for simplicity sake and because there is no previous node to link to


# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next


class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:

        # counter variable tracks the length of the list with the while loop by incrementing with each iteration
        counter = 0

        #count tracks iterations in the second while loop, to be compared for when the Nth node from the end of the list appears
        count = 0

        # curr is the calling of the start of the list, the node of the list when called as head
        curr = head

        # this while loop simply iterates through each node and counts the length of the list
        while curr:
            curr = curr.next
            counter +=1

        # reset the curr variable to the start of the list in order to reiterate through
        curr = head

        # These are the oddity situations
        # If the list length is 1 then, when removing the node, None is to be returned
        if counter == 1:
            return None
        # If the list length is 2 then either the first or second node must be removed
        elif counter == 2:
            # This checks for the second node being removed, done by setting the next node to None
            if n == 1:
                curr.next = None
                return head
            # Otherwise the first node is removed by simply setting the head of the list to the second node
            else:
                head = curr.next
                return head

        # This loop is called for lists larger than 2 nodes
        while curr:
            # Count is immediately incremented because all values n are >= 1
            count += 1

            # If n == counter then the first node is the one removed, therefore the head is equal to the second node and returned
            if n == counter:
                head = curr.next
                return head

            # All other solutions fall under this as when count == counter - n it will be the value prior to the one to be removed
            # This makes the removal of the value simple as the next value is set to a variable called nexval and curr.next is redirected to be the node
            #nexval.next, skipping the nexval link. Nexval is set to None 
            elif count == counter - n:
                nexval = curr.next
                curr.next = nexval.next
                nexval = None

            # This else statement just iterated to the next node is none of the previous conditions are met
            else:
                curr = curr.next

        # head is returned as that is the requirement of the technical interview question
        return head
