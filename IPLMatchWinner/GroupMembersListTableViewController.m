//
//  GroupMembersListTableViewController.m
//  IPLMatchWinner
//
//  Created by Vamsi Kallepalli on 4/10/17.
//  Copyright © 2017 Vamsi Kallepalli. All rights reserved.
//

#import "GroupMembersListTableViewController.h"

@interface GroupMembersListTableViewController ()

@end

@implementation GroupMembersListTableViewController

@synthesize ref;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ref = [[FIRDatabase database] reference];
    
    
    
    //[[[[_ref child:@"users"] child:user.uid] child:@"username"] setValue:username];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addAPlayer:(id)sender {
    
    [[[ref child:@"Players"] child:@"Player1"] setValue:@{@"name": @"Krishna"}];
    
}
@end
