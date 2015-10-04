#import <UIKit/UIKit.h>

#import "ViewCell.h"

@interface feedback : UIViewController <UITextViewDelegate, UITableViewDelegate, UITableViewDataSource>

{
    
    
    
    NSMutableArray *consult;
    
    NSMutableDictionary *selectedIndexes;
    
    UIButton *btn;
    
}



@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;

@property (weak, nonatomic) IBOutlet UIButton *btnSubmit2;

@property (weak, nonatomic) IBOutlet UITableView *tableViewFeed;

@property (strong, nonatomic) IBOutlet UIView *Window;




@end

