//
//  TopRated+CoreDataProperties.m
//  TeasersFlix
//
//  Created by Taha Siddiqui on 16/11/2016.
//  Copyright © 2016 Taha Siddiqui. All rights reserved.
//

#import "TopRated+CoreDataProperties.h"

@implementation TopRated (CoreDataProperties)

+ (NSFetchRequest<TopRated *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"TopRated"];
}

@dynamic backdroppath;
@dynamic id;
@dynamic posterpath;
@dynamic releasedate;
@dynamic title;

@end
