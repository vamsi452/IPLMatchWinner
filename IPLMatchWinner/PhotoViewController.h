//
//  PhotoViewController.h
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
@import FirebaseDatabase;

@interface PhotoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *list;
    NSDictionary *data;
    NSString * player;
}

@property (retain, nonatomic) FIRDatabaseReference *ref;
@property (nonatomic) FIRDatabaseHandle refHandle;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) NSString *photoFilename;

- (IBAction)addAPlayer:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *playersList;

@end
