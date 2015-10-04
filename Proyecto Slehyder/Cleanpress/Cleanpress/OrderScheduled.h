//
//  OrderScheduled.h
//  Cleanpress
//
//  Created by Slehyder Martinez on 8/22/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>
@interface OrderScheduled : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,CLLocationManagerDelegate>
{

    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    CLGeocoder *geocode;
    CLPlacemark *placemark;
    NSArray *location1;
    NSArray *zipcodes;
    UIDatePicker *datePicker;
    UIPickerView *TimePicker;
    UIPickerView *TimePickerTwo;
    NSMutableArray *datapickerParse;

}
@property (weak, nonatomic) IBOutlet UITextField *AddressPick;
@property (weak, nonatomic) IBOutlet UITextField *StateCityPick;
@property (weak, nonatomic) IBOutlet UITextField *ZipcodePick;
@property (weak, nonatomic) IBOutlet UITextField *SpecialNotesPick;
@property (weak, nonatomic) IBOutlet UITextField *SelectPick;
@property (weak, nonatomic) IBOutlet UITextField *DatePick;
@property (weak, nonatomic) IBOutlet UITextField *HourPick;
@property (weak, nonatomic) IBOutlet UILabel *LabelPick;
@property (weak, nonatomic) IBOutlet UILabel *WeekPick;
@property (weak, nonatomic) IBOutlet UILabel *LineVerticalPick;
@property (weak, nonatomic) IBOutlet UIButton *UseAddresDeliveryBtn;
@property (weak, nonatomic) IBOutlet UILabel *LabelDeliveryAddress;
@property (weak, nonatomic) IBOutlet UITextField *AddressDelivery;
@property (weak, nonatomic) IBOutlet UITextField *StateCityDelivery;
@property (weak, nonatomic) IBOutlet UITextField *ZipcodeDelivery;
@property (weak, nonatomic) IBOutlet UILabel *LineHorizontalDeli_1;
@property (weak, nonatomic) IBOutlet UILabel *LineVerticalDeli_2;
@property (weak, nonatomic) IBOutlet UILabel *LineHorizontalDeli_3;
@property (weak, nonatomic) IBOutlet UITextField *SpecialNotesDelivery;
@property (weak, nonatomic) IBOutlet UILabel *LineHorizontalDeli_4;
@property (weak, nonatomic) IBOutlet UILabel *LabelThisLocation;
@property (weak, nonatomic) IBOutlet UITextField *SelectDelivery;
@property (weak, nonatomic) IBOutlet UIImageView *ArrowblueDeliveryAdd;
@property (weak, nonatomic) IBOutlet UIImageView *ArrowbluePick;
@property (weak, nonatomic) IBOutlet UIImageView *ArrowbluePickAdd;
@property (weak, nonatomic) IBOutlet UILabel *LabelDelivery;
@property (weak, nonatomic) IBOutlet UITextField *DateDelivery;
@property (weak, nonatomic) IBOutlet UILabel *WeekDelivery;
@property (weak, nonatomic) IBOutlet UITextField *HourDelivery;
@property (weak, nonatomic) IBOutlet UIImageView *ArrowblueDelivery;
@property (weak, nonatomic) IBOutlet UIButton *PlaceOrder;
@property (weak, nonatomic) IBOutlet UILabel *LineVerticalDeli_5;
@property (weak, nonatomic) IBOutlet UINavigationItem *topbar;

@end
