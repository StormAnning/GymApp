//
//  ExerciseViewController.m
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import "ExerciseViewController.h"
#import "CategoriesViewController.h"
#import "ObjectHelper.h"
#import "PerformedExercise+CoreDataProperties.h"

@interface ExerciseViewController () <UITableViewDelegate>
@property (strong, nonatomic) NSArray *exercises;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ExerciseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:self.category.title];
}


-(void)viewWillAppear:(BOOL)animated{
    [self loadData];
}

-(void)loadData{
    self.exercises = [self.category.exercises allObjects];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.category.exercises.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Exercise *exercise = [self.exercises objectAtIndex:indexPath.row];
    UILabel *label = (UILabel*) [cell viewWithTag:1];
    [label setText:exercise.name];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Exercise *exercise = [self.exercises objectAtIndex:indexPath.row];
    PerformedExercise *performedExercise = [ObjectHelper CreatPerformedExercise:exercise];
    [performedExercise addSetsObject:[ObjectHelper CreateSet:0 weight:0]];
    [self.workout addExercisesObject:performedExercise];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0]animated:YES];
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
