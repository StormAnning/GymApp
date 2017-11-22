//
//  CreationService.m
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import "CreationService.h"
#import "ObjectHelper.h"


@implementation CreationService


+(void)InitializeDefaultCategoriesAndExercises{
    [self setUpChest];
    [self setUpLegs];
}

+(void)setUpChest{
    ExerciseCategory *category = [ObjectHelper CreateExerciseCategory:@"Chest"];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"Barbell Bench Press" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"Close Grip Barbell Bench Press" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"Barbell Bench Press" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"fgdhfgPress" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"Bfghfgh Bench Press" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"fghfgh Bench Press" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"Bfghfgh Bench Press" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"fghgfhgf Bench Press" exerciseType:0]];

}


+(void)setUpLegs{
    ExerciseCategory *category = [ObjectHelper CreateExerciseCategory:@"Legs"];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"Barbell Bench Press" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"Close Grip Barbell Bench Press" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"Barbell Bench Press" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"fgdhfgPress" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"Bfghfgh Bench Press" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"fghfgh Bench Press" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"Bfghfgh Bench Press" exerciseType:0]];
    [category addExercisesObject:[ObjectHelper CreateExercise:@"fghgfhgf Bench Press" exerciseType:0]];
    
}


@end
