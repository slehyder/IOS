//
//  Initial.m
//  Cleanpress
//
//  Created by Slehyder Martinez on 8/11/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import "Initial.h"

@interface Initial ()

@end

@implementation Initial

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.Pagecontrol.layer.zPosition = 2;
  //[self.Pagecontrol setPageIndicatorTintColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"red_circle"]]];
    //self.Pagecontrol.currentPageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"red_circle"]];
    
    self.initialScreenScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 4, self.view.frame.size.height/2);
    [self.initialScreenScrollView setShowsHorizontalScrollIndicator:NO];
    
    for (int i = 0; i < 4; i++)
    {
        if (i==0) {
        
                UILabel *screenLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.initialScreenScrollView.frame.size.width * i), self.initialScreenScrollView.frame.size.height / 4, self.initialScreenScrollView.frame.size.width, self.initialScreenScrollView.frame.size.height / 3)];
            UILabel *text1title=[[UILabel alloc] initWithFrame:CGRectMake((self.initialScreenScrollView.frame.size.width * i), self.initialScreenScrollView.frame.size.height / 4, self.initialScreenScrollView.frame.size.width, self.initialScreenScrollView.frame.size.height / 4)];
            
            
            text1title.text=[NSString stringWithFormat:@"Freshen your Wardrobe!\n"];
            text1title.textColor=[UIColor whiteColor];
            [text1title setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:22]];
            text1title.textAlignment = NSTextAlignmentCenter;
            [self.initialScreenScrollView addSubview:text1title];
            // Set UILabel text and configure
            screenLabel.numberOfLines = 0;
            screenLabel.text = [NSString stringWithFormat:@"\nCleanpress will give your clothes\na second chance to surprise you."];
            screenLabel.textColor = [UIColor whiteColor];
            [screenLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18]];
            screenLabel.textAlignment = NSTextAlignmentCenter;
            
            
            // Add UILabel to scroll view
            [self.initialScreenScrollView addSubview:screenLabel];
            
          
           
       
            
        }else if(i==1){
            UILabel *screenLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.initialScreenScrollView.frame.size.width * i), self.initialScreenScrollView.frame.size.height / 4, self.initialScreenScrollView.frame.size.width, self.initialScreenScrollView.frame.size.height / 3)];
          
      
            
            
            UILabel *text1title=[[UILabel alloc] initWithFrame:CGRectMake((self.initialScreenScrollView.frame.size.width * i), self.initialScreenScrollView.frame.size.height / 4, self.initialScreenScrollView.frame.size.width, self.initialScreenScrollView.frame.size.height / 4)];
            
            
            text1title.text=[NSString stringWithFormat:@"Press Dry Cleaning\n"];
            text1title.textColor=[UIColor whiteColor];
            [text1title setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:22]];
            text1title.textAlignment = NSTextAlignmentCenter;
            [self.initialScreenScrollView addSubview:text1title];
            
            
            // Set UILabel text and configure
            screenLabel.numberOfLines = 0;
            screenLabel.text = [NSString stringWithFormat:@"\nMake that suit or dress shine againa\nwith our dry cleaning plans"];
            screenLabel.textColor = [UIColor whiteColor];
            [screenLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18]];
            screenLabel.textAlignment = NSTextAlignmentCenter;
            
            // Add UILabel to scroll view
            [self.initialScreenScrollView addSubview:screenLabel];
         
            
        }else if(i==2){
    
            UILabel *screenLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.initialScreenScrollView.frame.size.width * i), self.initialScreenScrollView.frame.size.height / 4, self.initialScreenScrollView.frame.size.width, self.initialScreenScrollView.frame.size.height / 3)];
            UILabel *text1title=[[UILabel alloc] initWithFrame:CGRectMake((self.initialScreenScrollView.frame.size.width * i), self.initialScreenScrollView.frame.size.height / 4, self.initialScreenScrollView.frame.size.width, self.initialScreenScrollView.frame.size.height / 4)];
            
            
            text1title.text=[NSString stringWithFormat:@"Washing Per Pounds\n"];
            text1title.textColor=[UIColor whiteColor];
            [text1title setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:22]];
            text1title.textAlignment = NSTextAlignmentCenter;
            [self.initialScreenScrollView addSubview:text1title];
            
            
            
            
            // Set UILabel text and configure
            screenLabel.numberOfLines = 0;
            screenLabel.text = [NSString stringWithFormat:@"\nWash and fold will no longer be a\nproblem for you, leave it to us."];
            screenLabel.textColor = [UIColor whiteColor];
            [screenLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18]];
            screenLabel.textAlignment = NSTextAlignmentCenter;
      
            
            // Add UILabel to scroll view
            [self.initialScreenScrollView addSubview:screenLabel];
        }else if(i==3) {
 
            
            
            UILabel *screenLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.initialScreenScrollView.frame.size.width * i), self.initialScreenScrollView.frame.size.height / 4, self.initialScreenScrollView.frame.size.width, self.initialScreenScrollView.frame.size.height / 3)];
            UILabel *text1title=[[UILabel alloc] initWithFrame:CGRectMake((self.initialScreenScrollView.frame.size.width * i), self.initialScreenScrollView.frame.size.height / 4, self.initialScreenScrollView.frame.size.width, self.initialScreenScrollView.frame.size.height / 5)];
            
            
            text1title.text=[NSString stringWithFormat:@"Save Time + Money\n"];
            text1title.textColor=[UIColor whiteColor];
            [text1title setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:22]];
            text1title.textAlignment = NSTextAlignmentCenter;
            [self.initialScreenScrollView addSubview:text1title];
            
            // Set UILabel text and configure
            screenLabel.numberOfLines = 0;
            screenLabel.text = [NSString stringWithFormat:@"\nCleanpress can help you save those extra\ndollars and give you and your family\nmore time to spend together."];
            screenLabel.textColor = [UIColor whiteColor];
            [screenLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18]];
            screenLabel.textAlignment = NSTextAlignmentCenter;
            
            // Add UILabel to scroll view
            [self.initialScreenScrollView addSubview:screenLabel];
     
            
        
        }
        

        
        // Add UIImageView with screen indicator dots
     
        
      
    
       
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.initialScreenScrollView.frame.size.width;
    float fractionalPage = self.initialScreenScrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.Pagecontrol.currentPage = page;
    if (page==0) {
          [ self.initialScreenScrollView setBackgroundColor:[[UIColor whiteColor ] colorWithAlphaComponent:0.6f]];
    } else if (page==1){
       [ self.initialScreenScrollView setBackgroundColor:[[UIColor whiteColor ] colorWithAlphaComponent:0.4f]];
    }else if(page==2){
       [ self.initialScreenScrollView setBackgroundColor:[[UIColor whiteColor ] colorWithAlphaComponent:0.2f]];
    }else if(page==3){
           [ self.initialScreenScrollView setBackgroundColor:[[UIColor whiteColor ] colorWithAlphaComponent:0.0f]];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
