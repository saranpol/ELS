//
//  ViewSummary.m
//  ELS
//
//  Created by saranpol on 8/1/56 BE.
//  Copyright (c) 2556 saranpol. All rights reserved.
//

#import "ViewSummary.h"
#import "API.h"

@implementation ViewSummary
@synthesize mImageQ1Yes;
@synthesize mImageQ1NO;
@synthesize mImageQ4Yes;
@synthesize mImageQ4NO;
@synthesize mLabelQ2;
@synthesize mLabelQ3;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    API *a = [API getAPI];
    [mImageQ1Yes setHidden:!a.mQ1];
    [mImageQ1NO setHidden:a.mQ1];
    [mImageQ4Yes setHidden:!a.mQ4];
    [mImageQ4NO setHidden:a.mQ4];
    [mLabelQ2 setText:[NSString stringWithFormat:@"%d", a.mQ2]];
    [mLabelQ3 setText:[NSString stringWithFormat:@"%d", a.mQ3]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickEdit:(id)sender {
    [[[[[[self presentingViewController]
    presentingViewController]
    presentingViewController]
    presentingViewController]
      presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    API *a = [API getAPI];
    [a addData];
    [a resetData];
}


@end
