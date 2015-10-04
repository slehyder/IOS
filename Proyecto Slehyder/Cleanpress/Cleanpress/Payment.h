//
//  Payment.h
//  Cleanpress
//
//  Created by eris ramirez on 8/3/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import "ViewController.h"

@interface Payment : ViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UINavigationItem *topbar;
@property (strong, nonatomic) IBOutlet UIButton *paynow;
@property (strong, nonatomic) IBOutlet UILabel *BagsCounter;
@property (strong, nonatomic) IBOutlet UILabel *bagsprice;
@property (strong, nonatomic) IBOutlet UILabel *subtotal;
@property (strong, nonatomic) IBOutlet UILabel *total;
@property (strong, nonatomic) IBOutlet UILabel *DryCleaningTotal;
@property (strong, nonatomic) IBOutlet UILabel *deliveryfee;

@end
