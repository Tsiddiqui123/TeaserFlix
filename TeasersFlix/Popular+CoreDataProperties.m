//
//  Popular+CoreDataProperties.m
//  TeasersFlix
//
//  Created by Taha Siddiqui on 16/11/2016.
//  Copyright © 2016 Taha Siddiqui. All rights reserved.
//

#import "Popular+CoreDataProperties.h"

@implementation Popular (CoreDataProperties)

+ (NSFetchRequest<Popular *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Popular"];
}

@dynamic backdroppath;
@dynamic id;
@dynamic posterpath;
@dynamic releasedate;
@dynamic title;

@end
