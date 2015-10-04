//
//  Prices.h
//  Cleanpress
//
//  Created by Slehyder Martinez on 8/6/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewCellPrices.h"
@interface Prices : UIViewController
{

    NSMutableArray *consult;

}


@property (strong, nonatomic) IBOutlet UIView *Window;
@property (weak, nonatomic) IBOutlet UINavigationItem *topbar;

@property (weak, nonatomic) IBOutlet UITableView *Tableview;

@end
