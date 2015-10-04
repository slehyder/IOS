//
//  Support.m
//  Cleanpress
//
//  Created by eris ramirez on 7/31/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import "Support.h"

@interface Support ()

@end

@implementation Support


- (void)viewDidLoad
{
    self.topbar.hidesBackButton = YES;
    [self.topbar setLeftItemsSupplementBackButton:YES];
    UIBarButtonItem *gomenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"go_back"] style:UIBarButtonItemStylePlain target:self action:@selector(ToMenu)];
    
    [self.topbar setLeftBarButtonItem:gomenu animated:YES];
    self.topbar.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"go_back"]];
    
    self.lineblue.layer.zPosition = 2;
    if(self.Window.frame.size.height <= 480 ){
        
        //4s
        
        self.scroll.contentSize = CGSizeMake(self.view.frame.size.width, 850);
        
    }else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
        
        
        
        //5 - 5s
        
        self.scroll.contentSize = CGSizeMake(self.view.frame.size.width, 950);
        
        
    }else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
        
        
        //6
        self.scroll.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
#pragma mark - ajuste a cada pantalla
        
    }else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
        
        
        
        //6 plus
        
        self.scroll.contentSize = CGSizeMake(self.view.frame.size.width, 1050);
        
    }
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)twitter:(id)sender{
    //BOOL canOpenURL = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://mentions"]];
    NSURL *url = [NSURL URLWithString:@"twitter://user?screen_name=cleanpressinc"];
    [[UIApplication sharedApplication] openURL:url];
    /*NSURL *url = [NSURL URLWithString:@"https://www.twitter.com"];
    [[UIApplication sharedApplication] openURL:url];*/
    
}

- (IBAction)facebook:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"fb://pages"];
    [[UIApplication sharedApplication] openURL:url];
    /*BOOL canOpenURL = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"ffb://pages/Clean-Press-Inc/1465514210413452?fref=ts"]];
    NSString *url = canOpenURL ? @"fb://pages/Clean-Press-Inc/1465514210413452?fref=ts" : @"fb://pages/Clean-Press-Inc/1465514210413452?fref=ts";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];*/
    /*NSURL *url = [NSURL URLWithString:@"https://www.facebook.com"];
    [[UIApplication sharedApplication] openURL:url];*/
    
}

- (IBAction)llamada:(id)sender {
    NSURL *phoneNumber = [[NSURL alloc] initWithString: @"tel:867-5309"];
    [[UIApplication sharedApplication] openURL: phoneNumber];
    /*UIAlertView *llamada = [[UIAlertView alloc] initWithTitle:@"Contact" message:@"000-000-0000" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [llamada show];*/
}

-(void)ToMenu{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
