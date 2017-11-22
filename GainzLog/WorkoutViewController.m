//
//  WorkoutViewController.m
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import "WorkoutViewController.h"
#import "CategoriesViewController.h"
#import "PerformedExercise+CoreDataProperties.h"
#import "Set+CoreDataClass.h"
#import "Exercise+Extension.h"
#import "ObjectHelper.h"
#import "PerformedExercisePagerViewController.h"

@interface WorkoutViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WorkoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    Set *set = [[exercise.sets allObjects] objectAtIndex:indexPath.row];
    NSString *cellIdentifier = @"workoutCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    UILabel *label1 = [cell viewWithTag:1];
    [label1 setText:[NSString stringWithFormat:@"Weight %f",set.weight]];
    UILabel *label2 = [cell viewWithTag:2];
    [label2 setText:[NSString stringWithFormat:@"Reps %d",set.reps]];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    PerformedExercise *exercise = [[self.workout.exercises allObjects]objectAtIndex:section];
    return exercise.exercise.name;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

- (IBAction)editSetEnd:(id)sender {

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PerformedExercise *exercise = [[self.workout.exercises allObjects]objectAtIndex:indexPath.section];
    [self performSegueWithIdentifier:@"performedExercise" sender:exercise];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"categories"]){
        CategoriesViewController *vc = segue.destinationViewController;
        vc.workout = self.workout;
    }
    else if([segue.identifier isEqualToString:@"performedExercise"]){
        PerformedExercisePagerViewController *vc = segue.destinationViewController;
        vc.exercise = sender;
    }
}


@end
