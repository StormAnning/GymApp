//
//  ObjectHelper.h
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exercise+Extension.h"
#import "ExerciseCategory+CoreDataProperties.h"
#import "PerformedExercise+CoreDataProperties.h"
#import "Workout+CoreDataProperties.h"
#import "Set+CoreDataClass.h"


@interface ObjectHelper : NSObject
+(Exercise*)CreateExercise:(NSString*)exerciseName exerciseType:(int16_t)exerciseType;
+(ExerciseCategory*)CreateExerciseCategory:(NSString*)title;
+(NSArray*)FetchAllCategories;
+(PerformedExercise*)CreatPerformedExercise:(Exercise*)exercise;
+(Workout*)CreatWorkout:(NSDate*)date;
+(Set*)CreateSet:(int32_t)reps weight:(float)weight;
+(NSArray*)FetchAllPerformedExercisesForExercise:(Exercise*)exercise;
+(NSArray*)FetchAllWorkoutsOnDay:(NSDate*)date;
+(void)Save;
@end
