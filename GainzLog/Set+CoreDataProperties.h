//
//  Set+CoreDataProperties.h
//  GainzLog
//
//  Created by Storm Anning on 25/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Set+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Set (CoreDataProperties)

+ (NSFetchRequest<Set *> *)fetchRequest;

@property (nonatomic) int32_t reps;
@property (nonatomic) int64_t time;
@property (nonatomic) float weight;
@property (nullable, nonatomic, copy) NSDate *date;

@end

NS_ASSUME_NONNULL_END
