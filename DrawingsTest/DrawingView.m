//
//  DrawingView.m
//  DrawingsTest
//
//  Created by MacUser on 01.04.16.
//  Copyright © 2016 Shitikov.net. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView

- (void) drawRect:(CGRect)rect {
   // [super drawRect:rect];
    
    NSLog(@"drawRect %@", NSStringFromCGRect(rect));
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
    CGRect sqare1 = CGRectMake(100, 100, 100, 100);
    CGRect sqare2 = CGRectMake(200, 200, 100, 100);
    CGRect sqare3 = CGRectMake(300, 300, 100, 100);
    
    CGContextAddRect(context, sqare1);
    CGContextAddRect(context, sqare2);
    CGContextAddRect(context, sqare3);
    
    CGContextFillPath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    CGContextAddEllipseInRect(context, sqare1);
    CGContextAddEllipseInRect(context, sqare2);
    CGContextAddEllipseInRect(context, sqare3);
    
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextSetLineWidth(context, 4.f);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextMoveToPoint(context, CGRectGetMinX(sqare1), CGRectGetMaxY(sqare1));
    CGContextAddLineToPoint(context, CGRectGetMinX(sqare3), CGRectGetMaxY(sqare3));
    
    CGContextMoveToPoint(context, CGRectGetMaxX(sqare3), CGRectGetMinY(sqare3));
    CGContextAddLineToPoint(context, CGRectGetMaxX(sqare1), CGRectGetMinY(sqare1));
    
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    
    CGContextMoveToPoint(context, CGRectGetMinX(sqare1), CGRectGetMaxY(sqare1));
    CGContextAddArc(context, CGRectGetMaxX(sqare1), CGRectGetMaxY(sqare1),
                             CGRectGetWidth(sqare1), M_PI, M_PI_2, YES);

    CGContextStrokePath(context);
    
    NSString *text = @"test";
    
    UIFont *font = [UIFont systemFontOfSize:16.f];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(1.f, 1.f);
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowBlurRadius = 0.5f;
    
    NSDictionary *atributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName,
                               font, NSFontAttributeName,
                               shadow, NSShadowAttributeName, nil];
    
    CGSize textSize = [text sizeWithAttributes:atributes];
    [text drawAtPoint:CGPointMake(CGRectGetMidX(sqare2) - textSize.width/2,
                                  CGRectGetMidY(sqare2) - textSize.height/2) withAttributes:atributes];
    
}

@end
