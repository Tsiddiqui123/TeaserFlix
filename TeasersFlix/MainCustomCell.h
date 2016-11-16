//
//  MainCustomCell.h
//  TeasersFlix
//
//  Created by Taha Siddiqui on 15/11/2016.
//  Copyright © 2016 Taha Siddiqui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCustomCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UILabel *lblTitle;
@property (nonatomic,strong) IBOutlet UILabel *lblReleaseDate;
@property (nonatomic,strong) IBOutlet UIImageView *imgBackground;
@property (nonatomic,strong) IBOutlet UIImageView *imgPlayList;

@end
