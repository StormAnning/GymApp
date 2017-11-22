//
//  WorkoutViewController.h
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workout+CoreDataClass.h"

@interface WorkoutViewController : UIViewController
@property (strong, nonatomic) Workout *workout;
@end
