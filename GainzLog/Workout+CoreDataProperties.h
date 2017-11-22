//
//  Workout+CoreDataProperties.h
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Workout+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Workout (CoreDataProperties)

+ (NSFetchRequest<Workout *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, copy) NSString *notes;
@property (nullable, nonatomic, retain) NSSet<PerformedExercise *> *exercises;

@end

@interface Workout (CoreDataGeneratedAccessors)

- (void)addExercisesObject:(PerformedExercise *)value;
- (void)removeExercisesObject:(PerformedExercise *)value;
- (void)addExercises:(NSSet<PerformedExercise *> *)values;
- (void)removeExercises:(NSSet<PerformedExercise *> *)values;

@end

NS_ASSUME_NONNULL_END
