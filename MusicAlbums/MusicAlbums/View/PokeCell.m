//
//  MovieCell.m
//  MoviesObjC
//
//  Created by iAskedYou2nd on 8/17/20.
//  Copyright © 2020 iAskedYou2nd. All rights reserved.
//

#import "PokeCell.h"

@implementation PokeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    UIImageView* poster = [[UIImageView alloc] initWithFrame:CGRectZero];
    [poster setTranslatesAutoresizingMaskIntoConstraints:false];
    [poster setContentMode:UIViewContentModeScaleAspectFit];
    [poster setImage:[UIImage imageNamed:@"graph"]];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setTranslatesAutoresizingMaskIntoConstraints:false];
    [label setNumberOfLines:0];
    [label setTextAlignment:NSTextAlignmentLeft];
    [label setText:@"Text Goes here"];
    
    [self.contentView addSubview:poster];
    [self.contentView addSubview:label];
    
    [[poster.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8] setActive:true];
    [[poster.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:8] setActive:true];
    [[poster.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8] setActive:true];
    
    [[poster.heightAnchor constraintEqualToConstant:100] setActive:true];
    [[poster.widthAnchor constraintEqualToConstant:100] setActive:true];
    
    [[label.leadingAnchor constraintEqualToAnchor:poster.trailingAnchor constant:8] setActive:true];
    [[label.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8] setActive:true];
    [[label.centerYAnchor constraintEqualToAnchor:poster.centerYAnchor] setActive:true];
    
    self.img = poster;
    self.pokeName = label;
}

@end
