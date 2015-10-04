//
//  Support.h
//  Cleanpress
//
//  Created by eris ramirez on 7/31/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface Support : ViewController
{
    IBOutlet UIButton *llamada;
    
    IBOutlet UIButton *twitter;
    IBOutlet UIButton *facebook;
    IBOutlet UIWebView *web;
}
@property (weak, nonatomic) IBOutlet UILabel *lineblue;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UIView *Window;
@property (strong, nonatomic) IBOutlet UINavigationItem *topbar;
-(IBAction)llamada:(id)sender;
-(IBAction)twitter:(id)sender;
-(IBAction)facebook:(id)sender;
@end
