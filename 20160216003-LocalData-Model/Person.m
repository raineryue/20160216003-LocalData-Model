//
//  Person.m
//  20160216003-LocalData-Model
//
//  Created by Rainer on 16/2/16.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initPersonWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

+ (instancetype)personWithDictionary:(NSDictionary *)dictionary {
    return [[Person alloc] initPersonWithDictionary:dictionary];
}

/**
 *  属性编码
 */
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_age forKey:@"age"];
}

/**
 *  初始化编码后的属性，这里在归档时会调用
 */
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeIntegerForKey:@"age"];
    }
    
    return self;
}

@end
