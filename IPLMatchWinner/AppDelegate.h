//
//  AppDelegate.h
//  IPLMatchWinner
//
//  Created by Vamsi Kallepalli on 4/8/17.
//  Copyright © 2017 Vamsi Kallepalli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@import Firebase;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

