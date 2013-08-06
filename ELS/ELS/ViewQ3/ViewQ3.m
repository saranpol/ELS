//
//  ViewQ3.m
//  ELS
//
//  Created by saranpol on 8/1/56 BE.
//  Copyright (c) 2556 saranpol. All rights reserved.
//

#import "ViewQ3.h"
#import "API.h"

@implementation ViewQ3

@synthesize mTextField;
@synthesize mView;

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
    
    int x = a.mQ3;
    
    if(x == 0){
        [mTextField setText:@""];
    }else{
        [mTextField setText:[NSString stringWithFormat:@"%d", x]];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)onKeyboardShow:(NSNotification *)notification {
    CGRect f = mView.frame;
    f.origin.y = -100;
    [UIView animateWithDuration:0.3 animations:^{
        [mView setFrame:f];;
    }];
    
}

- (void)onKeyboardHide:(NSNotification *)notification {
    CGRect f = mView.frame;
    f.origin.y = 0;
    [UIView animateWithDuration:0.3 animations:^{
        [mView setFrame:f];;
    }];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    API *a = [API getAPI];
    a.mQ3 = [mTextField.text intValue];
    [mTextField resignFirstResponder];
}

- (IBAction)clickBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

@end
