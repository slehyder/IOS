//
//  Order.m
//  Cleanpress
//
//  Created by eris ramirez on 6/17/15.
//  Copyright (c) 2015 Eris Ramirez. All rights reserved.
//



#import "Order.h"
#import <Parse/Parse.h>
#import "QuartzCore/QuartzCore.h"
long img= 0;
long iml = 0;
NSString *PickAddress,*PickUnit,*PickZip,*PickNotes,*PickDate,*PickDay,*PickHour,*DeliveryAddress,*DeliveryUnit,*DeliveryZip,*DeliveryNotes,*DeliveryDate,*DeliveryDay,*DeliveryHour,*us;
int ordernumber;
PFUser *currentUser;
@interface Order ()

@end

@implementation Order
NSArray *timescompare;
NSArray *timescompare2;
NSString *textpicker1;
NSString *textpicker2;
NSDate *hora1;
NSDate *hora2;

//yes is this select timeOne
int yes;
//yes1 is this select TimeTwo
int yes1;

//yes3 is this select if dateOne and dateTwo is perfect.
int yes3;

int topAmday;
int datetwoyes;
NSArray *pickerData;
UIPickerView *Picker;
PFObject *local;
- (void)viewDidLoad {
    
   
    [super viewDidLoad];
    currentUser = [PFUser currentUser];

    // save User Addresses in an array
   us = currentUser[@"username"];
    NSPredicate *userandlocation = [NSPredicate predicateWithFormat:@"username = %@",us];
    PFQuery *addressuser = [PFQuery queryWithClassName:@"Addresses" predicate:userandlocation];
    [addressuser findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            //NSLog(@"Successfully retrieved %zd scores.", objects.count);
            // Do something with the found objects
            location1 =[NSArray arrayWithArray:objects];
            /*for (PFObject *object in objects) {
                    NSString *location = object[@"Location"];
                    NSString *Address = object[@"Address"];
                    NSString *unit_suite = object[@"Unit_Suite"];
                    NSString *zipc = object[@"ZipCode"];
                    location1 = @[object[@"Location"]];
                    
                NSLog(@"%@",location1[0]);
               
            }*/
            
        } else {
            // Log details of the failure
            //NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    //finish saved user Addresses
    //Save zipcodes in an array
    
    PFQuery *Zipquery = [PFQuery queryWithClassName:@"ZipCode"];
    zipcodes = [Zipquery findObjects];
    //NSLog(@"%@",zipcodes);
    
    self.topbar.hidesBackButton = YES;
    [self.topbar setLeftItemsSupplementBackButton:YES];
    UIBarButtonItem *gomenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"go_back_2"] style:UIBarButtonItemStylePlain target:self action:@selector(ToMenu)];
    
    [self.topbar setLeftBarButtonItem:gomenu animated:YES];
    self.topbar.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"go_back_2"]];
    
    self.topbartime.hidesBackButton = YES;
    [self.topbartime setLeftItemsSupplementBackButton:YES];
    UIBarButtonItem *goback = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"go_back"] style:UIBarButtonItemStylePlain target:self action:@selector(ToBack)];
    
    [self.topbartime setLeftBarButtonItem:goback animated:YES];
    self.topbartime.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"go_back"]];
    PFUser *currentUser = [PFUser currentUser];
    PFQuery *Order = [PFQuery queryWithClassName:@"Order"];
    [Order whereKey:@"username" equalTo:currentUser[@"username"]];
    [Order whereKey:@"Paid" equalTo:@NO];
    [Order orderByDescending:@"createAt"];
    [Order getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *error){
        if (!object) {
        }else{
            [self performSegueWithIdentifier:@"MainToTracking" sender:self];
        }
    }];
    
    locationManager = [[CLLocationManager alloc] init];
    geocode = [[CLGeocoder alloc]init];
    
    PickAddress = [[NSString alloc]init];
    PickAddress = _TextLocation.text;
    PickUnit = [[NSString alloc]init];
    PickZip = [[NSString alloc]init];
    PickNotes = [[NSString alloc]init];
    UITapGestureRecognizer *touchbegan = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [_Scroll addGestureRecognizer:touchbegan];
         pickerData=@[@"Home",@"Work",@"Other"];
    Picker = [[UIPickerView alloc]init];
    Picker.backgroundColor = [UIColor whiteColor];
    Picker.dataSource = self;
    Picker.delegate = self;
    [self.TextLocation setInputView:Picker];
    [self.TextLocation1 setInputView:Picker];
    
    self.Scroll.contentSize = CGSizeMake(self.view.frame.size.width, 1214);
    
        pickerData=@[@"Home",@"Work",@"Other",@"Don't save"];
        self.BlueLine.layer.zPosition = 2;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:@"UIKeyboardWillShowNotification"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:@"UIKeyboardDidHideNotification"
                                               object:nil];
    
    UIToolbar *tooled = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.Window.frame.size.height, 44)];
    UIBarButtonItem *done1= [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(HideKeyboard)];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [tooled setItems:[NSArray arrayWithObjects:spacer,done1, nil]];
    [self.TextLocation setInputAccessoryView:tooled];
    [self.TextLocation1 setInputAccessoryView:tooled];
    self.DeliLabel.hidden = TRUE;
    self.DeliLabel1.hidden = TRUE;
    self.DeliLabel2.hidden = TRUE;
    self.DeliLabel3.hidden = TRUE;
    self.DeliLabel4.hidden = TRUE;
    self.DeliLabel5.hidden = TRUE;
    self.DeliAddress.hidden = TRUE;
    self.DeliAddress1.hidden = TRUE;
    self.DeliAddress2.hidden = TRUE;
    self.DeliAddress3.hidden = TRUE;
    self.DeliAddress4.hidden = TRUE;
    self.DeliAddress5.hidden = TRUE;
    self.TextLocation1.hidden = TRUE;
    self.Bluearrow1.hidden = TRUE;
    // Do any additional setup after loading the view.
    //OrderSchedule.m
    ///////
    /////
    ////
    
    
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
            [TimePickerOne reloadAllComponents];
            
        }
    }];
    
    PFQuery *quer = [PFQuery queryWithClassName:@"Hours"];
    [quer orderByAscending:@"createdAt"];
    [quer whereKeyExists:@"PM"];
    [quer findObjectsInBackgroundWithBlock:^(NSArray *object, NSError *error) {
        if (!error) {
            // La búsqueda se ha ejecutado correctamente y el NSArray objects
            // contiene los resultados de la misma.
            datapickerParseTwo = [[NSMutableArray alloc]initWithArray:object];
            /* for (PFObject *object in datapickerParse) {
             
             NSLog(@"%@", [object objectForKey:@"AM"]);
             }*/
            [TimePickerTwo reloadAllComponents];
            
        }
    }];
    
    //hora tope
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    [formatter setDateFormat:@"HH:mm"];
    NSDate *topAm = [formatter dateFromString:@"12:00"];
    //hora actual
    NSDate *nowTime = [NSDate date];
    
    
    NSDateFormatter * timeFormatt = [[ NSDateFormatter alloc ] init ];
    [ timeFormatt setDateFormat : @ "HH:mm" ];
    NSString * timestr = [ timeFormatt stringFromDate : nowTime];
    
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    // this is imporant - we set our input date format to match our input string
    // if format doesn't match you'll get nil from your string, so be careful
    [timeFormat setDateFormat:@"HH:mm"];
    [timeFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    NSDate *TimeToday = [[NSDate alloc] init];
    // voila!
    TimeToday = [timeFormat dateFromString:timestr];
    
    //agregar un dia a the next day
    
    if ([topAm compare:TimeToday]==NSOrderedAscending) {
        
        NSDate *now = [NSDate date];
        NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
        dayComponent.day = 1;
        NSDateComponents *dayComponen = [[NSDateComponents alloc] init];
        dayComponen.day = 2;
        NSCalendar *theCalendar = [NSCalendar currentCalendar];
        NSDate *nextDate = [theCalendar dateByAddingComponents:dayComponent toDate:now options:0];
        NSDateFormatter * dateFormatt = [[ NSDateFormatter alloc ] init ];
        [ dateFormatt setDateFormat : @ "MM/dd/yyyy" ];
        self.DateOne.text = [ dateFormatt stringFromDate : nextDate];
        NSDateFormatter *format=[[NSDateFormatter alloc]init];
        [format setDateFormat:@"EEEE"];
        self.weekdayOne.text = [format stringFromDate:nextDate];
        
        NSDate *nextDat = [theCalendar dateByAddingComponents:dayComponen toDate:now options:0];
        self.DateTwo.text = [ dateFormatt stringFromDate : nextDat];
        self.weekdayTwo.text = [format stringFromDate:nextDat];
        
        topAmday=1;
        yes3=1;
        
        
    }else  if([topAm compare:TimeToday]==NSOrderedDescending){
        //agregar un dia a la the day actual
        
        NSDate *now = [NSDate date];
        NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
        dayComponent.day = 0;
        NSDateComponents *dayComponen = [[NSDateComponents alloc] init];
        dayComponen.day = 1;
        NSCalendar *theCalendar = [NSCalendar currentCalendar];
        NSDate *nextDate = [theCalendar dateByAddingComponents:dayComponent toDate:now options:0];
        NSDateFormatter * dateFormatt = [[ NSDateFormatter alloc ] init ];
        [ dateFormatt setDateFormat : @ "MM/dd/yyyy" ];
        self.DateOne.text = [ dateFormatt stringFromDate : nextDate];
        NSDateFormatter *format=[[NSDateFormatter alloc]init];
        [format setDateFormat:@"EEEE"];
        self.weekdayOne.text = [format stringFromDate:nextDate];
        
        NSDate *nextDat = [theCalendar dateByAddingComponents:dayComponen toDate:now options:0];
        self.DateTwo.text = [ dateFormatt stringFromDate : nextDat];
        self.weekdayTwo.text = [format stringFromDate:nextDat];
    }
    
    
    
    
    self.PlacerOrderBtn.enabled = FALSE;
    self.PlacerOrderBtn.backgroundColor = [UIColor colorWithRed:0.329 green:0.408 blue:0.475 alpha:0.5];
    
    timescompare=@[@"07:00",@"07:30",@"8:00",@"8:30",@"9:00",@"09:30",@"10:00",@"10:30",@"11:45",@"12:00"];
    timescompare2=@[@"17:00",@"017:30",@"18:00",@"18:30",@"19:00",@"019:30",@"20:30"];
    datePickerOne=[[UIDatePicker alloc]init];
    datePickerOne.backgroundColor = [UIColor whiteColor];
    datePickerOne.datePickerMode=UIDatePickerModeDate;
    [self.DateOne setInputView:datePickerOne];
    datePickerTwo=[[UIDatePicker alloc]init];
    datePickerTwo.backgroundColor = [UIColor whiteColor];
    datePickerTwo.datePickerMode=UIDatePickerModeDate;
    [self.DateTwo setInputView:datePickerTwo];
    
    TimePickerOne=[[UIPickerView alloc]init];
    TimePickerOne.tag=1;
    TimePickerOne.backgroundColor = [UIColor whiteColor];
    TimePickerOne.delegate=self;
    TimePickerOne.dataSource=self;
    
    TimePickerTwo=[[UIPickerView alloc]init];
    TimePickerTwo.tag=2;
    TimePickerTwo.backgroundColor = [UIColor whiteColor];
    TimePickerTwo.delegate=self;
    TimePickerTwo.dataSource=self;
    
    
    [self.TimeOne setInputView:TimePickerOne];
    [self.TimeTwo setInputView:TimePickerTwo];
    
    UIToolbar *toolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolbar setTintColor:[UIColor cyanColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(showSelectedDateOne)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolbar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.DateOne setInputAccessoryView:toolbar];
    //************************************************
    UIToolbar *toolba=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolba setTintColor:[UIColor cyanColor]];
    UIBarButtonItem *doneBt=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(showSelectedDateTwo)];
    UIBarButtonItem *spac=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolba setItems:[NSArray arrayWithObjects:spac,doneBt, nil]];
    [self.DateTwo setInputAccessoryView:toolba];
    //************************************************
    UIToolbar *toolb=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolb setTintColor:[UIColor cyanColor]];
    UIBarButtonItem *doneB=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(showSelectedTimeOne)];
    UIBarButtonItem *spa=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolb setItems:[NSArray arrayWithObjects:spa,doneB, nil]];
    [self.TimeOne setInputAccessoryView:toolb];
    [self. TimeTwo setInputAccessoryView:toolb];

    ////////
    //////
    ////
    //
    
    
    
}

-(void)ToMenu{
    [self performSegueWithIdentifier:@"ToMenu" sender:self];
}

-(void)ToBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture{
    [_PickupAddress resignFirstResponder];
    [_PickupUnitSuite resignFirstResponder];
    [_PickupZipcode resignFirstResponder];
    [_DeliAddress resignFirstResponder];
    [_DeliAddress1 resignFirstResponder];
    [_DeliAddress2 resignFirstResponder];
    [_DeliAddress3 resignFirstResponder];
    [_DeliAddress5 resignFirstResponder];
    [_PickupSpecialNotes resignFirstResponder];
    [_TextLocation resignFirstResponder];
    [_TextLocation1 resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(pickerView.tag==1){
        
        
        return [datapickerParse count];
        
    }else if ([_TextLocation isFirstResponder]) {
        return pickerData.count;
    }else if ([_TextLocation1 isFirstResponder]){
        return pickerData.count;
    
    }else{
        
        return [datapickerParseTwo count];

        
    }
    
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if([_TimeOne isFirstResponder]){
        
        PFObject *titulo=datapickerParse[row];
        return [titulo objectForKey:@"AM"];
        
        
    }else if([_TimeTwo isFirstResponder]){
        
        PFObject *titulo=datapickerParseTwo[row];
        return [titulo objectForKey:@"PM"];
        
    }else{
    return pickerData[row];
    }
    
}
-(void)HideKeyboard{
    if([_TextLocation isFirstResponder]){
        [_TextLocation resignFirstResponder];
        
    }else if ([_TextLocation1 isFirstResponder]){
        [_TextLocation1 resignFirstResponder];
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
        [_PickupAddress resignFirstResponder];
        [_PickupUnitSuite resignFirstResponder];
        [_PickupZipcode resignFirstResponder];
        [_DeliAddress resignFirstResponder];
        [_DeliAddress1 resignFirstResponder];
        [_DeliAddress2 resignFirstResponder];
        [_DeliAddress3 resignFirstResponder];
        [_DeliAddress5 resignFirstResponder];
        [_PickupSpecialNotes resignFirstResponder];
        
        return YES;
    
}

-(void)pickerView:(nonnull UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if([_TextLocation isFirstResponder]){
        _TextLocation.text = pickerData[row];
        if (row == 3) {
           
        }else if(row == 0){
            if (location1.count >0) {
                for (int i = 0; i < location1.count; i++) {
                    if ([[location1[i] valueForKey:@"Location"] isEqualToString:@"Home"]) {
                        _PickupAddress.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"Address"]];
                        _PickupUnitSuite.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"City_State"]];
                        _PickupZipcode.text =[NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"ZipCode"]];
                        break;
                    }else{
                        _PickupAddress.text= nil;
                        _PickupAddress.placeholder = @"Address*";
                        _PickupUnitSuite.text= nil;
                        _PickupUnitSuite.placeholder = @"Unit/Suite*";
                        _PickupZipcode.text= nil;
                        _PickupZipcode.placeholder = @"Zipcode*";
                    }
                }
            }
        }else if (row == 1){
            if (location1.count >0) {
                for (int i = 0; i < location1.count; i++) {
                    if ([[location1[i] valueForKey:@"Location"] isEqualToString:@"Work"]) {
                        _PickupAddress.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"Address"]];
                        _PickupUnitSuite.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"City_State"]];
                        _PickupZipcode.text =[NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"ZipCode"]];
                        break;
                    }else{
                        _PickupAddress.text= nil;
                        _PickupAddress.placeholder = @"Address*";
                        _PickupUnitSuite.text= nil;
                        _PickupUnitSuite.placeholder = @"Unit/Suite*";
                        _PickupZipcode.text= nil;
                        _PickupZipcode.placeholder = @"Zipcode*";
                    }
                }
            }
        }else if (row == 2){
            if (location1.count >0) {
                for (int i = 0; i < location1.count; i++) {
                    if ([[location1[i] valueForKey:@"Location"] isEqualToString:@"Other"]) {
                        _PickupAddress.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"Address"]];
                        _PickupUnitSuite.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"City_State"]];
                        _PickupZipcode.text =[NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"ZipCode"]];
                        break;
                    }else{
                        _PickupAddress.text= nil;
                        _PickupAddress.placeholder = @"Address*";
                        _PickupUnitSuite.text= nil;
                        _PickupUnitSuite.placeholder = @"Unit/Suite*";
                        _PickupZipcode.text= nil;
                        _PickupZipcode.placeholder = @"Zipcode*";
                    }
                }
            }
        
        }
    }else if ([_TextLocation1 isFirstResponder]){
        _TextLocation1.text = pickerData[row];
        if (row == 3) {
            
        }else if(row == 0){
            if (location1.count >0) {
                for (int i = 0; i < location1.count; i++) {
                    if ([[location1[i] valueForKey:@"Location"] isEqualToString:@"Home"]) {
                        _DeliAddress1.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"Address"]];
                        _DeliAddress2.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"City_State"]];
                        _DeliAddress3.text =[NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"ZipCode"]];
                        break;
                    }else{
                        _DeliAddress1.text= nil;
                        _DeliAddress1.placeholder = @"Address*";
                        _DeliAddress2.text= nil;
                        _DeliAddress2.placeholder = @"Unit/Suite*";
                        _DeliAddress3.text= nil;
                        _DeliAddress3.placeholder = @"Zipcode*";
                    }
                }
            }
        }else if (row == 1){
            if (location1.count >0) {
                for (int i = 0; i < location1.count; i++) {
                    if ([[location1[i] valueForKey:@"Location"] isEqualToString:@"Work"]) {
                        _DeliAddress1.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"Address"]];
                        _DeliAddress2.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"City_State"]];
                        _DeliAddress3.text =[NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"ZipCode"]];
                        break;
                    }else{
                        _DeliAddress1.text= nil;
                        _DeliAddress1.placeholder = @"Address*";
                        _DeliAddress2.text= nil;
                        _DeliAddress2.placeholder = @"Unit/Suite*";
                        _DeliAddress3.text= nil;
                        _DeliAddress3.placeholder = @"Zipcode*";
                    }
                }
            }
        }else if (row == 2){
            if (location1.count >0) {
                for (int i = 0; i < location1.count; i++) {
                    if ([[location1[i] valueForKey:@"Location"] isEqualToString:@"Other"]) {
                        _DeliAddress1.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"Address"]];
                        _DeliAddress2.text = [NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"City_State"]];
                        _DeliAddress3.text =[NSString stringWithFormat:@"%@",[location1[i] valueForKey:@"ZipCode"]];
                        break;
                    }else{
                        _DeliAddress1.text= nil;
                        _DeliAddress1.placeholder = @"Address*";
                        _DeliAddress2.text= nil;
                        _DeliAddress2.placeholder = @"Unit/Suite*";
                        _DeliAddress3.text= nil;
                        _DeliAddress3.placeholder = @"Zipcode*";
                    }
                }
            }
            
        }
    }else if ([_TimeOne isFirstResponder]) {
        
        if(topAmday==1){
            if(yes3==1 && ![self.TimeTwo.text isEqual:@""]) {self.PlacerOrderBtn.backgroundColor = [UIColor colorWithRed:0 green:0.902 blue:0.525 alpha:1];self.PlacerOrderBtn.enabled = TRUE;yes1=1;}yes=1;self.TimeTwo.enabled=YES;self.DateTwo.enabled=YES;
            
        }else {
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
            [formatter setDateFormat:@"HH:mm"];
            hora1 = [formatter dateFromString:timescompare[row]];
            //today Time
            NSDate *nowTime = [NSDate date];
            
            
            NSDateFormatter * timeFormatt = [[ NSDateFormatter alloc ] init ];
            [ timeFormatt setDateFormat : @ "HH:mm" ];
            NSString * timestr = [ timeFormatt stringFromDate : nowTime];
            
            NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
            // this is imporant - we set our input date format to match our input string
            // if format doesn't match you'll get nil from your string, so be careful
            [timeFormat setDateFormat:@"HH:mm"];
            [timeFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
            NSDate *TimeToday = [[NSDate alloc] init];
            // voila!
            TimeToday = [timeFormat dateFromString:timestr];
            
            
            
            
            if([TimeToday compare:hora1]==NSOrderedAscending){
                
                
                if(yes3==1 && ![self.TimeTwo.text isEqual:@""]) {
                    
                    
                    self.PlacerOrderBtn.backgroundColor = [UIColor colorWithRed:0 green:0.902 blue:0.525 alpha:1];
                    self.PlacerOrderBtn.enabled = TRUE;
                    
                    
                    yes1=1;
                    
                    
                }
                
                yes=1;
                
                self.TimeTwo.enabled=YES;
                self.DateTwo.enabled=YES;
                
                
            }else if([TimeToday compare:hora1]==NSOrderedDescending){
                
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Verifique que la hora sea mayor a la actual" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alert show];
                self.PlacerOrderBtn.backgroundColor = [UIColor colorWithRed:0.329 green:0.408 blue:0.475 alpha:0.5];
                self.PlacerOrderBtn.enabled = FALSE;
                
                
            }else{
                
                
            }
            
        }
        //   NSLog(@"date picker %@  hoy %@",fecha,timeFromStrin);
        
        PFObject *recipe = datapickerParse[row];
        
        _TimeOne.text = [recipe objectForKey:@"AM"];
    }else if ([_TimeTwo isFirstResponder]){
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
        
        [formatter setDateFormat:@"HH:mm"];
        
        hora2 = [formatter dateFromString:timescompare2[row]];
        
        if([hora2 isEqual:@""]){
            
            yes1=2;
            
        }else {
            
            self.PlacerOrderBtn.backgroundColor = [UIColor colorWithRed:0 green:0.902 blue:0.525 alpha:1];
            
            self.PlacerOrderBtn.enabled = TRUE;
            
            yes1=1;
            
        }
        
        yes1=1;
        
        self.TimeTwo.enabled=YES;
        
        self.DateTwo.enabled=YES;
        
        PFObject *recipe2 = datapickerParseTwo[row];
        
        _TimeTwo.text = [recipe2 objectForKey:@"PM"];
        
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


/*- (IBAction)validZip {
    BOOL validzip = false;
    for (int i=0; i<zipcodes.count; i++) {
        if ([[zipcodes[i] valueForKey:@"ZipCode"] isEqualToString:self.TextLocation1]) {
     
        }
    
    //PFObject *Zipcode = [PFObject objectWithClassName:@"ZipCode"];
    PFQuery *Zipquery = [PFQuery queryWithClassName:@"ZipCode"];
    //NSString *ziptocompare = self.PickupZipcode.text;
    [Zipquery whereKey:@"ZipCode" equalTo:self.PickupZipcode.text];
    [Zipquery getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
        if (!error) {
           

        }else{
            UIAlertView *WrongZipcode = [[UIAlertView alloc] initWithTitle:@"Sending" message:@"We do not offer the service in the place where you are." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [WrongZipcode show];
           // NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    
    }];
}*/



-(void)showSelectedDateOne{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM/dd/YYYY"];
    self.DateOne.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePickerOne.date]];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"EEEE"];
    self.weekdayOne.text=[NSString stringWithFormat:@"%@", [format stringFromDate:datePickerOne.date]];
    
    [self.DateOne resignFirstResponder];
    
    
    
}
-(void)showSelectedDateTwo{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM/dd/YYYY"];
    self.DateTwo.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePickerTwo.date]];
    
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"EEEE"];
    self.weekdayTwo.text=[NSString stringWithFormat:@"%@", [format stringFromDate:datePickerTwo.date]];
    datetwoyes=1;
    [self.DateTwo resignFirstResponder];
    
}
-(void)showSelectedTimeOne{
    
    
    [self.TimeOne resignFirstResponder];
    [self.TimeTwo resignFirstResponder];
    
}


- (IBAction)Change {
    
    
    //date one
    NSDateFormatter * dateFormatter = [[ NSDateFormatter alloc ] init ];
    [ dateFormatter setDateFormat : @ "dd-MM-yyyy" ];
    NSString * strDate = [ dateFormatter stringFromDate : datePickerOne.date ];
    
    NSDateFormatter *dateFormatte = [[NSDateFormatter alloc] init];
    // this is imporant - we set our input date format to match our input string
    // if format doesn't match you'll get nil from your string, so be careful
    [dateFormatte setDateFormat:@"dd-MM-yyyy"];
    NSDate *dateonecomp = [[NSDate alloc] init];
    // voila!
    dateonecomp= [dateFormatte dateFromString:strDate];
    
    //date two
    
    NSDateFormatter * dateForma = [[ NSDateFormatter alloc ] init ];
    [ dateForma setDateFormat : @ "dd-MM-yyyy" ];
    NSString * strDa = [ dateForma stringFromDate : datePickerTwo.date ];
    
    NSDateFormatter *dateForm = [[NSDateFormatter alloc] init];
    // this is imporant - we set our input date format to match our input string
    // if format doesn't match you'll get nil from your string, so be careful
    [dateForm setDateFormat:@"dd-MM-yyyy"];
    NSDate *datetowcomp = [[NSDate alloc] init];
    // voila!
    datetowcomp = [dateForm dateFromString:strDa];
    
    
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
    
    /*NSComparisonResult *result;
     result =  [ dateFromStrin compare: dateFromString];*/
    //NSLog(@" %@  JO %@", fecha, nowTime);
    //if (![dateFromStrin isEqualToDate:dateFromString]) {
    
    
    
    if([self.DateOne resignFirstResponder]){
        
        
        //Si la primera fecha es mayor
        
        if([today compare:dateonecomp]==NSOrderedAscending){
            
            if(datetwoyes==1){
                
                if([dateonecomp compare:datetowcomp]==NSOrderedDescending){
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"la fecha de busqueda no puede ser mayor a la de salidaasd" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                    [alert show];
                    self.PlacerOrderBtn.backgroundColor = [UIColor colorWithRed:0.329 green:0.408 blue:0.475 alpha:0.5];
                    self.PlacerOrderBtn.enabled = FALSE;
                    
                }else  if([dateonecomp compare:datetowcomp]==NSOrderedAscending){
                    
                    /* UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"la fecha de busqueda no puede ser mayor a la de salidaadstgg" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                     [alert show];
                     self.PlacerOrderBtn.backgroundColor = [UIColor colorWithRed:0.329 green:0.408 blue:0.475 alpha:0.5];
                     self.PlacerOrderBtn.enabled = FALSE;*/
                }else {UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"las fechas no pueden ser iguales." delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                    [alert show];
                    self.PlacerOrderBtn.backgroundColor = [UIColor colorWithRed:0.329 green:0.408 blue:0.475 alpha:0.5];
                    self.PlacerOrderBtn.enabled = FALSE;}
                
            }else{
               
                
            }      //Si la fecha actual es mayor
        } else if([today compare:dateonecomp]==NSOrderedDescending){
            
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"virifica que la fecha sea mayor a la actual" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            self.PlacerOrderBtn.backgroundColor = [UIColor colorWithRed:0.329 green:0.408 blue:0.475 alpha:0.5];
            self.PlacerOrderBtn.enabled = FALSE;
            
            
            //Las fechas son iguales
        }else {
            
            
            
            
        }
        
        
        
        
    }
    if([self.DateTwo resignFirstResponder]){
        
        
        //si la fecha dos es mayor
        
        if([dateonecomp compare:datetowcomp]==NSOrderedAscending){
            
            
            yes3 =1;
            
            
            if(yes==1 && yes1==1){
                
                self.PlacerOrderBtn.backgroundColor = [UIColor greenColor];
                self.PlacerOrderBtn.enabled = TRUE;
            }
            
            //si la fecha uno es mayor
        } else if([dateonecomp compare:datetowcomp]==NSOrderedDescending){
            
            yes3=0;
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"virifica que la fecha de salida sea mayor a la de busqueda" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            
            self.PlacerOrderBtn.backgroundColor = [UIColor colorWithRed:0.329 green:0.408 blue:0.475 alpha:0.5];
            self.PlacerOrderBtn.enabled = FALSE;
            
            //Las fechas son iguales
        }else {
            yes3=0;
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"las fechasn no pueden ser iguales" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
            self.PlacerOrderBtn.backgroundColor = [UIColor colorWithRed:0.329 green:0.408 blue:0.475 alpha:0.5];
            self.PlacerOrderBtn.enabled = FALSE;
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
}





- (IBAction)Address:(id)sender {
     local = [PFObject objectWithClassName:@"Order"];
    [local unpinInBackground];
    PFQuery *localquery = [PFQuery queryWithClassName:@"Order"];
    [localquery fromLocalDatastore];
    //local = [PFObject objectWithClassName:@"Order"];
    
    [localquery findObjectsInBackgroundWithBlock:^(NSArray *arra,NSError *err){
        if (!err) {
            //[local unpinInBackground];
            //NSLog(@"%lu",(unsigned long)arra.count);
            for (PFObject *object in arra) {
                [object unpinInBackground];
               
            }
            
        }
    }];

    if (_PickupAddress.text.length>=7 && _PickupUnitSuite.text.length>=2 && [self validateZip:[_PickupZipcode text]]==1 && ![self.TextLocation.text isEqual:@""]) {
        BOOL pickzip = [self validzip:_PickupZipcode];
        
            if (pickzip == true) {
                    if (iml == 0 && [self.SameAddressDelivery.currentTitle isEqualToString:@" Use Same Address for delivery"]) {
                        
                        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"Delivery Address" message:@"Input a delivery address or select same pickup for delivery" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                        [aler show];
                    }else if(iml==1 && [self.SameAddressDelivery.currentTitle isEqualToString:@" Use Same Address for delivery"]){
                        if ([_TextLocation.text isEqualToString:@"Don't save"]) {
                            local = [PFObject objectWithClassName:@"Order"];
                            local[@"PickupAddress"] = _PickupAddress.text;
                            local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                            local[@"PickupZipcode"] = _PickupZipcode.text;
                            local[@"DeliveryAddress"] = _PickupAddress.text;
                            local[@"DeliveryUnitSuite"] = _PickupUnitSuite.text;
                            local[@"DeliveryZipcode"] = _PickupZipcode.text;
                            if (_PickupSpecialNotes.text != nil){
                                local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                local[@"DeliverySpecialNotes"] = _PickupSpecialNotes.text;
                            }else{
                                
                            }
                            
                            [local pinInBackground];
                            [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                            
                        }else{
                            PFUser *cus = [PFUser currentUser];
                            NSString *us = cus[@"username"];
                            NSPredicate *userandlocation = [NSPredicate predicateWithFormat:@"username = %@ AND Location = %@",us,_TextLocation.text];
                            PFQuery *addressuser = [PFQuery queryWithClassName:@"Addresses" predicate:userandlocation];
                            [addressuser getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *errir){
                                if (!errir) {
                                    _PickupAddress.text = object[@"Address"];
                                    _PickupUnitSuite.text = object[@"Unit_Suite"];
                                    _PickupZipcode.text = object[@"ZipCode"];
                                    local = [PFObject objectWithClassName:@"Order"];
                                    local[@"PickupAddress"] = _PickupAddress.text;
                                    local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                    local[@"PickupZipcode"] = _PickupZipcode.text;
                                    local[@"DeliveryAddress"] = _PickupAddress.text;
                                    local[@"DeliveryUnitSuite"] = _PickupUnitSuite.text;
                                    local[@"DeliveryZipcode"] = _PickupZipcode.text;
                                    if (_PickupSpecialNotes.text != nil){
                                        local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                        local[@"DeliverySpecialNotes"] = _PickupSpecialNotes.text;
                                    }else{
                                        
                                    }
                                    
                                    [local pinInBackground];
                                    
                                    [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                    
                                }else{
                                    PFObject *UserAddresses = [PFObject objectWithClassName:@"Addresses"];
                                    UserAddresses[@"username"] = us;
                                    UserAddresses[@"Location"] = _TextLocation.text;
                                    UserAddresses[@"Address"] = _PickupAddress.text;
                                    UserAddresses[@"Unit_Suite"] = _PickupUnitSuite.text;
                                    UserAddresses[@"ZipCode"] = _PickupZipcode.text;
                                    [UserAddresses saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                                        if (succeeded) {
                                            
                                            local = [PFObject objectWithClassName:@"Order"];
                                            local[@"PickupAddress"] = _PickupAddress.text;
                                            local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                            local[@"PickupZipcode"] = _PickupZipcode.text;
                                            local[@"DeliveryAddress"] = _PickupAddress.text;
                                            local[@"DeliveryUnitSuite"] = _PickupUnitSuite.text;
                                            local[@"DeliveryZipcode"] = _PickupZipcode.text;
                                            if (_PickupSpecialNotes.text != nil){
                                                local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                local[@"DeliverySpecialNotes"] = _PickupSpecialNotes.text;
                                            }else{
                                                
                                            }
                                            
                                            [local pinInBackground];
                                            [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                        }else{
                                            NSLog(@"%@",error.description);
                                        }
                                    }];
                                    
                                }
                                
                            }];
                            
                        }
                        
                        
                    }else if(iml==1 && [self.SameAddressDelivery.currentTitle isEqualToString:@"Use my current location for delivery"]){
                        if(_DeliAddress1.text.length>=7 && _DeliAddress2.text.length>=2 && [self validateZip:[_DeliAddress3 text]]==1 && ![self.TextLocation1.text isEqual:@""]){
                            
                            BOOL delizip = [self validzip:_DeliAddress3];
                                if (delizip == true) {
                                    if ([_TextLocation.text isEqualToString:@"Don't save"]) {
                                        if ([_TextLocation1.text isEqualToString:@"Don't save"]) {
                                            local = [PFObject objectWithClassName:@"Order"];
                                            local[@"PickupAddress"] = _PickupAddress.text;
                                            local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                            local[@"PickupZipcode"] = _PickupZipcode.text;
                                            local[@"DeliveryAddress"] = _DeliAddress1.text;
                                            local[@"DeliveryUnitSuite"] = _DeliAddress2.text;
                                            local[@"DeliveryZipcode"] = _DeliAddress3.text;
                                            if (_PickupSpecialNotes.text != nil) {
                                                local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                            }else if(_DeliLabel5.text != nil){
                                                local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                            }else if (_PickupSpecialNotes.text != nil && _DeliLabel5.text != nil){
                                                local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                            }else{
                                                
                                            }
                                            
                                            [local pinInBackground];
                                            [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                        }else{
                                            PFUser *cus = [PFUser currentUser];
                                            NSString *us = cus[@"username"];
                                            NSPredicate *userandlocation = [NSPredicate predicateWithFormat:@"username = %@ AND Location = %@",us,_TextLocation1.text];
                                            PFQuery *addressuser = [PFQuery queryWithClassName:@"Addresses" predicate:userandlocation];
                                            [addressuser getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *errir){
                                                if (!errir) {
                                                    _DeliAddress1.text = object[@"Address"];
                                                    _DeliAddress2.text = object[@"Unit_Suite"];
                                                    _DeliAddress3.text = object[@"ZipCode"];
                                                    local = [PFObject objectWithClassName:@"Order"];
                                                    local[@"PickupAddress"] = _PickupAddress.text;
                                                    local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                                    local[@"PickupZipcode"] = _PickupZipcode.text;
                                                    local[@"DeliveryAddress"] = _DeliAddress1.text;
                                                    local[@"DeliveryUnitSuite"] = _DeliAddress2.text;
                                                    local[@"DeliveryZipcode"] = _DeliAddress3.text;
                                                    if (_PickupSpecialNotes.text != nil) {
                                                        local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                    }else if(_DeliLabel5.text != nil){
                                                        local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                    }else if (_PickupSpecialNotes.text != nil && _DeliLabel5.text != nil){
                                                        local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                        local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                    }else{
                                                        
                                                    }
                                                    
                                                    [local pinInBackground];
                                                    [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                                }else{
                                                    PFObject *UserAddresses = [PFObject objectWithClassName:@"Addresses"];
                                                    UserAddresses[@"username"] = us;
                                                    UserAddresses[@"Location"] = _TextLocation1.text;
                                                    UserAddresses[@"Address"] = _DeliAddress1.text;
                                                    UserAddresses[@"Unit_Suite"] = _DeliAddress2.text;
                                                    UserAddresses[@"ZipCode"] = _DeliAddress3.text;
                                                    [UserAddresses saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                                                        if (succeeded) {
                                                            local = [PFObject objectWithClassName:@"Order"];
                                                            local[@"PickupAddress"] = _PickupAddress.text;
                                                            local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                                            local[@"PickupZipcode"] = _PickupZipcode.text;
                                                            local[@"DeliveryAddress"] = _DeliAddress1.text;
                                                            local[@"DeliveryUnitSuite"] = _DeliAddress2.text;
                                                            local[@"DeliveryZipcode"] = _DeliAddress3.text;
                                                            if (_PickupSpecialNotes.text != nil) {
                                                                local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                            }else if(_DeliLabel5.text != nil){
                                                                local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                            }else if (_PickupSpecialNotes.text != nil && _DeliLabel5.text != nil){
                                                                local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                                local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                            }else{
                                                                
                                                            }
                                                            
                                                            [local pinInBackground];
                                                            [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                                        }else{
                                                            NSLog(@"%@",error.description);
                                                        }
                                                    }];
                                                    
                                                }
                                                
                                            }];
                                        }
                                        
                                    }else if ([_TextLocation1.text isEqualToString:@"Don't save"]) {
                                        
                                        PFUser *cus = [PFUser currentUser];
                                        NSString *us = cus[@"username"];
                                        NSPredicate *userandlocation = [NSPredicate predicateWithFormat:@"username = %@ AND Location = %@",us,_TextLocation.text];
                                        PFQuery *addressuser = [PFQuery queryWithClassName:@"Addresses" predicate:userandlocation];
                                        [addressuser getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *errir){
                                            if (!errir) {
                                                _PickupAddress.text = object[@"Address"];
                                                _PickupUnitSuite.text = object[@"Unit_Suite"];
                                                _PickupZipcode.text = object[@"ZipCode"];
                                                local = [PFObject objectWithClassName:@"Order"];
                                                local[@"PickupAddress"] = _PickupAddress.text;
                                                local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                                local[@"PickupZipcode"] = _PickupZipcode.text;
                                                local[@"DeliveryAddress"] = _DeliAddress1.text;
                                                local[@"DeliveryUnitSuite"] = _DeliAddress2.text;
                                                local[@"DeliveryZipcode"] = _DeliAddress3.text;
                                                if (_PickupSpecialNotes.text != nil) {
                                                    local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                }else if(_DeliLabel5.text != nil){
                                                    local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                }else if (_PickupSpecialNotes.text != nil && _DeliLabel5.text != nil){
                                                    local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                    local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                }else{
                                                    
                                                }
                                                
                                                [local pinInBackground];
                                                [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                            }else{
                                                PFObject *UserAddresses = [PFObject objectWithClassName:@"Addresses"];
                                                UserAddresses[@"username"] = us;
                                                UserAddresses[@"Location"] = _TextLocation.text;
                                                UserAddresses[@"Address"] = _PickupAddress.text;
                                                UserAddresses[@"Unit_Suite"] = _PickupUnitSuite.text;
                                                UserAddresses[@"ZipCode"] = _PickupZipcode.text;
                                                [UserAddresses saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                                                    if (succeeded) {
                                                        local = [PFObject objectWithClassName:@"Order"];
                                                        local[@"PickupAddress"] = _PickupAddress.text;
                                                        local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                                        local[@"PickupZipcode"] = _PickupZipcode.text;
                                                        local[@"DeliveryAddress"] = _DeliAddress1.text;
                                                        local[@"DeliveryUnitSuite"] = _DeliAddress2.text;
                                                        local[@"DeliveryZipcode"] = _DeliAddress3.text;
                                                        if (_PickupSpecialNotes.text != nil) {
                                                            local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                        }else if(_DeliLabel5.text != nil){
                                                            local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                        }else if (_PickupSpecialNotes.text != nil && _DeliLabel5.text != nil){
                                                            local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                            local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                        }else{
                                                            
                                                        }
                                                        
                                                        [local pinInBackground];
                                                        [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                                    }else{
                                                        NSLog(@"%@",error.description);
                                                    }
                                                }];
                                                
                                            }
                                            
                                        }];
                                        
                                    }else{
                                        PFUser *cus = [PFUser currentUser];
                                        NSString *us = cus[@"username"];
                                        NSPredicate *userandlocation = [NSPredicate predicateWithFormat:@"username = %@ AND Location = %@",us,_TextLocation.text];
                                        PFQuery *addressuser = [PFQuery queryWithClassName:@"Addresses" predicate:userandlocation];
                                        [addressuser getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *errir){
                                            if (!errir) {
                                                _PickupAddress.text = object[@"Address"];
                                                _PickupUnitSuite.text = object[@"Unit_Suite"];
                                                _PickupZipcode.text = object[@"ZipCode"];
                                                
                                                NSPredicate *userandlocation1 = [NSPredicate predicateWithFormat:@"username = %@ AND Location = %@",us,_TextLocation1.text];
                                                PFQuery *addressusers = [PFQuery queryWithClassName:@"Addresses" predicate:userandlocation1];
                                                [addressusers getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *errir){
                                                    if (!errir) {
                                                        _DeliAddress1.text = object[@"Address"];
                                                        _DeliAddress2.text = object[@"Unit_Suite"];
                                                        _DeliAddress3.text = object[@"ZipCode"];
                                                        local = [PFObject objectWithClassName:@"Order"];
                                                        local[@"PickupAddress"] = _PickupAddress.text;
                                                        local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                                        local[@"PickupZipcode"] = _PickupZipcode.text;
                                                        local[@"DeliveryAddress"] = _DeliAddress1.text;
                                                        local[@"DeliveryUnitSuite"] = _DeliAddress2.text;
                                                        local[@"DeliveryZipcode"] = _DeliAddress3.text;
                                                        if (_PickupSpecialNotes.text != nil) {
                                                            local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                        }else if(_DeliLabel5.text != nil){
                                                            local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                        }else if (_PickupSpecialNotes.text != nil && _DeliLabel5.text != nil){
                                                            local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                            local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                        }else{
                                                            
                                                        }
                                                        
                                                        [local pinInBackground];
                                                        [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                                    }else{
                                                        PFObject *UserAddresses = [PFObject objectWithClassName:@"Addresses"];
                                                        UserAddresses[@"username"] = us;
                                                        UserAddresses[@"Location"] = _TextLocation1.text;
                                                        UserAddresses[@"Address"] = _DeliAddress1.text;
                                                        UserAddresses[@"Unit_Suite"] = _DeliAddress2.text;
                                                        UserAddresses[@"ZipCode"] = _DeliAddress3.text;
                                                        [UserAddresses saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                                                            if (succeeded) {
                                                                local = [PFObject objectWithClassName:@"Order"];
                                                                local[@"PickupAddress"] = _PickupAddress.text;
                                                                local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                                                local[@"PickupZipcode"] = _PickupZipcode.text;
                                                                local[@"DeliveryAddress"] = _DeliAddress1.text;
                                                                local[@"DeliveryUnitSuite"] = _DeliAddress2.text;
                                                                local[@"DeliveryZipcode"] = _DeliAddress3.text;
                                                                if (_PickupSpecialNotes.text != nil) {
                                                                    local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                                }else if(_DeliLabel5.text != nil){
                                                                    local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                                }else if (_PickupSpecialNotes.text != nil && _DeliLabel5.text != nil){
                                                                    local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                                    local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                                }else{
                                                                    
                                                                }
                                                                
                                                                [local pinInBackground];
                                                                [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                                            }else{
                                                                NSLog(@"%@",error.description);
                                                            }
                                                        }];
                                                        
                                                    }
                                                    
                                                }];
                                                
                                            }else{
                                                PFObject *UserAddresses = [PFObject objectWithClassName:@"Addresses"];
                                                UserAddresses[@"username"] = us;
                                                UserAddresses[@"Location"] = _TextLocation.text;
                                                UserAddresses[@"Address"] = _PickupAddress.text;
                                                UserAddresses[@"Unit_Suite"] = _PickupUnitSuite.text;
                                                UserAddresses[@"ZipCode"] = _PickupZipcode.text;
                                                [UserAddresses saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                                                    if (succeeded) {
                                                        
                                                        NSPredicate *userandlocation1 = [NSPredicate predicateWithFormat:@"username = %@ AND Location = %@",us,_TextLocation1.text];
                                                        PFQuery *addressusers = [PFQuery queryWithClassName:@"Addresses" predicate:userandlocation1];
                                                        [addressusers getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *errir){
                                                            if (!errir) {
                                                                _DeliAddress1.text = object[@"Address"];
                                                                _DeliAddress2.text = object[@"Unit_Suite"];
                                                                _DeliAddress3.text = object[@"ZipCode"];
                                                                local = [PFObject objectWithClassName:@"Order"];
                                                                local[@"PickupAddress"] = _PickupAddress.text;
                                                                local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                                                local[@"PickupZipcode"] = _PickupZipcode.text;
                                                                local[@"DeliveryAddress"] = _DeliAddress1.text;
                                                                local[@"DeliveryUnitSuite"] = _DeliAddress2.text;
                                                                local[@"DeliveryZipcode"] = _DeliAddress3.text;
                                                                if (_PickupSpecialNotes.text != nil) {
                                                                    local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                                }else if(_DeliLabel5.text != nil){
                                                                    local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                                }else if (_PickupSpecialNotes.text != nil && _DeliLabel5.text != nil){
                                                                    local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                                    local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                                }else{
                                                                    
                                                                }
                                                                
                                                                [local pinInBackground];
                                                                [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                                            }else{
                                                                PFObject *UserAddresses = [PFObject objectWithClassName:@"Addresses"];
                                                                UserAddresses[@"username"] = us;
                                                                UserAddresses[@"Location"] = _TextLocation1.text;
                                                                UserAddresses[@"Address"] = _DeliAddress1.text;
                                                                UserAddresses[@"Unit_Suite"] = _DeliAddress2.text;
                                                                UserAddresses[@"ZipCode"] = _DeliAddress3.text;
                                                                [UserAddresses saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                                                                    if (succeeded) {
                                                                        local = [PFObject objectWithClassName:@"Order"];
                                                                        local[@"PickupAddress"] = _PickupAddress.text;
                                                                        local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                                                        local[@"PickupZipcode"] = _PickupZipcode.text;
                                                                        local[@"DeliveryAddress"] = _DeliAddress1.text;
                                                                        local[@"DeliveryUnitSuite"] = _DeliAddress2.text;
                                                                        local[@"DeliveryZipcode"] = _DeliAddress3.text;
                                                                        if (_PickupSpecialNotes.text != nil) {
                                                                            local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                                        }else if(_DeliLabel5.text != nil){
                                                                            local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                                        }else if (_PickupSpecialNotes.text != nil && _DeliLabel5.text != nil){
                                                                            local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                                            local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                                        }else{
                                                                            
                                                                        }
                                                                        
                                                                        [local pinInBackground];
                                                                        [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                                                    }else{
                                                                        NSLog(@"%@",error.description);
                                                                    }
                                                                }];
                                                                
                                                            }
                                                            
                                                        }];
                                                    }else{
                                                        NSLog(@"%@",error.description);
                                                    }
                                                }];
                                                
                                            }
                                            
                                        }];
                                    }
                                    
                                }else{
                                    NSString *zipcodewrong = [NSString stringWithFormat:@"We do not offer the service in %@", _DeliAddress3.text];
                                    UIAlertView *WrongZipcode = [[UIAlertView alloc] initWithTitle:@"Sending" message:zipcodewrong delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                                    [WrongZipcode show];
                                }
                            
                            
                        }else{
                            UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"Complete Fields" message:@"Please fill all field which has *" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                            [aler show];
                            
                        }
                    }else if (iml==0 && [self.SameAddressDelivery.currentTitle isEqualToString:@"Use my current location for delivery"]){
                        if(_DeliAddress1.text.length>=7 && _DeliAddress2.text.length>=2 && [self validateZip:[_DeliAddress3 text]]==1 && ![self.TextLocation1.text isEqual:@""]){
                            
                            BOOL delizip1 = [self validzip:_DeliAddress3];
                                if (delizip1 == true) {
                                    
                                    if ([_TextLocation.text isEqualToString:@"Don't save"]) {
                                        if ([_TextLocation1.text isEqualToString:@"Don't save"]) {
                                            local = [PFObject objectWithClassName:@"Order"];
                                            local[@"PickupAddress"] = _PickupAddress.text;
                                            local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                            local[@"PickupZipcode"] = _PickupZipcode.text;
                                            local[@"DeliveryAddress"] = _DeliAddress1.text;
                                            local[@"DeliveryUnitSuite"] = _DeliAddress2.text;
                                            local[@"DeliveryZipcode"] = _DeliAddress3.text;
                                            if (_PickupSpecialNotes.text != nil) {
                                                local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                            }else if(_DeliLabel5.text != nil){
                                                local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                            }else if (_PickupSpecialNotes.text != nil && _DeliLabel5.text != nil){
                                                local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                            }else{
                                                
                                            }
                                            
                                            [local pinInBackground];
                                            [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                        }else{
                                            PFObject *UserAddresses = [PFObject objectWithClassName:@"Addresses"];
                                            PFUser *currentu = [PFUser currentUser];
                                            UserAddresses[@"username"] = currentu[@"username"];
                                            UserAddresses[@"Location"] = _TextLocation1.text;
                                            UserAddresses[@"Address"] = _DeliAddress1.text;
                                            UserAddresses[@"Unit_Suite"] = _DeliAddress2.text;
                                            UserAddresses[@"ZipCode"] = _DeliAddress3.text;
                                            [UserAddresses saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                                                if (succeeded) {
                                                    [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                                }else{
                                                    NSLog(@"%@",error.description);
                                                }
                                            }];
                                        }
                                        
                                    }else if ([_TextLocation1.text isEqualToString:@"Don't save"]) {
                                        PFObject *UserAddresses = [PFObject objectWithClassName:@"Addresses"];
                                        PFUser *currentu = [PFUser currentUser];
                                        UserAddresses[@"username"] = currentu[@"username"];
                                        UserAddresses[@"Location"] = _TextLocation.text;
                                        UserAddresses[@"Address"] = _PickupAddress.text;
                                        UserAddresses[@"Unit_Suite"] = _PickupUnitSuite.text;
                                        UserAddresses[@"ZipCode"] = _PickupZipcode.text;
                                        [UserAddresses saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                                            if (succeeded) {
                                                local = [PFObject objectWithClassName:@"Order"];
                                                local[@"PickupAddress"] = _PickupAddress.text;
                                                local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                                local[@"PickupZipcode"] = _PickupZipcode.text;
                                                local[@"DeliveryAddress"] = _DeliAddress1.text;
                                                local[@"DeliveryUnitSuite"] = _DeliAddress2.text;
                                                local[@"DeliveryZipcode"] = _DeliAddress3.text;
                                                if (_PickupSpecialNotes.text != nil) {
                                                    local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                }else if(_DeliLabel5.text != nil){
                                                    local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                }else if (_PickupSpecialNotes.text != nil && _DeliLabel5.text != nil){
                                                    local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                    local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                }else{
                                                    
                                                }
                                                
                                                [local pinInBackground];
                                                [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                            }else{
                                                NSLog(@"%@",error.description);
                                            }
                                        }];
                                        
                                    }else{
                                        PFObject *UserAddresses = [PFObject objectWithClassName:@"Addresses"];
                                        PFUser *currentu = [PFUser currentUser];
                                        UserAddresses[@"username"] = currentu[@"username"];
                                        UserAddresses[@"Location"] = _TextLocation.text;
                                        UserAddresses[@"Address"] = _PickupAddress.text;
                                        UserAddresses[@"Unit_Suite"] = _PickupUnitSuite.text;
                                        UserAddresses[@"ZipCode"] = _PickupZipcode.text;
                                        
                                        [UserAddresses saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                                            if (succeeded) {
                                                PFObject *UserAddresses = [PFObject objectWithClassName:@"Addresses"];
                                                PFUser *currentu = [PFUser currentUser];
                                                UserAddresses[@"username"] = currentu[@"username"];
                                                UserAddresses[@"Location"] = _TextLocation1.text;
                                                UserAddresses[@"Address"] = _DeliAddress1.text;
                                                UserAddresses[@"Unit_Suite"] = _DeliAddress2.text;
                                                UserAddresses[@"ZipCode"] = _DeliAddress3.text;
                                                [UserAddresses saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
                                                    if (succeeded) {
                                                        local = [PFObject objectWithClassName:@"Order"];
                                                        local[@"PickupAddress"] = _PickupAddress.text;
                                                        local[@"PickupUnitSuite"] = _PickupUnitSuite.text;
                                                        local[@"PickupZipcode"] = _PickupZipcode.text;
                                                        local[@"DeliveryAddress"] = _DeliAddress1.text;
                                                        local[@"DeliveryUnitSuite"] = _DeliAddress2.text;
                                                        local[@"DeliveryZipcode"] = _DeliAddress3.text;
                                                        if (_PickupSpecialNotes.text != nil) {
                                                            local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                        }else if(_DeliLabel5.text != nil){
                                                            local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                        }else if (_PickupSpecialNotes.text != nil && _DeliLabel5.text != nil){
                                                            local[@"PickupSpecialNotes"] = _PickupSpecialNotes.text;
                                                            local[@"DeliverySpecialNotes"] = _DeliLabel5.text;
                                                        }else{
                                                            
                                                        }
                                                        
                                                        [local pinInBackground];
                                                        [self performSegueWithIdentifier:@"ToSchedule" sender:self];
                                                    }else{
                                                        NSLog(@"%@",error.description);
                                                    }
                                                }];
                                                
                                            }else{
                                                NSLog(@"%@",error.description);
                                            }
                                        }];
                                    }
                                    
                                }else{
                                    NSString *zipcodewrong = [NSString stringWithFormat:@"We do not offer the service in %@", _DeliAddress3.text];
                                    UIAlertView *WrongZipcode = [[UIAlertView alloc] initWithTitle:@"Sending" message:zipcodewrong delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                                    [WrongZipcode show];
                                }
                            
                           
                            
                            
                        }else{
                            UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"Complete Fields" message:@"Please fill all field which has *" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                            [aler show];
                            
                        }
                        
                    }
                    
                    
                    
            
            }else{
                NSString *zp = [NSString stringWithFormat:@"We do not offer the service in %@",_PickupZipcode.text];
                UIAlertView *WrongZipcode = [[UIAlertView alloc] initWithTitle:@"Sending" message:zp delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [WrongZipcode show];
                // NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        
        
    }else {
        
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"Complete Fields" message:@"Please fill all field which has *" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [aler show];
    }

}

- (IBAction)DeliveryAddress:(id)sender {
    [_SameAddressDelivery setTitle:@"Use my current location for delivery" forState:0];
    iml = 0;
    [_SameAddressDelivery setImage:[UIImage imageNamed:@"check1"] forState:0];
    
        _SameAddressDelivery.frame = CGRectMake(_SameAddressDelivery.frame.origin.x-20, _SameAddressDelivery.frame.origin.y, _SameAddressDelivery.frame.size.width+50,_SameAddressDelivery.frame.size.height);
        self.buttonAddress.frame = CGRectMake(self.buttonAddress.frame.origin.x , 920, self.buttonAddress.frame.size.width , self.buttonAddress.frame.size.height);
        self.Scroll.contentSize = CGSizeMake(320, 1417);
    self.NewAddress.hidden = TRUE;
    self.DeliLabel.hidden = FALSE;
    self.DeliLabel1.hidden = FALSE;
    self.DeliLabel2.hidden = FALSE;
    self.DeliLabel3.hidden = FALSE;
    self.DeliLabel4.hidden = FALSE;
    self.DeliLabel5.hidden = FALSE;
    self.DeliAddress.hidden = FALSE;
    self.DeliAddress1.hidden = FALSE;
    self.DeliAddress2.hidden = FALSE;
    self.DeliAddress3.hidden = FALSE;
    self.DeliAddress4.hidden = FALSE;
    self.DeliAddress5.hidden = FALSE;
    self.TextLocation1.hidden = FALSE;
    self.Bluearrow1.hidden = FALSE;
}

- (IBAction)ChangeImg:(id)sender {
    /*locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];*/
    if (img == 0) {
        [locationManager requestWhenInUseAuthorization];
        
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [locationManager startUpdatingLocation];
        self.PickupAddress.text = [NSString stringWithFormat:@"%@ %@",
                                   placemark.subThoroughfare, placemark.thoroughfare];
        self.PickupZipcode.text = placemark.postalCode;
        [_CurrentLocationButton setImage:[UIImage imageNamed:@"check2"] forState:0];
        img = 1;
        
        
    }else{
        [_CurrentLocationButton setImage:[UIImage imageNamed:@"check1"] forState:0];
        img = 0;
        self.PickupAddress.text= nil;
        self.PickupAddress.placeholder = @"Address*";
        self.PickupZipcode.text= nil;
        self.PickupZipcode.placeholder = @"Zipcode*";
        [locationManager stopUpdatingLocation];
        
    }
    
    
    
}

- (IBAction)SameAddDeli:(id)sender {
    if ([self.SameAddressDelivery.currentTitle isEqualToString:@"Use my current location for delivery"]) {
        if (iml == 0) {
            [_SameAddressDelivery setImage:[UIImage imageNamed:@"check2"] forState:0];
            iml = 1;
            //NSLog(@"Paso por aqui");
            [locationManager requestWhenInUseAuthorization];
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            [locationManager startUpdatingLocation];
            self.DeliAddress1.text = [NSString stringWithFormat:@"%@ %@",
             placemark.subThoroughfare, placemark.thoroughfare];
             self.DeliAddress3.text = placemark.postalCode;
            
        }else{
            [_SameAddressDelivery setImage:[UIImage imageNamed:@"check1"] forState:0];
            iml = 0;
            _DeliAddress1.text = nil;
            _DeliAddress1.placeholder = @"Address*";
            _DeliAddress3.text = nil;
            _DeliAddress3.placeholder = @"Zipcode*";
        }
    }else{
        if (iml == 0) {
            [_SameAddressDelivery setImage:[UIImage imageNamed:@"check2"] forState:0];
            iml = 1;
            self.NewAddress.hidden = TRUE;
        }else{
            [_SameAddressDelivery setImage:[UIImage imageNamed:@"check1"] forState:0];
            iml = 0;
            self.NewAddress.hidden = FALSE;
        }
        
    }
    
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Error con la localizacion");
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    CLLocation *CL = newLocation;
    [geocode reverseGeocodeLocation:CL completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error == nil && [placemarks count]>0) {
            placemark = [placemarks lastObject];
            /*self.PickupAddress.text = [NSString stringWithFormat:@"%@ %@",
                                       placemark.subThoroughfare, placemark.thoroughfare];
            self.PickupZipcode.text = placemark.postalCode;*/
        }
    }];
}


- (IBAction)PlaceOrder:(id)sender {
    PFObject *Order = [PFObject objectWithClassName:@"Order"];
    PFUser *cuser = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"Order"];
    [query whereKey:@"OrderNumber" greaterThanOrEqualTo:@0];
    [query orderByDescending:@"OrderNumber"];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
            NSLog(@"The getFirstObject request failed.");
        } else {
            // The find succeeded.
            
            //NSLog(@"%@",object[@"OrderNumber"]);
            ordernumber = [object[@"OrderNumber"] intValue]+1;
            PFQuery *localquery = [PFQuery queryWithClassName:@"Order"];
             [localquery fromLocalDatastore];
             local = [PFObject objectWithClassName:@"Order"];
             [local unpinInBackground];
             [localquery findObjectsInBackgroundWithBlock:^(NSArray *arra,NSError *err){
             if (!err) {
             
             
             for (PFObject *object in arra) {
             PickAddress = [NSString stringWithFormat:@"%@",object[@"PickupAddress"]];
             PickUnit = [NSString stringWithFormat:@"%@",object[@"PickupUnitSuite"]];
             PickZip = [NSString stringWithFormat:@"%@",object[@"PickupZipcode"]];
             PickNotes = [NSString stringWithFormat:@"%@",object[@"PickupSpecialNotes"]];
             DeliveryAddress = [NSString stringWithFormat:@"%@",object[@"DeliveryAddress"]];
             DeliveryUnit = [NSString stringWithFormat:@"%@",object[@"DeliveryUnitSuite"]];
             DeliveryZip = [NSString stringWithFormat:@"%@",object[@"DeliveryZipcode"]];
             DeliveryNotes = [NSString stringWithFormat:@"%@",object[@"DeliverySpecialNotes"]];
                 Order[@"Paid"] = @NO;
             Order[@"username"] = cuser[@"username"];
             Order[@"Verify"] = @NO;
             Order[@"PickupAddress"] = PickAddress;
             Order[@"PickupUnitSuite"] = PickUnit;
                 Order[@"OrderNumber"] = @(ordernumber);
             if (PickNotes != nil) {
             Order[@"PickupSpecialNotes"] = PickNotes;
             }
             
             Order[@"PickupZipcode"] = PickZip;
             Order[@"DeliveryAddress"] = DeliveryAddress;
             Order[@"DeliveryUnitSuite"] = DeliveryUnit;
             Order[@"DeliveryZipcode"] = DeliveryZip;
             if (DeliveryNotes) {
             Order[@"DeliverySpecialNotes"] = DeliveryNotes;
             }
             
             Order[@"AM"] = _TimeOne.text;
             Order[@"PM"] = _TimeTwo.text;
             Order[@"Pickupdate"] = _DateOne.text;
             Order[@"Dropoffdate"] = _DateTwo.text;
             [Order saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
             if (succeeded) {
                //NSPredicate *usercc = [NSPredicate predicateWithFormat:@"Username = %@ AND CCnumber > 0",cuser];
                 PFQuery *cinfo = [PFQuery queryWithClassName:@"User"];
                 [cinfo whereKey:@"Username" equalTo:cuser[@"username"]];
                 [cinfo whereKey:@"CCnumber" greaterThan:@0];
                 [cinfo getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
                     if (!object) {
                        // NSLog(@"no tiene tarjeta");
                         [self performSegueWithIdentifier:@"Ccinfo" sender:self];
                     } else {
                        //NSLog(@"tiene tarjeta %@",object[@"CCnumber"]);
                         
                         [self performSegueWithIdentifier:@"Tracking1" sender:self];
                     }}];
                 
             
             }else{
             UIAlertView *alerta = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Didn't work" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
             [alerta show];
             }
             }];
             
             }
             
             }
             }];
            
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


