//
//  AppDelegate.h
//  SDAutoLayoutTest
//
//  Created by 王小林 on 9/11/18.
//  Copyright © 2018 王小林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

