//
//  Upcommings+CoreDataProperties.m
//  TeasersFlix
//
//  Created by Taha Siddiqui on 16/11/2016.
//  Copyright © 2016 Taha Siddiqui. All rights reserved.
//

#import "Upcommings+CoreDataProperties.h"

@implementation Upcommings (CoreDataProperties)

+ (NSFetchRequest<Upcommings *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Upcommings"];
}

@dynamic backdroppath;
@dynamic id;
@dynamic posterpath;
@dynamic releasedate;
@dynamic title;

@end
