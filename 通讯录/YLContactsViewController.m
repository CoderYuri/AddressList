//
//  YLContactsViewController.m
//  通讯录
//
//  Created by Yuri on 15/10/15.
//  Copyright © 2015年 Yuri. All rights reserved.
//

#import "YLContactsViewController.h"
#import "YLContact.h"
#import "YLaddContactsViewController.h"
@interface YLContactsViewController () <UIActionSheetDelegate,addContactsViewControllerDelegate>

/**    array*/
@property (nonatomic, strong)NSMutableArray *contactArray;


@end

@implementation YLContactsViewController
- (NSMutableArray *)contactArray{
    if(!_contactArray)
    {
        _contactArray = [NSMutableArray array];
    }
    return _contactArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = [NSString stringWithFormat:@"%@通讯录",self.account];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)deleteAccount:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"确定注销吗？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:@"GG", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if(buttonIndex == 1){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"你是逗比吗" message:@"好像是的" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alertView show];
    }
}

//- (void)setContact:(YLContact *)contact{
//    _contact = contact;
//    NSLog(@"%@",self.contact.name);
//    [self.tableView reloadData];
//}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    YLaddContactsViewController *vc = segue.destinationViewController;
//    vc.yacvc = self;
    vc.delegate = self;

//    NSLog(@"%@",self.contact.name);
}

- (void)addcontact:(YLContact *)contact{
//名字相同 不循允许入
    for (YLContact *con in _contactArray) {
        if([contact.name isEqualToString:con.name] )
            return;
    }
    
   [_contactArray addObject:contact];
    [self.tableView reloadData];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contactArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"ni";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    YLContact *contact = self.contactArray[indexPath.row];
//    NSLog(@"nihao");
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.number;
    return cell;
}


@end
