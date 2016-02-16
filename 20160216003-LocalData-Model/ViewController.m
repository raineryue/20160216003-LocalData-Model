//
//  ViewController.m
//  20160216003-LocalData-Model
//
//  Created by Rainer on 16/2/16.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/**
 *  存储按钮点击事件
 */
- (IBAction)saveClickAction:(id)sender {
    // 1.获取Document的路径
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    // 2.拼接数据存储文件
    NSString *dataPlistPath = [documentPath stringByAppendingPathComponent:@"person.data"];
    
    // 3.使用归档将自定义对象存入数据存储文件类
    [NSKeyedArchiver archiveRootObject:self.person toFile:dataPlistPath];
}

/**
 *  取出按钮点击事件
 */
- (IBAction)readClickAction:(id)sender {
    // 1.获取Document的路径
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    // 2.拼接数据存储文件
    NSString *dataPlistPath = [documentPath stringByAppendingPathComponent:@"person.data"];
    
    // 3.解档数据存储文件
    Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:dataPlistPath];
    
    NSLog(@"name:%@ age:%ld", person.name, person.age);
}

/**
 *  懒加载对象属性
 */
- (Person *)person {
    if (nil == _person) {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        
        dictionary[@"name"] = @"Rainer";
        dictionary[@"age"] = @30;
        
        _person = [[Person alloc] initPersonWithDictionary:dictionary];
    }
    
    return _person;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
