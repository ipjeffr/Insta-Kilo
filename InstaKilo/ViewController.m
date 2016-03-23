//
//  ViewController.m
//  InstaKilo
//
//  Created by Tenzin Phagdol on 2016-03-23.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *animalPhotos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.animalPhotos = [NSArray arrayWithObjects:@"angryGorilla.jpg", @"blueFaceMonkeys.jpg", @"chickenAndSnake.jpg", @"giraffeTongue.jpg", @"happyMonkey.jpg", @"meerkats.jpg", @"owlBigEyes.jpg", @"penguins.jpg", @"redPanda.jpg", @"wolvesHowl.jpg", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.animalPhotos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:[self.animalPhotos objectAtIndex:indexPath.row]];
    
    return cell;
}


@end
