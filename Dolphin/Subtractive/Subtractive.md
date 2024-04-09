Subtractive
---
Only use this if you have performance issues.
The original shader uses pixel value multiplication, this uses substraction.
(It might be faster, haven't actually profiled it and the main issue is that there are 2 divissions instead of 1).