<img src="https://tixy-objects.s3.amazonaws.com/media/logos/tixylogo_facebook.jpg" alt="alt text" width="70" height="70">

# seatserver-test
Tixy - OpenAccess SeatServer Test Tool

Version 0.01

## Usage
`t-queue.pl SERVER MAPID TIERID QUANTITY [PRIORITY]`

+ **SERVER** - IP address of seatserver instance
+ **MAPID** - unique map id from database
+ **TIERID** - unique tier id from database
+ **QUANTITY** - quantity of seats requested
+ **PRIORITY** *(optional)* - numeric priority from 1-10. 1 is lowest/normal priority and is the default if not specified.
