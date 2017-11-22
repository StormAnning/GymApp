//
//  CategoriesViewController.m
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import "CategoriesViewController.h"
#import "ObjectHelper.h"
#import "ExerciseViewController.h"

@interface CategoriesViewController () <UITableViewDelegate>
@property (strong, nonatomic) NSArray *categories;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [self loadData];
}

-(void)loadData{
    self.categories = [ObjectHelper FetchAllCategories];
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
    return self.categories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"categoryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    ExerciseCategory *category = [self.categories objectAtIndex:indexPath.row];
    UILabel *label = (UILabel*) [cell viewWithTag:1];
    [label setText:category.title];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ExerciseCategory *category = [self.categories objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"exercises" sender:category];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ExerciseViewController *vc = segue.destinationViewController;
    vc.category = sender;
    vc.workout = self.workout;
}


@end
