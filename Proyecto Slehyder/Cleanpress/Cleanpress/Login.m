//
//  Login.m
//  Cleanpress
//
//  Created by eris ramirez on 7/3/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import "Login.h"
#import <Parse/Parse.h>

@interface Login ()

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    //[super resignFirstResponder];
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
- (IBAction)ResetPw:(id)sender {
    if(_EmailLog.text.length == 0){
        UIAlertView *ResetPW = [[UIAlertView alloc] initWithTitle:@"Provide a Email" message:@"Provide a Email to reset your password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [ResetPW show];
    }else{
        [PFUser requestPasswordResetForEmailInBackground:_EmailLog.text];
        UIAlertView *ResetPW = [[UIAlertView alloc] initWithTitle:@"Sending" message:@"We sent you a Email to reset your password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [ResetPW show];
    }
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_EmailLog resignFirstResponder];
    [_PwLog resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.EmailLog){
        [self.PwLog becomeFirstResponder];
    }else if (textField == self.PwLog){
        [textField resignFirstResponder];
        if (self.EmailLog.text.length != 0 && self.PwLog.text.length != 0)
        {
            // Fire request to check username and password
            [PFUser logInWithUsernameInBackground:self.EmailLog.text password:self.PwLog.text
                                            block:^(PFUser *user, NSError *error)
             { if (user)
             {
                 // Do stuff after successful login.
                 
                 // Execute segue into menu and order view controllers
                 PFUser *currentUser = [PFUser currentUser];
                 PFQuery *Order = [PFQuery queryWithClassName:@"Order"];
                 [Order whereKey:@"username" equalTo:currentUser[@"username"]];
                 [Order whereKey:@"Paid" equalTo:@NO];
                 [Order orderByDescending:@"createAt"];
                 [Order getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *error){
                     if (!object) {
                         NSLog(@"esta mierda no existe");
                         [self performSegueWithIdentifier:@"LoginSucceded" sender:self];
                         /*UIViewController *test=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Mainly"];
                          UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test];
                          self.window.rootViewController = nav;*/
                     }else{
                         NSLog(@"esta mierda si existe %@",object.objectId);
                         [self performSegueWithIdentifier:@"LoginToTracking" sender:self];
                         /*UIViewController *test=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Tracking"];
                          UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test];
                          self.window.rootViewController = nav;*/
                         
                     }
                 }];
             }
             else if (error.code == 101)
             {
                 // Create alert regarding error.
                 UIAlertView *loginError = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Invalid username or password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                 
                 // Display the alert
                 [loginError show];
             }
             }];
        }
        else
        {
            // Create alert.
            UIAlertView *loginMessage = [[UIAlertView alloc] initWithTitle:@"Incomplete Fields" message:@"Please provide username and password before submitting" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            
            // Display the alert.
            [loginMessage show];
        }
        
    }
    //}
    
    return YES;
}


- (IBAction)loginClicked:(id)sender
{
    // Test if all fields are filled by user.
    if (self.EmailLog.text.length != 0 && self.PwLog.text.length != 0)
    {
        // Fire request to check username and password
        [PFUser logInWithUsernameInBackground:self.EmailLog.text password:self.PwLog.text
                                        block:^(PFUser *user, NSError *error)
         { if (user)
         {
             // Do stuff after successful login.
        
             // Execute segue into menu and order view controllers
             PFUser *currentUser = [PFUser currentUser];
             PFQuery *Order = [PFQuery queryWithClassName:@"Order"];
             [Order whereKey:@"username" equalTo:currentUser[@"username"]];
             [Order whereKey:@"Paid" equalTo:@NO];
             [Order orderByDescending:@"createAt"];
             [Order getFirstObjectInBackgroundWithBlock:^(PFObject *object,NSError *error){
                 if (!object) {
                     NSLog(@"esta mierda no existe");
                     [self performSegueWithIdentifier:@"LoginSucceded" sender:self];
                     /*UIViewController *test=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Mainly"];
                     UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test];
                     self.window.rootViewController = nav;*/
                 }else{
                     NSLog(@"esta mierda si existe %@",object.objectId);
                     [self performSegueWithIdentifier:@"LoginToTracking" sender:self];
                     /*UIViewController *test=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Tracking"];
                     UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test];
                     self.window.rootViewController = nav;*/
                     
                 }
             }];
             
             //[self performSegueWithIdentifier:@"LoginSucceded" sender:self];
         }
         else if (error.code == 101)
         {
             // Create alert regarding error.
             UIAlertView *loginError = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Invalid username or password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
             
             // Display the alert
             [loginError show];
         }
         }];
    }
    else
    {
        // Create alert.
        UIAlertView *loginMessage = [[UIAlertView alloc] initWithTitle:@"Incomplete Fields" message:@"Please provide username and password before submitting" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        // Display the alert.
        [loginMessage show];
    }
}


@end


