//
//  Workout+CoreDataProperties.m
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Workout+CoreDataProperties.h"

@implementation Workout (CoreDataProperties)

+ (NSFetchRequest<Workout *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Workout"];
}

@dynamic date;
@dynamic notes;
@dynamic exercises;

@end
