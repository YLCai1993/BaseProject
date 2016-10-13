//
//  TuWanViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"

@interface TuWanViewModel : BaseViewModel

/*   必须初始化这个方法,需要一个类型   */
-(instancetype)initWithType:(InfoType)type;
@property(nonatomic,assign)InfoType type;

@property(nonatomic,assign)NSInteger rowNumber;

/*  用语判断某一行数据是否有图   */
-(BOOL)containImages:(NSInteger )row;

/*  存放头部滚动栏  */
@property(nonatomic,strong)NSArray *indexPicArr;

/*  是否有头部滚动栏  */
@property(nonatomic,getter=isExistIndexPic)BOOL existIndexPic;

/*  返回列表中某行数据的题目  */
-(NSString *)titleForRowInList:(NSInteger )row;

/*  返回列表中某行数据的图片  */
-(NSURL *)iconURLForRowInList:(NSInteger )row;

/*  返回列表中某行数据的数据  */
-(NSString *)descForRowInList:(NSInteger )row;

/*  返回列表中某行数据的浏览人数  */
-(NSString *)clicksForRowInList:(NSInteger )row;

/*  滚动展示栏的图片  */
-(NSURL *)iconURLForRowInIndexPic:(NSInteger )row;

/*  滚动展示栏的文字  */
-(NSString *)titleURLForRowInIndexPic:(NSInteger )row;

/** 获取列表中某行数据对应的html5链接 */
- (NSURL *)detailURLForRowInList:(NSInteger)row;

/** 获取展示栏中某行数据对应的html5链接 */
- (NSURL *)detailURLForRowInIndexPic:(NSInteger)row;

/** 滚动展示栏的文字 */
- (NSString *)titleForRowInIndexPic:(NSInteger)row;

/*  滚动展示栏的图片数量  */
@property(nonatomic,assign)NSInteger indexPicNumber;

@property(nonatomic,assign)NSInteger start;

/** 通过行数 返回此行中对应的链接数组  */
-(NSArray *)iconURLSForRow:(NSInteger )row;

/** 判断当前数据类型时视频 video*/
-(BOOL )isVideoInListForRow:(NSInteger )row;
-(BOOL )isVideoInIndexPicForRow:(NSInteger )row;

/** 判断当前数据类型时图片 pic*/
-(BOOL )isPicInListForRow:(NSInteger )row;
-(BOOL )isPicInIndexPicForRow:(NSInteger )row;

/** 判断当前数据类型时Html all*/
-(BOOL )isHtmlInListForRow:(NSInteger )row;
-(BOOL )isHtmlInIndexPicForRow:(NSInteger )row;

/** 返回某行数据的Aid  */
-(NSString *)aidInListForRow:(NSInteger )row;
-(NSString *)aidInIndexPicForRow:(NSInteger )row;

@end
