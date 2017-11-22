//
//  Set+CoreDataProperties.m
//  GainzLog
//
//  Created by Storm Anning on 25/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Set+CoreDataProperties.h"

@implementation Set (CoreDataProperties)

+ (NSFetchRequest<Set *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Set"];
}

@dynamic reps;
@dynamic time;
@dynamic weight;
@dynamic date;

@end
