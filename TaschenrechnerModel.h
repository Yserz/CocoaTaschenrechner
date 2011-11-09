//
//  TaschenrechnerModel.h
//  Taschenrechner
//
//  Created by MacYser on 24.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
	operator_nothing,
	operator_plus,
	operator_minus,
	operator_multiplication,
	operator_division
} OperatorType;


@interface TaschenrechnerModel : NSObject {
	NSNumber *lastResult;
	OperatorType lastOperator;
	
}
- (void)setNextNumber:(NSNumber *)number;
- (void)setNextOperator:(OperatorType)operatorType;
- (NSNumber *)result;
- (void)clearAll;

@end
