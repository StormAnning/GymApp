//
//  ExerciseHistoryViewController.m
//  GainzLog
//
//  Created by Storm Anning on 25/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import "ExerciseHistoryViewController.h"
#import "Set+CoreDataClass.h"
#import "PerformedExercise+Extension.h"
#import "ObjectHelper.h"

@interface ExerciseHistoryViewController ()
@property (strong, nonatomic) NSArray* performedExercises;
@end

@implementation ExerciseHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.performedExercises = [ObjectHelper FetchAllPerformedExercisesForExercise:self.exercise];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.performedExercises.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    PerformedExercise *exercise = [self.performedExercises objectAtIndex:section];
    return exercise.sets.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //[myPerson MR_deleteEntity];
    return cell;
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
