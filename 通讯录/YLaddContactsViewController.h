//
//  YLaddContactsViewController.h
//  通讯录
//
//  Created by Yuri on 15/10/15.
//  Copyright © 2015年 Yuri. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class YLContactsViewControlleri;
@class YLContact;
@protocol addContactsViewControllerDelegate  <NSObject>

- (void)addcontact:(YLContact *)contact;

@optional

@end
@interface YLaddContactsViewController : UIViewController

/**    delegate*/
@property (nonatomic, strong)id<addContactsViewControllerDelegate> delegate;


@end
