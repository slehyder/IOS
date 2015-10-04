 //
//  about.h
//  Pantalla1
//
//  Created by Ana Colmenares on 23/7/15.
//  Copyright (c) 2015 Ana Colmenares. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface about : UIViewController

@property (strong, nonatomic) IBOutlet UIView *Window;
@property (weak, nonatomic) IBOutlet UINavigationItem *scrolview;
@property (strong, nonatomic) IBOutlet UINavigationItem *topbar;

@property (weak, nonatomic) IBOutlet UIWebView *video;
@property (weak, nonatomic) IBOutlet UIScrollView *scrol;
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UILabel *labelblue;
@property (weak, nonatomic) IBOutlet UIButton *terms;
@property (weak, nonatomic) IBOutlet UIButton *working;
@property (weak, nonatomic) IBOutlet UIButton *tutorials;
@property (weak, nonatomic) IBOutlet UILabel *labeluno;
@property (weak, nonatomic) IBOutlet UILabel *labeldos;
@property (weak, nonatomic) IBOutlet UIButton *arrowTuto;
@property (weak, nonatomic) IBOutlet UIButton *arrowTerms;
@property (weak, nonatomic) IBOutlet UIButton *arrowWorking;
@property (weak, nonatomic) IBOutlet UILabel *blueline;
@property (weak, nonatomic) IBOutlet UILabel *titlename;

@end
