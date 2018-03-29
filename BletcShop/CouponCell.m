//
//  CouponCell.m
//  BletcShop
//
//  Created by Bletc on 2017/3/3.
//  Copyright © 2017年 bletc. All rights reserved.
//

#define waveNum  25

#import "CouponCell.h"
#import "SawtoothView.h"


@interface CouponCell ()
@property(nonatomic,weak) UIView *line;
@property(nonatomic,weak)UIView *leftCircle;
@property(nonatomic,weak)UIView *view;
@end
@implementation CouponCell



+(instancetype)couponCellWithTableView:(UITableView*)tableView{
    
    CouponCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CouponCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.backgroundColor = RGB(240, 240, 240);
        UIView *view = [[UIView alloc]initWithFrame:cell.frame];
        view.backgroundColor =RGB(240, 240, 240);

        cell.selectedBackgroundView = view;
        cell.tintColor = RGB(243, 73, 78);
    }
    
    return cell;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    self.leftCircle.backgroundColor=RGB(240, 240, 240);

    self.topView.backgroundColor=RGB(243, 73, 78);
    self.line.backgroundColor=RGB(231, 231, 231);
    self.bgView.backgroundColor=[UIColor whiteColor];


}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.line.backgroundColor=RGB(231, 231, 231);
    self.bgView.backgroundColor=[UIColor whiteColor];
    self.leftCircle.backgroundColor=RGB(240, 240, 240);

    self.topView.backgroundColor=RGB(243, 73, 78);
}
-(void)initSubViews{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(12, 10, SCREENWIDTH-24, 116)];
    view.backgroundColor=[UIColor whiteColor];
    view.layer.cornerRadius=5;
    view.clipsToBounds = YES;
    [self.contentView addSubview:view];
    
    self.bgView=view;
    
    UIView *coverView=[[UIView alloc]initWithFrame:CGRectMake(12, 10, SCREENWIDTH-24, 116)];
    coverView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    coverView.layer.cornerRadius=5;
    coverView.clipsToBounds = YES;
    [self.contentView addSubview:coverView];
    coverView.hidden=YES;
    self.coverView=coverView;
    
    UIView *topRedView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, view.width, 6)];
    topRedView.backgroundColor=RGB(243, 73, 78);
    [view addSubview:topRedView];
    
    self.topView=topRedView;
    
    UIImageView *onlineImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [view addSubview:onlineImageView];
    
    self.onlineState=onlineImageView;
    
    
    UIImageView *headImageView=[[UIImageView alloc]initWithFrame:CGRectMake(17, 19, 51, 51)];
    headImageView.layer.cornerRadius=headImageView.width*0.5;
    headImageView.clipsToBounds=YES;
    [view addSubview:headImageView];
    
    self.headImg=headImageView;
    
    UILabel *shopName=[[UILabel alloc]initWithFrame:CGRectMake(83, topRedView.bottom+9, view.width-83-5, 13)];
    shopName.font=[UIFont systemFontOfSize:14.0f];
    shopName.textColor=RGB(51, 51, 51);
    [view addSubview:shopName];
    
    self.shopNamelab=shopName;
    
    UILabel *useLimit=[[UILabel alloc]initWithFrame:CGRectMake(83, shopName.bottom+11, 120, 12)];
    useLimit.font= [UIFont systemFontOfSize:12.0f];
    useLimit.textColor=RGB(243, 73, 78);
    self.limitLab=useLimit;
    [view addSubview:useLimit];
    
    UILabel *useTime=[[UILabel alloc]initWithFrame:CGRectMake(83, useLimit.bottom+12, view.width-83, 10)];
    useTime.font=[UIFont systemFontOfSize:12.0f];
    useTime.textColor=RGB(51, 51, 51);
    [view addSubview:useTime];
    
    self.deadTime=useTime;
    
    UIImageView *more=[[UIImageView alloc]initWithFrame:CGRectMake(view.width-18-6, 38, 6, 12)];
    more.image=[UIImage imageNamed:@"youjiantou"];
    [view addSubview:more];
    
    self.youjian=more;
    
    UIImageView *circle=[[UIImageView alloc]initWithFrame:CGRectMake(view.width-35, 38, 15, 15)];
    circle.image=[UIImage imageNamed:@"选择nnnn"];
    circle.hidden=YES;
    [view addSubview:circle];
    
    self.chooseCircle=circle;
    
    
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(18, 84, view.width-36, 1)];
    line.backgroundColor=RGB(231, 231, 231);
    [view addSubview:line];
    
    self.line = line;
    
    UIView *leftCircle=[[UIView alloc]initWithFrame:CGRectMake(-9, 84-9, 18, 18)];
    leftCircle.backgroundColor=RGB(240, 240, 240);
    leftCircle.layer.cornerRadius=9.0f;
    leftCircle.clipsToBounds=YES;
    [view addSubview:leftCircle];
    
    self.leftCircle = leftCircle;
    
    UIView *rightCircle=[[UIView alloc]initWithFrame:CGRectMake(line.right+9, 84-9, 16, 16)];
    rightCircle.backgroundColor=RGB(240, 240, 240);
    rightCircle.layer.cornerRadius=9.0f;
    rightCircle.clipsToBounds=YES;
    [view addSubview:rightCircle];
    
    UILabel *detail=[[UILabel alloc]initWithFrame:CGRectMake(18, line.bottom+10, view.width-18-55, 12)];
    detail.font=[UIFont systemFontOfSize:12];
    detail.textColor=RGB(132, 132, 132);
    detail.text=@"详情";
    [view addSubview:detail];
    self.detail = detail;
    
    UIButton *moreBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [moreBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    moreBtn.frame=CGRectMake(detail.right+5, line.bottom, 50, 30);
    [moreBtn setTitle:@"更多..." forState: UIControlStateNormal];
    [moreBtn setTitleColor:RGB(243, 73, 78) forState:UIControlStateNormal];
    [view addSubview:moreBtn];
    moreBtn.titleLabel.font=[UIFont systemFontOfSize:14.0f];
    moreBtn.hidden=YES;
    self.lookMore=moreBtn;
    
    
//    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
//    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    button.frame=CGRectMake(0, 100-44+10, 100, 40);
//    [view addSubview:button];
//    
//    self.turnButton=button;
    
    
//    UILabel *messageLable=[[UILabel alloc]initWithFrame:CGRectMake(12, button.bottom+6 , view.width-24, 10)];
//    messageLable.textColor=RGB(132, 132, 132);
//    messageLable.font=[UIFont systemFontOfSize:12.0f];
//    messageLable.numberOfLines=0;
//    [view addSubview:messageLable];
//    
//    self.contentLable=messageLable;
//    
    
    UILabel *couponMoney=[[UILabel alloc]initWithFrame:CGRectMake(useLimit.right +40, 35, 80, 18)];
    couponMoney.font=[UIFont systemFontOfSize:14.0f];
    couponMoney.textColor=RGB(243, 73, 78);
    [view addSubview:couponMoney];
    self.couponMoney=couponMoney;
    
    UIImageView *expiredCoupon=[[UIImageView alloc]initWithFrame:CGRectMake(view.width-51, topRedView.bottom, 51, 45)];
    [view addSubview:expiredCoupon];
    self.expiredView=expiredCoupon;
    
    
    
}
-(void)setShopNamelab:(UILabel *)shopNamelab{
    _shopNamelab = shopNamelab;
}

-(void)setGradientLayer:(CAGradientLayer *)gradientLayer{
    
    _gradientLayer = gradientLayer;
    
    
}
@end
