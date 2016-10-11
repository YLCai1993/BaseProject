//
//  HeadLineViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/9/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NewsNetManager.h"
#import "OtherNormalModel.h"

@interface HeadLineViewModel : BaseViewModel

-(instancetype)initWithType:(NewsListType )type andClassName:(NSString *)className;
@property(nonatomic,assign)NewsListType type;
@property(nonatomic,strong)NSString *className;

@property(nonatomic,assign)NSInteger fn;
@property(nonatomic,assign)NSInteger offset;
@property(nonatomic,assign)NSInteger sizeNumber;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *tag;
@property(nonatomic,strong)NSArray *images;
@property(nonatomic,assign)NSInteger beginBumber;

@property(nonatomic,assign)NSInteger rowNumber;
@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic,strong)NSArray *headImageURL;

-(NSString *)docIdRow:(NSInteger)row;
-(NSURL *)iconForRow:(NSInteger )row;
-(NSString *)titleForRow:(NSInteger )row;
-(NSString *)classForRow:(NSInteger )row;
-(NSString *)commentForRow:(NSInteger )row;
-(NSArray *)imgnewextraForRow:(NSInteger )row;
-(CGFloat )cellHeightForRow:(NSInteger )row;
-(NSString *)specialIdForRow:(NSInteger )row;

//判断事哪一种cell
-(NSString *)tagForRow:(NSInteger )row;
//刷新
-(void)refreshDataCompleteHandle:(void(^)(NSError *error))complete;
//加载更多
-(void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete;

@end
