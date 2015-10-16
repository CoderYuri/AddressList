//
//  YLLoginViewController.m
//  通讯录
//
//  Created by Yuri on 15/10/15.
//  Copyright © 2015年 Yuri. All rights reserved.
//

#import "YLLoginViewController.h"
#import "MBProgressHUD+XMG.h"
#import "YLContactsViewController.h"
@interface YLLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *rememberSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

@end

@implementation YLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.account addTarget:self action:@selector(txtFiled) forControlEvents:UIControlEventEditingChanged];
    [self.pwd addTarget:self action:@selector(txtFiled) forControlEvents:UIControlEventEditingChanged];
    
    [self txtFiled];
  
}

- (void)txtFiled{
    self.loginBtn.enabled = self.account.text.length && self.pwd.text.length;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)remberS:(UISwitch *)sender {
    if(!sender.on){
//        _autoLoginSwitch.on = NO;
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

- (IBAction)LoginS:(UISwitch *)sender {
    if(sender.on){
        [self.rememberSwitch setOn:YES animated:YES];
    }
}


- (IBAction)enterBtn:(id)sender {
//    dispatch_after(dispatch_time(<#dispatch_time_t when#>, <#int64_t delta#>), <#dispatch_queue_t queue#>, ^{
//        <#code#>
//    })
      [MBProgressHUD showMessage:@"正在登录ing...."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [MBProgressHUD hideHUD];
        if([_account.text isEqualToString:@"Yuri"] && [_pwd.text isEqualToString:@"940412"] ){
            [self performSegueWithIdentifier:@"loginContact" sender:nil];
        }
        else{
            [MBProgressHUD showError:@"密码或账号有错"];
        }
    });

   
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sende{
    YLContactsViewController *vc = segue.destinationViewController;
    vc.account = _account.text;
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
