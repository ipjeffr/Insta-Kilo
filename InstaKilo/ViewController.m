//
//  ViewController.m
//  InstaKilo
//
//  Created by Tenzin Phagdol on 2016-03-23.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "CollectionHeaderView.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *animalPhotos;

@property (nonatomic, strong) NSArray *animalPhotosLocation;

@property (nonatomic, strong) NSArray *currentArray;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //nested array for sorting images by type
    NSArray *groupAnimalImages = [NSArray arrayWithObjects:@"blueFaceMonkeys.jpg", @"chickenAndSnake.jpg", @"meerkats.jpg", @"penguins.jpg", @"wolvesHowl.jpg", nil];
    NSArray *soloAnimalImages = [NSArray arrayWithObjects:@"angryGorilla.jpg", @"giraffeTongue.jpg", @"happyMonkey.jpg", @"owlBigEyes.jpg", @"redPanda.jpg", nil];
    
    self.animalPhotos = [NSArray arrayWithObjects:groupAnimalImages, soloAnimalImages, nil];
    
    self.currentArray = self.animalPhotos;
    
    NSArray *near = [NSArray arrayWithObjects:@"chickenAndSnake.jpg",@"owlBigEyes.jpg",@"wolvesHowl.jpg", nil];
    
    NSArray *far = [NSArray arrayWithObjects:@"angryGorilla.jpg",@"blueFaceMonkeys.jpg",@"giraffeTongue.jpg", @"happyMonkey.jpg", @"meerkats.jpg", @"penguins.jpg", @"redPanda.jpg", nil];
    
    self.animalPhotosLocation = [NSArray arrayWithObjects:near, far, nil];
    
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(50, 0, 50, 0);
    
    //segmented control introduction
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.currentArray count];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.currentArray objectAtIndex:section] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:[self.currentArray[indexPath.section] objectAtIndex:indexPath.row]];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        CollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [[NSString alloc]initWithFormat:@"Animal Group #%i", indexPath.section + 1];
        headerView.title.text = title;
        
        reusableview = headerView;
    }
    return reusableview;
}

- (IBAction)clickSegmentedControl:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        self.currentArray = nil;
        self.currentArray = self.animalPhotos;
        [self.collectionView reloadData];
    } else  {
        self.currentArray = nil;
        self.currentArray = self.animalPhotosLocation;
        [self.collectionView reloadData];
    }
}

@end
