//
//  YLContact.h
//  通讯录
//
//  Created by Yuri on 15/10/15.
//  Copyright © 2015年 Yuri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLContact : NSObject

/**    name*/
@property (nonatomic, strong)NSString *name;

/**    number*/
@property (nonatomic, strong)NSString *number;

+ (instancetype)contactWithName:(NSString *)name andNumber:(NSString *)number;
@end
