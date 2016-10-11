//
//  QuestionViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface QuestionViewModel : BaseViewModel

-(NSInteger )getRowNumber;
-(NSString *)getHeadImageForSection:(NSInteger )section;
-(NSString *)getNameForSection:(NSInteger )secti0n;
-(NSString *)getNiNameForSection:(NSInteger )section;
-(NSString *)getContentImageForSection:(NSInteger )section;
-(NSString *)getClassNameForSection:(NSInteger )section;
-(NSString *)getConcernFoSection:(NSInteger )section;
-(NSString *)getQuestionForSection:(NSInteger )section;
-(NSString *)getContentForSection:(NSInteger )section;
-(CGFloat )cellHeightForRow:(NSInteger )section;

-(void)getTopicsDataCompleteHandle:(void(^)(NSError *error))complete;

-(void)getMoreTopcisDataCompleteHandle:(void(^)(NSError *error))complete;

@end
