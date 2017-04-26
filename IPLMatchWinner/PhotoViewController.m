//
//  PhotoViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "PhotoViewController.h"
#import "SWRevealViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

@synthesize ref;
@synthesize playersList;
@synthesize refHandle;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photoImageView.image = [UIImage imageNamed:self.photoFilename];

    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.ref = [[FIRDatabase database] reference];
    self.playersList.delegate = self;
    self.playersList.dataSource = self;
    
list = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    

    //Retrieve the posts and listen for posts
    
    //[[[ref child:@"Players"] obse] setValue:@{@"name": @"Krishna"}];
    data = [[NSDictionary alloc] init];
    refHandle = [[ref child:@"Players"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSDictionary *postDict = snapshot.value;
        NSLog(@"%@", postDict);
        data = postDict;
        // ...
        [self.playersList reloadData];
    }];
    NSLog(@"%@", data);
    
    self.playersList.allowsMultipleSelectionDuringEditing = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addAPlayer:(id)sender {
    
    //[[[ref child:@"Players"] child:@"Player3"] setValue:@"Vamsi"];
    
    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
//    [alert addAction:[UIAlertAction actionWithTitle:@"Click" style:UIAlertActionStyleDefault handler:nil]];
//    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
//        textField.placeholder = @"Enter text:";
//        textField.secureTextEntry = YES;
//    }];
//    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Add member" message:@"Add Member to group" preferredStyle:UIAlertControllerStyleAlert];
    
    //[actionSheet addAction:[UIAlertAction actionWithTitle:@"Click" style:UIAlertActionStyleDefault handler:nil]];
    [actionSheet addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Enter name:";
        //textField.secureTextEntry = YES;
    }];
    
    [actionSheet addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Enter city:";
        //textField.secureTextEntry = YES;
    }];
    
    [actionSheet addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Enter Description:";
        //textField.secureTextEntry = YES;
    }];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tappped.
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSString *input = actionSheet.textFields[0].text;
        NSLog(@"input was '%@'", input);
        player = [NSString stringWithFormat:@"Player%lu",(unsigned long)[[data allKeys] count] +1];
        // OK button tapped.
        [[[ref child:@"Players"] child:player] setValue:input];
        [self dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[data allKeys] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    /*
    for (id key in data) {
        NSLog(@"key: %@, value: %@", key, [data objectForKey:key]);
    }
    */
    
    NSString *providerNameString = [data objectForKey:[NSString stringWithFormat:@"Player%ld",indexPath.row+1]];
    //NSString *providerIdString = [data objectForKey:@"object"];
    cell.textLabel.text  = providerNameString;
    //cell.detailTextLabel.text  = providerIdString;
    
    
    return cell;
}

// Override to support conditional editing of the table view.
// This only needs to be implemented if you are going to be returning NO
// for some items. By default, all items are editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        player = [data objectForKey:[NSString stringWithFormat:@"Player%ld",indexPath.row+1]];
        [[[ref child:@"Players"] child:player] removeValue];
        
        //[self.playersList reloadData];

        //add code here for when you hit delete
    }
}

@end
