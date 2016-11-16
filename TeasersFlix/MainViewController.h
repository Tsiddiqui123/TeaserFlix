//
//  MainViewController.h
//  TeasersFlix
//
//  Created by Taha Siddiqui on 15/11/2016.
//  Copyright © 2016 Taha Siddiqui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  <CoreData/CoreData.h>

@interface MainViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentBar;


- (void)saveContext;
- (IBAction)onSelect:(UISegmentedControl *)sender;

@end
