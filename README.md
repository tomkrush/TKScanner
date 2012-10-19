An Objective-C library designed to enable regular expression based scanning.

Example Usage
=============
```objc
TKScanner *scanner = [[TKScanner alloc] initWithString:@"This is a string"];

NSString *word = [scanner scan:@"\\w+"]; // Returns @"This"
NSString *nextCharacter = [scanner peek]; // Returns @" "
```