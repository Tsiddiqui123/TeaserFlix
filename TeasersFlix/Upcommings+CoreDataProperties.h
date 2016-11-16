//
//  Upcommings+CoreDataProperties.h
//  TeasersFlix
//
//  Created by Taha Siddiqui on 16/11/2016.
//  Copyright © 2016 Taha Siddiqui. All rights reserved.
//

#import "Upcommings+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Upcommings (CoreDataProperties)

+ (NSFetchRequest<Upcommings *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *backdroppath;
@property (nullable, nonatomic, copy) NSString *id;
@property (nullable, nonatomic, copy) NSString *posterpath;
@property (nullable, nonatomic, copy) NSString *releasedate;
@property (nullable, nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
