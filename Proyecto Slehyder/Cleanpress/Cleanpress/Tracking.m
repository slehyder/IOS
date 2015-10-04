//
//  Tracking.m
//  Cleanpress
//
//  Created by Slehyder Martinez on 9/7/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//



#import "Tracking.h"
#import <Parse/Parse.h>

#import "QuartzCore/QuartzCore.h"

@interface Tracking ()

{
    
    NSDate *currentDate;
    
    float picktime;
    
    float timepick;
    
    BOOL launpdrop;
    
    BOOL deliveryVerify;
    
    float timedelivery;
    
    float progreso;
    
    float progre;
    
    float progr;
    
    NSString *imagen;
    
    
    
    
    float flag;
    
}

@end



@implementation Tracking



- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationController.navigationItem.hidesBackButton = YES;
    
    self.topbar.hidesBackButton = YES;
    [self.topbar setLeftItemsSupplementBackButton:YES ];
    UIBarButtonItem *gomenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"go_back_2"] style:UIBarButtonItemStylePlain target:self action:@selector(ToMenu)];
    
    [self.topbar setLeftBarButtonItem:gomenu animated:YES];
    self.topbar.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"go_back_2"]];
    
    
    currentDate=[NSDate date];
    
    
    
    
    
    
    
    
    
    //  NSString *verif=@"true";
    
    
    
#pragma consulta a la base de datos.
    
    PFUser *cuser = [PFUser currentUser];
    
    NSString *us = cuser[@"username"];
    
    //  NSPredicate *tracking = [NSPredicate predicateWithFormat:@"username = %@ AND Verify = %@",us,verif];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Order" ];
    
    [query whereKey:@"username" equalTo:us];
    
    [query orderByDescending:@"updatedAt"];
    
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *errir){
        
        if (!errir) {
            
            
            NSUserDefaults *use = [NSUserDefaults standardUserDefaults];
            
            NSDate *startTim = [NSDate dateWithTimeIntervalSince1970:[[use objectForKey:@"flag"]doubleValue]];
            
            NSTimeInterval elapsedTim = -[startTim timeIntervalSinceNow];
            
#pragma mark - else if para saber si el tracking esta completo y devolver de nuevo a la pantalla de orden
            
            if([object[@"Paid"] boolValue]==1 && [object[@"Verify"]boolValue]==1 && (float)elapsedTim >=1){
                
                
                
                
                
                [self performSegueWithIdentifier:@"backOrder" sender:self];
                
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"time"];[[NSUserDefaults standardUserDefaults] synchronize];
                
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"time3"];[[NSUserDefaults standardUserDefaults] synchronize];
                
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"time2"];[[NSUserDefaults standardUserDefaults] synchronize];
                
                
            }else
#pragma mark - else if para saber si pago y que se le esta enviando la ropa si el delivery time is true
                
                if([object[@"Paid"] boolValue]==1 && [object[@"Verify"]boolValue]==1){
                    
                    
                    
                    
                    
                    
                    
#pragma mark - Consulta para el trackingstatus
                    
                    
                    
                    
                    
                    PFQuery *driver = [PFQuery queryWithClassName:@"Driver"];
                    
                    [driver whereKey:@"DriverUsername" equalTo:object[@"DriverUsername"]];
                    
                    [driver getFirstObjectInBackgroundWithBlock:^(PFObject *obje,NSError *errir){
                        
                        if (!errir) {
                            
                            
                            
                            
                            
                            
                            
                            PFFile *userImageFile = obje[@"PhotoDriver"];
                            
                            [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
                                
                                if (!error) {
                                    
                                    
                                    
                                    _PhotoTracking.image= [UIImage imageWithData:imageData];
                                    
                                }
                                
                            }];
                            
                            
                            
                            
#pragma mark - closed consult the photo tracking
                            
                            
                        }}];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
#pragma mark - consult the tracking Status
                    PFQuery *consult=[PFQuery queryWithClassName:@"TrackingStatus"];
                    
                    [consult whereKey:@"OrderNumber" equalTo:object[@"OrderNumber"]];
                    
                    [consult getFirstObjectInBackgroundWithBlock:^(PFObject *objecto,NSError *erri){
                        
                        if (!erri) {
                            
                            
                            NSUserDefaults *timerflag = [NSUserDefaults standardUserDefaults];
                            
                            [timerflag setObject:[NSNumber numberWithDouble:[objecto[@"updatedAt"] timeIntervalSince1970]] forKey:@"flag"];
                            
                            [timerflag synchronize];
                            
                            
                            
                            
                            
                            timepick = [objecto[@"TimePick"] floatValue];
                            
                            launpdrop =[objecto[@"LaundryDrop"] boolValue];
                            
                            deliveryVerify =[objecto[@"DeliveryVerify"] boolValue];
                            
                            timedelivery=[objecto[@"DeliveryTime"]floatValue];
                            
                            if([objecto[@"TimePick"] floatValue]>0.0){
                                
                                timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(moreProgress)
                                         
                                                                       userInfo:Nil repeats:YES];
                                
                                
                                
                                
                                
                                NSUserDefaults *user1 = [NSUserDefaults standardUserDefaults];
                                
                                
                                
                                if ([[NSUserDefaults standardUserDefaults] objectForKey:@"time" ] != nil) {
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                }else {
                                    
                                    
                                    
                                    NSDate *created = [objecto createdAt];
                                    
                                    
                                    
                                    [user1 setObject:[NSNumber numberWithDouble:[created timeIntervalSince1970]] forKey:@"time"];
                                    
                                    [user1 synchronize];
                                    
                                }
                                
                                
                                
                            }else {
                                
                                
                                
                                progreso=0.0;
                                
                                
                                
                            }
                            
#pragma mark - verificafion si el laundrydrop es true
                            
                            if ([objecto[@"LaundryDrop"] boolValue]==1) {
                                
                                
                                
                                
                                
                                timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(moreProgres)
                                         
                                                                       userInfo:Nil repeats:YES];
                                
                                
                                
#pragma mark - verificacion si existe la variable NSuserdefault de time2
                                
                                NSUserDefaults *user2 = [NSUserDefaults standardUserDefaults];
                                
                                if ([[NSUserDefaults standardUserDefaults] objectForKey:@"time2" ] != nil) {
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                }else {
                                    
                                    NSDate *update = [objecto updatedAt];
                                    
                                    
                                    
                                    [user2 setObject:[NSNumber numberWithDouble:[update timeIntervalSince1970]] forKey:@"time2"];
                                    
                                    [user2 synchronize];
                                    
                                    
                                    
                                    
                                    
                                }
                                
                                
                                
#pragma mark - cierre del if de la verificacion si el LaundryDrop is true
                                
                                
                                
                            }else{
                                
                                timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(moreProgres)
                                         
                                                                       userInfo:Nil repeats:YES];
                                
                                
                                
                                
                                
                                
                                
                            }
                            
#pragma mark - verificacion si el deliveryVerify is true
                            
                            if ([objecto[@"DeliveryVerify"] boolValue ]==1) {
                                
                                
                                
                                timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(moreProgre)
                                         
                                                                       userInfo:Nil repeats:YES];
                                
#pragma mark - verificacion si existe la variable NSuserdefault de time3
                                
                                NSUserDefaults *user3 = [NSUserDefaults standardUserDefaults];
                                
                                if ([[NSUserDefaults standardUserDefaults] objectForKey:@"time3" ] != nil) {
                                    
                                    
                                    
                                    
                                    NSDate *update = [objecto updatedAt];
                                    
                                    
                                    
                                    
                                    [user3 setObject:[NSNumber numberWithDouble:[update timeIntervalSince1970]] forKey:@"time3"];
                                    
                                    [user3 synchronize];
                                    
                                    
                                    
                                    
                                    
                                    
                                }else {
                                    NSDate *update = [objecto updatedAt];
                                    
                                    
                                    
                                    
                                    [user3 setObject:[NSNumber numberWithDouble:[update timeIntervalSince1970]] forKey:@"time3"];
                                    
                                    [user3 synchronize];
                                    
                                    
                                    
                                }
                                
                                
                                
#pragma mark - cierre del if de la verificacion si el Deliveryverify is true
                                
                            }else{
                                
                                timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(moreProgre)
                                         
                                                                       userInfo:Nil repeats:YES];
                                
                                
                                
                            }
                            
                            
#pragma mark - closed consult status tracking
                        }}];
                    
                    
                    
                    
                    
                    
                    
                    self.PhotoTracking.layer.cornerRadius=40.0f;
                    
                    self.PhotoTracking.layer.masksToBounds=YES;
                    
                    
                    
                    self.PhotoTracking.layer.borderColor=[UIColor whiteColor].CGColor;
                    
                    self.PhotoTracking.layer.borderWidth=1.0f;
                    
                    
                    
                    self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 665);
                    
                    
                    
                    self.PhotoTracking.hidden=false;
                    
                    self.NameTracking.hidden=false;
                    
                    self.labelDownTrack.hidden=false;
                    
                    
                    
#pragma mark - ajuste a cada pantalla
                    
                    
                    
                    if(self.Window.frame.size.height <= 480 ){
                        
                        //4s
                        
                        self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 775);
                        
                        self.btnFeedback.frame = CGRectMake(self.btnFeedback.frame.origin.x , 595, self.btnFeedback.frame.size.width , self.btnFeedback.frame.size.height);
                        
                        
                        
                        self.CancelPickup.hidden=YES;
                        self.btnFeedback.hidden=NO;
                        
                        self.timeOne.frame=CGRectMake(self.timeOne.frame.origin.x ,self.timeOne.frame.origin.y+35, self.timeOne.frame.size.width , self.timeOne.frame.size.height);
                        
                        self.LabelPickupTime.frame=CGRectMake(self.LabelPickupTime.frame.origin.x ,self.LabelPickupTime.frame.origin.y+50, self.LabelPickupTime.frame.size.width , self.LabelPickupTime.frame.size.height);
                        
                        self.timeTwo.frame=CGRectMake(self.timeTwo.frame.origin.x ,self.timeTwo.frame.origin.y+35, self.timeTwo.frame.size.width , self.timeTwo.frame.size.height);
                        
                        self.labelDeliveryTime.frame=CGRectMake(self.labelDeliveryTime.frame.origin.x ,self.labelDeliveryTime.frame.origin.y+50, self.labelDeliveryTime.frame.size.width , self.labelDeliveryTime.frame.size.height);
                        
                        self.PhotoTracking.frame=CGRectMake(self.PhotoTracking.frame.origin.x ,self.PhotoTracking.frame.origin.y+35, self.PhotoTracking.frame.size.width , self.PhotoTracking.frame.size.height);
                        
                        
                    }else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                        
                        
                        
                        //5 - 5s
                        
                        self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 780);
                        
                        self.btnFeedback.frame = CGRectMake(self.btnFeedback.frame.origin.x , 600, self.btnFeedback.frame.size.width , self.btnFeedback.frame.size.height);
                        self.CancelPickup.hidden=YES;
                        self.btnFeedback.hidden=NO;
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                        
                        
                        
                        //6
                        
                        
                        
                        self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 810);
                        
                        
                        
                        _LineVertical.frame = CGRectMake(_LineVertical.frame.origin.x, _LineVertical.frame.origin.y, _LineVertical.frame.size.width,_LineVertical.frame.size.height+20);
                        
                        
                        
                        self.btnFeedback.frame = CGRectMake(self.btnFeedback.frame.origin.x , 625, self.btnFeedback.frame.size.width , self.btnFeedback.frame.size.height);
                        //
                        self.CancelPickup.hidden=YES;
                        self.btnFeedback.hidden=NO;
                        
                        
                        self.timeOne.frame = CGRectMake(self.timeOne.frame.origin.x+15 , 365, self.timeOne.frame.size.width , self.timeOne.frame.size.height);
                        
                        
                        
                        self.LabelPickupTime.frame = CGRectMake(self.LabelPickupTime.frame.origin.x , 410, self.LabelPickupTime.frame.size.width , self.LabelPickupTime.frame.size.height);
                        
                        
                        
                        self.labelWeekdayPickup.frame = CGRectMake(self.labelWeekdayPickup.frame.origin.x , 440, self.labelWeekdayPickup.frame.size.width , self.labelWeekdayPickup.frame.size.height);
                        
                        
                        
                        self.labelDatePickup.frame = CGRectMake(self.labelDatePickup.frame.origin.x , 470, self.labelDatePickup.frame.size.width , self.labelDatePickup.frame.size.height);
                        
                        
                        
                        self.labelTimePickup.frame = CGRectMake(self.labelTimePickup.frame.origin.x , 500, self.labelTimePickup.frame.size.width , self.labelTimePickup.frame.size.height);
                        
                        
                        
                        self.labelAddressPickup.frame = CGRectMake(self.labelAddressPickup.frame.origin.x , 530, self.labelAddressPickup.frame.size.width , self.labelAddressPickup.frame.size.height);
                        
                        
                        
                        
                        
                        self.timeTwo.frame = CGRectMake(self.timeTwo.frame.origin.x -10, 365, self.timeTwo.frame.size.width , self.timeTwo.frame.size.height);
                        
                        
                        
                        self.labelDeliveryTime.frame = CGRectMake(self.labelDeliveryTime.frame.origin.x , 410, self.labelDeliveryTime.frame.size.width , self.labelDeliveryTime.frame.size.height);
                        
                        
                        
                        self.labelWeekdayDelivery.frame = CGRectMake(self.labelWeekdayDelivery.frame.origin.x , 440, self.labelWeekdayDelivery.frame.size.width , self.labelWeekdayDelivery.frame.size.height);
                        
                        
                        
                        self.labelDateDelivery.frame = CGRectMake(self.labelDateDelivery.frame.origin.x , 470, self.labelDateDelivery.frame.size.width , self.labelDateDelivery.frame.size.height);
                        
                        
                        
                        self.labelTimeDelivery.frame = CGRectMake(self.labelTimeDelivery.frame.origin.x , 500, self.labelTimeDelivery.frame.size.width , self.labelTimeDelivery.frame.size.height);
                        
                        
                        
                        self.labelAddressDelivery.frame = CGRectMake(self.labelAddressDelivery.frame.origin.x , 530, self.labelAddressDelivery.frame.size.width , self.labelAddressDelivery.frame.size.height);
                        
                        self.PhotoTracking.frame = CGRectMake(self.PhotoTracking.frame.origin.x+30 , 225, self.PhotoTracking.frame.size.width+5 , self.PhotoTracking.frame.size.height+5);
                        
                        self.labelDownTrack.frame = CGRectMake(self.labelDownTrack.frame.origin.x-15 , self.labelDownTrack.frame.origin.y, self.labelDownTrack.frame.size.width , self.labelDownTrack.frame.size.height);
                        self.NameTracking.frame = CGRectMake(self.NameTracking.frame.origin.x-15 , self.NameTracking.frame.origin.y, self.NameTracking.frame.size.width , self.NameTracking.frame.size.height);
                        
                    }else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                        
                        
                        
                        //6 plus
                        
                        self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 800);
                        
                        self.btnFeedback.frame = CGRectMake(self.btnFeedback.frame.origin.x , 620, self.btnFeedback.frame.size.width , self.btnFeedback.frame.size.height);
                        
                        _LineVertical.frame = CGRectMake(_LineVertical.frame.origin.x, _LineVertical.frame.origin.y, _LineVertical.frame.size.width,_LineVertical.frame.size.height+20);
                        
                        //
                        self.CancelPickup.hidden=YES;
                        self.btnFeedback.hidden=NO;
                        
                        self.timeOne.frame = CGRectMake(self.timeOne.frame.origin.x+15 , 365, self.timeOne.frame.size.width , self.timeOne.frame.size.height);
                        
                        
                        
                        self.LabelPickupTime.frame = CGRectMake(self.LabelPickupTime.frame.origin.x , 410, self.LabelPickupTime.frame.size.width , self.LabelPickupTime.frame.size.height);
                        
                        
                        
                        self.labelWeekdayPickup.frame = CGRectMake(self.labelWeekdayPickup.frame.origin.x , 440, self.labelWeekdayPickup.frame.size.width , self.labelWeekdayPickup.frame.size.height);
                        
                        
                        
                        self.labelDatePickup.frame = CGRectMake(self.labelDatePickup.frame.origin.x , 470, self.labelDatePickup.frame.size.width , self.labelDatePickup.frame.size.height);
                        
                        
                        
                        self.labelTimePickup.frame = CGRectMake(self.labelTimePickup.frame.origin.x , 500, self.labelTimePickup.frame.size.width , self.labelTimePickup.frame.size.height);
                        
                        
                        
                        self.labelAddressPickup.frame = CGRectMake(self.labelAddressPickup.frame.origin.x , 530, self.labelAddressPickup.frame.size.width , self.labelAddressPickup.frame.size.height);
                        
                        
                        
                        
                        
                        self.timeTwo.frame = CGRectMake(self.timeTwo.frame.origin.x -15, 365, self.timeTwo.frame.size.width , self.timeTwo.frame.size.height);
                        
                        
                        
                        self.labelDeliveryTime.frame = CGRectMake(self.labelDeliveryTime.frame.origin.x , 410, self.labelDeliveryTime.frame.size.width , self.labelDeliveryTime.frame.size.height);
                        
                        
                        
                        self.labelWeekdayDelivery.frame = CGRectMake(self.labelWeekdayDelivery.frame.origin.x , 440, self.labelWeekdayDelivery.frame.size.width , self.labelWeekdayDelivery.frame.size.height);
                        
                        
                        
                        self.labelDateDelivery.frame = CGRectMake(self.labelDateDelivery.frame.origin.x , 470, self.labelDateDelivery.frame.size.width , self.labelDateDelivery.frame.size.height);
                        
                        
                        
                        self.labelTimeDelivery.frame = CGRectMake(self.labelTimeDelivery.frame.origin.x , 500, self.labelTimeDelivery.frame.size.width , self.labelTimeDelivery.frame.size.height);
                        
                        
                        
                        self.labelAddressDelivery.frame = CGRectMake(self.labelAddressDelivery.frame.origin.x , 530, self.labelAddressDelivery.frame.size.width , self.labelAddressDelivery.frame.size.height);
                        
                        self.PhotoTracking.frame = CGRectMake(self.PhotoTracking.frame.origin.x+40 , 225, self.PhotoTracking.frame.size.width+8 , self.PhotoTracking.frame.size.height+8);
                        
                        self.labelDownTrack.frame = CGRectMake(self.labelDownTrack.frame.origin.x-35 , self.labelDownTrack.frame.origin.y, self.labelDownTrack.frame.size.width , self.labelDownTrack.frame.size.height);
                        self.NameTracking.frame = CGRectMake(self.NameTracking.frame.origin.x-35 , self.NameTracking.frame.origin.y, self.NameTracking.frame.size.width , self.NameTracking.frame.size.height);
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    
#pragma mark - muestra de la informacion de la order en el tracking y cambio de formato para poder mostrar el dia de la fecha
                    
                    NSDateFormatter *dateFormatte = [[NSDateFormatter alloc] init];
                    
                    [dateFormatte setDateFormat:@"MM/dd/yyyy"];
                    
                    NSDate *pickupdate = [[NSDate alloc] init];
                    
                    NSDate *deliverydate=[[NSDate alloc] init];
                    
                    pickupdate= [dateFormatte dateFromString:object[@"Pickupdate"]];
                    
                    deliverydate=[dateFormatte dateFromString:object[@"Dropoffdate"]];
                    
                    NSDateFormatter *format=[[NSDateFormatter alloc]init];
                    
                    [format setDateFormat:@"EEEE"];
                    
                    self.labelWeekdayPickup.text=[format stringFromDate:pickupdate];
                    
                    self.labelWeekdayDelivery.text=[format stringFromDate:deliverydate ];
                    
                    self.labelDatePickup.text=object[@"Pickupdate"];
                    
                    self.labelDateDelivery.text=object[@"Dropoffdate"];
                    
                    self.labelTimePickup.text=object[@"PickHour"];
                    
                    self.labelTimeDelivery.text=object[@"Deliveryhour"];
                    
                    self.labelAddressPickup.text= [NSString stringWithFormat:@"%@ ,  %@ ",object[@"PickupAddress"],object[@"PickupZipcode"]];
                    
                    self.labelAddressDelivery.text=[NSString stringWithFormat:@"%@ , %@",object[@"DeliveryAddress"], object[@"DeliveryZipcode"]];
                    
                    self.NameTracking.text=object[@"DriverUsername"];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }else
                    
                    
#pragma mark- verifica si la orden fue acepta por algun driver
                    
                    
                    
                    if([object[@"Verify"] boolValue]==1){
                        
#pragma mark - mostrar cestica
                        UIImage *orderimg = [UIImage imageNamed:@"order2"];
                        UIBarButtonItem *cesta = [[UIBarButtonItem alloc] initWithImage:orderimg style:UIBarButtonItemStylePlain target:self action:@selector(Topay)];
                        self.topbar.rightBarButtonItem = cesta;
                        self.topbar.rightBarButtonItem.tintColor =[UIColor colorWithPatternImage:orderimg];
                        
                        
                        
#pragma mark - consulta para poder mostrar la photo del driver.
                        
                        
                        
                        PFQuery *driver = [PFQuery queryWithClassName:@"Driver"];
                        
                        [driver whereKey:@"DriverUsername" equalTo:object[@"DriverUsername"]];
                        
                        [driver getFirstObjectInBackgroundWithBlock:^(PFObject *obje,NSError *errir){
                            
                            if (!errir) {
                                
                                
                                
                                
                                
                                
                                
                                PFFile *userImageFile = obje[@"PhotoDriver"];
                                
                                [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
                                    
                                    if (!error) {
                                        
                                        
                                        
                                        _PhotoTracking.image= [UIImage imageWithData:imageData];
                                        
                                    }
                                    
                                }];
                                
                                
                                
                                
                                
#pragma mark - Close consult photo driver
                                
                            }}];
                        
                        
                        
                        
                        
                        
                        
#pragma mark - consulta para poder saber en que proceso va la orden del cliente
                        
                        
                        
                        PFQuery *consult=[PFQuery queryWithClassName:@"TrackingStatus"];
                        
                        [consult whereKey:@"OrderNumber" equalTo:object[@"OrderNumber"]];
                        
                        [consult getFirstObjectInBackgroundWithBlock:^(PFObject *objecto,NSError *erri){
                            
                            if (!erri) {
                                
                                
                                
                                timepick = [objecto[@"TimePick"] floatValue];
                                
                                launpdrop =[objecto[@"LaundryDrop"] boolValue];
                                
                                deliveryVerify =[objecto[@"DeliveryVerify"] boolValue];
                                
                                timedelivery=[objecto[@"DeliveryTime"]floatValue];
                                
                                if([objecto[@"TimePick"] floatValue]>0.0){
                                    
                                    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(moreProgress)
                                             
                                                                           userInfo:Nil repeats:YES];
                                    
                                    
                                    
                                    
                                    
                                    NSUserDefaults *user1 = [NSUserDefaults standardUserDefaults];
                                    
                                    
                                    
                                    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"time" ] != nil) {
                                        
                                        
                                        
                                        
                                    }else {
                                        
                                        
                                        NSDate *created = [objecto createdAt];
                                        
                                        
                                        
                                        
                                        [user1 setObject:[NSNumber numberWithDouble:[created  timeIntervalSince1970]] forKey:@"time"];
                                        
                                        [user1 synchronize];
                                        
                                    }
                                    
                                    
                                    
                                }else {
                                    
                                    
                                    
                                    progreso=0.0;
                                    
                                    
                                    
                                }
                                
#pragma mark - verificafion si el laundrydrop es true
                                
                                if ([objecto[@"LaundryDrop"] boolValue]==1) {
                                    
                                    
                                    
                                    
                                    
                                    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(moreProgres)
                                             
                                                                           userInfo:Nil repeats:YES];
                                    
                                    
                                    
#pragma mark - verificacion si existe la variable NSuserdefault de time2
                                    
                                    NSUserDefaults *user2 = [NSUserDefaults standardUserDefaults];
                                    
                                    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"time2" ] != nil) {
                                        
                                        
                                        
                                        
                                        
                                        
                                    }else {
                                        
                                        
                                        NSDate *update = [objecto updatedAt];
                                        
                                        
                                        [user2 setObject:[NSNumber numberWithDouble:[update timeIntervalSince1970]] forKey:@"time2"];
                                        
                                        [user2 synchronize];
                                        
                                        
                                        
                                        
                                        
                                    }
                                    
                                    
                                    
#pragma mark - cierre del if de la verificacion si el LaundryDrop is true
                                    
                                    
                                    
                                }else{
                                    
                                    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(moreProgres)
                                             
                                                                           userInfo:Nil repeats:YES];
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                }
                                
#pragma mark - Close consult the tracking
                                
                            }}];
                        
                        
                        
                        
                        
                        
                        
                        self.PhotoTracking.layer.cornerRadius=40.0f;
                        
                        self.PhotoTracking.layer.masksToBounds=YES;
                        
                        
                        
                        self.PhotoTracking.layer.borderColor=[UIColor whiteColor].CGColor;
                        
                        self.PhotoTracking.layer.borderWidth=1.0f;
                        
                        
                        
                        self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 665);
                        
                        
                        
                        self.PhotoTracking.hidden=false;
                        
                        self.NameTracking.hidden=false;
                        
                        self.labelDownTrack.hidden=false;
                        
                        
                        
#pragma mark - ajuste a cada pantalla
                        
                        
                        
                        if(self.Window.frame.size.height <= 480 ){
                            
                            //4s
                            
                            self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 775);
                            
                            self.btnFeedback.frame = CGRectMake(self.btnFeedback.frame.origin.x , 595, self.btnFeedback.frame.size.width , self.btnFeedback.frame.size.height);
                            
                            
                            
                            self.CancelPickup.hidden=YES;
                            self.btnFeedback.hidden=NO;
                            
                            self.timeOne.frame=CGRectMake(self.timeOne.frame.origin.x ,self.timeOne.frame.origin.y+35, self.timeOne.frame.size.width , self.timeOne.frame.size.height);
                            
                            self.LabelPickupTime.frame=CGRectMake(self.LabelPickupTime.frame.origin.x ,self.LabelPickupTime.frame.origin.y+50, self.LabelPickupTime.frame.size.width , self.LabelPickupTime.frame.size.height);
                            
                            self.timeTwo.frame=CGRectMake(self.timeTwo.frame.origin.x ,self.timeTwo.frame.origin.y+35, self.timeTwo.frame.size.width , self.timeTwo.frame.size.height);
                            
                            self.labelDeliveryTime.frame=CGRectMake(self.labelDeliveryTime.frame.origin.x ,self.labelDeliveryTime.frame.origin.y+50, self.labelDeliveryTime.frame.size.width , self.labelDeliveryTime.frame.size.height);
                            
                            self.PhotoTracking.frame=CGRectMake(self.PhotoTracking.frame.origin.x ,self.PhotoTracking.frame.origin.y+35, self.PhotoTracking.frame.size.width , self.PhotoTracking.frame.size.height);
                            
                            
                        }else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                            
                            
                            
                            //5 - 5s
                            
                            self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 780);
                            
                            self.btnFeedback.frame = CGRectMake(self.btnFeedback.frame.origin.x , 600, self.btnFeedback.frame.size.width , self.btnFeedback.frame.size.height);
                            self.CancelPickup.hidden=YES;
                            self.btnFeedback.hidden=NO;
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        }else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                            
                            
                            
                            //6
                            
                            
                            
                            self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 810);
                            
                            
                            
                            _LineVertical.frame = CGRectMake(_LineVertical.frame.origin.x, _LineVertical.frame.origin.y, _LineVertical.frame.size.width,_LineVertical.frame.size.height+20);
                            
                            
                            
                            self.btnFeedback.frame = CGRectMake(self.btnFeedback.frame.origin.x , 625, self.btnFeedback.frame.size.width , self.btnFeedback.frame.size.height);
                            //
                            self.CancelPickup.hidden=YES;
                            self.btnFeedback.hidden=NO;
                            
                            
                            self.timeOne.frame = CGRectMake(self.timeOne.frame.origin.x+15 , 365, self.timeOne.frame.size.width , self.timeOne.frame.size.height);
                            
                            
                            
                            self.LabelPickupTime.frame = CGRectMake(self.LabelPickupTime.frame.origin.x , 410, self.LabelPickupTime.frame.size.width , self.LabelPickupTime.frame.size.height);
                            
                            
                            
                            self.labelWeekdayPickup.frame = CGRectMake(self.labelWeekdayPickup.frame.origin.x , 440, self.labelWeekdayPickup.frame.size.width , self.labelWeekdayPickup.frame.size.height);
                            
                            
                            
                            self.labelDatePickup.frame = CGRectMake(self.labelDatePickup.frame.origin.x , 470, self.labelDatePickup.frame.size.width , self.labelDatePickup.frame.size.height);
                            
                            
                            
                            self.labelTimePickup.frame = CGRectMake(self.labelTimePickup.frame.origin.x , 500, self.labelTimePickup.frame.size.width , self.labelTimePickup.frame.size.height);
                            
                            
                            
                            self.labelAddressPickup.frame = CGRectMake(self.labelAddressPickup.frame.origin.x , 530, self.labelAddressPickup.frame.size.width , self.labelAddressPickup.frame.size.height);
                            
                            
                            
                            
                            
                            self.timeTwo.frame = CGRectMake(self.timeTwo.frame.origin.x -10, 365, self.timeTwo.frame.size.width , self.timeTwo.frame.size.height);
                            
                            
                            
                            self.labelDeliveryTime.frame = CGRectMake(self.labelDeliveryTime.frame.origin.x , 410, self.labelDeliveryTime.frame.size.width , self.labelDeliveryTime.frame.size.height);
                            
                            
                            
                            self.labelWeekdayDelivery.frame = CGRectMake(self.labelWeekdayDelivery.frame.origin.x , 440, self.labelWeekdayDelivery.frame.size.width , self.labelWeekdayDelivery.frame.size.height);
                            
                            
                            
                            self.labelDateDelivery.frame = CGRectMake(self.labelDateDelivery.frame.origin.x , 470, self.labelDateDelivery.frame.size.width , self.labelDateDelivery.frame.size.height);
                            
                            
                            
                            self.labelTimeDelivery.frame = CGRectMake(self.labelTimeDelivery.frame.origin.x , 500, self.labelTimeDelivery.frame.size.width , self.labelTimeDelivery.frame.size.height);
                            
                            
                            
                            self.labelAddressDelivery.frame = CGRectMake(self.labelAddressDelivery.frame.origin.x , 530, self.labelAddressDelivery.frame.size.width , self.labelAddressDelivery.frame.size.height);
                            
                            self.PhotoTracking.frame = CGRectMake(self.PhotoTracking.frame.origin.x+30 , 225, self.PhotoTracking.frame.size.width+5 , self.PhotoTracking.frame.size.height+5);
                            
                            self.labelDownTrack.frame = CGRectMake(self.labelDownTrack.frame.origin.x-15 , self.labelDownTrack.frame.origin.y, self.labelDownTrack.frame.size.width , self.labelDownTrack.frame.size.height);
                            self.NameTracking.frame = CGRectMake(self.NameTracking.frame.origin.x-15 , self.NameTracking.frame.origin.y, self.NameTracking.frame.size.width , self.NameTracking.frame.size.height);
                            
                        }else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                            
                            
                            
                            //6 plus
                            
                            self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 800);
                            
                            self.btnFeedback.frame = CGRectMake(self.btnFeedback.frame.origin.x , 620, self.btnFeedback.frame.size.width , self.btnFeedback.frame.size.height);
                            
                            _LineVertical.frame = CGRectMake(_LineVertical.frame.origin.x, _LineVertical.frame.origin.y, _LineVertical.frame.size.width,_LineVertical.frame.size.height+20);
                            
                            //
                            self.CancelPickup.hidden=YES;
                            self.btnFeedback.hidden=NO;
                            
                            self.timeOne.frame = CGRectMake(self.timeOne.frame.origin.x+15 , 365, self.timeOne.frame.size.width , self.timeOne.frame.size.height);
                            
                            
                            
                            self.LabelPickupTime.frame = CGRectMake(self.LabelPickupTime.frame.origin.x , 410, self.LabelPickupTime.frame.size.width , self.LabelPickupTime.frame.size.height);
                            
                            
                            
                            self.labelWeekdayPickup.frame = CGRectMake(self.labelWeekdayPickup.frame.origin.x , 440, self.labelWeekdayPickup.frame.size.width , self.labelWeekdayPickup.frame.size.height);
                            
                            
                            
                            self.labelDatePickup.frame = CGRectMake(self.labelDatePickup.frame.origin.x , 470, self.labelDatePickup.frame.size.width , self.labelDatePickup.frame.size.height);
                            
                            
                            
                            self.labelTimePickup.frame = CGRectMake(self.labelTimePickup.frame.origin.x , 500, self.labelTimePickup.frame.size.width , self.labelTimePickup.frame.size.height);
                            
                            
                            
                            self.labelAddressPickup.frame = CGRectMake(self.labelAddressPickup.frame.origin.x , 530, self.labelAddressPickup.frame.size.width , self.labelAddressPickup.frame.size.height);
                            
                            
                            
                            
                            
                            self.timeTwo.frame = CGRectMake(self.timeTwo.frame.origin.x -15, 365, self.timeTwo.frame.size.width , self.timeTwo.frame.size.height);
                            
                            
                            
                            self.labelDeliveryTime.frame = CGRectMake(self.labelDeliveryTime.frame.origin.x , 410, self.labelDeliveryTime.frame.size.width , self.labelDeliveryTime.frame.size.height);
                            
                            
                            
                            self.labelWeekdayDelivery.frame = CGRectMake(self.labelWeekdayDelivery.frame.origin.x , 440, self.labelWeekdayDelivery.frame.size.width , self.labelWeekdayDelivery.frame.size.height);
                            
                            
                            
                            self.labelDateDelivery.frame = CGRectMake(self.labelDateDelivery.frame.origin.x , 470, self.labelDateDelivery.frame.size.width , self.labelDateDelivery.frame.size.height);
                            
                            
                            
                            self.labelTimeDelivery.frame = CGRectMake(self.labelTimeDelivery.frame.origin.x , 500, self.labelTimeDelivery.frame.size.width , self.labelTimeDelivery.frame.size.height);
                            
                            
                            
                            self.labelAddressDelivery.frame = CGRectMake(self.labelAddressDelivery.frame.origin.x , 530, self.labelAddressDelivery.frame.size.width , self.labelAddressDelivery.frame.size.height);
                            
                            self.PhotoTracking.frame = CGRectMake(self.PhotoTracking.frame.origin.x+40 , 225, self.PhotoTracking.frame.size.width+8 , self.PhotoTracking.frame.size.height+8);
                            
                            self.labelDownTrack.frame = CGRectMake(self.labelDownTrack.frame.origin.x-35 , self.labelDownTrack.frame.origin.y, self.labelDownTrack.frame.size.width , self.labelDownTrack.frame.size.height);
                            self.NameTracking.frame = CGRectMake(self.NameTracking.frame.origin.x-35 , self.NameTracking.frame.origin.y, self.NameTracking.frame.size.width , self.NameTracking.frame.size.height);
                            
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
#pragma mark - muestra de la informacion de la order en el tracking y cambio de formato para poder mostrar el dia de la fecha
                        
                        NSDateFormatter *dateFormatte = [[NSDateFormatter alloc] init];
                        
                        [dateFormatte setDateFormat:@"MM/dd/yyyy"];
                        
                        NSDate *pickupdate = [[NSDate alloc] init];
                        
                        NSDate *deliverydate=[[NSDate alloc] init];
                        
                        pickupdate= [dateFormatte dateFromString:object[@"Pickupdate"]];
                        
                        deliverydate=[dateFormatte dateFromString:object[@"Dropoffdate"]];
                        
                        NSDateFormatter *format=[[NSDateFormatter alloc]init];
                        
                        [format setDateFormat:@"EEEE"];
                        
                        self.labelWeekdayPickup.text=[format stringFromDate:pickupdate];
                        
                        self.labelWeekdayDelivery.text=[format stringFromDate:deliverydate ];
                        
                        self.labelDatePickup.text=object[@"Pickupdate"];
                        
                        self.labelDateDelivery.text=object[@"Dropoffdate"];
                        
                        self.labelTimePickup.text=object[@"PickHour"];
                        
                        self.labelTimeDelivery.text=object[@"Deliveryhour"];
                        
                        self.labelAddressPickup.text= [NSString stringWithFormat:@"%@ ,  %@ ",object[@"PickupAddress"],object[@"PickupZipcode"]];
                        
                        self.labelAddressDelivery.text=[NSString stringWithFormat:@"%@ , %@",object[@"DeliveryAddress"], object[@"DeliveryZipcode"]];
                        
                        self.NameTracking.text=object[@"DriverUsername"];
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }
            
            
            
            
            
            
            
            
            
#pragma mark - else si ningun driver a aceptado la orden
                    else{
                        
                        
                        
                        progess=0.0;
                        
                        proges1=0.0;
                        
                        proges2=0.0;
                 
                        
                        
                        [self.PickupProgess setProgress:progess];
                        
                        [self.DryCleaningProgress setProgress:proges1];
                        
                        [self.DeliveryProgress setProgress:proges2];
                        
                        
                        
                        self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 665);
                        
                        self.PhotoTracking.hidden=true;
                        
                        self.NameTracking.hidden=true;
                        
                        self.labelDownTrack.hidden=true;
                        
                        
                        
                        
                        
                        if(self.Window.frame.size.height <= 480 ){
                            
                            //4s
                            
                            self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 660);
                            
                            self.CancelPickup.frame = CGRectMake(self.CancelPickup.frame.origin.x , 480, self.CancelPickup.frame.size.width , self.CancelPickup.frame.size.height);
                            
                            self.LineHorizontal.frame = CGRectMake(self.LineHorizontal.frame.origin.x , 228, self.LineHorizontal.frame.size.width , self.LineHorizontal.frame.size.height);
                            
                            //
                            
                            self.LineVertical.frame = CGRectMake(self.LineVertical.frame.origin.x , 248, self.LineVertical.frame.size.width , self.LineVertical.frame.size.height);
                            
                            
                            
                            self.timeOne.frame = CGRectMake(self.timeOne.frame.origin.x , 258, self.timeOne.frame.size.width , self.timeOne.frame.size.height);
                            
                            
                            
                            self.LabelPickupTime.frame = CGRectMake(self.LabelPickupTime.frame.origin.x , 295, self.LabelPickupTime.frame.size.width , self.LabelPickupTime.frame.size.height);
                            
                            
                            
                            self.labelWeekdayPickup.frame = CGRectMake(self.labelWeekdayPickup.frame.origin.x , 325, self.labelWeekdayPickup.frame.size.width , self.labelWeekdayPickup.frame.size.height);
                            
                            
                            
                            self.labelDatePickup.frame = CGRectMake(self.labelDatePickup.frame.origin.x , 355, self.labelDatePickup.frame.size.width , self.labelDatePickup.frame.size.height);
                            
                            
                            
                            self.labelTimePickup.frame = CGRectMake(self.labelTimePickup.frame.origin.x , 385, self.labelTimePickup.frame.size.width , self.labelTimePickup.frame.size.height);
                            
                            
                            
                            self.labelAddressPickup.frame = CGRectMake(self.labelAddressPickup.frame.origin.x , 415, self.labelAddressPickup.frame.size.width , self.labelAddressPickup.frame.size.height);
                            
                            
                            
                            
                            
                            self.timeTwo.frame = CGRectMake(self.timeTwo.frame.origin.x , 258, self.timeTwo.frame.size.width , self.timeTwo.frame.size.height);
                            
                            
                            
                            self.labelDeliveryTime.frame = CGRectMake(self.labelDeliveryTime.frame.origin.x , 295, self.labelDeliveryTime.frame.size.width , self.labelDeliveryTime.frame.size.height);
                            
                            
                            
                            self.labelWeekdayDelivery.frame = CGRectMake(self.labelWeekdayDelivery.frame.origin.x , 325, self.labelWeekdayDelivery.frame.size.width , self.labelWeekdayDelivery.frame.size.height);
                            
                            
                            
                            self.labelDateDelivery.frame = CGRectMake(self.labelDateDelivery.frame.origin.x , 355, self.labelDateDelivery.frame.size.width , self.labelDateDelivery.frame.size.height);
                            
                            
                            
                            self.labelTimeDelivery.frame = CGRectMake(self.labelTimeDelivery.frame.origin.x , 385, self.labelTimeDelivery.frame.size.width , self.labelTimeDelivery.frame.size.height);
                            
                            
                            
                            self.labelAddressDelivery.frame = CGRectMake(self.labelAddressDelivery.frame.origin.x , 415, self.labelAddressDelivery.frame.size.width , self.labelAddressDelivery.frame.size.height);
                            
                            
                            
                        }else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                            
                            
                            
                            //5 - 5s
                            
                            self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 660);
                            
                            self.CancelPickup.frame = CGRectMake(self.CancelPickup.frame.origin.x , 480, self.CancelPickup.frame.size.width , self.CancelPickup.frame.size.height);
                            
                            
                            //
                            self.LineHorizontal.frame = CGRectMake(self.LineHorizontal.frame.origin.x , 228, self.LineHorizontal.frame.size.width , self.LineHorizontal.frame.size.height);
                            
                            
                            
                            self.LineVertical.frame = CGRectMake(self.LineVertical.frame.origin.x , 248, self.LineVertical.frame.size.width , self.LineVertical.frame.size.height);
                            
                            
                            
                            self.timeOne.frame = CGRectMake(self.timeOne.frame.origin.x , 258, self.timeOne.frame.size.width , self.timeOne.frame.size.height);
                            
                            
                            
                            self.LabelPickupTime.frame = CGRectMake(self.LabelPickupTime.frame.origin.x , 295, self.LabelPickupTime.frame.size.width , self.LabelPickupTime.frame.size.height);
                            
                            
                            
                            self.labelWeekdayPickup.frame = CGRectMake(self.labelWeekdayPickup.frame.origin.x , 325, self.labelWeekdayPickup.frame.size.width , self.labelWeekdayPickup.frame.size.height);
                            
                            
                            
                            self.labelDatePickup.frame = CGRectMake(self.labelDatePickup.frame.origin.x , 355, self.labelDatePickup.frame.size.width , self.labelDatePickup.frame.size.height);
                            
                            
                            
                            self.labelTimePickup.frame = CGRectMake(self.labelTimePickup.frame.origin.x , 385, self.labelTimePickup.frame.size.width , self.labelTimePickup.frame.size.height);
                            
                            
                            
                            self.labelAddressPickup.frame = CGRectMake(self.labelAddressPickup.frame.origin.x , 415, self.labelAddressPickup.frame.size.width , self.labelAddressPickup.frame.size.height);
                            
                            
                            
                            
                            
                            self.timeTwo.frame = CGRectMake(self.timeTwo.frame.origin.x , 258, self.timeTwo.frame.size.width , self.timeTwo.frame.size.height);
                            
                            
                            
                            self.labelDeliveryTime.frame = CGRectMake(self.labelDeliveryTime.frame.origin.x , 295, self.labelDeliveryTime.frame.size.width , self.labelDeliveryTime.frame.size.height);
                            
                            
                            
                            self.labelWeekdayDelivery.frame = CGRectMake(self.labelWeekdayDelivery.frame.origin.x , 325, self.labelWeekdayDelivery.frame.size.width , self.labelWeekdayDelivery.frame.size.height);
                            
                            
                            
                            self.labelDateDelivery.frame = CGRectMake(self.labelDateDelivery.frame.origin.x , 355, self.labelDateDelivery.frame.size.width , self.labelDateDelivery.frame.size.height);
                            
                            
                            
                            self.labelTimeDelivery.frame = CGRectMake(self.labelTimeDelivery.frame.origin.x , 385, self.labelTimeDelivery.frame.size.width , self.labelTimeDelivery.frame.size.height);
                            
                            
                            
                            self.labelAddressDelivery.frame = CGRectMake(self.labelAddressDelivery.frame.origin.x , 415, self.labelAddressDelivery.frame.size.width , self.labelAddressDelivery.frame.size.height);
                            
                            
                            
                        }else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                            
                            
                            
                            //6
                            
                            
                            
                            self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 700);
                            
                            
                            
                            _LineVertical.frame = CGRectMake(_LineVertical.frame.origin.x, _LineVertical.frame.origin.y, _LineVertical.frame.size.width,_LineVertical.frame.size.height+30);
                            
                            
                            
                            self.CancelPickup.frame = CGRectMake(self.CancelPickup.frame.origin.x , 550, self.CancelPickup.frame.size.width , self.CancelPickup.frame.size.height);
                            
                            
                            
                            //
                            
                            self.timeOne.frame = CGRectMake(_timeOne.frame.origin.x+15, _timeOne.frame.origin.y, _timeOne.frame.size.width,_timeOne.frame.size.height);
                            
                            
                            self.timeTwo.frame = CGRectMake(_timeTwo.frame.origin.x-10, _timeTwo.frame.origin.y, _timeTwo.frame.size.width,_timeTwo.frame.size.height);
                            
                            self.LineHorizontal.frame = CGRectMake(self.LineHorizontal.frame.origin.x , 228, self.LineHorizontal.frame.size.width , self.LineHorizontal.frame.size.height);
                            
                            
                            
                            self.LineVertical.frame = CGRectMake(self.LineVertical.frame.origin.x , 248, self.LineVertical.frame.size.width , self.LineVertical.frame.size.height);
                            
                            
                            
                            self.timeOne.frame = CGRectMake(self.timeOne.frame.origin.x , 258, self.timeOne.frame.size.width , self.timeOne.frame.size.height);
                            
                            
                            
                            self.LabelPickupTime.frame = CGRectMake(self.LabelPickupTime.frame.origin.x , 295, self.LabelPickupTime.frame.size.width , self.LabelPickupTime.frame.size.height);
                            
                            
                            
                            self.labelWeekdayPickup.frame = CGRectMake(self.labelWeekdayPickup.frame.origin.x , 325, self.labelWeekdayPickup.frame.size.width , self.labelWeekdayPickup.frame.size.height);
                            
                            
                            
                            self.labelDatePickup.frame = CGRectMake(self.labelDatePickup.frame.origin.x , 355, self.labelDatePickup.frame.size.width , self.labelDatePickup.frame.size.height);
                            
                            
                            
                            self.labelTimePickup.frame = CGRectMake(self.labelTimePickup.frame.origin.x , 385, self.labelTimePickup.frame.size.width , self.labelTimePickup.frame.size.height);
                            
                            
                            
                            self.labelAddressPickup.frame = CGRectMake(self.labelAddressPickup.frame.origin.x , 415, self.labelAddressPickup.frame.size.width , self.labelAddressPickup.frame.size.height);
                            
                            
                            
                            
                            
                            self.timeTwo.frame = CGRectMake(self.timeTwo.frame.origin.x , 258, self.timeTwo.frame.size.width , self.timeTwo.frame.size.height);
                            
                            
                            
                            self.labelDeliveryTime.frame = CGRectMake(self.labelDeliveryTime.frame.origin.x , 295, self.labelDeliveryTime.frame.size.width , self.labelDeliveryTime.frame.size.height);
                            
                            
                            
                            self.labelWeekdayDelivery.frame = CGRectMake(self.labelWeekdayDelivery.frame.origin.x , 325, self.labelWeekdayDelivery.frame.size.width , self.labelWeekdayDelivery.frame.size.height);
                            
                            
                            
                            self.labelDateDelivery.frame = CGRectMake(self.labelDateDelivery.frame.origin.x , 355, self.labelDateDelivery.frame.size.width , self.labelDateDelivery.frame.size.height);
                            
                            
                            
                            self.labelTimeDelivery.frame = CGRectMake(self.labelTimeDelivery.frame.origin.x , 385, self.labelTimeDelivery.frame.size.width , self.labelTimeDelivery.frame.size.height);
                            
                            
                            
                            self.labelAddressDelivery.frame = CGRectMake(self.labelAddressDelivery.frame.origin.x , 415, self.labelAddressDelivery.frame.size.width , self.labelAddressDelivery.frame.size.height);
                            
                            
                            
                            
                        }else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                            
                            
                            
                            //6 plus
                            
                            
                            self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 700);
                            
                            _LineVertical.frame = CGRectMake(_LineVertical.frame.origin.x, _LineVertical.frame.origin.y, _LineVertical.frame.size.width,_LineVertical.frame.size.height+80);
                            
                            self.timeOne.frame = CGRectMake(_timeOne.frame.origin.x+20, _timeOne.frame.origin.y, _timeOne.frame.size.width+9,_timeOne.frame.size.height+9);
                            
                            
                            self.timeTwo.frame = CGRectMake(_timeTwo.frame.origin.x-20, _timeTwo.frame.origin.y, _timeTwo.frame.size.width+9,_timeTwo.frame.size.height+9);
                            
                            
                            
                            self.LineHorizontal.frame = CGRectMake(self.LineHorizontal.frame.origin.x , 228, self.LineHorizontal.frame.size.width , self.LineHorizontal.frame.size.height);
                            
                            
                            
                            self.LineVertical.frame = CGRectMake(self.LineVertical.frame.origin.x , 248, self.LineVertical.frame.size.width , self.LineVertical.frame.size.height);
                            
                            
                            
                            self.timeOne.frame = CGRectMake(self.timeOne.frame.origin.x , 258, self.timeOne.frame.size.width , self.timeOne.frame.size.height);
                            
                            
                            
                            self.LabelPickupTime.frame = CGRectMake(self.LabelPickupTime.frame.origin.x , 310, self.LabelPickupTime.frame.size.width , self.LabelPickupTime.frame.size.height);
                            
                            
                            
                            self.labelWeekdayPickup.frame = CGRectMake(self.labelWeekdayPickup.frame.origin.x , 340, self.labelWeekdayPickup.frame.size.width , self.labelWeekdayPickup.frame.size.height);
                            
                            
                            
                            self.labelDatePickup.frame = CGRectMake(self.labelDatePickup.frame.origin.x , 370, self.labelDatePickup.frame.size.width , self.labelDatePickup.frame.size.height);
                            
                            
                            
                            self.labelTimePickup.frame = CGRectMake(self.labelTimePickup.frame.origin.x , 400, self.labelTimePickup.frame.size.width , self.labelTimePickup.frame.size.height);
                            
                            
                            
                            self.labelAddressPickup.frame = CGRectMake(self.labelAddressPickup.frame.origin.x , 430, self.labelAddressPickup.frame.size.width , self.labelAddressPickup.frame.size.height);
                            
                            
                            
                            
                            
                            self.timeTwo.frame = CGRectMake(self.timeTwo.frame.origin.x , 258, self.timeTwo.frame.size.width , self.timeTwo.frame.size.height);
                            
                            
                            
                            self.labelDeliveryTime.frame = CGRectMake(self.labelDeliveryTime.frame.origin.x , 310, self.labelDeliveryTime.frame.size.width , self.labelDeliveryTime.frame.size.height);
                            
                            
                            
                            self.labelWeekdayDelivery.frame = CGRectMake(self.labelWeekdayDelivery.frame.origin.x , 340, self.labelWeekdayDelivery.frame.size.width , self.labelWeekdayDelivery.frame.size.height);
                            
                            
                            
                            self.labelDateDelivery.frame = CGRectMake(self.labelDateDelivery.frame.origin.x , 370, self.labelDateDelivery.frame.size.width , self.labelDateDelivery.frame.size.height);
                            
                            
                            
                            self.labelTimeDelivery.frame = CGRectMake(self.labelTimeDelivery.frame.origin.x , 400, self.labelTimeDelivery.frame.size.width , self.labelTimeDelivery.frame.size.height);
                            
                            
                            
                            self.labelAddressDelivery.frame = CGRectMake(self.labelAddressDelivery.frame.origin.x , 430, self.labelAddressDelivery.frame.size.width , self.labelAddressDelivery.frame.size.height);
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        
#pragma mark - muestra de la informacion de la order en el tracking y cambio de formato para poder mostrar el dia de la fecha
                        
                        NSDateFormatter *dateFormatte = [[NSDateFormatter alloc] init];
                        
                        [dateFormatte setDateFormat:@"MM/dd/yyyy"];
                        
                        NSDate *pickupdate = [[NSDate alloc] init];
                        
                        NSDate *deliverydate=[[NSDate alloc] init];
                        
                        pickupdate= [dateFormatte dateFromString:object[@"Pickupdate"]];
                        
                        deliverydate=[dateFormatte dateFromString:object[@"Dropoffdate"]];
                        
                        NSDateFormatter *format=[[NSDateFormatter alloc]init];
                        
                        [format setDateFormat:@"EEEE"];
                        
                        self.labelWeekdayPickup.text=[format stringFromDate:pickupdate];
                        
                        self.labelWeekdayDelivery.text=[format stringFromDate:deliverydate ];
                        
                        self.labelDatePickup.text=object[@"Pickupdate"];
                        
                        self.labelDateDelivery.text=object[@"Dropoffdate"];
                        
                        self.labelTimePickup.text=object[@"PickHour"];
                        
                        self.labelTimeDelivery.text=object[@"Deliveryhour"];
                        
                        self.labelAddressPickup.text= [NSString stringWithFormat:@"%@ ,  %@ ",object[@"PickupAddress"],object[@"PickupZipcode"]];
                        
                        self.labelAddressDelivery.text=[NSString stringWithFormat:@"%@ , %@",object[@"DeliveryAddress"], object[@"DeliveryZipcode"]];
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }
            
            
            
            
            
            
            
        }
        
        
        
    }];
    
    
    
    
    
    
    
    
    
    /* _LineVertical.frame = CGRectMake(_LineVertical.frame.origin.x, _LineVertical.frame.origin.y, _LineVertical.frame.size.width,_LineVertical.frame.size.height+60);*/
    
    
    
    // Do any additional setup after loading the view.
    
    
    
    /*
     
     [self.PickupProgess setProgress:progess];
     
     timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(PickupProgeso:) userInfo:nil repeats:YES];
     
     
     
     [self.DryCleaningProgress setProgress:proges1];
     
     
     
     
     
     
     
     timer1 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(DryCleaningProgeso:) userInfo:nil repeats:YES];
     
     
     
     
     
     
     
     [self.DeliveryProgress setProgress:proges2];
     
     timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(DeliveryProgeso:) userInfo:nil repeats:YES];*/
    
    
    
}



#pragma mark - inicializacion de los progress view

- (void) moreProgress {
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    self.PickupLabel.textColor=[UIColor colorWithRed:0 green:0.902 blue:0.525 alpha:1];
    
    
    NSDate *startTime = [NSDate dateWithTimeIntervalSince1970:[[user objectForKey:@"time"]doubleValue]];
    
    NSTimeInterval elapsedTime = -[startTime timeIntervalSinceNow];
    
    progreso = (float)elapsedTime/(timepick * 60.0);
    
    [self.PickupProgess setProgress:progreso];
    
    if (progreso >= 1)
        
    {
        self.PickupImage.image=[ UIImage imageNamed :@ "pickup2.png" ];
        self.checkballPickup.hidden=NO;
        
        flag=1;
    }
    
    
    
}

- (void) moreProgres {
    
    NSUserDefaults *use = [NSUserDefaults standardUserDefaults];
    
    NSDate *startTim = [NSDate dateWithTimeIntervalSince1970:[[use objectForKey:@"time2"]doubleValue]];
    
    NSTimeInterval elapsedTim = -[startTim timeIntervalSinceNow];
    
    if(launpdrop ==1){
        
        progre = (float)elapsedTim/(4.0 * 60.0);
        self.DryCleaningLabel.textColor= [UIColor colorWithRed:0 green:0.902 blue:0.525 alpha:1];
 
        [self.DryCleaningProgress setProgress:progre];
        
        if (progre >= 1)
            
        {
            
            self.DryCleaningImage.image=[ UIImage imageNamed :@ "process2.png" ];
            self.checkballCleaning.hidden=NO;
            flag=1;
            
            // The timer is end, you should stop it and do what you need
            
        }
        
    }else {
        
        
        
        [self.DryCleaningProgress setProgress:0.0];
        
        
        
    }
    
}



- (void) moreProgre {
    
    NSUserDefaults *ue = [NSUserDefaults standardUserDefaults];
    
    NSDate *startTi = [NSDate dateWithTimeIntervalSince1970:[[ue objectForKey:@"time3"]doubleValue]];
    
    NSTimeInterval elapsedTi = -[startTi timeIntervalSinceNow];
    
    
    
    
    
    if(deliveryVerify==1){
        
        progr = (float)elapsedTi/(timedelivery * 60.0);
        
        [self.DeliveryProgress setProgress:progr];
        self.DeliveryLabel.textColor= [UIColor colorWithRed:0 green:0.902 blue:0.525 alpha:1];
        
        if (progr >= 1)
            
        {
            
            
            self.checkballDelivery.hidden=NO;
            self.DeliveryImage.image=[ UIImage imageNamed :@ "delivery2.png" ];
            
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"time"];[[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"time3"];[[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"time2"];[[NSUserDefaults standardUserDefaults] synchronize];
            
            
            
            /*    NSUserDefaults *time = [NSUserDefaults standardUserDefaults];
             
             [time setFloat:1.0 forKey:@"flag"];
             
             [time synchronize];*/
            
            
            
            
            
        }
        
    }else {
        
        
        
        [self.DeliveryProgress setProgress:0.0];
        
        
        
        
        
    }
    
}


-(void)ToMenu{
    [self performSegueWithIdentifier:@"Menusegue" sender:self];
}

-(void)Topay{
    [self performSegueWithIdentifier:@"Paysegue" sender:self];
}







/*-(void)PickupProgeso:(id)sender{
 
 if([pickup isEqualToString:@"acept"]) {
 
 
 
 if (progess>=1.00) {
 
 [timer invalidate];
 
 if ((progess=1)) {
 
 self.PickupImage.image=[ UIImage imageNamed :@ "pickup2.png" ];
 
 //self.DeliveryImage.hidden=YES;
 
 
 
 }
 
 }
 
 progess+=0.01;
 
 
 
 }
 
 
 
 
 
 }
 
 
 
 
 
 
 
 -(void)DryCleaningProgeso:(id)sender{
 
 
 
 
 
 
 
 
 
 if (proges1>=1.00) {
 
 [timer1 invalidate];
 
 if ((proges1=1)) {
 
 self.DryCleaningImage.image=[ UIImage imageNamed :@ "process2.png" ];
 
 //self.DeliveryImage.hidden=YES;
 
 
 
 }
 
 
 
 proges1+=0.01;
 
 [self.DryCleaningProgress setProgress:proges1];
 
 }
 
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 -(void)DeliveryProgeso:(id)sender{
 
 
 
 if (proges2>=1.00) {
 
 [timer2 invalidate];
 
 if ((proges2=1)) {
 
 self.DeliveryImage.image=[ UIImage imageNamed :@ "delivery2.png" ];
 
 //self.DeliveryImage.hidden=YES;
 
 }
 
 }
 
 proges2+=0.01;
 
 [self.DeliveryProgress setProgress:proges2];
 
 
 
 
 
 }
 
 
 
 
 
 
 
 
 
 
 
 */







- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)CancelPickup:(id)sender {
    PFQuery *orde = [PFQuery queryWithClassName:@"Order"];
    PFUser *user = [PFUser currentUser];
    [orde whereKey:@"username" equalTo:user[@"username"]];
    [orde whereKey:@"Verify" equalTo:@NO];
    [orde orderByAscending:@"createdAt"];
    [orde getFirstObjectInBackgroundWithBlock:^(PFObject *result,NSError *error){
        if (!error) {
            [result deleteInBackground];
            [self performSegueWithIdentifier:@"ToOrder" sender:self];
        }else{
            NSLog(@"%@",error.description);
        }
    }];
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