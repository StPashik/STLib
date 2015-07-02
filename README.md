# STLib
Library with helpers and extension. This library is assembled from the different projects and there may be small inaccuracies. The library does not pritenduet on originality, but if it will be useful to someone, that's good.
>I would be grateful for tips and patches on your part

---
###Contents:

* [**Install**](#install)
* [**Main**](#main)
* [**Components**](#components)
* [**Extensions**](#extensions)

--

###Install
Jast drop folder into you project and import STLib.h where you need.

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
//validate e-mail address
+ (NSError *)validateEmail:(NSString *)email
//launch image name
+ (NSString *)launchImageName
//string from time intrval in format "minuts:second:miliseconds"
+ (NSString *)stringFromTimeInterval:(NSTimeInterval)timeInterval
//filer string for phone number
+ (NSMutableString *)filteredPhoneStringFromStringWithFilter:(NSString *)string
                                                      filter:(NSString *)filter
```

---
###Components

####Contents:

* [**STPaintCodeImageView**](#stpaintcodeimageview---ibdesignable)
* [**STRoundFrameButton**](#stroundframebutton---ibdesignable)

--
####STPaintCodeImageView `IBDesignable`
Display images in the storyboard made in PaintCode. To use, create in storyboard UIView and assign class STPaintKodeImageViev. In to attribute inspector set **StyleKit** class name and **Canvas** name.
>This component work with UIView and image may only show. I recomended use this only for static images in interface.

####STRoundFrameButton `IBDesignable`
Rounded button with customize parametrs. All parametrs customize in InterfaceBuilder. All parametrs set only *UIControlStateNormal* button state.
#####Parametrs:
* `borderColor` - border color
* `titleColor` - title color. If *titleColor* is *Default*, title colored like border
* `background` - background color
* `radius` - corner radius
* `border` - border width

---
###Extensions

####Contents:

* [**NSArray+STLib**](#nsarraystlib)
* [**NSDate+STLib**](#nsdatestlib)
* [**NSDateFormatter+STLib**](#nsdateformatterstlib)
* [**NSDictionary+STLib**](#nsdictionarystlib)
* [**NSError+STLib**](#nserrorstlib)
* [**NSIndexPath+STLib**](#nsindexpathstlib)
* [**NSObject+STLib**](#nsobjectstlib)
* [**NSString+STLib**](#nsstringstlib)
* [**NSTimer+STLib**](#nstimerstlib)
* [**UIAlertView+STLib**](#uialertviewstlib)
* [**UIColor+STLib**](#uicolorstlib)
* [**UIImage+STLib**](#uiimagestlib)
* [**UILabel+STLib**](#uilabelstlib)
* [**UITextField+STLib**](#uitextfieldstlib)
* [**RLMObject+STLib**](#rlmobjectstlib)

--

####NSArray+STLib
```obj-c
//Sort Outlets array methods
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
####NSDateFormatter+STLib
```obj-c
//Creates and returns instance with given date format
+ (NSDateFormatter *)dateFormatterWithDateFormat:(NSString *)aDateFormat;
```
####NSDictionary+STLib
```obj-c
//Dictionary object nil by key
- (id)objectNotNullForKey:(id)key;
//Object by integer key
- (id)objectForIntegerKey:(NSInteger)integerKey;
//Num key for integer key
- (NSNumber *)keyForIntegerKey:(NSInteger)integerKey;
```
####NSError+STLib
```obj-c
//Localized server error by response code if description error empty
+ (NSError *)errorWithCode:(NSInteger)code
      localizedDescription:(NSString *)LocalizedDescription;
```
####NSIndexPath+STLib
```obj-c
//Compare with indexPath
- (BOOL)isEqualToIndexPath:(NSIndexPath *)indexPath;
```
####NSObject+STLib
```obj-c
//Perform block after delay
- (void)performBlock:(void (^)(void))block
          afterDelay:(NSTimeInterval)delay;
```
####NSString+STLib
```obj-c
//Check string for empty
- (BOOL)notEmpty;
//Clera spaces in string
- (NSString *)stringByRemovingSpaces;
//Height for string with font and accuracy width
- (CGFloat)heightWithFont:(UIFont *)font
       constrainedToWidth:(CGFloat)width;
//Height for string with font and free width
- (CGFloat)heightWithFont:(UIFont *)font;
//Width for string with font and free height
- (CGFloat)widthWithFont:(UIFont *)font;
//sha1 code
- (NSString *)sha1;
//Delete HTML symbols from string
- (NSString *)stringByStrippingHTML;
//Decode HTML symbols
- (NSString *)stringByDecodedHTMLSymbols;
//Clear phone number
- (NSString *)unformattedPhoneNumber;
```
####NSTimer+STLib
```obj-c
//Timer with block and run tick
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                      block:(void (^)(NSTimer *timer))inBlock
                                    repeats:(BOOL)inRepeats;
//Timer with execution block
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)inTimeInterval
                             block:(void (^)(NSTimer *timer))inBlock
                           repeats:(BOOL)inRepeats;
```
####UIAlertView+STLib
```obj-c
//Init with internet connection localize error
- (id)initInternetConnectionError;
//Init witn location denied error
- (id)initLocationNotDeniedError;
//Init with message
- (id)initWithMessage:(NSString *)message;
//Init with message and title
- (id)initWithTitle:(NSString *)title
            message:(NSString *)message;
//Init with message and title. With delegate
- (id)initQuestionWithTitle:(NSString *)title
                    message:(NSString *)message
                   delegate:(id)delegate;
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
####UIImage+STLib
```obj-c
//Image from color value
+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)size;
//Gradient image from colors value
+ (UIImage *)radialGradientImage:(CGSize)size
                      startColor:(UIColor *)startColor
                        endColor:(UIColor *)endColor;
//Rounded image with color fill and border
+ (UIImage *)roundedImageWithFillColor:(UIColor *)fillColor
                           borderColor:(UIColor *)borderColor
                                  size:(CGSize)size
                                border:(CGFloat)border;
//Colored image with color
- (UIImage *)coloredImageWithColor:(UIColor *)color;
//Tint image with color
- (UIImage *)imageTintedWithColor:(UIColor *)color;
//Tint image with color and fraction
- (UIImage *)imageTintedWithColor:(UIColor *)color
                         fraction:(CGFloat)fraction;
```
####UILabel+STLib
```obj-c
//Invalidate animation with kSTLibValidationErrorColor
- (void)startAnimationOfValidation;
//Invalidate animation with kSTLibValidationErrorColor with limit of repeat
- (void)startAnimationWithLimit:(NSInteger)limit;
```
####UITextField+STLib
```obj-c
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, readonly) BOOL   isValid;

//Set left padding
- (void)setLeftPadding:(int)paddingValue;
//Set right padding
- (void)setRightPadding:(int)paddingValue;
//Validate with animation
- (BOOL)validateWithAnimation;
//Validate with ping-pong animation
- (BOOL)validateWithBackAnimationWithColor:(UIColor *)color;
//Start animation
- (void)startAnimationOfValidation;
```
####RLMObject+STLib
```obj-c
//Get RLMObject by primaryKey.
//If object in realm not found, return \b nil.
+ (instancetype)objectByPrimaryKey:(id)primaryKey;
```
