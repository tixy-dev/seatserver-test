<img src="https://tixy-objects.s3.amazonaws.com/media/logos/tixylogo_facebook.jpg" alt="alt text" width="70" height="70">

# seatserver-test
![](https://img.shields.io/github/last-commit/jsjohnstone/seatserver-test)
![](https://img.shields.io/badge/project-seatserver-yellow)
![](https://img.shields.io/badge/version-0.01-lightgrey)

Tixy - OpenAccess SeatServer Test Tool
Version 0.01

## Usage
`t-queue.pl SERVER MAPID TIERID QUANTITY [PRIORITY]`

+ **SERVER** - IP address of seatserver instance
+ **MAPID** - unique map id from database
+ **TIERID** - unique tier id from database
+ **QUANTITY** - quantity of seats requested
+ **PRIORITY** *(optional)* - numeric priority from 1-10. 1 is lowest/normal priority and is the default if not specified.
