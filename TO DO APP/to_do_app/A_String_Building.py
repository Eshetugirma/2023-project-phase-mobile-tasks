from collections import Counter 
from collections import defaultdict
from bisect import bisect_left,bisect_right
from math import lcm
def testcase(): return int(input())
def maps(): return map(int, input().split())
def lists(): return list(map(str, input().split()))
def sorts(): return sorted(map(int, input().split()))
def solve():
   s = lists()
   start = 0
   count = 0
   print(s)
   for i in range(len(s)):
      if s[start] == s[i]:
         count += 1
      else:
         if count < 2:
            print("NO")
            return 
         else:
            start = i
            count = 1
   print("YES")


T = testcase()
for ___ in range(T):
   solve()