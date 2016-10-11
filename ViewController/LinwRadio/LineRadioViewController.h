//
//  LineRadioViewController.h
//  BaseProject
//
//  Created by YLCai on 16/9/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineRadioViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

- (IBAction)didSelected:(UISegmentedControl *)sender ;
@end
