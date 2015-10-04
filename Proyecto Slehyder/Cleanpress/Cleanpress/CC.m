//
//  CC.m
//  Cleanpress
//
//  Created by eris ramirez on 6/29/15.
//  Copyright © 2015 Eris Ramirez. All rights reserved.
//

#import "CC.h"
#import "PTKTextField.h"


@interface CC ()<PTKTextFieldDelegate>


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)replacementString;
- (BOOL)cardNumberFieldShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)replacementString;
- (BOOL)cardCVCShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)replacementString;

@property (nonatomic) PTKCardNumber *cardNumber;
@property (nonatomic) PTKCardExpiry *cardExpiry;
@property (nonatomic) PTKCardCVC *cardCVC;
@property (nonatomic) PTKAddressZip *addressZip;
@end
NSInteger *year;
@implementation CC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ContinueButton.enabled = false;
    self.ContinueButton.backgroundColor = [UIColor grayColor];
    self.baritem.hidesBackButton = YES;
    //self.ContinueButton.enabled = false;
    //start Creating CC info textfields
    self.CCnumber = [[PTKTextField alloc] initWithFrame:CGRectMake(20,176, 280, 30)];
    self.CCnumber.delegate = self;
    self.CCnumber.placeholder = @"Credit Card Number";
    self.CCnumber.keyboardType = UIKeyboardTypeNumberPad;
    [self.CCnumber.layer setMasksToBounds:YES];
    [self.view addSubview:self.CCnumber];
    self.expMonth = [[PTKTextField alloc]initWithFrame:CGRectMake(20, 214, 140, 30)];
    self.expMonth.enabled = false;
    self.expMonth.delegate = self;
    self.expMonth.placeholder = @"MM*";
    self.expMonth.keyboardType = UIKeyboardTypeNumberPad;
    [self.expMonth.layer setMasksToBounds:YES];
    [self.view addSubview:self.expMonth];
    self.expYear = [[UITextField alloc]initWithFrame:CGRectMake(170, 214, 140, 30)];
    self.expYear.enabled = false;
    self.expYear.delegate = self;
    self.expYear.placeholder = @"YYYY*";
    self.expYear.keyboardType = UIKeyboardTypeNumberPad;
    [self.expYear.layer setMasksToBounds:YES];
    [self.view addSubview:self.expYear];
    self.cvc = [[PTKTextField alloc]initWithFrame:CGRectMake(20, 264, 140, 30)];
    self.cvc.enabled = false;
    self.cvc.delegate = self;
    self.cvc.placeholder = @"CVC*";
    self.cvc.keyboardType = UIKeyboardTypeNumberPad;
    [self.cvc.layer setMasksToBounds:YES];
    [self.view addSubview:self.cvc];
    self.cardzipcode = [[UITextField alloc]initWithFrame:CGRectMake(170, 264, 140, 30)];
    self.cardzipcode.delegate = self;
    self.cardzipcode.enabled =false;
    self.cardzipcode.placeholder = @"Zipcode";
    self.cardzipcode.keyboardType = UIKeyboardTypeNumberPad;
    [self.cardzipcode.layer setMasksToBounds:YES];
    [self.view addSubview:self.cardzipcode];
    //end
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

#pragma mark - Accessors


/*-(BOOL)isValid{
    return [self.cardNumber isValid];

}*/

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)replacementString
{
    if ([textField isEqual:self.CCnumber]) {
        self.expMonth.enabled = true;
        return [self cardNumberFieldShouldChangeCharactersInRange:range replacementString:replacementString];
        
     
    }
    
    if ([textField isEqual:self.expMonth]) {
        self.expYear.enabled = true;
        return [self cardMonthShouldChangeCharactersInRange:range replacementString:replacementString];
        
    }
    
    if ([textField isEqual:self.expYear]) {
        self.cvc.enabled = true;
       return [self cardYearShouldChangeCharactersInRange:range replacementString:replacementString];
       
    }
    
    if ([textField isEqual:self.cvc]) {
        self.cardzipcode.enabled = true;
        return [self cardCVCShouldChangeCharactersInRange:range replacementString:replacementString];
    }
    
    if ([textField isEqual:self.cardzipcode]) {
        return [self cardZipShouldChangeCharactersInRange:range replacementString:replacementString];
    }
    
       
    
    return YES;
}


- (BOOL)cardNumberFieldShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)replacementString
{
    NSString *resultString = [self.CCnumber.text stringByReplacingCharactersInRange:range withString:replacementString];
    resultString = [PTKTextField textByRemovingUselessSpacesFromString:resultString];
    PTKCardNumber *cardNumber = [PTKCardNumber cardNumberWithString:resultString];
    
    if (![cardNumber isPartiallyValid]) return NO;
    
    if (replacementString.length > 0) {
        self.CCnumber.text = [cardNumber formattedStringWithTrail];
        
    } else {
        self.CCnumber.text = [cardNumber formattedString];
    }
    
    
    if ([cardNumber isValid]) {
        [self textFieldIsValid:self.CCnumber];
        
        //[self stateMeta];
        
    } else if ([cardNumber isValidLength] && ![cardNumber isValidLuhn]) {
        [self textFieldIsInvalid:self.CCnumber withErrors:YES];
        
    } else if (![cardNumber isValidLength]) {
        [self textFieldIsInvalid:self.CCnumber withErrors:NO];
    }
    
    return NO;
}

- (BOOL)cardMonthShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)replacementString
{
    NSString *resultString = [self.expMonth.text stringByReplacingCharactersInRange:range withString:replacementString];
    resultString = [PTKTextField textByRemovingUselessSpacesFromString:resultString];
    PTKCardExpiry *cardmonth = [PTKCardExpiry cardExpiryWithString:resultString];
    
    if (![cardmonth isPartiallyValid]) return NO;
    
    // Only support shorthand year
    if ([cardmonth formattedString].length > 5) return NO;
    
    if (replacementString.length > 0) {
        self.expMonth.text = [cardmonth formattedStringWithTrail];
        if (self.expMonth.text.length ==2) {
            
               //if (![cardyear isPartiallyValid]) return NO;
            
        }
        
    } else {
        self.expMonth.text = [cardmonth formattedString];
        
    }
    
    if ([cardmonth isValid]) {
        [self textFieldIsValid:self.expMonth];
        
        //[self stateCardCVC];
        
    } else if ([cardmonth isValidLength] && ![cardmonth isValidDate]) {
        [self textFieldIsInvalid:self.expMonth withErrors:YES];
    } else if (![cardmonth isValidLength]) {
        [self textFieldIsInvalid:self.expMonth withErrors:NO];
    }
    
    return NO;
}

- (BOOL)cardYearShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)replacementString
{
   
   
    if(range.length + range.location > self.expYear.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [self.expYear.text length] + [replacementString length] - range.length;
    return newLength < 5;
   
    return NO;
}

- (BOOL)cardZipShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)replacementString
{
    
    if(range.length + range.location > self.cardzipcode.text.length)
    {
       self.cardzipcode.textColor = [UIColor redColor];
        self.ContinueButton.enabled = false;
        self.ContinueButton.backgroundColor = [UIColor grayColor];
        return NO;
    }else{
        self.ContinueButton.enabled = true;
        self.ContinueButton.backgroundColor = [UIColor colorWithRed:0.447 green:0.886 blue:0.463 alpha:1];;
        self.cardzipcode.textColor = [UIColor blackColor];
        
        
    }
    
    NSUInteger newLength = [self.cardzipcode.text length] + [replacementString length] - range.length;
    return newLength < 6;
    
    return NO;
}

-(BOOL)cardCVCShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)replacementString{
    NSString *resultString = [self.cvc.text stringByReplacingCharactersInRange:range withString:replacementString];
    resultString = [PTKTextField textByRemovingUselessSpacesFromString:resultString];
    PTKCardCVC *cardCVC = [PTKCardCVC cardCVCWithString:resultString];
    PTKCardType cardType = [[PTKCardNumber cardNumberWithString:self.CCnumber.text] cardType];
    
    // Restrict length
    if (![cardCVC isPartiallyValidWithType:cardType]) return NO;
    
    // Strip non-digits
    self.cvc.text = [cardCVC string];
    
    if ([cardCVC isValidWithType:cardType]) {
        [self textFieldIsValid:self.cvc];
        [self.cardzipcode becomeFirstResponder];
        self.Authorized.textColor = [UIColor colorWithRed:0.447 green:0.886 blue:0.463 alpha:1];
    } else {
        [self textFieldIsInvalid:self.cvc withErrors:NO];
        self.Authorized.textColor = [UIColor colorWithRed:0.706 green:0.71 blue:0.733 alpha:1];
    }
    
    return NO;

}


/*- (void)checkValid
{
    if ([self isValid]) {
        _isValidState = YES;
        
        if ([self.delegate respondsToSelector:@selector(paymentView:withCard:isValid:)]) {
            [self.delegate paymentView:self withCard:self.card isValid:YES];
        }
        
    } else if (![self isValid]) {
        _isValidState = NO;
        
        if ([self.delegate respondsToSelector:@selector(paymentView:withCard:isValid:)]) {
            [self.delegate paymentView:self withCard:self.card isValid:NO];
        }
    }
}*/

- (void)textFieldIsValid:(UITextField *)textField
{
    textField.textColor = [UIColor blackColor];
    //[self checkValid];
}

- (void)textFieldIsInvalid:(UITextField *)textField withErrors:(BOOL)errors
{
    if (errors) {
        textField.textColor = [UIColor redColor];
    } else {
        textField.textColor = [UIColor blackColor];
    }
    
   // [self checkValid];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [_CCnumber resignFirstResponder];
    [_expMonth resignFirstResponder];
    [_expYear resignFirstResponder];
    [_cvc resignFirstResponder];
    [_cardzipcode resignFirstResponder];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.CCnumber) {
        [_CCnumber resignFirstResponder];
    }
    
    return YES;
}





- (IBAction)Next:(id)sender {
    NSDate *date = [NSDate date];
    NSCalendar *grego = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [grego components:NSCalendarUnitYear fromDate:date];
    
    if (comp.year > [self.expYear.text intValue]) {
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Year field is wrong" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alerta show];
        self.expYear.textColor = [UIColor redColor];
    }else{
        self.expYear.textColor = [UIColor blackColor];
        PFUser *ccuser = [PFUser currentUser];
        //PFObject *ccinfo = [PFObject objectWithClassName:@"User"];
        int ccexpmonth,ccexpyear,cccvc,cczip;
        NSInteger ccnumber;
        NSString *year = [NSString stringWithFormat:@"%@",self.expYear.text];
        year = [year substringFromIndex:2];
        NSString *card = [NSString stringWithFormat:@"%@",[self.CCnumber.text stringByReplacingOccurrencesOfString:@" " withString:@""]];
        ccnumber = [card integerValue];
        ccexpmonth = [self.expMonth.text intValue];
        ccexpyear = [year intValue];
        cccvc = [self.cvc.text intValue];
        cczip = [self.cardzipcode.text intValue];
        PFQuery *queryuser = [PFQuery queryWithClassName:@"User"];
        [queryuser whereKey:@"Username" equalTo:ccuser[@"username"]];
        [queryuser getFirstObjectInBackgroundWithBlock:^(PFObject *use, NSError *error){
            if (!error) {
                use[@"CCnumber"] = @(ccnumber);
                use[@"expMonth"] = @(ccexpmonth);
                use[@"expYear"] = @(ccexpyear);
                use[@"cvc"] = @(cccvc);
                use[@"CCzipcode"] = @(cczip);
                [use saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
                    if (!error) {
                        [self performSegueWithIdentifier:@"Tracking" sender:self];
                    }else{
                        NSString *errorString = [error userInfo][@"error"];
                        // Show the errorString somewhere and let the user try again.
                        
                        // Create alert.
                        UIAlertView *errorMessage = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                        
                        // Display the alert.
                        [errorMessage show];
                    }
                    
                }];
            }
            
            
        }];
        
    }
    
   
}

@end
