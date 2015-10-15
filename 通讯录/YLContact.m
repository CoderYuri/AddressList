//
//  YLContact.m
//  通讯录
//
//  Created by Yuri on 15/10/15.
//  Copyright © 2015年 Yuri. All rights reserved.
//

#import "YLContact.h"

@implementation YLContact

+ (instancetype)contactWithName:(NSString *)name andNumber:(NSString *)number{
    YLContact *contact = [[YLContact alloc]init];
    contact.name = name;
    contact.number = number;
    return contact;
}
@end
