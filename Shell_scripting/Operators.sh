#!/bin/bash

# # ******* Arithmetic Operators ********
# + (Addition )       -- 4th priority
# - (substraction)    -- 5th priority (least priority)
# * (multiplication)  -- 1st priority
# / (division)        -- 2nd priority
# % (modules)         -- 3rd priority  == division 2)10(5
#                                                    10
#                                                    --
#                                                     0

X=$(expr 10 / 5)
X=$(expr 10 % 2)
X=$(expr 5 - 3 \* 6 / 2)