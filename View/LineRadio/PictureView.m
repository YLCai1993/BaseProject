//
//  PictureView.m
//  BaseProject
//
//  Created by YLCai on 16/9/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PictureView.h"
#import <UIImageView+WebCache.h>

@implementation PictureView

-(void)setImagesURL:(NSArray *)imagesURL{
    _imagesURL = imagesURL;
    if (imagesURL.count == 0||imagesURL == nil) {
        return;
    }
    
    switch (imagesURL.count) {
        case 1:
            [self setOneImage:imagesURL];
            break;
        case 2:
            [self setTwoImage:imagesURL];
            break;
        case 3:
            [self setThreeImage:imagesURL];
            break;
        case 4:
            [self setFourImage:imagesURL];
            break;
        case 5:
            break;
        case 6:
            break;
    }
}
-(void)setOneImage:(NSArray *)imageURL{
//    NSLog(@"**%@",imageURL[0]);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, 245)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL[0]] placeholderImage:[UIImage imageNamed:@"angle-mask"]];
    [self addSubview:imageView];
    CGRect frame = CGRectMake(0, 0, self.width, 245+10);
    self.frame = frame;
}

-(void)setTwoImage:(NSArray *)imageURL{
    CGFloat width = (self.width - 22)/2;
    for (NSInteger i = 0; i<imageURL.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(10 + (width+2)*i, 0, width, 125);
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL[i]] placeholderImage:[UIImage imageNamed:@"angle-mask"]];
        [self addSubview:imageView];
    }
    CGRect frame = CGRectMake(0, 0, self.width, 125+10);
    self.frame = frame;
}

-(void)setThreeImage:(NSArray *)imageURL{
     CGFloat width = (self.width - 24)/3;
    for (NSInteger i = 0; i<imageURL.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(10 + (width+2)*i, 0, width, 85);
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL[i]] placeholderImage:[UIImage imageNamed:@"angle-mask"]];
        [self addSubview:imageView];
    }
    CGRect frame = CGRectMake(0, 0, self.width, 85+10);
    self.frame = frame;
}

-(void)setFourImage:(NSArray *)imageURL{
    CGFloat width = (self.width - 22)/2;
    for (NSInteger i = 0; i<imageURL.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(10 + (width+2)*(i%2), 126*(i/2), width, 125);
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL[i]] placeholderImage:[UIImage imageNamed:@"angle-mask"]];
        [self addSubview:imageView];
    }
    CGRect frame = CGRectMake(0, 0, self.width, 250+10);
    self.frame = frame;

}

@end


































