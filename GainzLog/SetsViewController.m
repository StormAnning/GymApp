//
//  SetsViewController.m
//  GainzLog
//
//  Created by Storm Anning on 23/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import "SetsViewController.h"
#import "ObjectHelper.h"
#import <MaterialControls/MaterialControls.h>

@interface SetsViewController () <MDTextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.exercise.sets.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Set *set = [[self.exercise SetsOrderedByDate] objectAtIndex:indexPath.row];
    NSString *cellIdentifier = @"workoutCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    MDTextField *reps = [cell viewWithTag:1];
    reps.delegate = self;
    MDTextField *weight = [cell viewWithTag:2];
    weight.delegate = self;

    (set.reps > 0 ? [reps setText:[NSString stringWithFormat:@"%d", set.reps]] : [reps setText:@""]);
    (set.weight > 0 ? [weight setText:[NSString stringWithFormat:@"%d", (int32_t)set.weight]] : [weight setText:@""]);
    
    return cell;
}


- (IBAction)editSetEnd:(id)sender {
    UITextField *field = sender;
    UITableViewCell *textFieldRowCell = (UITableViewCell *) field.superview.superview;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:textFieldRowCell];
    Set *set = [[self.exercise SetsOrderedByDate] objectAtIndex:indexPath.row];
    
    if(field.tag == 1){
        NSInteger reps = [field.text integerValue];
        [set setReps:(reps > 0 ? (int32_t)reps : 0)];
        if(indexPath.row == self.exercise.sets.count -1){
            [self.exercise addSetsObject:[ObjectHelper CreateSet:0 weight:set.weight]];
            [ObjectHelper Save];
            [self.tableView reloadData];
        }
    }
    else if(field.tag ==2)
    {
        [set setWeight:[field.text floatValue]];
    }
}

-(void)textFieldDidEndEditing:(MDTextField *)textField{
    UITableViewCell *textFieldRowCell = (UITableViewCell *) textField.superview.superview;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:textFieldRowCell];
    Set *set = [[self.exercise SetsOrderedByDate] objectAtIndex:indexPath.row];
    
    if(textField.tag == 1){
        NSInteger reps = [textField.text integerValue];
        [set setReps:(reps > 0 ? (int32_t)reps : 0)];
        if(indexPath.row == self.exercise.sets.count -1){
            [self.exercise addSetsObject:[ObjectHelper CreateSet:0 weight:set.weight]];
            [ObjectHelper Save];
            [self.tableView reloadData];
        }
    }
    else if(textField.tag ==2)
    {
        [set setWeight:[textField.text floatValue]];
    }

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
