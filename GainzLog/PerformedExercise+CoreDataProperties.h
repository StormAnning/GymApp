//
//  PerformedExercise+CoreDataProperties.h
//  GainzLog
//
//  Created by Storm Anning on 25/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "PerformedExercise+CoreDataClass.h"
#import "Workout+CoreDataProperties.h"


NS_ASSUME_NONNULL_BEGIN

@interface PerformedExercise (CoreDataProperties)

+ (NSFetchRequest<PerformedExercise *> *)fetchRequest;

@property (nullable, nonatomic, retain) Exercise *exercise;
@property (nullable, nonatomic, retain) NSSet<Set *> *sets;
@property (nullable, nonatomic, retain) Workout *workout;

@end

@interface PerformedExercise (CoreDataGeneratedAccessors)

- (void)addSetsObject:(Set *)value;
- (void)removeSetsObject:(Set *)value;
- (void)addSets:(NSSet<Set *> *)values;
- (void)removeSets:(NSSet<Set *> *)values;

@end

NS_ASSUME_NONNULL_END
