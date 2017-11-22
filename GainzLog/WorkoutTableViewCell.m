//
//  WorkoutTableViewCell.m
//  GainzLog
//
//  Created by Storm Anning on 25/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import "WorkoutTableViewCell.h"
#import "WeightsAndRepsTableViewCell.h"
#import "PerformedExercise+Extension.h"
#import "Exercise+Extension.h"
#import "Set+CoreDataClass.h"

@interface WorkoutTableViewCell() <UITableViewDataSource>
@property (strong, nonatomic) Workout *workout;
@end

@implementation WorkoutTableViewCell 

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setCellWorkout:(Workout*)workout{
    self.workout = workout;
    [self.tableView reloadData];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.workout.exercises.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    PerformedExercise *exercise = [[self.workout.exercises allObjects] objectAtIndex:section];
    return exercise.sets.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PerformedExercise *exercise = [[self.workout.exercises allObjects] objectAtIndex:indexPath.section];
    Set *set = [[exercise SetsOrderedByDate] objectAtIndex:indexPath.row];
    static NSString *simpleTableIdentifier = @"setCell";
    WeightsAndRepsTableViewCell *cell = (WeightsAndRepsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WeightAndRepsTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    [cell.repLabel setText:[NSString stringWithFormat:@"%d",set.reps]];
    [cell.weightLabel setText:[NSString stringWithFormat:@"%d",(int32_t)set.weight]];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    PerformedExercise *exercise = [[self.workout.exercises allObjects] objectAtIndex:section];
    return exercise.exercise.name;
}

@end
