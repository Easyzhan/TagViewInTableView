//
//  PaContentView.m
//  TagViewINTableView
//
//  Created by VD-Dragon on 17/3/13.
//  Copyright © 2017年 VD-Dragon. All rights reserved.
//

#import "PaContentView.h"

@interface PaContentView()
@property (nonatomic,assign) NSInteger btnCount;

@end
@implementation PaContentView

-(instancetype) initWithFrame:(CGRect)frame dataArr:(NSArray *)array{
    
    if (self = [super initWithFrame:frame]) {
        
        for (int i = 0; i < array.count; i ++)
        {
            //        Area *are = cell_Array[i];
            self.btnCount = array.count;
            NSString *name = array[i];
            static UIButton *recordBtn =nil;
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            
            CGRect rect = [name boundingRectWithSize:CGSizeMake(self.frame.size.width -20, 30) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:btn.titleLabel.font} context:nil];
            
            CGFloat BtnW = rect.size.width + 20;
            CGFloat BtnH = rect.size.height + 10;
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = BtnH/2;
            if (i == 0)
            {
                btn.frame =CGRectMake(10, 10, BtnW, BtnH);
            }
            else{
                
                CGFloat yuWidth = self.frame.size.width - 20 -recordBtn.frame.origin.x -recordBtn.frame.size.width;
                
                if (yuWidth >= rect.size.width) {
                    
                    btn.frame =CGRectMake(recordBtn.frame.origin.x +recordBtn.frame.size.width + 10, recordBtn.frame.origin.y, BtnW, BtnH);
                }else{
                    
                    btn.frame =CGRectMake(10, recordBtn.frame.origin.y+recordBtn.frame.size.height+10, BtnW, BtnH);
                }
                
            }
            btn.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
            [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [btn setTitle:name forState:UIControlStateNormal];
            [self addSubview:btn];
            
            NSLog(@"btn.frame.origin.y  %f", btn.frame.origin.y);
            // 距离左侧边距
            float marginLeft = self.frame.origin.x;
            self.frame = CGRectMake(marginLeft, 0, [UIScreen mainScreen].bounds.size.width - marginLeft-10,CGRectGetMaxY(btn.frame)+10);
            recordBtn = btn;
            
            btn.tag = 100 + i;
            
            [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
    
    
    return self;
    
}

-(void) BtnClick:(UIButton *)sender{
    
    __weak typeof(self) weakSelf = self;
    
    if (weakSelf.btnBlock) {
        
        weakSelf.btnBlock(sender.tag);
        for (NSInteger i = 0; i<_btnCount; i++) {
            
            UIButton *tempBtn = [self viewWithTag:(100+i)];
            if (tempBtn.tag == sender.tag) {
                tempBtn.backgroundColor = [UIColor redColor];
                [tempBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }else{
                tempBtn.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
                [tempBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            }
        }
    }
    
}


-(void) btnClickBlock:(BtnBlock)btnBlock{
    
    self.btnBlock = btnBlock;
    
}
@end
