//
//  Movie.m
//  MoviesObjC
//
//  Created by iAskedYou2nd on 8/18/20.
//  Copyright © 2020 iAskedYou2nd. All rights reserved.
//

#import "Form.h"

@implementation Form

-(instancetype)initFromDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        self.sprites = [dictionary valueForKey:@"sprites"];
    }
    return self;
}

@end
