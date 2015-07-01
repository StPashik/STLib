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
* `kSTErrorDomain`
* `kSTErrorRegInfoFailedCode`
* `kSTErrorModelIncorrectCode`
* `kSTErrorServerErrorCode`

#####Devices
* `IS_IPAD`
* `IS_IPHONE`
* `IS_RETINA`

#####Screen sizes
* `SCREEN_WIDTH`
* `SCREEN_HEIGHT`
* `SCREEN_MAX_LENGTH`
* `SCREEN_MIN_LENGTH`

#####iOS versions
* `IS_IPHONE_4_OR_LESS`
* `IS_IPHONE_5`
* `IS_IPHONE_6`
* `IS_IPHONE_6_PLUS`

#####String errors
* `kSTLibRegInfoErrorEmptyEmail`
* `kSTLibRegInfoErrorIncorrectEmail`
* `kSTLibRegInfoErrorEmptyPhone`
* `kSTLibRegInfoErrorIncorrectPhone`

#####UIAlertView strings
* `kSTLibAlertViewDefaultTitle`
* `kSTLibAlertViewInternetConnectionErrorString`
* `kSTLibAlertViewLocationNotDeniedErrorString`

#####System version compare
* `SYSTEM_VERSION_EQUAL_TO(v)`
* `SYSTEM_VERSION_GREATER_THAN(v)`
* `SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)`
* `SYSTEM_VERSION_LESS_THAN(v)`
* `SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)`
* `IOS_8_OR_LATER`
* `IOS_7_OR_LATER`

#####Error color
* `kSTLibValidationErrorColor`

#####Time intervals
* `kSTLibTimeIntervalForMinute`
* `kSTLibTimeIntervalForHour`
* `kSTLibTimeIntervalForDay`
* `kSTLibTimeIntervalForFiveDays`
* `kSTLibTimeIntervalForWeek`
* `kSTLibNumberOfDaysInWeek`

####Methods
```obj-c
+ (NSError *)validateEmail:(NSString *)email //validate e-mail address
+ (NSString *)launchImageName //launch image name
+ (NSString *)stringFromTimeInterval:(NSTimeInterval)timeInterval //string from time intrval in format "minuts:second:miliseconds"
+ (NSMutableString *)filteredPhoneStringFromStringWithFilter:(NSString *)string filter:(NSString *)filter //filer string for phone number
```

--
###Components
####STPaintCodeImageView *- IBDesignable*
Display images in the storyboard made in PaintCode. To use, create in storyboard UIView and assign class STPaintKodeImageViev. In to attribute inspector set **StyleKit** class name and **Canvas** name.
>This component work with UIView and image may only show. I recomended use this only for static images in interface.

--
###Extensions
####NSArray+STLib
```obj-c
- (NSArray *)sortedOutletsByOriginY;
- (NSArray *)sortedOutletsByOriginX;
- (NSArray *)sortedOutletsByOriginXWithSuperview;
- (NSArray *)sortedOutletsByTag;
- (NSArray *)mapWithBlock:(id (^)(NSUInteger index, id obj))block;
- (NSDictionary *)groupByBlock:(id(^)(NSUInteger index, id obj))block;
- (BOOL)integerObjectIsExists:(NSInteger)integer;
```
####NSDate+STLib
```obj-c
//Compere methods
- (BOOL)isLaterThanOrEqualTo:(NSDate*)date;
- (BOOL)isEarlierThanOrEqualTo:(NSDate*)date;
- (BOOL)isLaterThan:(NSDate*)date;
- (BOOL)isEarlierThan:(NSDate*)date;
//Clear time in date
- (NSDate *)withOutTime;
//Differrence date with intervals
- (NSInteger)differenceFromDate:(NSDate *)date interval:(NSInteger)interval;
//"today", "tomorrow" localized formating date
- (NSString *)afterDate:(NSDate *)date dateFormat:(NSString *)dateFormat;
//Format date to string
- (NSString *)formattedStringWithFormat:(NSString *)format;
```
####UIColor+STLib
```obj-c
//Color from hex value
+ (UIColor *)colorWithHex:(NSUInteger)hex;
//Color from hex value with alpha
+ (UIColor *)colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha;
//Hex value from color
- (long)hexValue;
```