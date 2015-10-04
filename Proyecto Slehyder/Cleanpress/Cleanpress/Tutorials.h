//
//  Tutorials.h
//  Pantalla1
//
//  Created by Ana Colmenares on 27/7/15.
//  Copyright (c) 2015 Ana Colmenares. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tutorials : UIViewController
@property (strong, nonatomic) IBOutlet UIView *windowtutorials;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollTutorials;
@property (weak, nonatomic) IBOutlet UITextView *textuno;
@property (weak, nonatomic) IBOutlet UITextView *textdos;
@property (weak, nonatomic) IBOutlet UITextView *texttres;
@property (strong, nonatomic) IBOutlet UINavigationItem *topbar;

@end
