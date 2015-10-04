//
//  CC.h
//  Cleanpress
//
//  Created by eris ramirez on 6/29/15.
//  Copyright © 2015 Eris Ramirez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PTKCard.h"
#import "PTKCardNumber.h"
#import "PTKCardExpiry.h"
#import "PTKCardCVC.h"
#import "PTKAddressZip.h"
#import "PTKUSAddressZip.h"
#import <Parse/Parse.h>
@class PTKTextField;
@interface CC : UIViewController<UITextFieldDelegate>

@property (nonatomic,readonly,getter=isYearValid)BOOL Yearvalid;
@property (nonatomic, readonly) PTKCardNumber *cardNumber;
@property (nonatomic, readonly) PTKCardExpiry *cardExpiry;
@property (nonatomic, readonly) PTKCardCVC *cardCVC;
@property (nonatomic, readonly) PTKAddressZip *addressZip;
@property (strong, nonatomic) IBOutlet PTKTextField *CCnumber;
@property (strong, nonatomic) IBOutlet UINavigationItem *baritem;

@property (strong, nonatomic) IBOutlet PTKTextField *expMonth;
@property (strong, nonatomic) IBOutlet UITextField *expYear;
@property (strong, nonatomic) IBOutlet PTKTextField *cvc;
@property (strong, nonatomic) IBOutlet UITextField *cardzipcode;
@property (strong, nonatomic) IBOutlet UIButton *ContinueButton;
@property (strong, nonatomic) IBOutlet UILabel *Authorized;

@end
