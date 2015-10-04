//
//  Signup.h
//  Cleanpress
//
//  Created by eris ramirez on 6/15/15.
//  Copyright (c) 2015 Eris Ramirez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Signup : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *EmailSign;
@property (strong, nonatomic) IBOutlet UITextField *ConfirmEmail;
@property (strong, nonatomic) IBOutlet UIButton *CreateAcc;
@property (strong, nonatomic) IBOutlet UITextField *Name;
@property (strong, nonatomic) IBOutlet UITextField *LName;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UITextField *PhoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *termsAndConditionsImg;

@property (strong, nonatomic) IBOutlet UITextField *Pw;
@property (strong, nonatomic) IBOutlet UITextField *CPw;

@end
