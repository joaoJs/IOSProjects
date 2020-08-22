#import "NetworkManager.h"

@implementation NetworkManager

+ (instancetype)sharedInstance {
    static NetworkManager* _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init {
    self = [super init];
    return self;
}

// MARK: - Network Fetching
-(void)fetchPokemon:(void (^)(ResponseObj * _Nullable))completion {
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", BASE_POKE_URL]];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(nil);
            return;
        }
        
        if (data == nil) {
            completion(nil);
            return;
        }
        
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary* dictionary = object;
            ResponseObj* results = [[ResponseObj alloc] initWithDictionary:dictionary];
            completion(results);
            return;
        }
        
    }] resume];
}


-(void)fetchForm:(NSString *)pokeName completion:(void (^)(Form* _Nullable))completion {
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BASE_FORM_URL, pokeName]];
    
     [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
            if (error) {
                completion(nil);
                return;
            }
    
            if (data == nil) {
                completion(nil);
                return;
            }
         
         id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
         if ([object isKindOfClass:[NSDictionary class]]) {
             NSDictionary* dictionary = object;
             Form* sprites = [[Form alloc] initFromDictionary:dictionary];
             completion(sprites);
             return;
         }
    
        }] resume];
}

-(void)fetchImage:(NSString *)imageUrl completion:(void (^)(UIImage * _Nullable))completion {
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", imageUrl]];
    
         [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
                if (error) {
                    completion(nil);
                    return;
                }
    
                if (data == nil) {
                    completion(nil);
                    return;
                }
    
                UIImage* image = [UIImage imageWithData:data];
                completion(image);
                return;
            }] resume];
}


@end
