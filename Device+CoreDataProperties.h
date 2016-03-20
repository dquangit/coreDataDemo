//
//  Device+CoreDataProperties.h
//  coreDataDemo
//
//  Created by DQuang on 3/20/16.
//  Copyright © 2016 Rasia Ltd. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Device.h"

NS_ASSUME_NONNULL_BEGIN

@interface Device (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *company;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *version;

@end

NS_ASSUME_NONNULL_END
