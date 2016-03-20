//
//  ViewController.h
//  coreDataDemo
//
//  Created by DQuang on 3/17/16.
//  Copyright © 2016 Rasia Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property NSMutableArray *device;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSManagedObjectContext *manageObjectContext;

@end

