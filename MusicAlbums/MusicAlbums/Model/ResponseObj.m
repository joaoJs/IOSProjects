//
//  PageResult.m
//  MoviesObjC
//
//  Created by iAskedYou2nd on 8/18/20.
//  Copyright © 2020 iAskedYou2nd. All rights reserved.
//

#import "ResponseObj.h"
#import "Pokemon.h"

@implementation ResponseObj

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        NSMutableArray* pokes = [[NSMutableArray alloc] init];
        NSArray* jsonMovies = [dictionary objectForKey:@"results"];
        for (NSDictionary* pokeDict in jsonMovies) {
            Pokemon* poke = [[Pokemon alloc] initFromDictionary:pokeDict];
            [pokes addObject:poke];
        }
        self.results = [NSArray arrayWithArray:pokes];
    }
    return self;
}

@end
