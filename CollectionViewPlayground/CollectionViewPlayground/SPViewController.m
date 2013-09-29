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

@end
