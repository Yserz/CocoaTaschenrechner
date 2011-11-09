//
//  TaschenrechnerController.h
//  Taschenrechner
//
//  Created by MacYser on 24.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaschenrechnerModel.h"


@interface TaschenrechnerController : NSObject {
    IBOutlet NSTextField *digitDisplay;
	TaschenrechnerModel *model;
	BOOL clearDisplay;
}
- (IBAction)pushClear:(NSButton *)sender;
- (IBAction)pushClearAll:(NSButton *)sender;
- (IBAction)pushComma:(NSButton *)sender;
- (IBAction)pushDigit:(NSButton *)sender;
- (IBAction)pushDivision:(NSButton *)sender;
- (IBAction)pushEqual:(NSButton *)sender;
- (IBAction)pushMinus:(NSButton *)sender;
- (IBAction)pushMultiplication:(NSButton *)sender;
- (IBAction)pushPlus:(NSButton *)sender;
- (IBAction)pushPlusMinus:(NSButton *)sender;
@end
