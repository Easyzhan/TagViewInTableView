//
//  PaContentView.h
//  TagViewINTableView
//
//  Created by VD-Dragon on 17/3/13.
//  Copyright © 2017年 VD-Dragon. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BtnBlock)(NSInteger index);

@interface PaContentView : UIView

@property (nonatomic,copy) BtnBlock btnBlock;

-(void) btnClickBlock:(BtnBlock) btnBlock;


-(instancetype) initWithFrame:(CGRect)frame dataArr:(NSArray *)array;


@end
