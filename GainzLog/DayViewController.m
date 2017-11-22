//
//  DayViewController.m
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import "DayViewController.h"
#import "Workout+CoreDataProperties.h"
#import "WorkoutViewController.h"
#import "ObjectHelper.h"
#import "WorkoutTableViewCell.h"
#import "PerformedExercisePagerViewController.h"
#import "CategoriesViewController.h"

@interface DayViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property NSUInteger count;
@property (strong, nonatomic) NSCalendar* calendar;
@property (strong, nonatomic) NSDate* now;
@property (strong, nonatomic) NSDateFormatter* dateFormatter;
@property (strong, nonatomic) Workout *todaysWorkout;
@end

@implementation DayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupCollectionView];
}

-(void)setupCollectionView {
    //[self.collectionView registerClass:[CVGGallleryCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
    [self.collectionView setPagingEnabled:YES];
    [self.collectionView setCollectionViewLayout:flowLayout];
    self.count = 600;
    self.now = [NSDate date];
    self.calendar = [NSCalendar currentCalendar];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"MMM dd YYYY"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:300 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSUInteger daysToAdd = indexPath.item - (self.count/2);
    
    NSDate *selectedDate = [self getDayForIndexPath:indexPath];
    
    UILabel *dateLabel = (UILabel*) [cell viewWithTag:1];
    [dateLabel setText:(daysToAdd == 0 ? @"Today" : [self.dateFormatter stringFromDate:selectedDate])];
    
    self.todaysWorkout = [[ObjectHelper FetchAllWorkoutsOnDay:selectedDate] firstObject];
    UITableView *tableView = [cell viewWithTag:2];
    [tableView reloadData];
    
    return cell;
}

-(NSDate*)getDayForIndexPath:(NSIndexPath*)indexPath{
     NSUInteger daysToAdd = indexPath.item - (self.count/2);
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:daysToAdd];
    NSDate *selectedDate = [self.calendar dateByAddingComponents:components toDate:self.now options:0];
    return selectedDate;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionView.frame.size;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.todaysWorkout.exercises.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    PerformedExercise *exercise = [[self.todaysWorkout.exercises allObjects] objectAtIndex:section];
    return exercise.sets.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PerformedExercise *exercise = [[self.todaysWorkout.exercises allObjects] objectAtIndex:indexPath.section];
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
    PerformedExercise *exercise = [[self.todaysWorkout.exercises allObjects]objectAtIndex:section];
    return exercise.exercise.name;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PerformedExercise *exercise = [[self.todaysWorkout.exercises allObjects]objectAtIndex:indexPath.section];
    [self performSegueWithIdentifier:@"performedExercise" sender:exercise];
}


- (IBAction)addWorkoutClicked:(id)sender {
    if(!self.todaysWorkout){
        self.todaysWorkout = [ObjectHelper CreatWorkout:[NSDate date]];
    }
    [self performSegueWithIdentifier:@"categories" sender:self];
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"workout"]){
        WorkoutViewController *vc = segue.destinationViewController;
        vc.workout = sender;
    }
    else if([segue.identifier isEqualToString:@"categories"]){
        CategoriesViewController *vc = segue.destinationViewController;
        vc.workout = self.todaysWorkout;
    }
    else if([segue.identifier isEqualToString:@"performedExercise"]){
        PerformedExercisePagerViewController *vc = segue.destinationViewController;
        vc.exercise = sender;
    }
}


@end
