#!/bin/sh
echo "Charleston, SC;`export TZ='US/Eastern';date +'%-l:%M %p';unset TZ`"
echo "Fort Worth, TX;`export TZ='US/Central';date +'%-l:%M %p';unset TZ`"
echo "San Diego;`export TZ='America/Los_Angeles';date +'%-l:%M %p';unset TZ`"
echo "Mountain;`export TZ='US/Mountain';date +'%-l:%M %p';unset TZ`"


#echo "London;`export TZ='Europe/London';date +'%-l:%M %p';unset TZ`"
#echo "Paris;`export TZ='Europe/Paris';date +'%-l:%M %p';unset TZ`"
#echo "Moscow;`export TZ='Europe/Moscow';date +'%-l:%M %p';unset TZ`"
#echo "India;`export TZ='Asia/Kolkata';date +'%-l:%M %p';unset TZ`"
# echo "Shanghai;`export TZ='Asia/Shanghai';date +'%-l:%M %p';unset TZ`"