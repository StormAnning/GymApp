//
//  ExerciseViewController.h
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExerciseCategory+CoreDataProperties.h"
#import "Workout+CoreDataProperties.h"

@interface ExerciseViewController : UIViewController
@property (strong, nonatomic) ExerciseCategory *category;
@property (strong, nonatomic) Workout *workout;
@end
