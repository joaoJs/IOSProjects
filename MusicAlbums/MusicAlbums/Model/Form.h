//
//  PageResult.h
//  MoviesObjC
//
//  Created by iAskedYou2nd on 8/18/20.
//  Copyright © 2020 iAskedYou2nd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Form : NSObject

//@property (nonatomic, copy) NSString* url;
@property (nonatomic, strong) NSDictionary* sprites;

-(instancetype)initFromDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
