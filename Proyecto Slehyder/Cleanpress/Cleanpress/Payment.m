//
//  Payment.m
//  Cleanpress
//
//  Created by eris ramirez on 8/3/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import "Payment.h"
#import <Parse/Parse.h>
@interface Payment ()

@end
float bags,lbprice,totalpricebags,fee;
@implementation Payment

- (void)viewDidLoad {
    [super viewDidLoad];
    PFQuery *order = [PFQuery queryWithClassName:@"Order"];
    [order whereKey:@"username" equalTo:[PFUser currentUser][@"username"]];
    [order orderByAscending:@"createdAt"];
    [order getFirstObjectInBackgroundWithBlock:^(PFObject *result,NSError *error){
        if (!error) {
            if ([result[@"Wash_Fold"]  isEqual: @YES]) {
                bags = [result[@"W_F_Bags"] floatValue];
                float cant = 18.0;
                self.BagsCounter.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"red_circle"]];
                self.BagsCounter.layer.cornerRadius = 10.0f;
                self.BagsCounter.layer.masksToBounds = YES;
                
                PFQuery *lbs = [PFQuery queryWithClassName:@"Prices"];
                [lbs whereKey:@"Piece_Code" equalTo:@(0)];
                [lbs getFirstObjectInBackgroundWithBlock:^(PFObject *res,NSError *err){
                    if (!err) {
                        lbprice = [res[@"Price"] floatValue];
                        totalpricebags = lbprice * bags;
                        self.subtotal.text = [NSString stringWithFormat:@"$%.2f",totalpricebags];
                        PFQuery *delifee = [PFQuery queryWithClassName:@"Prices"];
                        [delifee whereKey:@"Piece_Code" equalTo:@(1000)];
                        [delifee getFirstObjectInBackgroundWithBlock:^(PFObject *resultfee,NSError *errorfee){
                            if (!errorfee) {
                                
                                if (totalpricebags >=25.00) {
                                    fee= 0;
                                    self.deliveryfee.text = @"$0";
                                self.total.text = [NSString stringWithFormat:@"$%.2f",(totalpricebags)];
                                }else{
                                    fee = [resultfee[@"Price"]floatValue];
                                        self.deliveryfee.text =[NSString stringWithFormat:@"$%.2f",fee];
                                        self.total.text = [NSString stringWithFormat:@"$%.2f",(totalpricebags+fee)];
                                    }
                                
                            }
                        }];
                        self.bagsprice.text = [NSString stringWithFormat:@"$%.2f",totalpricebags];
                    }
                }];
                
                if (bags >= 10) {
                    self.BagsCounter.text = [NSString stringWithFormat:@"%@",result[@"W_F_Bags"]];
                }else{
                    self.BagsCounter.text = [NSString stringWithFormat:@"%@",result[@"W_F_Bags"]];
                    self.BagsCounter.font =[UIFont systemFontOfSize:cant];
                }
                
            }
            
        }
    }];
   
    if(self.view.frame.size.height <= 480 ){
     self.scroll.contentSize = CGSizeMake(self.scroll.frame.size.width, 480);
     }else if (self.view.frame.size.height > 480 && self.view.frame.size.height <= 568 ){
     self.paynow.frame = CGRectMake(0, 465, self.paynow.frame.size.width, self.paynow.frame.size.height);
     }else if (self.view.frame.size.height > 568 && self.view.frame.size.height <= 667){
     self.paynow.frame = CGRectMake(0, 563, self.paynow.frame.size.width, self.paynow.frame.size.height);
     }else if (self.view.frame.size.height > 667 && self.view.frame.size.height <= 736){
         self.paynow.frame = CGRectMake(0, 632, self.paynow.frame.size.width, self.paynow.frame.size.height);
     }
    
    self.topbar.hidesBackButton = YES;
    [self.topbar setLeftItemsSupplementBackButton:YES];
    UIBarButtonItem *gomenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"go_back"] style:UIBarButtonItemStylePlain target:self action:@selector(ToMenu)];
    
    [self.topbar setLeftBarButtonItem:gomenu animated:YES];
    self.topbar.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"go_back"]];
    // Do any additional setup after loading the view.
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ToMenu{
    [self.navigationController popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
