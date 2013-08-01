//
//  API.m
//  ELS
//
//  Created by saranpol on 8/1/56 BE.
//  Copyright (c) 2556 saranpol. All rights reserved.
//

#import "API.h"

@implementation API


@synthesize mQ1;
@synthesize mQ2;
@synthesize mQ3;
@synthesize mQ4;
@synthesize mName;
@synthesize mPhone;
@synthesize mEmail;
@synthesize mArrayData;

static API *instance;

static NSString *kSaveData = @"SAVE_DATA_KEY";

+ (API*)getAPI {
    if (instance == nil) {
        instance = [[API alloc] init];
    }
    return instance;
}

- (API*)init {
    API *a = [super init];
    
    NSArray *loadArray = [self loadObject:kSaveData];
    if(loadArray){
        self.mArrayData = [NSMutableArray arrayWithArray:loadArray];
    }else{
        self.mArrayData = [[NSMutableArray alloc] init];
    }
    
    return a;
}


- (id)loadObject:(NSString*)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

- (void)saveObject:(id)obj forKey:(NSString*)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:obj forKey:key];
    [userDefaults synchronize];
}

- (void)resetData {
    self.mQ1 = NO;
    self.mQ2 = 0;
    self.mQ3 = 0;
    self.mQ4 = NO;
    
    self.mName = @"";
    self.mPhone = @"";
    self.mEmail = @"";
}

- (void)addData {
    NSMutableDictionary *d = [[NSMutableDictionary alloc] init];
    [d setObject:[NSNumber numberWithBool:mQ1] forKey:@"mQ1"];
    [d setObject:[NSNumber numberWithInt:mQ2] forKey:@"mQ2"];
    [d setObject:[NSNumber numberWithInt:mQ3] forKey:@"mQ3"];
    [d setObject:[NSNumber numberWithBool:mQ4] forKey:@"mQ4"];
    if(mName)
        [d setObject:mName forKey:@"mName"];
    else
        [d setObject:@"" forKey:@"mName"];
    if(mPhone)
        [d setObject:mPhone forKey:@"mPhone"];
    else
        [d setObject:@"" forKey:@"mPhone"];
    if(mEmail)
        [d setObject:mEmail forKey:@"mEmail"];
    else
        [d setObject:@"" forKey:@"mEmail"];
        
    [mArrayData addObject:d];
    
    [self saveObject:mArrayData forKey:kSaveData];
}

- (NSString*)getHtml {
    NSString *html = @"<style>\
    table{\
        font-family:Arial;\
        border-collapse:collapse;\
    }\
    table, td, th{\
        border:1px solid black;\
        padding:15px;\
    }\
    </style>\
    <table><tr><td>Name</td><td>Phone</td><td>Email</td><td>Q1</td><td>Q2</td><td>Q3</td><td>Q4</td></tr>";
    
    for(NSDictionary *d in mArrayData){
        NSString *name = [d objectForKey:@"mName"];
        NSString *phone = [d objectForKey:@"mPhone"];
        NSString *email = [d objectForKey:@"mEmail"];
        NSString *q1 = [[d objectForKey:@"mQ1"] boolValue] ? @"YES" : @"NO";
        int q2 = [[d objectForKey:@"mQ2"] intValue];
        int q3 = [[d objectForKey:@"mQ3"] intValue];
        NSString *q4 = [[d objectForKey:@"mQ4"] boolValue] ? @"YES" : @"NO";
        html = [html stringByAppendingFormat:@"<tr><td>%@</td><td>%@</td><td>%@</td><td>%@</td><td>%d</td><td>%d</td><td>%@</td></tr>", name, phone, email, q1, q2, q3, q4];
    }
    
    html = [html stringByAppendingString:@"</table>"];
    
    return html;
}

- (void)removeData:(int)idx {
    [mArrayData removeObjectAtIndex:idx];
    [self saveObject:mArrayData forKey:kSaveData];
}

@end
