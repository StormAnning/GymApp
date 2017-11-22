//
//  ObjectHelper.m
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import "ObjectHelper.h"
#import <MagicalRecord/MagicalRecord.h>


@implementation ObjectHelper

+(ExerciseCategory*)CreateExerciseCategory:(NSString*)title{
    ExerciseCategory *exerciseCategory = [ExerciseCategory MR_createEntity];
    [exerciseCategory setTitle:title];
    return exerciseCategory;
}

+(Exercise*)CreateExercise:(NSString*)exerciseName exerciseType:(int16_t)exerciseType{
    Exercise *exercise = [Exercise MR_createEntity];
    [exercise setName:exerciseName];
    [exercise setType:exerciseType];
    return exercise;
}

+(PerformedExercise*)CreatPerformedExercise:(Exercise*)exercise{
    PerformedExercise* performedExercise = [PerformedExercise MR_createEntity];
    [performedExercise setExercise:exercise];
    return performedExercise;
}

+(Set*)CreateSet:(int32_t)reps weight:(float)weight{
    Set *set = [Set MR_createEntity];
    [set setReps:reps];
    [set setWeight:weight];
    [set setDate:[NSDate date]];
    return set;
}

+(Workout*)CreatWorkout:(NSDate*)date{
    Workout *workout = [Workout MR_createEntity];
    [workout setDate:date];
    return workout;
}

+(NSArray*)FetchAllCategories{
   return [ExerciseCategory MR_findAll];
}

+(NSArray*)FetchAllPerformedExercisesForExercise:(Exercise*)exercise{
    return [PerformedExercise MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"exercise == %@",exercise]];
}

+(NSArray*)FetchAllWorkoutsOnDay:(NSDate*)date{
    [self DeleteEmptyWorkouts];
    NSCalendar *calendar = [NSCalendar currentCalendar];
   
    NSDate *startOfDay = [calendar startOfDayForDate:date];
    NSDateComponents *components = [[NSDateComponents alloc]init];
    components.day = 1;
    components.second = -1;
    NSDate *endOfDay = [calendar dateByAddingComponents:components toDate:date options:0];
    return [Workout MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"date >= %@ && date <= %@", startOfDay, endOfDay]];
}

+(void)DeleteEmptyWorkouts{
    NSArray *emptyWorkouts = [Workout MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"exercises.@count < 1"]];
    for (Workout *workout in emptyWorkouts) {
        [workout MR_deleteEntity];
    }
    [self Save];
}

+(void)Save{
    NSManagedObjectContext *defaultContext = [NSManagedObjectContext MR_defaultContext];
    [defaultContext MR_saveToPersistentStoreAndWait];
}

@end
