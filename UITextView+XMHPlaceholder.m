//
//  UITextView+XMHPlaceholder.m
//  test
//
//  Created by KFW on 2019/3/29.
//  Copyright © 2019 KFW. All rights reserved.
//

#import "UITextView+XMHPlaceholder.h"

static const char *placeHolderLabel = "placeHolderLabel";

@implementation UITextView (XMHPlaceholder)

- (UILabel *)xmhPlaceholder {
    return objc_getAssociatedObject(self, placeHolderLabel);
}

- (void)setXmhPlaceholder:(UILabel *)xmhPlaceholder {
    objc_setAssociatedObject(self, placeHolderLabel, xmhPlaceholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)xmhAddPlaceholder:(NSString *)text {
    // _placeholderLabel
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = text;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor lightGrayColor];
    placeHolderLabel.font = self.font;
    [placeHolderLabel sizeToFit];
    [self addSubview:placeHolderLabel];
    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    
    [self setXmhPlaceholder:placeHolderLabel];
    
    self.text = @"123";
    self.text = nil;
}
@end
