//
//  XLKnowLegeTableViewCell.h
//  Project
//
//  Created by Mac on 16/8/10.
//  Copyright © 2016年 com.xxx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XLKnowLedgeInfo;
@protocol XLKnowLegeTableViewCellCustemDeleget <NSObject>
-(void)zanClick:(XLKnowLedgeInfo*)info;
-(void)pinglunClick:(XLKnowLedgeInfo*)info;
@end

@interface XLKnowLegeTableViewCell : UITableViewCell
@property (nonatomic, strong) id<XLKnowLegeTableViewCellCustemDeleget>custemDeleget;
@property (nonatomic, strong) XLKnowLedgeInfo *info;
@end
