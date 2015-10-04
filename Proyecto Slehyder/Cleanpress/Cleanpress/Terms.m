//
//  Terms.m
//  Pantalla1
//
//  Created by Ana Colmenares on 27/7/15.
//  Copyright (c) 2015 Ana Colmenares. All rights reserved.
//

#import "Terms.h"

@interface Terms ()

@end

@implementation Terms

- (void)viewDidLoad {
    self.topbar.hidesBackButton = YES;
    [self.topbar setLeftItemsSupplementBackButton:YES];
    UIBarButtonItem *gomenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"go_back"] style:UIBarButtonItemStylePlain target:self action:@selector(ToMenu)];
    
    [self.topbar setLeftBarButtonItem:gomenu animated:YES];
    self.topbar.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"go_back"]];
    
    if(self.windowTerms.frame.size.height <= 480 ){
        
        //4s
        
        self.scrollTerms.contentSize = CGSizeMake(self.view.frame.size.width, 520);
        
        //primer texto
        self.textouno.frame = CGRectMake(self.textouno.frame.origin.x , 60, self.textouno.frame.size.width , self.textouno.frame.size.height);
        
        //segundo texto
        self.textodos.frame = CGRectMake(self.textodos.frame.origin.x , 200, self.textodos.frame.size.width , self.textodos.frame.size.height);
        
        //tercer texto
        self.textotres.frame = CGRectMake(self.textotres.frame.origin.x , 340, self.textotres.frame.size.width , self.textotres.frame.size.height);
        
        
    }

    
    
    [super viewDidLoad];
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
