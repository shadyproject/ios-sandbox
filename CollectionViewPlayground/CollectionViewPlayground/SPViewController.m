//
//  SPViewController.m
//  CollectionViewPlayground
//
//  Created by Christopher Martin on 9/29/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPViewController.h"

static NSString *const kCellIdentifier = @"SPCollectionViewCellId";

@interface SPViewController ()
@property NSArray *colorArray;
@end

@implementation SPViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    
    const NSInteger numColors = 100;
    
    NSMutableArray *temp = [@[] mutableCopy];
    
    for (int i = 0; i < numColors; i +=1) {
        CGFloat red = (arc4random() % 255) / 255.0f;
        CGFloat green = (arc4random() % 255) / 255.0f;
        CGFloat blue = (arc4random() % 255) / 255.0f;
        
        [temp addObject:[UIColor colorWithRed:red green:green blue:blue alpha:1.0f]];
    }
    
    self.colorArray = [NSArray arrayWithArray:temp];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection view data source
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.colorArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = self.colorArray[indexPath.item];
    
    return cell;
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
