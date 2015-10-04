//
//  Tutorials.m
//  Pantalla1
//
//  Created by Ana Colmenares on 27/7/15.
//  Copyright (c) 2015 Ana Colmenares. All rights reserved.
//

#import "Tutorials.h"

@interface Tutorials ()

@end

@implementation Tutorials

- (void)viewDidLoad {
    self.topbar.hidesBackButton = YES;
    [self.topbar setLeftItemsSupplementBackButton:YES];
    UIBarButtonItem *gomenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"go_back"] style:UIBarButtonItemStylePlain target:self action:@selector(ToMenu)];
    
    [self.topbar setLeftBarButtonItem:gomenu animated:YES];
    self.topbar.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"go_back"]];
    
    if(self.windowtutorials.frame.size.height <= 480 ){
        
        //4s
        
        self.scrollTutorials.contentSize = CGSizeMake(self.view.frame.size.width, 520);
        
        //primer texto
        self.textuno.frame = CGRectMake(self.textuno.frame.origin.x , 60, self.textuno.frame.size.width , self.textuno.frame.size.height);
        
        //segundo texto
        self.textdos.frame = CGRectMake(self.textdos.frame.origin.x , 200, self.textdos.frame.size.width , self.textdos.frame.size.height);
        
        //tercer texto
        self.texttres.frame = CGRectMake(self.texttres.frame.origin.x , 340, self.texttres.frame.size.width , self.texttres.frame.size.height);
        
        
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
