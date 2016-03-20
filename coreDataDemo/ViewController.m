//
//  ViewController.m
//  coreDataDemo
//
//  Created by DQuang on 3/17/16.
//  Copyright © 2016 Rasia Ltd. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "Device.h"
@interface ViewController ()

@end
static NSString *CellIdentifier = @"cell";
TableViewCell *cell;
@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    id appDelegate = (id)[[UIApplication sharedApplication] delegate];
    _manageObjectContext = [appDelegate managedObjectContext];
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:_manageObjectContext];
    [object setValue:@"aa" forKey:@"name"];
    [object setValue:@"bb" forKey:@"version"];
    [object setValue:@"cc" forKey:@"company"];
    NSError *error;
    if (![_manageObjectContext save:&error]) {
        NSLog(@"Failed to save - error: %@", [error localizedDescription]);
    }
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Device"];
    _device = [[_manageObjectContext executeFetchRequest:request error:nil] mutableCopy];
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [_tableView reloadData];
}

//-(NSManagedObjectContext *)manageObjectContext {
//    NSManagedObjectContext *context = nil;
//    id delegate = [[UIApplication sharedApplication] delegate];
//    if ([delegate performSelector:@selector(managedObjectContext)]) {
//        context = [delegate managedObjectContext];
//    }
//    return context;
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _device?[_device count]:0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    NSManagedObject *object = [_device objectAtIndex:indexPath.row];
    cell.lblDetail.text = [NSString stringWithFormat:@"%@ %@",[object valueForKey:@"name"],[object valueForKey:@"version"]];
    cell.lblText.text = [NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_manageObjectContext deleteObject:[_device objectAtIndex:indexPath.row]];
        [_manageObjectContext save:nil];
        [_device removeObjectAtIndex:indexPath.row];
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
