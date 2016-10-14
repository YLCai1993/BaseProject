//
//  TuWanViewController.m
//  BaseProject
//
//  Created by YLCai on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"
#import "TuWanListTableViewController.h"

@interface TuWanViewController ()


@end

@implementation TuWanViewController

+(id )standardRuWanNavi{
    static TuWanViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [[TuWanViewController alloc] initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        //例如设置第一个控制器的某个属性的值
        //v 次setvalues:[values[0] forKey:[0] ]
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
    });
    return vc;
}

-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

/**  提供每个vc对应的values值数组 */
+(NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (NSInteger i = 0; i<[self itemNames].count; i++) {
        //数值上,每个vc的infoTyoe枚举值 恰好和i值相同
        [arr addObject:@(i)];
    }
    return arr;
}

/**  提供每个vc对应的key值数组 */
+(NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

/**  提供题目数组  */
+(NSArray *)itemNames{
    return @[@"头条",@"独家",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"视频",@"攻略",@"幻化",@"趣闻",@"COS",@"美女"];
}

/**  提供每个对应的控制器的类型,题目类型数量必须一致 */
+(NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[TuWanListTableViewController class]];
    }
    return [arr copy];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"游戏资讯";
//    [Factory addMenuItemToVC:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end





























