//
//  feedback.m
//  Cleanpress
//
//  Created by Slehyder Martinez on 7/28/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.

#import "feedback.h"
#import <Parse/Parse.h>
#import "QuartzCore/QuartzCore.h"
#import "ViewCell.h"
@interface feedback ()
{
    int currentSelection;
}
- (BOOL)cellIsSelected:(NSIndexPath *)indexPath;
@end
@implementation feedback
#define kCellHeight 80.0
#define fourCellHeight 80.0
#define fiveCellHeight 70.0
#define sixCellHeight 75.0
#define sixplusCellHeight 80.0
@synthesize tableViewFeed;
- (void)viewDidLoad {
        [super viewDidLoad];
    // Do any additional setup after loading the view.
    // self.textView.maximumZoomScale=20.0;
    

    
    
    UIToolbar *toobar=[[UIToolbar alloc]initWithFrame:CGRectMake(0,0,320,44)];
    UIBarButtonItem *removeBtn = [[UIBarButtonItem alloc]initWithTitle:@"Close" style:UIBarButtonItemStyleDone  target:self action:@selector(removekeyboard)];
    UIBarButtonItem *space= [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toobar setItems:[NSArray arrayWithObjects:space,removeBtn, nil]];
    [self.textView setInputAccessoryView:toobar];
    [self consultfeedback];
    selectedIndexes = [[NSMutableDictionary alloc] init];
}
- (BOOL)cellIsSelected:(NSIndexPath *)indexPath {
    // Return whether the cell at the specified index path is selected or not
    NSNumber *selectedIndex = [selectedIndexes objectForKey:indexPath];
    return selectedIndex == nil ? FALSE : [selectedIndex boolValue];
}
-(void) consultfeedback {
    PFQuery *query = [PFQuery queryWithClassName:@"FeedBack"];
    [query orderByDescending:@"createdAt"];
    query.limit=6;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objecto,NSError *error){
        if (!error) {
            consult = [[NSMutableArray alloc] initWithArray:objecto];
            [tableViewFeed reloadData];
        }
        [tableViewFeed reloadData];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([_textView.text isEqualToString:@"Enter a new review"]) {
        _textView.text = @"";
        _textView.textColor = [UIColor blackColor]; //optional
    }
    [_textView becomeFirstResponder];
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([_textView.text isEqualToString:@""]) {
        _textView.text = @"Enter a new review";
        _textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [_textView resignFirstResponder];
}
-(void)removekeyboard{
    [self.textView resignFirstResponder];
    if (self.textView.text != nil ){
        if( ![self.textView.text isEqualToString:@"Enter a new review"]){
            if(![self.textView.text isEqualToString:@""]){
                self.btnSubmit.hidden=YES;
                self.btnSubmit.enabled=NO;
                self.btnSubmit2.enabled=YES;
                self.btnSubmit2.hidden=NO;
            }else {
                self.btnSubmit.hidden=NO;
                self.btnSubmit.enabled=YES;
                self.btnSubmit2.enabled=NO;
                self.btnSubmit2.hidden=YES;
            }
        }
    }
}
- (IBAction)saveReview:(id)sender {
    PFUser *cus = [PFUser currentUser];
    NSString *us = cus[@"username"];
    NSDate *current= [NSDate date];
    NSDateFormatter *dateFormatte = [[NSDateFormatter alloc] init];
    [dateFormatte setDateFormat:@"MM/dd/yyyy"];
    [dateFormatte stringFromDate:current];
    PFObject * save = [ PFObject objectWithClassName : @ "FeedBack"];
    save [@"Review"] = self.textView.text ;
    save [@"username"] = us;
    save [@"Today"] =[dateFormatte stringFromDate:current];
    [ save saveInBackgroundWithBlock : ^ (BOOL succeeded , NSError * error) {
        if (succeeded) {
            // The object is saved.
            self.textView.text=@"Enter a new review";
            [self consultfeedback];
            self.btnSubmit.hidden=YES;
            self.btnSubmit2.hidden=NO;
        
            [tableViewFeed reloadData];
            [tableViewFeed reloadInputViews];
        } else {
            // There was a problem, error.description
            NSLog(@"%@",error.description);
        }
    } ] ;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // if (consult.count>=1) {
    return consult.count;
    /*  }else{
     UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
     messageLabel.text = @"No data is currently available.";
     messageLabel.textColor = [UIColor blackColor];
     messageLabel.numberOfLines = 0;
     messageLabel.textAlignment = NSTextAlignmentCenter;
     messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:13];
     [messageLabel sizeToFit];
     self.tableViewFeed.backgroundView = messageLabel;
     self.tableViewFeed.separatorStyle = UITableViewCellSeparatorStyleNone;
     return 0;
     }
     */
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    ViewCell *cell = (ViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    PFObject *tempObject = [consult objectAtIndex:indexPath.row];
    NSString *fecha = [tempObject objectForKey:@"Today"];
    NSString *review = [tempObject objectForKey:@"Review"];
    NSDateFormatter *dateFormatte = [[NSDateFormatter alloc] init];
    [dateFormatte setDateFormat:@"MM/dd/yyyy"];
    NSDate *date = [[NSDate alloc] init];
    date= [dateFormatte dateFromString:fecha];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"EEEE"];
    PFUser *cuser = [PFUser currentUser];
    
    NSString *us = cuser[@"username"];
    NSInteger row = [indexPath row];
    
      
        PFQuery *user = [PFQuery queryWithClassName:@"FeedBack"];
        
        [user whereKey:@"username" equalTo:us];
        [user orderByDescending:@"createdAt"];
        [user getFirstObjectInBackgroundWithBlock:^(PFObject *obje,NSError *errir){
            
            if (!errir) {
            if (row==0) {
            NSString *fech = obje[@"Today"];
         
                NSDate *da = [[NSDate alloc] init];
                da= [dateFormatte dateFromString:fech];
                
                
            NSString *wee=[format stringFromDate:da];
            UILabel * day= (UILabel *) [cell viewWithTag:1];
            day.text = wee;
            UILabel *dat=(UILabel *)[cell viewWithTag:2];
            dat.text =fech;
            UITextView *revi=(UITextView *)[cell viewWithTag:3];
            revi.text = obje[@"Review"];
            revi.textContainerInset = UIEdgeInsetsZero;
            revi.textContainer.lineFragmentPadding = 0;
            revi.textColor=[UIColor colorWithRed:0.207 green:0.207 blue:0.212 alpha:0.5];;
            [revi setFont:[ UIFont systemFontOfSize: 13]];
            revi.textAlignment= NSTextAlignmentJustified;
                
            btn=(UIButton *)[cell viewWithTag:4];
                [btn.titleLabel setFont:[ UIFont systemFontOfSize: 12]];
            }
            }
        
        }];
        
    
   
    
    
    NSString *week=[format stringFromDate:date];
    UILabel * day= (UILabel *) [cell viewWithTag:1];
    day.text = week;
    UILabel *dat=(UILabel *)[cell viewWithTag:2];
    dat.text =fecha;
    UITextView *revi=(UITextView *)[cell viewWithTag:3];
    revi.text = review;
    revi.textContainerInset = UIEdgeInsetsZero;
    revi.textContainer.lineFragmentPadding = 0;
    revi.textColor=[UIColor colorWithRed:0.207 green:0.207 blue:0.212 alpha:0.5];;
    [revi setFont:[ UIFont systemFontOfSize: 13]];
    revi.textAlignment= NSTextAlignmentJustified;
    btn=(UIButton *)[cell viewWithTag:4];
    [btn.titleLabel setFont:[ UIFont systemFontOfSize: 12]];
    
    return cell;
}
#pragma mark Tableview Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Deselect cell
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    BOOL isSelected = ![self cellIsSelected:indexPath];
    // Toggle 'selected' state
   // NSLog(@": (");
    // Store cell 'selected' state keyed on indexPath
   NSNumber *selectedIndex = [NSNumber numberWithBool:isSelected];
    [selectedIndexes setObject:selectedIndex forKey:indexPath];
    // This is where magic happens...
    [tableViewFeed beginUpdates];
    [tableViewFeed endUpdates];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // If our cell is selected, return double height
    
    
    if(self.Window.frame.size.height <= 480) {
        
        
        
        if([self cellIsSelected:indexPath]) {
            return fourCellHeight * 2.0;
        }else {
            // Cell isn't selected so return single height
            return fourCellHeight;
        }
        
       
        
    }else if(self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568  ) {
        
        if([self cellIsSelected:indexPath]) {
            return fiveCellHeight * 2.0;
        }else {
            // Cell isn't selected so return single height
            return fiveCellHeight;
        }
        
        // Cell isn't selected so return single height
       
        
        
        
    }else if(self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667 ) {
        
        
        if([self cellIsSelected:indexPath]) {
            return sixCellHeight * 2.0;
        }else {
            // Cell isn't selected so return single height
            return sixCellHeight;
        }
        
        // Cell isn't selected so return single height
        
       
        
        
        
    }else if(self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736 ) {
        // Cell isn't selected so return single height
        if([self cellIsSelected:indexPath]) {
            return sixplusCellHeight * 2.0;
        }else {
            // Cell isn't selected so return single height
            return sixplusCellHeight;
        }
     
        
    } else {
        
        return 0.0;
    }
    
    
    
    
    
    
    

}
/*-(void) textViewDidChange :( UITextView  *) textView
 {
 if ([btn resignFirstResponder]) {
 NSUInteger maxNumberOfLines = 8;
 NSUInteger numLines = textView.contentSize.height/textView.font.lineHeight;
 if (numLines > maxNumberOfLines
 {
 textView.text = [textView.text substringToIndex:textView.text.length - 1];
 }
 }else{
 NSUInteger maxNumberOfLines = 3;
 NSUInteger numLines = textView.contentSize.height/textView.font.lineHeight;
 if (numLines > maxNumberOfLines)
 {
 textView.text = [textView.text substringToIndex:textView.text.length - 1];
 }
 }
 }*/
@end