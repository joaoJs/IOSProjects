//
//  Movie.h
//  MoviesObjC
//
//  Created by iAskedYou2nd on 8/18/20.
//  Copyright © 2020 iAskedYou2nd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pokemon : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* url;

- (instancetype)initFromDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
