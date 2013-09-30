//
//  UIColor+RandomColor.m
//  CollectionViewPlayground
//
//  Created by Christopher Martin on 9/29/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)
+(UIColor*)randomColor{
    CGFloat red = (arc4random() % 255) / 255.0f;
    CGFloat green = (arc4random() % 255) / 255.0f;
    CGFloat blue = (arc4random() % 255) / 255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}
@end
