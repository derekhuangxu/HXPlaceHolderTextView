//
//  HXPlaceHolderTextView.m
//  HXPlaceHolderTextView
//
//  Created by Derek on 16/1/30.
//  Copyright © 2016年 huangxu. All rights reserved.
//

#import "HXPlaceHolderTextView.h"

static CGFloat const kLabelLeftOffset = 8.f;
static CGFloat const kLabelTopOffset = 0.5f;

@interface HXPlaceHolderTextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;

@end

@implementation HXPlaceHolderTextView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initializePlaceHolder];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializePlaceHolder];
    }
    return self;
}

-(void)initializePlaceHolder{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textChanged:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
    CGFloat placeholderLabelHeight = [self heightForString:self.placeholder fontSize:self.placeholderFont andWidth:self.bounds.size.width];
    CGSize placeholderLabelOffSet = CGSizeMake(kLabelLeftOffset, placeholderLabelHeight);
    CGRect placeholderLabelFrame = [self placeHolderLabelFrameWithOffSet:placeholderLabelOffSet];
    
    [self createPlaceholderLabel:placeholderLabelFrame];
}

//获取字体高度
- (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width
{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize]
                         constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                             lineBreakMode:UILineBreakModeTailTruncation];
    
    return sizeToFit.height;
}
//计算placeholderLabel的frame
-(CGRect)placeHolderLabelFrameWithOffSet:(CGSize)LabelOffSet{
    
    return CGRectMake(
                      kLabelLeftOffset,
                      (self.bounds.size.height - LabelOffSet.height)/2,
                      self.bounds.size.width  - (2 * LabelOffSet.width),
                      self.bounds.size.height - (2 * LabelOffSet.height)
                      );
    
    
}
- (void)createPlaceholderLabel:(CGRect)labelFrame {
    self.placeholderLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.placeholderLabel.numberOfLines = 0;
    self.placeholderLabel.font = self.font;
    self.placeholderLabel.backgroundColor = [UIColor clearColor];
    self.placeholderLabel.text = self.placeholder;
 
    self.placeholderLabel.textColor = [UIColor colorWithWhite:0.71f alpha:1.0f];
    [self addSubview:self.placeholderLabel];
}
- (void)textChanged:(NSNotification *)notification {
    [self updatePlaceholder];
}

-(void)setPlaceholder:(NSString *)placeholder{
    
    self.placeholderLabel.text = placeholder;
    [self.placeholderLabel sizeToFit];
}

#pragma mark - UITextView subclass methods
-(void)setFont:(UIFont *)font{
    [super setFont:font];
    self.placeholderLabel.font = self.font;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    [super setTextAlignment:textAlignment];
    self.placeholderLabel.textAlignment = textAlignment;
}


#pragma mark - UITextInput overrides
-(void)setText:(NSString *)text{
    [super setText:text];
    [self updatePlaceholder];
}
-(void)updatePlaceholder{
    if (self.text.length == 0) {
        
        self.text = _placeholder;
        self.font = [UIFont systemFontOfSize:_placeholderFont];
        self.textColor = [UIColor colorWithWhite:0.71f alpha:1.0f];
        
    }else{
        
        
    }
}
@end
