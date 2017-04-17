//
//  GroupMembersListTableViewController.h
//  IPLMatchWinner
//
//  Created by Vamsi Kallepalli on 4/10/17.
//  Copyright © 2017 Vamsi Kallepalli. All rights reserved.
//

#import <UIKit/UIKit.h>
@import FirebaseDatabase;

@interface GroupMembersListTableViewController : UIViewController

@property (strong, nonatomic) FIRDatabaseReference *ref;

- (IBAction)addAPlayer:(id)sender;

@end
