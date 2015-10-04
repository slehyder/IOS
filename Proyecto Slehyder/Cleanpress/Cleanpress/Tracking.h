//
//  Tracking.h
//  Cleanpress
//
//  Created by Slehyder Martinez on 9/7/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tracking : UIViewController
{

    float progess;
    float proges1;
    float proges2;
    NSTimer *timer;
    NSTimer *timer1;
    NSTimer *timer2;
    NSString *pickup;
    NSString *drycleaning;

}

@property (strong, nonatomic) UIWindow *windo;
@property (strong, nonatomic) IBOutlet UIView *Window;
@property (weak, nonatomic) IBOutlet UIImageView *PhotoTracking;
@property (weak, nonatomic) IBOutlet UILabel *NameTracking;
@property (weak, nonatomic) IBOutlet UIProgressView *PickupProgess;
@property (weak, nonatomic) IBOutlet UIImageView *PickupImage;
@property (weak, nonatomic) IBOutlet UITextField *PickupLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *DryCleaningProgress;
@property (weak, nonatomic) IBOutlet UIImageView *DryCleaningImage;
@property (weak, nonatomic) IBOutlet UITextField *DryCleaningLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *DeliveryProgress;
@property (weak, nonatomic) IBOutlet UIImageView *DeliveryImage;
@property (weak, nonatomic) IBOutlet UITextField *DeliveryLabel;
@property (weak, nonatomic) IBOutlet UIButton *CancelPickup;
@property (weak, nonatomic) IBOutlet UIScrollView *Scroll;
@property (weak, nonatomic) IBOutlet UILabel *labelDownTrack;
@property (weak, nonatomic) IBOutlet UILabel *LineHorizontal;
@property (weak, nonatomic) IBOutlet UILabel *LineVertical;
@property (weak, nonatomic) IBOutlet UIImageView *timeOne;
@property (weak, nonatomic) IBOutlet UIImageView *timeTwo;
@property (weak, nonatomic) IBOutlet UILabel *LabelPickupTime;
@property (weak, nonatomic) IBOutlet UILabel *labelDeliveryTime;
@property (weak, nonatomic) IBOutlet UILabel *labelWeekdayPickup;
@property (weak, nonatomic) IBOutlet UILabel *labelDatePickup;
@property (weak, nonatomic) IBOutlet UILabel *labelTimePickup;
@property (weak, nonatomic) IBOutlet UILabel *labelAddressPickup;
@property (weak, nonatomic) IBOutlet UILabel *labelWeekdayDelivery;
@property (weak, nonatomic) IBOutlet UILabel *labelDateDelivery;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeDelivery;
@property (weak, nonatomic) IBOutlet UILabel *labelAddressDelivery;
@property (strong, nonatomic) IBOutlet UINavigationItem *topbar;


@property (weak, nonatomic) IBOutlet UIImageView *checkballPickup;
@property (weak, nonatomic) IBOutlet UIImageView *checkballCleaning;
@property (weak, nonatomic) IBOutlet UIImageView *checkballDelivery;

@property (weak, nonatomic) IBOutlet UIButton *btnFeedback;
@end
