//
//  TaschenrechnerModel.m
//  Taschenrechner
//
//  Created by MacYser on 24.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TaschenrechnerModel.h"


@implementation TaschenrechnerModel

- (id)init{
	[super init];
	lastResult = [[NSNumber alloc]initWithDouble:0.0];
	lastOperator = operator_nothing;
	return self;
}
- (void)dealloc {
	[lastResult release];
	[super dealloc];
}
- (void)clearAll{
	[lastResult release];
	lastResult = [[NSNumber alloc]initWithDouble:0.0];
	lastOperator = operator_nothing;
	
}
- (void)setNextNumber:(NSNumber *)number{
	double previousResult = [lastResult doubleValue];
	double actualNumber = [number doubleValue];
	double newResult = 0.0;
	switch (lastOperator) {
		case operator_plus:
			newResult = previousResult + actualNumber;
			break;
		case operator_minus:
			newResult = previousResult - actualNumber;
			break;
		case operator_multiplication:
			newResult = previousResult * actualNumber;
			break;
		case operator_division:
			newResult = previousResult / actualNumber;
			break;
		default:
			newResult = actualNumber;
			break;
	}
	[lastResult release];
	lastResult = [[NSNumber alloc]initWithDouble:newResult];
}
- (void)setNextOperator:(OperatorType)operatorType{
	lastOperator = operatorType; 
}
- (NSNumber *)result{
	return lastResult;
	
}


@end
