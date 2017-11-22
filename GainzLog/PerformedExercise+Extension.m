//
//  PerformedExercise+Extension.m
//  GainzLog
//
//  Created by Storm Anning on 25/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//

#import "PerformedExercise+Extension.h"

@implementation PerformedExercise (Extension)
-(NSArray*)SetsOrderedByDate{
    return [[[self sets] allObjects] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES]]];
}
@end
