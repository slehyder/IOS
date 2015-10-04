//
//  about.m
//  Pantalla1
//
//  Created by Ana Colmenares on 23/7/15.
//  Copyright (c) 2015 Ana Colmenares. All rights reserved.
//

#import "about.h"

@interface about ()
@end

@implementation about




- (void)viewDidLoad {
    self.blueline.layer.zPosition = 2;
    self.titlename.layer.zPosition = 2;
    self.topbar.hidesBackButton = YES;
    [self.topbar setLeftItemsSupplementBackButton:YES];
    UIBarButtonItem *gomenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"go_back"] style:UIBarButtonItemStylePlain target:self action:@selector(ToMenu)];
    
    [self.topbar setLeftBarButtonItem:gomenu animated:YES];
    self.topbar.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"go_back"]];
    if(self.Window.frame.size.height <= 480 ){
        
        //4s
        
        self.scrol.contentSize = CGSizeMake(self.view.frame.size.width, 610);
        
        
        
        //texto superior
        self.text.frame = CGRectMake(self.text.frame.origin.x , 120, self.text.frame.size.width , self.text.frame.size.height);
        
        //linea azul inferior
        self.labelblue.frame = CGRectMake(self.labelblue.frame.origin.x , 440, self.labelblue.frame.size.width , self.labelblue.frame.size.height);
        
        //tercer label inferior
        self.tutorials.frame = CGRectMake(self.tutorials.frame.origin.x , 550, self.tutorials.frame.size.width , self.tutorials.frame.size.height);
        
        //segundo label inferior
        self.working.frame = CGRectMake(self.working.frame.origin.x , 505, self.working.frame.size.width , self.working.frame.size.height);
        
        //primer label inferior
        self.terms.frame = CGRectMake(self.terms.frame.origin.x , 460, self.terms.frame.size.width , self.terms.frame.size.height);
        
        //antepenultimo boton
        self.arrowTerms.frame = CGRectMake(self.arrowTerms.frame.origin.x , 465, self.arrowTerms.frame.size.width , self.arrowTerms.frame.size.height);
        
        //penultimo boton
        self.arrowWorking.frame = CGRectMake(self.arrowWorking.frame.origin.x , 512, self.arrowWorking.frame.size.width , self.arrowWorking.frame.size.height);
        
        //ultimo boton
        self.arrowTuto.frame = CGRectMake(self.arrowTuto.frame.origin.x , 560, self.arrowTuto.frame.size.width , self.arrowTuto.frame.size.height);
        
         //penultima linea gris
        self.labeluno.frame = CGRectMake(self.labeluno.frame.origin.x , 500, self.labeluno.frame.size.width , self.labeluno.frame.size.height);
        
         //ultima linea gris
        self.labeldos.frame = CGRectMake(self.labeldos.frame.origin.x , 548, self.labeldos.frame.size.width , self.labeldos.frame.size.height);
        
        self.video.frame = CGRectMake(self.video.frame.origin.x , 195, self.video.frame.size.width , self.video.frame.size.height+170);
        
            }
    
       
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // if(self.Window.frame.size.height <= 480 ){
    
    
      //  self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 775);
        
      //  self.CancelPickup.frame = CGRectMake(self.CancelPickup.frame.origin.x , 595, self.CancelPickup.frame.size.width , self.CancelPickup.frame.size.height);
    
   // }
    NSString *video = @"<iframe width=100% height=90% src=https://www.youtube.com/embed/RXSFRMJhlgY frameborder=0 allowfullscreen></iframe>";
    [[self video] loadHTMLString:video baseURL:nil];
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
