//
//  ExerciseCategory+CoreDataProperties.h
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "ExerciseCategory+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ExerciseCategory (CoreDataProperties)

+ (NSFetchRequest<ExerciseCategory *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, retain) NSSet<Exercise *> *exercises;

@end

@interface ExerciseCategory (CoreDataGeneratedAccessors)

- (void)addExercisesObject:(Exercise *)value;
- (void)removeExercisesObject:(Exercise *)value;
- (void)addExercises:(NSSet<Exercise *> *)values;
- (void)removeExercises:(NSSet<Exercise *> *)values;

@end

NS_ASSUME_NONNULL_END
