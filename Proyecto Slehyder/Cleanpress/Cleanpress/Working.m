//
//  Working.m
//  Pantalla1
//
//  Created by Ana Colmenares on 27/7/15.
//  Copyright (c) 2015 Ana Colmenares. All rights reserved.
//

#import "Working.h"

@interface Working ()

@end

@implementation Working

- (void)viewDidLoad {
    self.topbar.hidesBackButton = YES;
    [self.topbar setLeftItemsSupplementBackButton:YES];
    UIBarButtonItem *gomenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"go_back"] style:UIBarButtonItemStylePlain target:self action:@selector(ToMenu)];
    
    [self.topbar setLeftBarButtonItem:gomenu animated:YES];
    self.topbar.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"go_back"]];
    
    if(self.WindowWorking.frame.size.height <= 480 ){
        
        //4s
        
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 520);
        
        //primer texto
        self.textoUno.frame = CGRectMake(self.textoUno.frame.origin.x , 60, self.textoUno.frame.size.width , self.textoUno.frame.size.height);
        
        //segundo texto
        self.textoDos.frame = CGRectMake(self.textoDos.frame.origin.x , 200, self.textoDos.frame.size.width , self.textoDos.frame.size.height);
        
        //tercer texto
        self.textoTres.frame = CGRectMake(self.textoTres.frame.origin.x , 340, self.textoTres.frame.size.width , self.textoTres.frame.size.height);
        
        
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
