//
//  OrderExpress.m
//  Cleanpress
//
//  Created by Slehyder Martinez on 8/15/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import "OrderExpress.h"
#import <Parse/Parse.h>
#import "QuartzCore/QuartzCore.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MapKit/MapKit.h>
#import "MBProgressHUD.h"
long imagen= 0;
long imagendeli= 0;
long imle = 0;
long flagmap = 0;
long flagdate=1;
NSString *PickAddres,*PickStat,*PickZi,*PickDa,*PickHou,*DeliveryAddres,*DeliveryStat,*DeliveryZi,*DeliveryDa,*DeliveryHou,*user;
int ordernum;
PFUser *currentUs;
@interface OrderExpress ()

@end

@implementation OrderExpress
NSArray *pickerDat;
UIPickerView *Picke;
UIPickerView *Pickezipcode;
PFObject *locl;
NSDate *dateDelivery;
NSDate *dateOne;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    locationManager = [[CLLocationManager alloc] init];
    geocode = [[CLGeocoder alloc]init];

    [locationManager requestAlwaysAuthorization];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.delegate=self;
    [locationManager startUpdatingLocation ];
    
    self.mapview.showsUserLocation=true;
    self.mapview.mapType=MKMapTypeStandard;
    [locationManager requestAlwaysAuthorization];
    
    self.topbar.hidesBackButton = YES;
    [self.topbar setLeftItemsSupplementBackButton:YES];
    UIBarButtonItem *gomenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"go_back"] style:UIBarButtonItemStylePlain target:self action:@selector(BackOrderPickup)];
    [self.topbar setLeftBarButtonItem:gomenu animated:YES];
    self.topbar.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"go_back"]];
    // Do any additional setup after loading the view.
    
    currentUs = [PFUser currentUser];
    
    // save User Addresses in an array
    user= currentUs[@"username"];
    NSPredicate *userandlocation = [NSPredicate predicateWithFormat:@"username = %@",user];
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
    
    
    //finish saved user Addresses
    //Save zipcodes in an array
    
   /* PFQuery *Zipquery = [PFQuery queryWithClassName:@"ZipCode"];
    zipcodes = [Zipquery findObjects];*/

    PickAddres = [[NSString alloc]init];
    PickAddres = _textLocation.text;
    PickStat = [[NSString alloc]init];
    PickZi = [[NSString alloc]init];
   
    UITapGestureRecognizer *touchbegan = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [_ScrollView addGestureRecognizer:touchbegan];
    [_Scrollview2 addGestureRecognizer:touchbegan];
    pickerDat=@[@"Home",@"Work",@"Other"];
    Picke = [[UIPickerView alloc]init];
    Picke.backgroundColor = [UIColor whiteColor];
    Picke.dataSource = self;
    Picke.delegate = self;
    [self.textLocation setInputView:Picke];
    [self.textLocation1 setInputView:Picke];
    pickerDat=@[@"Home",@"Work",@"Other",@"Don't save"];
    UIToolbar *tooled = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.Window.frame.size.height, 44)];
    UIBarButtonItem *done1= [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(HideKeyboard)];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [tooled setItems:[NSArray arrayWithObjects:spacer,done1, nil]];
    [self.textLocation setInputAccessoryView:tooled];
    [self.textLocation1 setInputAccessoryView:tooled];
    
    Pickezipcode = [[UIPickerView alloc]init];
    Pickezipcode.backgroundColor = [UIColor whiteColor];
    Pickezipcode.dataSource = self;
    Pickezipcode.delegate = self;
    [self.ZipcodeDelivery setInputView:Pickezipcode];
    UIToolbar *tool = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.Window.frame.size.height, 44)];
    UIBarButtonItem *donekey= [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(keyretraitZipcode)];
    UIBarButtonItem *spacerkey = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [tool setItems:[NSArray arrayWithObjects:spacerkey,donekey, nil]];
    [self.ZipcodeDelivery setInputAccessoryView:tool];
    
    datePicker=[[UIDatePicker alloc]init];
    datePicker.backgroundColor = [UIColor whiteColor];
    datePicker.datePickerMode=UIDatePickerModeDate;
    [self.datedelivery setInputView:datePicker];
    
    TimePicker=[[UIPickerView alloc]init];
    TimePicker.tag=1;
    TimePicker.backgroundColor = [UIColor whiteColor];
    TimePicker.delegate=self;
    TimePicker.dataSource=self;
    [self.hourdelivery setInputView:TimePicker];
    
    UIToolbar *tooldate=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [tooldate setTintColor:[UIColor cyanColor]];
    UIBarButtonItem *doneBtndate=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(showSelectedDateOne)];
    UIBarButtonItem *spacedate=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [tooldate setItems:[NSArray arrayWithObjects:spacedate,doneBtndate, nil]];
    [self.datedelivery setInputAccessoryView:tooldate];
    
    UIToolbar *tooltime=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [tooltime setTintColor:[UIColor cyanColor]];
    UIBarButtonItem *donebtntime=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(showSelectedTimeOne)];
    UIBarButtonItem *spacetime=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [tooltime setItems:[NSArray arrayWithObjects:spacetime,donebtntime, nil]];
    [self.hourdelivery setInputAccessoryView:tooltime];
    
    
    #pragma mark - pickup view
    self.lineBlue.layer.zPosition=2;

    NSDate *now = [NSDate date];
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = 0;
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    NSDate *nextDate = [theCalendar dateByAddingComponents:dayComponent toDate:now options:0];
    
    NSDateFormatter * dateFormatt = [[ NSDateFormatter alloc ] init ];
    [ dateFormatt setDateFormat : @ "MM/dd/yyyy" ];
    
    self.datepick.text = [ dateFormatt stringFromDate : nextDate];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"EEEE"];
    self.weekpick.text = [format stringFromDate:nextDate];
    
    NSDateComponents *dayCompone = [[NSDateComponents alloc] init];
    dayCompone.day = 1;
    NSCalendar *theCalend = [NSCalendar currentCalendar];
    NSDate *nextD = [theCalend dateByAddingComponents:dayCompone toDate:now options:0];
    NSDateFormatter * dateForm = [[ NSDateFormatter alloc ] init ];
    [ dateForm setDateFormat : @ "MM/dd/yyyy" ];
    self.datedelivery.text = [ dateForm stringFromDate : nextD];
    NSDateFormatter *form=[[NSDateFormatter alloc]init];
    [form setDateFormat:@"EEEE"];
    self.weekdelivery.text = [format stringFromDate:nextD];
    
    NSDateFormatter * actuality = [[ NSDateFormatter alloc ] init ];
    [ actuality setDateFormat : @ "dd-MM-yyyy" ];
    NSString * strDate = [ actuality stringFromDate : now ];
    
    NSDateFormatter *actuality1 = [[NSDateFormatter alloc] init];
    // this is imporant - we set our input date format to match our input string
    // if format doesn't match you'll get nil from your string, so be careful
    [actuality1 setDateFormat:@"dd-MM-yyyy"];
    // voila!
    dateOne= [actuality1 dateFromString:strDate];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:@"UIKeyboardWillShowNotification"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:@"UIKeyboardDidHideNotification"
                                               object:nil];
    
#pragma mark - Print the hour
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    [formatter setDateFormat:@"HH:mm"];

    
    NSDate *nowTime = [NSDate date];
    NSDateFormatter * timeFormatt = [[ NSDateFormatter alloc ] init ];
    [ timeFormatt setDateFormat : @ "hh" ];
    NSString * timestr = [ timeFormatt stringFromDate : nowTime];
NSString * hourexact=[timeFormatt stringFromDate:nowTime];
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm"];
    [timeFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    NSDate *TimeToday = [[NSDate alloc] init];
    // voila!
    TimeToday = [timeFormat dateFromString:timestr];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:[NSDate date]];
    
    NSInteger hour= [components hour];
    NSInteger minute = [components minute];
    NSDate *mydate = [NSDate date];
    NSTimeInterval secondsInEightHours =  30 * 60;
    NSDate *dateEightHoursAhead = [mydate dateByAddingTimeInterval:secondsInEightHours];
    
     NSDateComponents *component = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:dateEightHoursAhead];
    NSInteger h= [component hour];
    NSInteger min = [component minute];
    NSString *hx=[timeFormatt stringFromDate:dateEightHoursAhead];
    
    self.hourdelivery.text=@"6:30-7:00 pm";
    if (hour>=8) {
        if((long)min<=10)
        self.hourpick.text=[[NSString alloc] initWithFormat:@"%@:%ld - %@:0%ld am",hourexact,(long)minute,hx,(long)min];
        else if((long)minute<10)
        self.hourpick.text=[[NSString alloc] initWithFormat:@"%@:0%ld - %@:%ld am",hourexact,(long)minute,hx,(long)min];
        else
        self.hourpick.text=[[NSString alloc] initWithFormat:@"%@:%ld - %@:%ld am",hourexact,(long)minute,hx,(long)min];
        
    } if(hour>=12){
        if ((long)min<=10)
     self.hourpick.text=[[NSString alloc] initWithFormat:@"%@:%ld - %@:0%ld pm",hourexact,(long)minute,hx,(long)min];
        else if((long)minute<10){
            self.hourpick.text=[[NSString alloc] initWithFormat:@"%@:0%ld - %@:%ld pm",hourexact,(long)minute,hx,(long)min];}
        else
             self.hourpick.text=[[NSString alloc] initWithFormat:@"%@:%ld - %@:%ld pm",hourexact,(long)minute,hx,(long)min];
    }else if(hour>=21){
        self.hourpick.text=@"8:00-8:30 am";
        
        NSDate *now = [NSDate date];
        NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
        dayComponent.day = 1;
        NSDateComponents *dayComponen = [[NSDateComponents alloc] init];
        dayComponen.day = 2;
        NSCalendar *theCalendar = [NSCalendar currentCalendar];
        NSDate *nextDate = [theCalendar dateByAddingComponents:dayComponent toDate:now options:0];
        NSDateFormatter * dateFormatt = [[ NSDateFormatter alloc ] init ];
        [ dateFormatt setDateFormat : @ "MM/dd/yyyy" ];
        self.datepick.text = [ dateFormatt stringFromDate : nextDate];
        NSDateFormatter *format=[[NSDateFormatter alloc]init];
        [format setDateFormat:@"EEEE"];
        self.weekpick.text = [format stringFromDate:nextDate];
        
        NSDate *nextDat = [theCalendar dateByAddingComponents:dayComponen toDate:now options:0];
        self.datedelivery.text = [ dateFormatt stringFromDate : nextDat];
        self.weekdelivery.text = [format stringFromDate:nextDat];
        
        NSDateFormatter * actuality = [[ NSDateFormatter alloc ] init ];
        [ actuality setDateFormat : @ "dd-MM-yyyy" ];
        NSString * strDate = [ actuality stringFromDate : nextDate ];
        
        NSDateFormatter *actuality1 = [[NSDateFormatter alloc] init];
        // this is imporant - we set our input date format to match our input string
        // if format doesn't match you'll get nil from your string, so be careful
        [actuality1 setDateFormat:@"dd-MM-yyyy"];
        // voila!
        dateOne= [actuality1 dateFromString:strDate];
   
        
    }
    

    
    if(self.view.frame.size.height <= 480 ){
        //4s
        if(self.Window2.hidden==YES){
         self.ScrollView.contentSize = CGSizeMake(self.ScrollView.frame.size.width, 775);
        }else {
            self.Scrollview2.contentSize = CGSizeMake(self.Scrollview2.frame.size.width, 480);
        }
    }else if (self.view.frame.size.height > 480 && self.view.frame.size.height <= 568 ){
        //5-5s
        
        if(self.Window2.hidden==YES){
             self.ScrollView.contentSize = CGSizeMake(self.ScrollView.frame.size.width, 775);
        }else {
            self.Scrollview2.contentSize = CGSizeMake(self.Scrollview2.frame.size.width, 480);
        }
        
    }else if (self.view.frame.size.height > 568 && self.view.frame.size.height <= 667){
        //6
        
        if(self.Window2.hidden==YES){
            self.ScrollView.contentSize = CGSizeMake(self.ScrollView.frame.size.width, 880);
        self.Continue.frame = CGRectMake(self.Continue.frame.origin.x , 650, self.Continue.frame.size.width , self.Continue.frame.size.height);
            
        }else {
            self.Scrollview2.contentSize = CGSizeMake(self.Scrollview2.frame.size.width, 480);
            
        }
        
    }else if (self.view.frame.size.height > 667 && self.view.frame.size.height <= 736){
        //6plus
        
        if(self.Window2.hidden==YES){
             self.ScrollView.contentSize = CGSizeMake(self.ScrollView.frame.size.width, 775);
                    }else {
            self.Scrollview2.contentSize = CGSizeMake(self.Scrollview2.frame.size.width, 480);
                  
        }
        
    }
    
    
    
    
}

-(void)showSelectedDateOne{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM/dd/YYYY"];
    self.datedelivery.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"EEEE"];
    self.weekdelivery.text=[NSString stringWithFormat:@"%@", [format stringFromDate:datePicker.date]];
    
    [self.datedelivery resignFirstResponder];
}

-(void)showSelectedTimeOne{
    
    
    [self.hourdelivery resignFirstResponder];
    
}


-(void)keyretraitZipcode{
    
    
    if([self.ZipcodeDelivery isFirstResponder]){
        [self.ZipcodeDelivery resignFirstResponder];
        
    }
    
}

-(void)BackOrderPickup{
    if(self.Window1.hidden==NO){
        
        [self.navigationController popViewControllerAnimated:YES];
        imagen=0;
    }else{
    
        [UIView transitionWithView:self.Window1 duration:2 options:UIViewAnimationOptionTransitionCrossDissolve animations:NULL completion:NULL];
        [UIView transitionWithView:self.Window2 duration:2 options:UIViewAnimationOptionTransitionCrossDissolve animations:NULL completion:NULL];
        self.Window1.hidden=NO;
        self.Window2.hidden=YES;
        imagendeli=0;
    }
}


- (IBAction)BtnconfirmLocation:(id)sender {
    
    if (imagen == 0) {
    
        [self.BtnConfLocation setImage:[UIImage imageNamed:@"check2"] forState:0];
        imagen = 1;

        
    }else{
        [self.BtnConfLocation setImage:[UIImage imageNamed:@"check1"] forState:0];
        imagen = 0;

    }
    

}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Error con la localizacion");
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    CLLocation *CL = newLocation;
    
    if (flagmap == 0) {
        
        MKCoordinateRegion regionzoom=MKCoordinateRegionMake(manager.location.coordinate, MKCoordinateSpanMake(0.007, 0.007));
        [self.mapview setRegion:regionzoom];
        
        
    }
    [geocode reverseGeocodeLocation:CL completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error == nil && [placemarks count]>0) {
            placemark = [placemarks lastObject];
            [self performSelector:@selector(displayLocationInfo:) withObject:placemark];
            /*self.PickupAddress.text = [NSString stringWithFormat:@"%@ %@",
             placemark.subThoroughfare, placemark.thoroughfare];
             self.PickupZipcode.text = placemark.postalCode;*/
        }
    }];
}

-(void)displayLocationInfo:(CLPlacemark *)placemarks{
    if(flagmap==0){
    self.Address.text = [NSString stringWithFormat:@"%@ %@",
                         placemark.subThoroughfare, placemark.thoroughfare];
    self.StateCity.text =[NSString stringWithFormat:@"%@/%@",
                          placemark.locality, placemark.subLocality ];
    self.Zipcode.text=placemark.postalCode;
    }
}

- (void) keyboardWillShow:(NSNotification *)note {
    NSDictionary *userInfo = [note userInfo];
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    //NSLog(@"Keyboard Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // move the view up by 30 pts
    
    
    CGRect frame = self.view.frame;
    frame.origin.y = -kbSize.height;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = frame;
    }];
}

- (void) keyboardDidHide:(NSNotification *)note {
    
    // move the view back to the origin
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = frame;
    }];
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture{
    [_Address resignFirstResponder];
   [_StateCity resignFirstResponder];
     [_Zipcode resignFirstResponder];
     [_textLocation resignFirstResponder];
    
    [_AddressDelivery resignFirstResponder];
    [_StateCityDelivery resignFirstResponder];
    [_ZipcodeDelivery resignFirstResponder];
    [_textLocation1 resignFirstResponder];
    
  
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
  
    if(pickerView.tag==1){
        
        
        return [datapickerParse count];
        
    }else if ([_textLocation isFirstResponder]) {
        return pickerDat.count;
    }else if ([_textLocation1 isFirstResponder]){
        return pickerDat.count;
        
    }else if([_ZipcodeDelivery isFirstResponder]){
    
        return [zipcodes count];
    }
    else
    {
        return false;
    }
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if([self.hourdelivery isFirstResponder]){
        
        PFObject *titulo=datapickerParse[row];
        return [titulo objectForKey:@"PM"];
        
        
    }else if([_ZipcodeDelivery isFirstResponder]){
           PFObject *zip=zipcodes[row];
           return [zip objectForKey:@"ZipCode"];
    }else{
        return pickerDat[row];
    }
    
}

-(void)HideKeyboard{
    if([_textLocation isFirstResponder]){
        [_textLocation resignFirstResponder];
        
    }else if ([_textLocation1 isFirstResponder]){
        [_textLocation1 resignFirstResponder];
    }
    
    
}

-(BOOL)validateZip : (NSString *) zip{
    NSString *regex = @"[0-9]{2,}";
    NSPredicate *Fieldtest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [Fieldtest evaluateWithObject: zip];
}


-(BOOL)validateText : (NSString *) text{
    NSString *regex = @"^ [\t\n\f\r{Z}][A-Z0-9a-z]{1,}";
    NSPredicate *Fieldtest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@ ", regex];
    
    return [Fieldtest evaluateWithObject: text];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_Address resignFirstResponder];
    [_StateCity resignFirstResponder];
    [_Zipcode resignFirstResponder];
    [_textLocation resignFirstResponder];
    
    [_AddressDelivery resignFirstResponder];
    [_StateCityDelivery resignFirstResponder];
    [_ZipcodeDelivery resignFirstResponder];
    [_textLocation1 resignFirstResponder];
   
    
    return YES;
    
}

-(void)pickerView:(nonnull UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if ([_hourdelivery isFirstResponder]){
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
        
        [formatter setDateFormat:@"HH:mm"];
        
        PFObject *recipe2 = datapickerParse[row];
        
        self.hourdelivery.text = [recipe2 objectForKey:@"PM"];
        
    }

    if([_ZipcodeDelivery isFirstResponder]){
       
        PFObject *zip=zipcodes[row];
        self.ZipcodeDelivery.text= [zip objectForKey:@"ZipCode"];
        
    }else
    
    if([_textLocation isFirstResponder]){
        _textLocation.text = pickerDat[row];
        if (row == 3) {
            
        }else if(row == 0){
            if (location1.count >0) {
                for (int i = 0; i < location1.count; i++) {
                    if ([[location1[i] valueForKey:@"Location"] isEqualToString:@"Home"]) {
                        _Address.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"Address"]];
                        _StateCity.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"City_State"]];
                        _Zipcode.text =[NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"ZipCode"]];
                        flagmap=1;
                        break;
                    }else{
                        
                        _Address.placeholder = @"Address*";
                       
                        _StateCity.placeholder = @"State / City*";
                       
                        _Zipcode.placeholder = @"Zipcode*";
                        flagmap=0;
                    }
                }
            }
        }else if (row == 1){
            if (location1.count >0) {
                for (int i = 0; i < location1.count; i++) {
                    if ([[location1[i] valueForKey:@"Location"] isEqualToString:@"Work"]) {
                        _Address.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"Address"]];
                        _StateCity.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"City_State"]];
                        _Zipcode.text =[NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"ZipCode"]];
                        flagmap=1;
                        break;
                        
                    }else{
                        
                        _Address.placeholder = @"Address*";
                     
                        _StateCity.placeholder = @"State / City*";
                        
                        _Zipcode.placeholder = @"Zipcode*";
                        flagmap=0;
                    }
                }
            }
        }else if (row == 2){
            if (location1.count >0) {
                for (int i = 0; i < location1.count; i++) {
                    if ([[location1[i] valueForKey:@"Location"] isEqualToString:@"Other"]) {
                        _Address.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"Address"]];
                        _StateCity.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"City_State"]];
                        _Zipcode.text =[NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"ZipCode"]];
                        flagmap=1;
                        break;
                    }else{
                       
                        _Address.placeholder = @"Address*";
                       
                        _StateCity.placeholder = @"State / City*";
                        
                        _Zipcode.placeholder = @"Zipcode*";
                        flagmap=0;
                    }
                }
            }
            
        }
    }else if ([_textLocation1 isFirstResponder]){
        _textLocation1.text = pickerDat[row];
        if (row == 3) {
            
        }else if(row == 0){
            if (location1.count >0) {
                for (int i = 0; i < location1.count; i++) {
                    if ([[location1[i] valueForKey:@"Location"] isEqualToString:@"Home"]) {
                        _AddressDelivery.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"Address"]];
                        _StateCityDelivery.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"City_State"]];
                        _ZipcodeDelivery.text =[NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"ZipCode"]];
                        flagmap=1;
                        break;
                    }else{
                        
                        _AddressDelivery.placeholder = @"Address*";
                       
                        _StateCityDelivery.placeholder = @"State / City*";
                        
                        _ZipcodeDelivery.placeholder = @"Zipcode*";
                        flagmap=0;
                    }
                }
            }
        }else if (row == 1){
            if (location1.count >0) {
                for (int i = 0; i < location1.count; i++) {
                    if ([[location1[i] valueForKey:@"Location"] isEqualToString:@"Work"]) {
                        _AddressDelivery.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"Address"]];
                        _StateCityDelivery.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"City_State"]];
                        _ZipcodeDelivery.text =[NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"ZipCode"]];
                        flagmap=1;
                        break;
                    }else{
                       
                        _AddressDelivery.placeholder = @"Address*";
                       
                        _StateCityDelivery.placeholder = @"State / City*";
                       
                        _ZipcodeDelivery.placeholder = @"Zipcode*";
                        flagmap=0;
                    }
                }
            }
        }else if (row == 2){
            if (location1.count >0) {
                for (int i = 0; i < location1.count; i++) {
                    if ([[location1[i] valueForKey:@"Location"] isEqualToString:@"Other"]) {
                        _AddressDelivery.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"Address"]];
                        _StateCityDelivery.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"City_State"]];
                        _ZipcodeDelivery.text =[NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"ZipCode"]];
                        flagmap=1;
                        break;
                    }else{
                       
                        _AddressDelivery.placeholder = @"Address*";
                        
                        _StateCityDelivery.placeholder = @"State / City*";
                        
                        _ZipcodeDelivery.placeholder = @"Zipcode*";
                        flagmap=0;
                    }
                }
            }
            
        }
    }
}

- (IBAction)validatezipcode:(UITextField *)sender {
    BOOL validzip = true;
    for (int i=0; i<zipcodes.count; i++) {
        if ([[zipcodes[i] valueForKey:@"ZipCode"] isEqualToString:sender.text]) {
            
            validzip = true;
            break;
        }else{
            validzip = false;
        }
    }
    if (validzip == false) {
        NSString *zipcodewrong = [NSString stringWithFormat:@"We do not offer the service in %@", sender.text];
        UIAlertView *WrongZipcode = [[UIAlertView alloc] initWithTitle:@"Sending" message:zipcodewrong delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [WrongZipcode show];
    }
}

-(BOOL)validzip:(UITextField *)textfield{
    BOOL valid = true;
    for (int i=0; i<zipcodes.count; i++) {
        if ([[zipcodes[i] valueForKey:@"ZipCode"] isEqualToString:textfield.text]) {
            
            valid = true;
            break;
        }else{
            valid = false;
        }
    }
    return valid;
}
- (IBAction)delectTextFieldDelivery:(id)sender {
    
    self.AddressDelivery.text=nil;
   
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)savepickup:(id)sender {
#pragma mark - Open Valid if check "confirm location"
    if(imagen==1){
#pragma mark - Open Valid if textfield Not Empty
        if(self.Address.text.length>=7 && self.StateCity.text.length>=2 && [self validateZip:[self.Zipcode text]]==1 && ![self.textLocation.text isEqual:@""]){
    BOOL pickzip = [self validzip:self.Zipcode];
        if(pickzip==true){
#pragma mark - Open Valid Zipcode
    [UIView transitionWithView:self.Window1 duration:2 options:UIViewAnimationOptionTransitionCrossDissolve animations:NULL completion:NULL];
    [UIView transitionWithView:self.Window2 duration:2 options:UIViewAnimationOptionTransitionCrossDissolve animations:NULL completion:NULL];
    self.Window1.hidden=YES;
    self.Window2.hidden=NO;
    self.AddressDelivery.text=self.Address.text;
    self.StateCityDelivery.text=self.StateCity.text;
            self.ZipcodeDelivery.text=self.Zipcode.text;
#pragma mark - Open saving consult a zipcode.
            NSString  * str = self.StateCityDelivery.text ;
            NSArray  * array  =  [ str componentsSeparatedByString :@ "/" ];
            NSString  * after =  [ array objectAtIndex : 0 ];
            NSString  * before =  [ array objectAtIndex : 1 ];
           
            NSPredicate *zipcodeConsult = [NSPredicate predicateWithFormat:@"City = %@",before];
            PFQuery *consulzip = [PFQuery queryWithClassName:@"ZipCode" predicate:zipcodeConsult];
            [consulzip findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                if (!error) {
           
                    zipcodes =[NSArray arrayWithArray:objects];
                    
                } else {
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
#pragma mark - Close zipcode consult
            
            
        }

        else
        {
            NSString *zp = [NSString stringWithFormat:@"We do not offer the service in %@",self.Zipcode.text];
            UIAlertView *WrongZipcode = [[UIAlertView alloc] initWithTitle:@"Sending" message:zp delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [WrongZipcode show];
        }
#pragma mark - Close valid zipcode
#pragma mark - Close Valid if textfield not empty
        }
    }else{
    
        NSString *zp = [NSString stringWithFormat:@"Confirm the location"];
        UIAlertView *WrongZipcode = [[UIAlertView alloc] initWithTitle:@"Sending" message:zp delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [WrongZipcode show];
    
    }
#pragma mark - Close Valid if check @"confirm location"
}
- (IBAction)ConfirmLocationDelivery:(id)sender {
    
    
    if (imagendeli == 0) {
        
        [self.BtnConfLocationDelivery setImage:[UIImage imageNamed:@"check2"] forState:0];
        imagendeli = 1;
        
        
    }else{
        [self.BtnConfLocationDelivery setImage:[UIImage imageNamed:@"check1"] forState:0];
        imagendeli = 0;
        
    }
    
}
- (IBAction)PlaceOrder:(id)sender {
    
    
    
#pragma mark - Open Valid if check "confirm location"
    if(imagendeli==1){
       
#pragma mark - Open Valid if date is correct 
        if(flagdate==1){
      
        
#pragma mark - Open Valid if textfield Not Empty
        if(self.AddressDelivery.text.length>=7 && self.StateCityDelivery.text.length>=2 && [self validateZip:[self.ZipcodeDelivery text]]==1 && ![self.textLocation1.text isEqual:@""]){
          
            BOOL pickzip = [self validzip:self.ZipcodeDelivery];
            if(pickzip==true){

                
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.mode = MBProgressHUDModeIndeterminate;
                hud.labelText = @"Uploading";
                [hud show:YES];
                PFUser *cuser = [PFUser currentUser];
                PFQuery *query = [PFQuery queryWithClassName:@"Order"];
                [query whereKey:@"OrderNumber" greaterThanOrEqualTo:@0];
                [query orderByDescending:@"OrderNumber"];
                [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
                    if (!object) {
                        NSLog(@"valid5");
                        NSLog(@"The getFirstObject request failed.");
                    } else {
                       
                        // The find succeeded.
                        //NSLog(@"%@",object[@"OrderNumber"]);
                        PFObject *Order = [PFObject objectWithClassName:@"Order"];
                        ordernum = [object[@"OrderNumber"] intValue]+1;
                        Order[@"Paid"] = @NO;
                        Order[@"username"] = cuser[@"username"];
                        Order[@"Verify"] = @NO;
                        Order[@"PickupAddress"] = self.Address.text;
                        Order[@"PickupCityState"] = self.StateCity.text;
                        Order[@"OrderNumber"] = @(ordernum);
                        Order[@"PickupZipcode"] = self.Zipcode.text;
                        Order[@"DeliveryAddress"] = self.AddressDelivery.text;
                        Order[@"DeliveryCityState"] = self.StateCityDelivery.text;
                        Order[@"DeliveryZipcode"] = self.ZipcodeDelivery.text;
                        Order[@"PickHour"] = self.hourpick.text;
                        Order[@"Deliveryhour"] = self.hourdelivery.text;
                        Order[@"Pickupdate"] = self.datepick.text;
                        Order[@"Dropoffdate"] =self.datedelivery.text;
                    
                        [Order saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                            if (succeeded) {
                              
              if([_textLocation.text isEqualToString:@"Don't save"]){
                  
                                }else{
                                 
                                    PFUser *cus = [PFUser currentUser];
                                    NSString *us = cus[@"username"];
                                    NSPredicate *userandlocation = [NSPredicate predicateWithFormat:@"username = %@ AND Location = %@",us,self.textLocation.text];
                                    PFQuery *addressuser = [PFQuery queryWithClassName:@"Addresses" predicate:userandlocation];
                                    [addressuser getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *errir){
                                        if (!errir) {
                                            
                                            if ([_textLocation1.text isEqualToString:@"Don't save"]) {
                                                
                                                
                                            }else {
                                                
                                                PFUser *cus = [PFUser currentUser];
                                                NSString *us = cus[@"username"];
                                                NSPredicate *userandlocation = [NSPredicate predicateWithFormat:@"username = %@ AND Location = %@",us,self.textLocation1.text];
                                                PFQuery *addressuser = [PFQuery queryWithClassName:@"Addresses" predicate:userandlocation];
                                                [addressuser getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *errir){
                                                    if (!errir) {
                                                        [hud hide:YES];
                                                        [self performSegueWithIdentifier:@"Tracking1" sender:self];
                                                        
                                                    }else{
                                                        PFObject *UserAddresses = [PFObject objectWithClassName:@"Addresses"];
                                                        UserAddresses[@"username"] = us;
                                                        UserAddresses[@"Location"] = _textLocation1.text;
                                                        UserAddresses[@"Address"] = _AddressDelivery.text;
                                                        UserAddresses[@"City_State"] = _StateCityDelivery.text;
                                                        UserAddresses[@"ZipCode"] = _ZipcodeDelivery.text;
                                                        [UserAddresses saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                                                            if (succeeded) {
                                                               
                                                                [hud hide:YES];
                                                                [self performSegueWithIdentifier:@"Tracking1" sender:self];
                                                                
                                                            }else{
                                                                [hud hide:YES];
                                                                [self performSegueWithIdentifier:@"Tracking1" sender:self];
                                                                NSLog(@"%@",error.description);
                                                            }
                                                        }];
                                                        
                                                    }
                                                    
                                                }];
                                                
                                            }
                                            
                                            
                                            
                                        }else{
                                            
                                            
                                            if ([_textLocation1.text isEqualToString:@"Don't save"]) {
                                                
                                                
                                            }else {
                                                
                                                PFUser *cus = [PFUser currentUser];
                                                NSString *us = cus[@"username"];
                                                NSPredicate *userandlocation = [NSPredicate predicateWithFormat:@"username = %@ AND Location = %@",us,self.textLocation1.text];
                                                PFQuery *addressuser = [PFQuery queryWithClassName:@"Addresses" predicate:userandlocation];
                                                [addressuser getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *errir){
                                                    if (!errir) {
                                                        [hud hide:YES];
                                                        [self performSegueWithIdentifier:@"Tracking1" sender:self];
                                                    }else{
                                                        PFObject *UserAddresses = [PFObject objectWithClassName:@"Addresses"];
                                                        UserAddresses[@"username"] = us;
                                                        UserAddresses[@"Location"] = _textLocation1.text;
                                                        UserAddresses[@"Address"] = _AddressDelivery.text;
                                                        UserAddresses[@"City_State"] = _StateCityDelivery.text;
                                                        UserAddresses[@"ZipCode"] = _ZipcodeDelivery.text;
                                                        [UserAddresses saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                                                            if (succeeded) {
                                                                
                                                                [hud hide:YES];
                                                                [self performSegueWithIdentifier:@"Tracking1" sender:self];
                                                                
                                                            }else{
                                                                [hud hide:YES];
                                                                [self performSegueWithIdentifier:@"Tracking1" sender:self];
                                                                NSLog(@"%@",error.description);
                                                            }
                                                        }];
                                                        
                                                    }
                                                    
                                                }];
                                                
                                            }
                                            
                                            
                                            PFObject *UserAddresses = [PFObject objectWithClassName:@"Addresses"];
                                            UserAddresses[@"username"] = us;
                                            UserAddresses[@"Location"] = _textLocation.text;
                                            UserAddresses[@"Address"] = _Address.text;
                                            UserAddresses[@"City_State"] = _StateCity.text;
                                            UserAddresses[@"ZipCode"] = _Zipcode.text;
                                            [UserAddresses saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                                                if (succeeded) {
                                                    [hud hide:YES];
                                                    [self performSegueWithIdentifier:@"Tracking1" sender:self];
                                                    
                                                }else{
                                                    NSLog(@"%@",error.description);
                                                }
                                            }];
                                            
                                        }
                                        
                                    }];
                                    //verify dont save
                                }
                                
                                
                                
                         
                                
                                
                            }else{
                                UIAlertView *alerta = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Didn't work" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                                [alerta show];
                            }
                        }];
;

                    }}];
                
            }
            
            else
            {
                NSString *zp = [NSString stringWithFormat:@"We do not offer the service in %@",self.Zipcode.text];
                UIAlertView *WrongZipcode = [[UIAlertView alloc] initWithTitle:@"Sending" message:zp delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [WrongZipcode show];
            }
#pragma mark - Close valid zipcode
#pragma mark - Close Valid if textfield not empty
        }
#pragma mark - Closed valid if date is correct
        }else {
        
            NSString *zp = [NSString stringWithFormat:@"The date is incorrect, check"];
            UIAlertView *WrongZipcode = [[UIAlertView alloc] initWithTitle:@"Sending" message:zp delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [WrongZipcode show];
        
        }
#pragma mark - Closed valid if check "confirm location"
        }else{
        
        NSString *zp = [NSString stringWithFormat:@"Confirm the location"];
        UIAlertView *WrongZipcode = [[UIAlertView alloc] initWithTitle:@"Sending" message:zp delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [WrongZipcode show];
        
    }
#pragma mark - Close Valid if check @"confirm location"
    
    
    
}
- (IBAction)Change {

    //date two
    NSDateFormatter * dateFormatter = [[ NSDateFormatter alloc ] init ];
    [ dateFormatter setDateFormat : @ "dd-MM-yyyy" ];
    NSString * strDate = [ dateFormatter stringFromDate : datePicker.date ];
    
    NSDateFormatter *dateFormatte = [[NSDateFormatter alloc] init];
    // this is imporant - we set our input date format to match our input string
    // if format doesn't match you'll get nil from your string, so be careful
    [dateFormatte setDateFormat:@"dd-MM-yyyy"];
    NSDate *dateonecomp = [[NSDate alloc] init];
    // voila!
    dateonecomp= [dateFormatte dateFromString:strDate];
    
    
    
    //today date
    NSDate *now = [NSDate date];
    
    
    NSDateFormatter * dateFormatt = [[ NSDateFormatter alloc ] init ];
    [ dateFormatt setDateFormat : @ "dd-MM-yyyy" ];
    NSString * strDat = [ dateFormatter stringFromDate : now];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    // this is imporant - we set our input date format to match our input string
    // if format doesn't match you'll get nil from your string, so be careful
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    NSDate *today = [[NSDate alloc] init];
    // voila!
    today = [dateFormat dateFromString:strDat];

    if ([self.datedelivery resignFirstResponder]) {
        
        
        if([dateOne compare:dateonecomp]==NSOrderedAscending){
            
            
            flagdate =1;
            
            
            //si la fecha uno es mayor
        } else if([dateOne compare:dateonecomp]==NSOrderedDescending){
            
            flagdate=0;
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"the date select must be greater than the pickup " delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            
         
            //Las fechas son iguales
        }else {
            flagdate=0;
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"the date select is equal the pickup" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            
        }
        
        

        
    }

}

@end
