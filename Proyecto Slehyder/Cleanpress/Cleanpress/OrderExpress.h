//
//  OrderExpress.h
//  Cleanpress
//

//  Created by Slehyder Martinez on 8/15/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>
@interface OrderExpress : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,CLLocationManagerDelegate>
{

    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    CLGeocoder *geocode;
    CLPlacemark *placemark;
    NSArray *location1;
    NSArray *zipcodes;
    UIDatePicker *datePicker;
    UIPickerView *TimePicker;
    NSMutableArray *datapickerParse;

}
@property(nonatomic, weak) id< UIPickerViewDataSource > dataSource;
@property (strong, nonatomic) IBOutlet UIView *Window;
@property (weak, nonatomic) IBOutlet UILabel *lineBlue;
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (weak, nonatomic) IBOutlet UITextField *Address;
@property (weak, nonatomic) IBOutlet UITextField *StateCity;
@property (weak, nonatomic) IBOutlet UITextField *Zipcode;
@property (weak, nonatomic) IBOutlet UITextField *textLocation;
@property (weak, nonatomic) IBOutlet UIButton *BtnConfLocation;
@property (weak, nonatomic) IBOutlet UIButton *Continue;
@property (weak, nonatomic) IBOutlet UILabel *datepick;
@property (weak, nonatomic) IBOutlet UILabel *weekpick;
@property (weak, nonatomic) IBOutlet UILabel *hourpick;
@property (weak, nonatomic) IBOutlet UIView *Window2;
@property (weak, nonatomic) IBOutlet UIView *Window1;
@property (weak, nonatomic) IBOutlet UIScrollView *Scrollview2;

@property (weak, nonatomic) IBOutlet UINavigationItem *topbar;

@property (weak, nonatomic) IBOutlet MKMapView *mapview;


@property (weak, nonatomic) IBOutlet UITextField *AddressDelivery;
@property (weak, nonatomic) IBOutlet UITextField *StateCityDelivery;
@property (weak, nonatomic) IBOutlet UITextField *ZipcodeDelivery;

@property (weak, nonatomic) IBOutlet UIButton *BtnConfLocationDelivery;
@property (weak, nonatomic) IBOutlet UIButton *btnDeleteTextF;
@property (weak, nonatomic) IBOutlet UITextField *datedelivery;

@property (weak, nonatomic) IBOutlet UILabel *weekdelivery;
@property (weak, nonatomic) IBOutlet UITextField *hourdelivery;

@property (weak, nonatomic) IBOutlet UITextField *textLocation1;


@end
