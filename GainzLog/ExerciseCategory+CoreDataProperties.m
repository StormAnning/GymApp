//
//  ExerciseCategory+CoreDataProperties.m
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ExerciseCategory+CoreDataProperties.h"

@implementation ExerciseCategory (CoreDataProperties)

+ (NSFetchRequest<ExerciseCategory *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ExerciseCategory"];
}

@dynamic title;
@dynamic exercises;

@end
