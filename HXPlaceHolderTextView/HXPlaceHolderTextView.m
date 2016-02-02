//
//  HXPlaceHolderTextView.m
//  HXPlaceHolderTextView
//
//  Created by Derek on 16/1/30.
//  Copyright © 2016年 huangxu. All rights reserved.
//

#import "HXPlaceHolderTextView.h"

static CGFloat const kLabelLeftOffset = 8.f;
static CGFloat const kLabelTopOffset = 8.f;

@interface HXPlaceHolderTextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

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
    
    
    CGSize placeholderLabelOffSet = CGSizeMake(kLabelLeftOffset, kLabelTopOffset);
    CGRect placeholderLabelFrame = [self placeHolderLabelFrameWithOffSet:placeholderLabelOffSet];
    [self createPlaceholderLabel:placeholderLabelFrame];
    
}

//获取placeholderLabel的frame
-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.width = frame.size.width;
    self.height = frame.size.height;
    if (frame.size.width != 0) {
        [self initializePlaceHolder];
    }
    
}
-(CGRect)placeHolderLabelFrameWithOffSet:(CGSize)LabelOffSet{
    
    return CGRectMake(
                      LabelOffSet.width,
                      LabelOffSet.height,
                      self.width  - (2 * LabelOffSet.width),
                      self.height - (2 * LabelOffSet.height)
                      );
    
}
- (void)createPlaceholderLabel:(CGRect)labelFrame {
    self.placeholderLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.placeholderLabel.numberOfLines = 0;
    self.placeholderLabel.backgroundColor = [UIColor clearColor];
    self.placeholderLabel.text = self.placeholder;
    
    //设置字体的默认大小
    self.placeholderLabel.font = [UIFont systemFontOfSize:13];
    //设置字体的默认颜色
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
- (id)insertDictationResultPlaceholder {
    id placeholder = [super insertDictationResultPlaceholder];
    self.placeholderLabel.hidden = YES;
    return placeholder;
}
- (void)removeDictationResultPlaceholder:(id)placeholder willInsertResult:(BOOL)willInsertResult {
    [super removeDictationResultPlaceholder:placeholder willInsertResult:willInsertResult];
    self.placeholderLabel.hidden = NO;
    [self updatePlaceholder];
}

- (void)updatePlaceholder {
    if ([self.text length] == 0) {
        self.placeholderLabel.alpha = 1.f;
    } else {
        self.placeholderLabel.alpha = 0.f;
    }
}


- (void)setText:(NSString *)text {
    [super setText:text];
    [self updatePlaceholder];
}


@end
