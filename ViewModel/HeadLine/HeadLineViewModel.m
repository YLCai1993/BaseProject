//
//  HeadLineViewModel.m
//  BaseProject
//
//  Created by YLCai on 16/9/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeadLineViewModel.h"
@implementation HeadLineViewModel

-(instancetype)initWithType:(NewsListType )type andClassName:(NSString *)className{
    if (self = [super init]) {
        _type = type;
        _className = className;
    }
    return self;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(NSString *)docIdRow:(NSInteger)row{
    TidNewsModel *tid = [self newsTidListModelForRow:row];
    return tid.docid;
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(TidNewsModel *)newsTidListModelForRow:(NSInteger )row{
    return self.dataArr[row];
}

-(classNormalModel *)normaleModelForRow:(NSInteger )row{
    return self.dataArr[row];
}

-(NSURL *)iconForRow:(NSInteger)row{
    if (!_className) {
       return [NSURL URLWithString:[self newsTidListModelForRow:row].img];
    }else{
       return [NSURL URLWithString:[self normaleModelForRow:row].imgsrc];
    }
}

-(NSString *)titleForRow:(NSInteger)row{
    if (!_className) {
        self.title = [self newsTidListModelForRow:row].title;
        return self.title;
    }else{
        self.title = [self normaleModelForRow:row].title;
        return self.title;
    }
}

-(NSString *)classForRow:(NSInteger)row{
    if (!_className) {
        return [self newsTidListModelForRow:row].recSource;
    }else{
        return [self normaleModelForRow:row].source;
    }
    
}

-(NSString *)commentForRow:(NSInteger)row{
    NSInteger comment = arc4random_uniform(5000);
    NSString *com = [NSString stringWithFormat:@"%ld",comment];
    return [com stringByAppendingString:@"跟帖"];
}

-(NSString *)tagForRow:(NSInteger)row{
    if (!_className) {
       self.tag = [self newsTidListModelForRow:row].tAG;
       return self.tag;
    }else{
        self.tag = [self normaleModelForRow:row].tAG;
        return self.tag;
    }
}

-(NSString *)specialIdForRow:(NSInteger )row{
    if (!_className) {
        return [self newsTidListModelForRow:row].specialID;
    }else{
        return [self normaleModelForRow:row].specialID;
    }
}

-(NSArray *)imgnewextraForRow:(NSInteger )row{
    if (!_className) {
        self.images = [self newsTidListModelForRow:row].imgnewextra;
        return self.images;
    }else{
        self.images = [self normaleModelForRow:row].imgextra;
        return self.images;
    }
   
}

-(CGFloat )cellHeightForRow:(NSInteger )row{
    CGFloat textW = kWindowW - 20;
     CGFloat textH = [self.title boundingRectWithSize:CGSizeMake(textW , MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil].size.height;
    CGFloat pictureHeight = 0;
    if (!self.images) {
        if (!self.tag) {
            pictureHeight = 70;
            return 90;
        }else{
            pictureHeight = 117;
        }
    }else{
        pictureHeight = 85;
    }
    return 30+textH+pictureHeight + 15;
}

-(void)getDataCompleteHandle:(void(^)(NSError *))complete{
    //获取头条数据
    if (!_className) {
        [NewsNetManager getNewsListForm:_type fn:_fn offset:_offset size:_sizeNumber completeHandle:^(NewsModel *model, NSError *error) {
            if (_fn == 1) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.tid];
//             NSLog(@"数据:%ld",self.dataArr.count);
            TidNewsModel *tid = model.tid[0];
            self.headImageURL =tid.ads;
//            NSLog(@"count:%ld",self.headImageURL.count);
            if (self.dataArr.count != 0) {
              [self.dataArr removeObjectAtIndex:0];
            }
            complete(error);
        }];
    }else{
//        NSLog(@"%@",_className);
        [NewsNetManager getNewsNormalListForm:_className offset:_beginBumber size:20 completeHandle:^(OtherNormalModel *model, NSError *error) {
            if (_beginBumber == 0) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.classModel];
            classNormalModel *ttt = model.classModel[0];
            self.headImageURL =ttt.ads;
            if (self.headImageURL == nil) {
                AdsNewsModel *ads1 = [[AdsNewsModel alloc] initWithTitle:ttt.title andURL:ttt.imgsrc];
                ads1.url = ttt.photosetID;
                self.headImageURL = @[ads1];
            }
            if (self.dataArr.count != 0) {
                [self.dataArr removeObjectAtIndex:0];
            }
            complete(error);
        }];
    }
}

/**
 *  广告的具体情况为网页http://c.m.163.com/nc/article/C1D7PAVE05169QC9/full.html改变后面的数据即可
 *  @param complete 
 */
-(void)refreshDataCompleteHandle:(void (^)(NSError *))complete{

    _beginBumber = 0;
    _fn = 1;
    _offset = 0;
    _sizeNumber = 30;
    [self getDataCompleteHandle:complete];
}

-(void)getMoreDataCompleteHandle:(void (^)(NSError *))complete{
    _beginBumber += 20;
    _fn = 2;
    [self getDataCompleteHandle:complete];
}


@end
