//
//  Person.h
//  20160216003-LocalData-Model
//
//  Created by Rainer on 16/2/16.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

// 归档对象需要遵守NSCoding协议
@interface Person : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger age;

- (instancetype)initPersonWithDictionary:(NSDictionary *)dictionary;

+ (instancetype)personWithDictionary:(NSDictionary *)dictionary;

@end
