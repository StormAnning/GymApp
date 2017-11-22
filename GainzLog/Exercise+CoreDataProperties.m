//
//  Exercise+CoreDataProperties.m
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Exercise+CoreDataProperties.h"

@implementation Exercise (CoreDataProperties)

+ (NSFetchRequest<Exercise *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Exercise"];
}

@dynamic name;
@dynamic type;

@end
