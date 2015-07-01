# STLib
Library with helpers and extension. This library is assembled from the different projects and there may be small inaccuracies. The library does not pritenduet on originality, but if it will be useful to someone, that's good.
>I would be grateful for tips and patches on your part

###Install
Jast drop folder into you project.

--
###Main
####STLib
It contains all the constants needed for the library and work with the interface.
#####Error codes
`kSTErrorDomain`
`kSTErrorRegInfoFailedCode`
`kSTErrorModelIncorrectCode`
`kSTErrorServerErrorCode`
#####Devices
`IS_IPAD`
`IS_IPHONE`
`IS_RETINA`
#####Screen sizes
`SCREEN_WIDTH`
`SCREEN_HEIGHT`
`SCREEN_MAX_LENGTH`
`SCREEN_MIN_LENGTH`
#####iOS versions
`IS_IPHONE_4_OR_LESS`
`IS_IPHONE_5`
`IS_IPHONE_6`
`IS_IPHONE_6_PLUS`
#####String errors
`kSTLibRegInfoErrorEmptyEmail`
`kSTLibRegInfoErrorIncorrectEmail`
`kSTLibRegInfoErrorEmptyPhone`
`kSTLibRegInfoErrorIncorrectPhone`
#####UIAlertView strings
`kSTLibAlertViewDefaultTitle`
`kSTLibAlertViewInternetConnectionErrorString`
`kSTLibAlertViewLocationNotDeniedErrorString`
#####System version compare
`SYSTEM_VERSION_EQUAL_TO(v)`
`SYSTEM_VERSION_GREATER_THAN(v)`
`SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)`
`SYSTEM_VERSION_LESS_THAN(v)`
`SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)`
`IOS_8_OR_LATER`
`IOS_7_OR_LATER`
#####Error color
`kSTLibValidationErrorColor`
#####Time intervals
`kSTLibTimeIntervalForMinute`
`kSTLibTimeIntervalForHour`
`kSTLibTimeIntervalForDay`
`kSTLibTimeIntervalForFiveDays`
`kSTLibTimeIntervalForWeek`
`kSTLibNumberOfDaysInWeek`

#####Methods
`+ (NSError *)validateEmail:(NSString *)email` - validate e-mail address

`+ (NSString *)launchImageName` - launch image name

`+ (NSString *)stringFromTimeInterval:(NSTimeInterval)timeInterval` - string from time intrval in format "minuts:second:miliseconds"

`+ (NSMutableString *)filteredPhoneStringFromStringWithFilter:(NSString *)string filter:(NSString *)filter` - filer string for phone number