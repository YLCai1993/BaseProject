//
//  AdsViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AdsViewModel.h"
#import "GDataXMLNode.h"

@implementation AdsViewModel

-(instancetype)initWithType:(NSString *)type andTag:(NSString *)tag{
    if (self = [super init]) {
        _type = type;
        _tag = tag;
    }
    return self;
}

-(NSArray *)getImages{
     NSMutableArray *images = [NSMutableArray new];
    if ([_tag isEqualToString:@"doc"]) {
        for (adsClassImgModel *imageModel in self.model.img) {
            [images addObject:imageModel.src];
        }
    }else{
        NSArray *photos = self.normalModel.photos;
        for (NorMalAdsPhotoModel *photo in photos) {
            [images addObject:photo.imgurl];
        }
    }
    return [images copy];
}

-(NSString *)getTitle{
    if ([_tag isEqualToString:@"doc"]) {
      return self.model.title;
    }else{
        return self.normalModel.setname;
    }
}

-(NSInteger )getImageCount{
      return [self getImages].count;
}

-(NSString *)getSourceAndTime{
    return [NSString stringWithFormat:@"%@ %@",self.model.source,self.model.ptime];
}

-(NSArray *)getDetail{
    NSMutableArray *details = [NSMutableArray new];
    if ([_tag isEqualToString:@"doc"]) {
        NSString *string = self.model.body;
//        NSLog(@"string::::%@",string);
        NSMutableArray *arr = [NSMutableArray new];
        while (string.length>0) {
            NSMutableString *muStr = [string mutableCopy];
            NSRange startRange = [string rangeOfString:@"<p>"];
            if (startRange.length<=0) {
                return arr;
            }
            NSRange endRange = [string rangeOfString:@"</p>"];
            NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
            NSString *result = [string substringWithRange:range];
            
            //获取标题
            NSInteger length = result.length;
            while (length>0) {
                 NSMutableString *muStr1 = [result mutableCopy];
                NSRange startRange1 = [result rangeOfString:@"<strong>"];
                NSRange endRange1 = [result rangeOfString:@"</strong>"];
                 NSRange range = NSMakeRange(startRange1.location + startRange1.length, endRange1.location - startRange1.location - startRange1.length);
                if (range.length<=0) {
                    length = -1;
                }else{
                  result = [result substringWithRange:range];
                    [arr addObject:result];
                    result = [muStr1 substringFromIndex:endRange1.location+endRange1.length];
                 if (range.length > 0) {
                    length = result.length;
                 }
                }
            }
            
//            NSLog(@"result***%@",result);
            [arr addObject:result];
            string = [muStr substringFromIndex:endRange.location+endRange.length];
        }
        return arr;
    }else{
        NSArray *photos = self.normalModel.photos;
        for (NorMalAdsPhotoModel *photo in photos) {
            [details addObject:photo.note];
        }
    }
    return [details copy];
}

-(void)getAdsModelCompleteHandle:(void(^)(NSError *error))complete{
    if ([_tag isEqualToString:@"doc"]) {
//        NSLog(@"%@",_type);
        [AdsNetManager getAdsForm:_type completeHandle:^(AdsModel *model, NSError *error) {
            self.model = model.classModel;
            complete(error);
        }];
    }else{
        [AdsNetManager getNormalAdsForm:_type completeHandle:^(NormalAdsModel *model, NSError *error) {
            self.normalModel = model;
            complete(error);
        }];
    }
   
}

@end












