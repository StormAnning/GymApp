//
//  PerformedExercise+CoreDataProperties.m
//  GainzLog
//
//  Created by Storm Anning on 25/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "PerformedExercise+CoreDataProperties.h"

@implementation PerformedExercise (CoreDataProperties)

+ (NSFetchRequest<PerformedExercise *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"PerformedExercise"];
}

@dynamic exercise;
@dynamic sets;
@dynamic workout;

@end
