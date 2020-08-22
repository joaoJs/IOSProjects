//
//  Movie.m
//  MoviesObjC
//
//  Created by iAskedYou2nd on 8/18/20.
//  Copyright © 2020 iAskedYou2nd. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

- (instancetype)initFromDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        self.name = [dictionary valueForKey:@"name"];
        self.url = [dictionary valueForKey:@"url"];
    }
    return self;
}

@end
