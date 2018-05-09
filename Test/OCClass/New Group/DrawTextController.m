//
//  DrawTextController.m
//  Test
//
//  Created by dow-np-162 on 2018/4/28.
//  Copyright © 2018年 yefa. All rights reserved.
//  <# 类说明 #>
 
#import "DrawTextController.h"

#import <CoreText/CoreText.h>

@interface DrawTextController ()

@property (nonatomic, copy)  NSString *text;
@property (nonatomic, assign) CGMutablePathRef path;
@property (nonatomic, strong) CALayer *animationLayer;
@property (nonatomic, strong) CALayer *pathLayer;
 
@end
 
@implementation DrawTextController
 
#pragma mark - LifeCycle
- (void)dealloc {
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
}
 
 
#pragma mark - CustomerDelegate
 
#pragma mark - Public
 
#pragma mark - Private
- (void)startAnimation {
    [self.pathLayer removeAllAnimations];
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 5;
    pathAnimation.fromValue = @0;
    pathAnimation.toValue = @1;
    [self.pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
}

- (CGMutablePathRef)pathWithText:(NSString *)text {
    if (!text) {
        return nil;
    }
    CGMutablePathRef letters = CGPathCreateMutable();
    CTFontRef font = CTFontCreateWithName(CFSTR("STHeiti SC"), 20, NULL);
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)font, kCTFontAttributeName, nil];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:text attributes:attrs];
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attrString);
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    for (CFIndex runIndex=0; runIndex<CFArrayGetCount(runArray); runIndex ++) {
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex ++) {
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            {
                CGPathRef letter = CTFontCreatePathForGlyph(runFont, glyph, NULL);
                CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(letters, &t, letter);
                CGPathRelease(letter);
            }
        }
    }
    CFRelease(line);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:letters]];
    CGPathRelease(letters);
    CFRelease(font);
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = self.animationLayer.bounds;
    pathLayer.bounds = CGPathGetBoundingBox(path.CGPath);
    pathLayer.geometryFlipped = YES;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = UIColor.blackColor.CGColor;
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 3;
    pathLayer.lineJoin = kCALineJoinBevel;
    [self.animationLayer addSublayer:pathLayer];
    
    
    return letters;
}
#pragma mark - Getter && Setter
- (void)setText:(NSString *)text {
    _text = text;
    self.path = [self pathWithText: text];
}

@end
