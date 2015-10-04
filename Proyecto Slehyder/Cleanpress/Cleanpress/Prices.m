//
//  Prices.m
//  Cleanpress
//
//  Created by Slehyder Martinez on 8/6/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import "Prices.h"
#import <Parse/Parse.h>
@interface Prices ()
{
    NSArray *recipeImages;
}
@end

@implementation Prices
#define fourCellHeight 130.0
#define fiveCellHeight 170.0
#define sixCellHeight 205.0
#define sixplusCellHeight 225.0
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.topbar.hidesBackButton = YES;
    [self.topbar setLeftItemsSupplementBackButton:YES];
    UIBarButtonItem *gomenu = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"go_back"] style:UIBarButtonItemStylePlain target:self action:@selector(ToMenu)];
    
    [self.topbar setLeftBarButtonItem:gomenu animated:YES];
    self.topbar.leftBarButtonItem.tintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"go_back"]];
    
     NSArray *mainDishImages = [NSArray arrayWithObjects:@"dc_jeans-01.png", @"dc_dresspants-01.png", @"dc_jackets-01.png", @"dc_shirts-01.png", @"dc_blouses-01.png", @"dc_bras-01.png", @"dc_underwear-01.png", @"dc_dresses-01.png", @"dc_suits-01.png", nil];
        recipeImages = [NSArray arrayWithObjects:mainDishImages, nil];
    [self consultprices];
}
-(void) consultprices {
    PFQuery *query = [PFQuery queryWithClassName:@"Prices"];
    [query orderByAscending:@"createdAt"];
    query.limit=9;
    query.skip=1;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objecto,NSError *error){
        if (!error) {
            consult = [[NSMutableArray alloc] initWithArray:objecto];
            [_Tableview reloadData];
        }
        [_Tableview reloadData];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return [consult count];

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identifier = @"Cell";
    
        ViewCellPrices *cell = (ViewCellPrices *)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    PFObject *tempObject = [consult objectAtIndex:indexPath.row];
    NSNumber *prices = [tempObject objectForKey:@"Price"];
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:[recipeImages[indexPath.section] objectAtIndex:indexPath.row]];
    UILabel *tituloView = (UILabel *) [cell viewWithTag:20];
    tituloView.text = [[NSString alloc] initWithFormat:@"$%@",prices];

 return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(self.Window.frame.size.height <= 480) {
        return fourCellHeight;
    }else if(self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568  ) {
        // Cell isn't selected so return single height
        return fiveCellHeight;
    }else if(self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667 ) {
        // Cell isn't selected so return single height
        return sixCellHeight;
    }else if(self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736 ) {
        // Cell isn't selected so return single height
        return sixplusCellHeight;
    } else {
        
        return 0.0;
    }

    
    
}
-(void)ToMenu{
    [self.navigationController popViewControllerAnimated:YES];
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
