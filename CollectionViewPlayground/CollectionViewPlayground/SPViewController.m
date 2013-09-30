//
//  SPViewController.m
//  CollectionViewPlayground
//
//  Created by Christopher Martin on 9/29/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPViewController.h"
#import "SPCollectionViewCell.h"

static NSString *const kCellIdentifier = @"SPCollectionViewCellId";

@interface SPViewController ()
@property NSMutableArray *dates;
@property NSDateFormatter *dateFormatter;
@end

@implementation SPViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.dates = [@[] mutableCopy];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"HH:mm:ss" options:0 locale:[NSLocale currentLocale]]];
    
    [self configureLayout];
    [self configureCollectionView];
    [self configureNavigationItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tappedAddButton:(id)sender{
    [self addNewDate];
}

-(void)addNewDate{
    [self.collectionView performBatchUpdates:^{
        NSDate *newDate = [NSDate date];
        [self.dates insertObject:newDate atIndex:0];
        [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
    } completion:nil];
}

-(void)configureLayout{
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    
    layout.minimumInteritemSpacing = 40.0f;
    layout.minimumLineSpacing = 40.0f;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.itemSize = CGSizeMake(100, 100);
}

-(void)configureCollectionView{
    [self.collectionView registerClass:[SPCollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    self.collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
}

-(void)configureNavigationItem{
    UIBarButtonItem *addButton =
    [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(tappedAddButton:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    self.navigationItem.title = @"List of Dates";
}

#pragma mark - Collection view data source
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dates.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell forItemAtIndexPath:indexPath];
    
    return cell;
}

-(void)configureCell:(SPCollectionViewCell*)cell forItemAtIndexPath:(NSIndexPath*)indexPath{
    cell.text = [self.dateFormatter stringFromDate:self.dates[indexPath.row]];
}

#pragma mark - UIScrollView delegates
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"Scroll View did Scroll");
    NSLog(@"Content Offset: X:%f Y:%f", scrollView.contentOffset.x, scrollView.contentOffset.y);
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDecelerating");
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDraggin");
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"scrollViewWillEndDragging");
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging willDecelerate:%@", (decelerate ? @"YES" : @"NO"));
}
@end
