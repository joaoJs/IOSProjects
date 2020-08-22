//
//  NetworkManager.h
//  MoviesObjC
//

#define BASE_POKE_URL @"https://pokeapi.co/api/v2/pokemon/?limit=151"
#define BASE_FORM_URL @"https://pokeapi.co/api/v2/pokemon-form/"
//#define BASE_IMAGE_URL @"https://image.tmdb.org/t/p/w500/"

#import <UIKit/UIKit.h>
#import "ResponseObj.h"
#import "Form.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+ (instancetype) sharedInstance;

-(void)fetchPokemon:(void (^)(ResponseObj*))completion;
-(void)fetchForm:(NSString*)pokeName completion:(void (^)(Form*))completion;
-(void)fetchImage:(NSString*)imageUrl completion:(void (^)(UIImage*))completion;

@end

NS_ASSUME_NONNULL_END
