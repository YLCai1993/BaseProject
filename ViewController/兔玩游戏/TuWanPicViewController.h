//
//  TuWanPicViewController.h
//  BaseProject
//
//  Created by YLCai on 16/10/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanPicViewController : UIViewController
{
    @private  //私有
    NSString *private1;
    @protected
    NSString *protected1;
    @public
    NSString *public1;
}

/**  此界面内容要根据aid来决定,所以aid时必须的 */
-(id _Nonnull)initWithAid:(NSString *_Nonnull)aid;
@property(nonatomic,strong)NSString *_Nonnull aid;


@end
