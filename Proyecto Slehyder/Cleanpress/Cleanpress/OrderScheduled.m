//
//  OrderScheduled.m
//  Cleanpress
//
//  Created by Slehyder Martinez on 8/22/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import "OrderScheduled.h"
#import <Parse/Parse.h>
#import "QuartzCore/QuartzCore.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MapKit/MapKit.h>
#import "MBProgressHUD.h"
long imagens= 0;
long imagendelis= 0;
long imles = 0;
long flagmaps = 0;
long flagdates=1;
NSString *PickAddresss,*PickStats,*PickZis,*PickDas,*PickHous,*DeliveryAddresss,*DeliveryStats,*DeliveryZis,*DeliveryDas,*DeliveryHous,*users;
int ordernum;
PFUser *current;
@interface OrderScheduled ()

@end

@implementation OrderScheduled
NSArray *pickerDa;
UIPickerView *Pick;
UIPickerView *Pickezipcod;
PFObject *loc;
NSDate *dateDeliver;
NSDate *dateOn;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc] init];
    geocode = [[CLGeocoder alloc]init];
    
    [locationManager requestAlwaysAuthorization];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.delegate=self;
    [locationManager startUpdatingLocation ];
    [locationManager requestAlwaysAuthorization];
    
    self.topbar.hidesBackButton = YES;
    [self.topbar setLeftItemsSupplementBackButton:YES];
    UIBarButtonItem *gomenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"go_back"] style:UIBarButtonItemStylePlain target:self action:@selector(BackOrderPickup)];
    [self.topbar setLeftBarButtonItem:gomenu animated:YES];
    self.topbar.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"go_back"]];
    
    current = [PFUser currentUser];
    
    // save User Addresses in an array
    users= current[@"username"];
    NSPredicate *userandlocation = [NSPredicate predicateWithFormat:@"username = %@",users];
    PFQuery *addressuser = [PFQuery queryWithClassName:@"Addresses" predicate:userandlocation];
    [addressuser findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            location1 =[NSArray arrayWithArray:objects];
            
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    PFQuery *quer = [PFQuery queryWithClassName:@"Hours"];
    [quer orderByAscending:@"createdAt"];
    [quer whereKeyExists:@"PM"];
    [quer findObjectsInBackgroundWithBlock:^(NSArray *object, NSError *error) {
        if (!error) {
            // La búsqueda se ha ejecutado correctamente y el NSArray objects
            // contiene los resultados de la misma.
            datapickerParse= [[NSMutableArray alloc]initWithArray:object];
            
            /* for (PFObject *object in datapickerParse) {
             
             NSLog(@"%@", [object objectForKey:@"AM"]);
             }*/
            [TimePicker reloadAllComponents];
            
        }
    }];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Horarios"];
    [query orderByAscending:@"createdAt"];
    [query whereKeyExists:@"AM"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // La búsqueda se ha ejecutado correctamente y el NSArray objects
            // contiene los resultados de la misma.
            datapickerParse = [[NSMutableArray alloc]initWithArray:objects];
            /* for (PFObject *object in datapickerParse) {
             
             NSLog(@"%@", [object objectForKey:@"AM"]);
             }*/
            [TimePickerTwo reloadAllComponents];
            
        }
    }];
    
    
    
    // Do any additional setup after loading the view.
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
