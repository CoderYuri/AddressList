//
//  YLaddContactsViewController.m
//  通讯录
//
//  Created by Yuri on 15/10/15.
//  Copyright © 2015年 Yuri. All rights reserved.
//

#import "YLaddContactsViewController.h"
#import "YLContact.h"
#import "YLContactsViewController.h"
@interface YLaddContactsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *addName;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UITextField *addPhone;
@end

@implementation YLaddContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.addBtn addTarget:self action:@selector(btnEnabled) forControlEvents:UIControlEventEditingChanged];
    [self.addPhone addTarget:self action:@selector(btnEnabled) forControlEvents:UIControlEventEditingChanged];
}

- (void)btnEnabled{
    self.addBtn.enabled = self.addName.text.length && self.addPhone.text.length;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)add:(id)sender {
    YLContact *contact = [YLContact contactWithName:self.addName.text andNumber:self.addPhone.text];
    
    self.yacvc.contact = contact;
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
