//
//  MusicDetailCell.h
//  BaseProject
//
//  Created by YLCai on 16/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLImageView.h"

@interface MusicDetailCell : UITableViewCell
/**  原则上.h文件中只存放需要被调用get或者set方法的属性 */

/**  音乐封面图  */
@property(nonatomic,strong)YLImageView *coverIV;

/**  题目的标签 */
@property(nonatomic,strong)UILabel *titleLb;

/**  添加时间标签  */
@property(nonatomic,strong)UILabel *timeLb;

/**  音乐来源标签  */
@property(nonatomic,strong)UILabel *sourceLb;

/**  播放次数标签  */
@property(nonatomic,strong)UILabel *playCountLb;

/**  喜欢次数标签  */
@property(nonatomic,strong)UILabel *favorCountLb;

/**  评论次数标签  */
@property(nonatomic,strong)UILabel *commentCountLb;

/**  时常标签     */
@property(nonatomic,strong)UILabel *durationLb;

/**  下载按钮     */
@property(nonatomic,strong)UIButton *downloadBtn;


@end
