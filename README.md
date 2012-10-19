An Objective-C library designed to enable regular expression based scanning.

Example Usage
=============
```objc
TKScanner *scanner = [[TKScanner alloc] initWithString:@"This is a string"];

[scanner pos];  			// Scanner position is 0
[scanner scan:@"\\w+"]; 	// Returns @"This"
[scanner scan:@"\\w+"]; 	// Returns nil
[scanner scan:@" "]; 		// Returns @" "
[scanner scan:@"\\w+"]; 	// Returns @"is"
[scanner scan:@" "]; 		// Returns @" "
[scanner eos]; 				// Returns NO
[scanner scan:@"a"]; 		// Returns @"a"
[scanner scan:@" "]; 		// Returns @" "
[scanner scan:@"string"]; 	// Returns @"a"
[scanner pos];				// Scanner position is 16
[scanner reset];			// Resets scanner to position 0

[scanner exists:@"string"]  // Pattern exists somewhere in string
[scanner getch];			// Returns next character and adjusts pointer @"T"
[scanner scan_util:@"is"]	// Scan until pattern is found
[scanner unscan]			// Moves pointer back to previous pointer

[scanner peek]; 			// returns @" "

```