//
//  CellUser.m
//  ELS
//
//  Created by saranpol on 8/1/56 BE.
//  Copyright (c) 2556 saranpol. All rights reserved.
//

#import "CellUser.h"
#import "API.h"

@implementation CellUser

@synthesize mLabelName;
@synthesize mLabelPhone;
@synthesize mLabelEmail;
@synthesize mLabelAnswer;
@synthesize mTableView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)clickDelete:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Confirm!"
                          message:@"Do you want to Delete?"
                          delegate:self
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    int idx = self.tag;

    if(buttonIndex == 0)
    {
        
    }else if(buttonIndex == 1)
    {
        API *a = [API getAPI];
        [a removeData:idx];
        [mTableView reloadData];
    }
    
}


@end
