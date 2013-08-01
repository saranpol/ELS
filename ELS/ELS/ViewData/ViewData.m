//
//  ViewData.m
//  ELS
//
//  Created by saranpol on 8/1/56 BE.
//  Copyright (c) 2556 saranpol. All rights reserved.
//

#import "ViewData.h"
#import "CellUser.h"
#import "API.h"

@implementation ViewData

@synthesize mTableView;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    API *a = [API getAPI];
    return [a.mArrayData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellUser *cell = [tableView dequeueReusableCellWithIdentifier:@"CellUser" forIndexPath:indexPath];
    API *a = [API getAPI];
    NSDictionary *d = [a.mArrayData objectAtIndex:indexPath.row];
    [cell.mLabelName setText:[d objectForKey:@"mName"]];
    [cell.mLabelPhone setText:[d objectForKey:@"mPhone"]];
    [cell.mLabelEmail setText:[d objectForKey:@"mEmail"]];
    
    NSString *q1 = [[d objectForKey:@"mQ1"] boolValue] ? @"YES" : @"NO";
    int q2 = [[d objectForKey:@"mQ2"] intValue];
    int q3 = [[d objectForKey:@"mQ3"] intValue];
    NSString *q4 = [[d objectForKey:@"mQ4"] boolValue] ? @"YES" : @"NO";
    
    NSString *answer = [NSString stringWithFormat:@"%@,%d,%d,%@", q1, q2, q3, q4];
    [cell.mLabelAnswer setText:answer];
    
    cell.mTableView = mTableView;
    cell.tag = indexPath.row;
    
    return cell;
}


@end
