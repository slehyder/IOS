//
//  Signup.m
//  Cleanpress
//
//  Created by eris ramirez on 6/15/15.
//  Copyright (c) 2015 Eris Ramirez. All rights reserved.
//

#import "Signup.h"
#import <Parse/Parse.h>

@interface Signup (){

    NSString *acep;
bool img;
}


@end

@implementation Signup



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    img=0;
    self.CreateAcc.enabled = FALSE;
    self.CreateAcc.backgroundColor = [UIColor colorWithRed:0.329 green:0.408 blue:0.475 alpha:0.5];
    if(self.view.frame.size.height <= 480 ){
        self.scroll.contentSize = CGSizeMake(self.scroll.frame.size.width, 480);
    }else if (self.view.frame.size.height > 480 && self.view.frame.size.height <= 568 ){
        self.CreateAcc.frame = CGRectMake(0, 465, self.CreateAcc.frame.size.width, self.CreateAcc.frame.size.height);
    }else if (self.view.frame.size.height > 568 && self.view.frame.size.height <= 667){
        self.CreateAcc.frame = CGRectMake(0, 563, self.CreateAcc.frame.size.width, self.CreateAcc.frame.size.height);
    }else if (self.view.frame.size.height > 667 && self.view.frame.size.height <= 736){
        self.CreateAcc.frame = CGRectMake(0, 632, self.CreateAcc.frame.size.width, self.CreateAcc.frame.size.height);
    }
    /*PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
     testObject[@"foo"] = @"nuevaPrueba";
     [testObject saveInBackground];*/
    
    // Do any additional setup after loading the view, typically from a nib.
}



-(BOOL)validatefields : (NSString *) candidate{
    NSString *regex = @"[a-zA-Z]{1,}";
    NSPredicate *Fieldtest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [Fieldtest evaluateWithObject:candidate];
}
-(BOOL)validateEmail : (NSString *) ema{
    NSString *regex = @"[A-Z0-9a-z@.]{2,}";
    NSPredicate *Fieldtest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [Fieldtest evaluateWithObject: ema];
}


-(BOOL)validatePw : (NSString *) PW{
    NSString *regex = @"[A-Z0-9a-z]{1,}";
    NSPredicate *Fieldtest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [Fieldtest evaluateWithObject: PW];
}


-(BOOL)validatePhoneNumber : (NSString *) PN{
    NSString *regex = @"[235689][0-9]{6}([0-9]{3})?";
    NSPredicate *Fieldtest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [Fieldtest evaluateWithObject: PN];
}


- (IBAction)btn:(UIButton *)sender {
    
    
    if (img == 0) {
        
        [_termsAndConditionsImg setImage:[UIImage imageNamed:@"check2"] forState:0];
               img = 1;
        
    }else{
        
        [_termsAndConditionsImg setImage:[UIImage imageNamed:@"check1"] forState:0];
        img=0;
    }
    
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.Name) {
        [self.LName becomeFirstResponder];
    }else if (textField == self.LName){
        [self.PhoneNumber becomeFirstResponder];
    }else if(textField == self.PhoneNumber){
        [self.EmailSign becomeFirstResponder];
    }else if (textField == self.EmailSign){
        [self.ConfirmEmail becomeFirstResponder];
    }else if (textField == self.ConfirmEmail){
        [self.Pw becomeFirstResponder];
    }else if (textField == self.Pw){
        
        [self.CPw becomeFirstResponder];
    }else if (textField==self.CPw){
        [textField resignFirstResponder];
    }
    
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_LName resignFirstResponder];
    [_EmailSign resignFirstResponder];
    [_PhoneNumber resignFirstResponder];
    [_ConfirmEmail resignFirstResponder];
    [_CPw resignFirstResponder];
    [_Name resignFirstResponder];
}

- (IBAction)Change {
    
    
    if ([self validatefields:[_Name text]]==1 && [self validatefields:[_LName text]]==1  && [self validatePw:[_CPw text]]==1 && [self validatePw:[_Pw text]]==1  && [self validateEmail:[_EmailSign text]] == 1 &&  [self validateEmail:[_ConfirmEmail text]] == 1 && [self validatePhoneNumber:[_PhoneNumber text]]==1)   {
       
        if(img==1){
        
        self.CreateAcc.backgroundColor = [UIColor greenColor];
            self.CreateAcc.enabled = TRUE;}
    }else{
        
        
            self.CreateAcc.backgroundColor = [UIColor colorWithRed:0.329 green:0.408 blue:0.475 alpha:0.5];
            self.CreateAcc.enabled = FALSE;
        
        }
    
    
    
}
- (IBAction)Validateconnection:(id)sender {
    NSString *email = self.EmailSign.text;
    NSString *emailcon = self.ConfirmEmail.text;
    if (![email isEqualToString:emailcon]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Please verify if both email are equals" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
        //[alert release];
    }else if (![self.Pw.text isEqualToString:self.CPw.text]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"Please verify if both passwords are equals" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
    }else if (![email containsString:@"@"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERT" message:@"The email is wrong" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
    }else if([email isEqualToString:emailcon] && [self.Pw.text isEqualToString:self.CPw.text] && [email containsString:@"@"]){
        
        PFUser *user = [PFUser user];
        PFQuery *query = [PFUser query];
        PFObject *Userobject = [PFObject objectWithClassName:@"User"];
        [query whereKey:@"username" equalTo:email];
        [query getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *error){
            if (!error) {
                
                    
                    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Usuario existente" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [alerta show];
                
            }else{
                user.username = email;
                user.password = self.Pw.text;
                user.email = email;
                Userobject[@"Username"] = email;
                Userobject[@"FirstName"] = self.Name.text;
                Userobject[@"LastName"] = self.LName.text;
                Userobject[@"Phone"]=self.PhoneNumber.text;
                [Userobject saveInBackground];
                [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
                    if (!error) {
                        [self performSegueWithIdentifier:@"SignupSucceeded" sender:self];
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
