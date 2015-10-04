//
//  Login.h
//  Cleanpress
//
//  Created by eris ramirez on 6/15/15.
//  Copyright (c) 2015 Eris Ramirez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *EmailLog;

@property (strong, nonatomic) IBOutlet UITextField *PwLog;
@property (strong, nonatomic) UIWindow *window;
@end
