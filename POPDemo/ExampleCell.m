//
//  ExampleCell.m
//  POPDemo
//
//  Created by Simon Ng on 19/12/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "ExampleCell.h"


@implementation ExampleCell

- (void)awakeFromNib {
    // Initialization code
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.textLabel.font = [UIFont fontWithName:@"Avenir-Light" size:24];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    if (self.highlighted) {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration = 0.1;
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scalingup"];
    } else {
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9, 0.9)];
        springAnimation.springBounciness = 20.f;
        springAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        [self.textLabel pop_addAnimation:springAnimation forKey:@"springAnimation"];
    }
}



@end
