//
//  DetailTopicCell.h
//  BaseProject
//
//  Created by YLCai on 16/10/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTopicCell : UITableViewCell

/**  头像 */
@property (weak, nonatomic) IBOutlet UIImageView *userHeadImageView;

/**  名字 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

/**  内容 */
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
