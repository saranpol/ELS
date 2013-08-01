//
//  ViewSummary.h
//  ELS
//
//  Created by saranpol on 8/1/56 BE.
//  Copyright (c) 2556 saranpol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewSummary : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *mImageQ1Yes;
@property (nonatomic, weak) IBOutlet UIImageView *mImageQ1NO;
@property (nonatomic, weak) IBOutlet UIImageView *mImageQ4Yes;
@property (nonatomic, weak) IBOutlet UIImageView *mImageQ4NO;
@property (nonatomic, weak) IBOutlet UILabel *mLabelQ2;
@property (nonatomic, weak) IBOutlet UILabel *mLabelQ3;


- (IBAction)clickEdit:(id)sender;

- (IBAction)clickBack:(id)sender;

@end
