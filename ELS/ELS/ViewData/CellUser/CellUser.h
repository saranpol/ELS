//
//  CellUser.h
//  ELS
//
//  Created by saranpol on 8/1/56 BE.
//  Copyright (c) 2556 saranpol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellUser : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *mLabelName;
@property (nonatomic, weak) IBOutlet UILabel *mLabelPhone;
@property (nonatomic, weak) IBOutlet UILabel *mLabelEmail;
@property (nonatomic, weak) IBOutlet UILabel *mLabelAnswer;
@property (nonatomic, assign) UITableView *mTableView;

- (IBAction)clickDelete:(id)sender;

@end
