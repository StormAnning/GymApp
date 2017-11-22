//
//  WorkoutTableViewCell.h
//  GainzLog
//
//  Created by Storm Anning on 25/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workout+CoreDataProperties.h"
@interface WorkoutTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITableView *tableView;
-(void)setCellWorkout:(Workout*)workout;
@end
