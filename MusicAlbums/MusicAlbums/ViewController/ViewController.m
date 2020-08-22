//
//  ViewController.m
//  MoviesObjC
//
//  Created by iAskedYou2nd on 8/17/20.
//  Copyright © 2020 iAskedYou2nd. All rights reserved.
//

#import "ViewController.h"
#import "PokeCell.h"
#import "ResponseObj.h"
#import "NetworkManager.h"
#import "Pokemon.h"
#import "MusicAlbums-Swift.h"

@interface ViewController ()

@property (nonatomic, weak) UITableView* tableView;
@property (nonatomic, strong) PokemonViewModel* vm;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
        
    //[self.vm fetchPokes];
    [self setUpViewModel];
    [self.vm fetchPokes];
}

- (void)setUp {
    UITableView* table = [[UITableView alloc] initWithFrame:CGRectZero];
    [table setTranslatesAutoresizingMaskIntoConstraints:false];
    [table setDataSource:self];
    // Set Prefetch
    //[self.tableView setPrefetchDataSource:self];
    // Register Cell
    [table registerClass:[PokeCell self] forCellReuseIdentifier:@"CellId"];
    
    self.tableView = table;
    [self.view addSubview:table];
    
    // Constraints
    [[table.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:8] setActive:true];
    [[table.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:8] setActive:true];
    [[table.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-8] setActive:true];
    [[table.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-8] setActive:true];
    
    [table setBackgroundColor:UIColor.systemTealColor];
}

-(void)setUpViewModel {
    self.vm = [[PokemonViewModel alloc] initWithService:NetworkManager.sharedInstance];
    
    [self.vm bindWithCompletion:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}


// MARK: - DataSource Functions

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vm.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PokeCell* cell = (PokeCell*)[tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    if (cell == nil) {
        return [[UITableViewCell alloc] init];
    }
    
    // Movie set up for cells
    
    //[self.vm fetchSpritesWithIndex:indexPath.row];
    [self.vm fetchSpritesWithIndex:indexPath.row completion:^(UIImage * _Nullable image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.pokeName setText:[self.vm titleWithIndex:indexPath.row]];
            [cell.img setImage:image];
            
        });
    }];
    
    return cell;
}

// MARK: - Prefetch DataSource

//-(void)tableView:(UITableView *)tableView prefetchRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
//    NSIndexPath* lastIndexPath = [NSIndexPath indexPathForRow:self.vm.count - 1 inSection:0];
//    if ([indexPaths containsObject:lastIndexPath]) {
//        [self.vm fetchPokes];
//    }
//}

@end
