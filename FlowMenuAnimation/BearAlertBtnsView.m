//
//  BearAlertBtnsView.m
//  GOSHOPPING
//
//  Created by Bear on 16/6/26.
//  Copyright © 2016年 cjl. All rights reserved.
//

#import "BearAlertBtnsView.h"

@interface BearAlertBtnsView ()
{
    NSString *_confirmBtnTitle;
    NSString *_cancelBtnTitle;
}

@end

@implementation BearAlertBtnsView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        //  取消按钮
        _cancelBtn = [[UIButton alloc] init];
        [self addSubview:_cancelBtn];
        
        //  确定按钮
        _confirmBtn = [[UIButton alloc] init];
        [self addSubview:_confirmBtn];
        
        //  分割线
        _btns_horizontalSepLineV = [[UIView alloc] init];
        [self addSubview:_btns_horizontalSepLineV];
        
        _btns_verticalSepLineV = [[UIView alloc] init];
        [self addSubview:_btns_verticalSepLineV];
    }
    
    return self;
}

- (void)setNormal_ConfirmBtnTitle:(NSString *)confirmBtnTitle CancelBtnTitle:(NSString *)cancelBtnTitle
{
    _confirmBtnTitle = confirmBtnTitle;
    _cancelBtnTitle = cancelBtnTitle;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    BOOL res_haveConfirmBtn = NO;
    BOOL res_haveCancelBtn = NO;
    
    CGFloat btn_width = self.width;
    CGFloat btn_height = self.height;
    
    if (res_haveCancelBtn && res_haveConfirmBtn) {
        
        btn_width = self.width / 2.0;
        
        _confirmBtn.frame = CGRectMake(0, 0, btn_width, btn_height);
        [_confirmBtn setTitle:_confirmBtnTitle forState:UIControlStateNormal];
        
        _cancelBtn.frame = CGRectMake(btn_width, 0, btn_width, btn_height);
        [_cancelBtn setTitle:_cancelBtnTitle forState:UIControlStateNormal];
        
        _btns_verticalSepLineV.frame = CGRectMake(0, 0, 1, self.height);
        [_btns_verticalSepLineV BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    }
    else if (res_haveConfirmBtn || res_haveCancelBtn){
        
        btn_width = self.width;
        
        if (res_haveConfirmBtn) {
            
            _confirmBtn.frame = CGRectMake(0, 0, btn_width, btn_height);
            [_confirmBtn setTitle:_confirmBtnTitle forState:UIControlStateNormal];
        }else if (res_haveCancelBtn){
            
            _cancelBtn.frame = CGRectMake(0, 0, btn_width, btn_height);
            [_cancelBtn setTitle:_cancelBtnTitle forState:UIControlStateNormal];
        }
    }
    
    _btns_horizontalSepLineV.frame = CGRectMake(0, 0, self.width, 1);
    _btns_horizontalSepLineV.backgroundColor = [UIColor blackColor];

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
