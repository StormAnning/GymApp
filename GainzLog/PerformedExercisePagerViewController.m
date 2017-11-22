//
//  PerformedExercisePagerViewController.m
//  GainzLog
//
//  Created by Storm Anning on 20/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import "PerformedExercisePagerViewController.h"
#import <FontAwesomeKit/FontAwesomeKit.h>
#import "SetsViewController.h"
#import "ExerciseHistoryViewController.h"


@interface PerformedExercisePagerViewController ()

@end

@implementation PerformedExercisePagerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    // Segmented Control customization
    self.segmentedPager.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedPager.segmentedControl.backgroundColor = [UIColor whiteColor];
    self.segmentedPager.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor yellowColor]};
    self.segmentedPager.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor orangeColor]};
    self.segmentedPager.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleArrow;
    self.segmentedPager.segmentedControl.selectionIndicatorColor = [UIColor orangeColor];
    self.segmentedPager.segmentedControl.sectionTitles = nil;
    self.segmentedPager.segmentedControlEdgeInsets = UIEdgeInsetsMake(12, 12, 12, 12);
    self.segmentedPager.segmentedControl.type = HMSegmentedControlTypeImages;
}


-(UIImage *)segmentedPager:(MXSegmentedPager *)segmentedPager imageForSectionAtIndex:(NSInteger)index{
    FAKFontAwesome *icon = [FAKFontAwesome androidIconWithSize:30];
    [icon addAttributes:@{NSForegroundColorAttributeName: [UIColor blueColor]}];
    return [icon imageWithSize:CGSizeMake(30, 30)];
}

-(UIImage *)segmentedPager:(MXSegmentedPager *)segmentedPager selectedImageForSectionAtIndex:(NSInteger)index{
    FAKFontAwesome *icon = [FAKFontAwesome androidIconWithSize:30];
    [icon addAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    return [icon imageWithSize:CGSizeMake(30, 30)];
}

-(CGFloat)heightForSegmentedControlInSegmentedPager:(MXSegmentedPager *)segmentedPager{
    return 40.0f;
}


#pragma mark <MXSegmentedPagerControllerDataSource>

- (NSInteger)numberOfPagesInSegmentedPager:(MXSegmentedPager *)segmentedPager {
    return 2;
}


- (NSString *)segmentedPager:(MXSegmentedPager *)segmentedPager segueIdentifierForPageAtIndex:(NSInteger)index {
    if(index == 0){
        return @"current";
    }
    return @"history";
}


- (void)prepareForSegue:(MXPageSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"current"]){
        SetsViewController *vc = segue.destinationViewController;
        vc.exercise = self.exercise;
    }
    else{
        ExerciseHistoryViewController *vc = segue.destinationViewController;
        vc.exercise = self.exercise.exercise;
    }
    
}


@end
