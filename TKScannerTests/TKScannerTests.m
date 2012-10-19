//
//  TKScannerTests.m
//  TKScannerTests
//
//  Created by Tom Krush on 10/18/12.
//  Copyright (c) 2012 Tom Krush. All rights reserved.
//

#import "TKScannerTests.h"
#import "TKScanner.h"

@implementation TKScannerTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testScan
{
    TKScanner *scanner = [[TKScanner alloc] initWithString:@"This is a string"];
        
    STAssertEquals(0, [scanner pos], @"Position is 0");
    
    STAssertEqualObjects(@"This", [scanner scan:@"\\w+"], @"Token is word");
    STAssertEqualObjects(nil, [scanner scan:@"\\w+"], @"Token is not a word");
    STAssertEqualObjects(@" ", [scanner scan:@" "], @"Token is a space");
    STAssertEqualObjects(@"is", [scanner scan:@"\\w+"], @"Token is a word");    
    STAssertFalse([scanner eos], @"Not end of string");
    STAssertEqualObjects(@" ", [scanner scan:@" "], @"Token is a space");
    STAssertEqualObjects(@"a", [scanner scan:@"\\w+"], @"Token is a word");
    STAssertEqualObjects(@" ", [scanner scan:@" "], @"Token is a space");
    STAssertEqualObjects(@"string", [scanner scan:@"\\w+"], @"Token is a word");
    STAssertTrue([scanner eos], @"End of string");
    STAssertEquals(16, [scanner pos], @"Position is 16");
    
    STAssertEquals(0, [scanner reset], @"Position is 0 again");
    STAssertEqualObjects(@"This", [scanner scan:@"\\w+"], @"Token is word");
    
    STAssertEqualObjects(@" is a string", [scanner rest], @"Rest of string returned");
    STAssertEqualObjects(@" is a string", [scanner peek], @"Peek returned rest of string");
    STAssertEqualObjects(@" i", [scanner peek:2], @"Peek returned part of string");
    STAssertEquals(10, [scanner exists:@"string"], @"Regex does exist in later string");
    
    STAssertEquals(0, [scanner reset], @"Position is 0 again");
    
    STAssertEqualObjects(@"T", [scanner getch], @"Returns next character and adjusts pointer");
    
    STAssertEqualObjects(@"is", [scanner scan_until:@"is"], @"Scan until find word");
    STAssertEquals(1, [scanner skip:@" "], @"Skip space");
    STAssertEquals(11, [scanner skip_until:@"string"], @"Skips to string and returns length");
    
    STAssertEquals(5, [scanner unscan], @"Goes back to previous pointer");
}

@end
