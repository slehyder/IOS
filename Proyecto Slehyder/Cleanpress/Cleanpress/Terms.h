//
//  Terms.h
//  Pantalla1
//
//  Created by Ana Colmenares on 27/7/15.
//  Copyright (c) 2015 Ana Colmenares. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Terms : UIViewController
@property (strong, nonatomic) IBOutlet UIView *windowTerms;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollTerms;
@property (weak, nonatomic) IBOutlet UITextView *textouno;
@property (weak, nonatomic) IBOutlet UITextView *textodos;
@property (weak, nonatomic) IBOutlet UITextView *textotres;
@property (strong, nonatomic) IBOutlet UINavigationItem *topbar;

@end
