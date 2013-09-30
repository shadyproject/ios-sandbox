//
//  SPCollectionViewCell.m
//  CollectionViewPlayground
//
//  Created by Christopher Martin on 9/29/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPCollectionViewCell.h"
#import "UIColor+RandomColor.h"

@interface SPCollectionViewCell ()
@property (nonatomic, strong) UILabel *textLabel;
@end

@implementation SPCollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor randomColor];
        
        self.textLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.font = [UIFont boldSystemFontOfSize:20];
        
        [self.contentView addSubview:self.textLabel];
    }
    return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    
    self.text = @"";
}

-(void)setText:(NSString *)text{
    _text = [text copy];
    
    self.textLabel.text = self.text;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
