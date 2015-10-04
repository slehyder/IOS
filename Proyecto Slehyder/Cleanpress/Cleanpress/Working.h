//
//  Working.h
//  Pantalla1
//
//  Created by Ana Colmenares on 27/7/15.
//  Copyright (c) 2015 Ana Colmenares. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Working : UIViewController
@property (strong, nonatomic) IBOutlet UIView *windowView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *labelWorking;
@property (weak, nonatomic) IBOutlet UILabel *labelTitulo;
@property (strong, nonatomic) IBOutlet UIView *WindowWorking;
@property (weak, nonatomic) IBOutlet UITextView *textoUno;
@property (weak, nonatomic) IBOutlet UITextView *textoDos;
@property (weak, nonatomic) IBOutlet UITextView *textoTres;
@property (strong, nonatomic) IBOutlet UINavigationItem *topbar;



@end
