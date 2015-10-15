//
//  YLContactsViewController.h
//  通讯录
//
//  Created by Yuri on 15/10/15.
//  Copyright © 2015年 Yuri. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YLContact;
@interface YLContactsViewController : UITableViewController

/**    string*/
@property (nonatomic, strong)NSString *account;

/**    contact*/
@property (nonatomic, strong)YLContact *contact;

@end
