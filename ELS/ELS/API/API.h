//
//  API.h
//  ELS
//
//  Created by saranpol on 8/1/56 BE.
//  Copyright (c) 2556 saranpol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface API : NSObject

+ (API *)getAPI;

@property (nonatomic, assign) BOOL mQ1;
@property (nonatomic, assign) NSInteger mQ2;
@property (nonatomic, assign) NSInteger mQ3;
@property (nonatomic, assign) BOOL mQ4;
@property (nonatomic, strong) NSString *mName;
@property (nonatomic, strong) NSString *mPhone;
@property (nonatomic, strong) NSString *mEmail;
@property (nonatomic, strong) NSMutableArray *mArrayData;

- (void)resetData;
- (void)addData;
- (void)removeData:(int)idx;
- (NSString*)getHtml;


@end
