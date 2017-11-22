//
//  Exercise+CoreDataProperties.h
//  GainzLog
//
//  Created by Storm Anning on 18/02/2017.
//  Copyright © 2017 Storm Anning. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Exercise+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Exercise (CoreDataProperties)

+ (NSFetchRequest<Exercise *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t type;

@end

NS_ASSUME_NONNULL_END
