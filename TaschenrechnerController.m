//
//  TaschenrechnerController.m
//  Taschenrechner
//
//  Created by MacYser on 24.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TaschenrechnerController.h"


@implementation TaschenrechnerController

- (id)init{
	[super init];
	model = [[TaschenrechnerModel alloc] init];
	return self;
}
- (void)dealloc {
	[model release];
	[super dealloc];
}

- (IBAction)pushClear:(NSButton *)sender {
    [digitDisplay setStringValue:@"0"];
}

- (IBAction)pushClearAll:(NSButton *)sender {
    [digitDisplay setStringValue:@"0"];
	//Reset calculation
	[model clearAll];
}

- (IBAction)pushComma:(NSButton *)sender {
    NSString *oldString = [digitDisplay stringValue];
	//Searching for "," in string
	NSRange range = [oldString rangeOfString:@","];

	if (range.location == NSNotFound) {
		NSString *newString = [NSString stringWithFormat:@"%@,",oldString];
		[digitDisplay setStringValue:newString];
	}
	clearDisplay = NO;
	
	
}

- (IBAction)pushDigit:(NSButton *)sender {
	
    int newValue = [sender tag];
	NSString *oldString = [digitDisplay stringValue];
	if ([oldString isEqualToString:@"0"]) {
		oldString=@"";
	}
	if (clearDisplay) {
		oldString=@"";
	}
	NSString *newString = [NSString stringWithFormat:@"%@%i",oldString,newValue];
	[digitDisplay setStringValue:newString];
	clearDisplay = NO;
}

- (IBAction)pushDivision:(NSButton *)sender {
    double doubleValue = [digitDisplay doubleValue];
    NSNumber *displayValue =  [[NSNumber alloc] initWithDouble:doubleValue];
	[model setNextNumber:displayValue];
	[displayValue release];
	[model setNextOperator:operator_division];
	
	NSNumber *result = [model result];
	[digitDisplay setDoubleValue:[result doubleValue]];
	clearDisplay = YES;
}

- (IBAction)pushEqual:(NSButton *)sender {
	double doubleValue = [digitDisplay doubleValue];
    NSNumber *displayValue =  [[NSNumber alloc] initWithDouble:doubleValue];
	[model setNextNumber:displayValue];
	[displayValue release];
	[model setNextOperator:operator_nothing];
	
	NSNumber *result = [model result];
	[digitDisplay setDoubleValue:[result doubleValue]];
	clearDisplay = YES;
	
}

- (IBAction)pushMinus:(NSButton *)sender {
    double doubleValue = [digitDisplay doubleValue];
    NSNumber *displayValue =  [[NSNumber alloc] initWithDouble:doubleValue];
	[model setNextNumber:displayValue];
	[displayValue release];
	[model setNextOperator:operator_minus];
	
	NSNumber *result = [model result];
	[digitDisplay setDoubleValue:[result doubleValue]];
	clearDisplay = YES;
}

- (IBAction)pushMultiplication:(NSButton *)sender {
    double doubleValue = [digitDisplay doubleValue];
    NSNumber *displayValue =  [[NSNumber alloc] initWithDouble:doubleValue];
	[model setNextNumber:displayValue];
	[displayValue release];
	[model setNextOperator:operator_multiplication];
	
	NSNumber *result = [model result];
	[digitDisplay setDoubleValue:[result doubleValue]];
	clearDisplay = YES;
}

- (IBAction)pushPlus:(NSButton *)sender {
	double doubleValue = [digitDisplay doubleValue];
    NSNumber *displayValue =  [[NSNumber alloc] initWithDouble:doubleValue];
	[model setNextNumber:displayValue];
	[displayValue release];
	[model setNextOperator:operator_plus];
	
	NSNumber *result = [model result];
	[digitDisplay setDoubleValue:[result doubleValue]];
	clearDisplay = YES;
}
- (IBAction)pushPlusMinus:(NSButton *)sender{
	double doubleValue = [digitDisplay doubleValue];
	if (doubleValue<0.0) {
		NSString *oldString = [digitDisplay stringValue];
		NSString *newString = [oldString substringFromIndex:1];
		[digitDisplay setStringValue:newString];
	}else if (doubleValue > 0.0) {
		NSString *oldString = [digitDisplay stringValue];
		NSString *newString = [NSString stringWithFormat:@"-%@",oldString];
		[digitDisplay setStringValue:newString];
	} 

	
}
@end
