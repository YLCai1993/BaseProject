//
//  ToolMenuViewModel.h
//  BaseProject
//
//  Created by YLCai on 16/10/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

typedef NS_ENUM(NSUInteger,ToolMenuItemType){
    ToolMenuItemTypeNative,
    ToolMenuItemTypeWeb,
};

@interface ToolMenuViewModel : BaseViewModel

/** 有多少行 */
@property(nonatomic) NSInteger rowNumber;
/** 某行的图标URL */
- (NSURL *)iconURLForRow:(NSInteger)row;
/** 某行的题目 */
- (NSString *)titleForRow:(NSInteger)row;
/** 某行的数据类型--枚举类型 */
- (ToolMenuItemType)itemTypeForRow:(NSInteger)row;
/** 某行的tag值 */
- (NSString *)tagForRow:(NSInteger)row;
/** 网页类型的链接地址 */
- (NSURL *)webURLForRow:(NSInteger)row;

@end
