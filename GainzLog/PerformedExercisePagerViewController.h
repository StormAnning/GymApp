//
//  PerformedExercisePagerViewController.h
//  GainzLog
//
//  Created by Storm Anning on 20/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import <MXSegmentedPager/MXSegmentedPagerController.h>
#import "PerformedExercise+CoreDataClass.h"

@interface PerformedExercisePagerViewController : MXSegmentedPagerController
@property (strong,nonatomic) PerformedExercise *exercise;
@end
