//
//  UIView+Htills.m
//  Hughtill
//
//  Created by Burn on 2017. 12. 21..
//  Copyright © 2017년 Hugh. All rights reserved.
//

#import "UIView+Htills.h"

@implementation UIView(Htills)


//[FadeAnimataion 17.12.21 Hugh
- (void)setDuration:(float)Duration {
    objc_setAssociatedObject(self, @selector(Duration), @(Duration), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (float)Duration {
    NSNumber *Duration = objc_getAssociatedObject(self, @selector(Duration));
    if (Duration) {
        return Duration.floatValue;
    }
    
    objc_setAssociatedObject(self, @selector(Duration), @NO, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return self.Duration;
}

- (void) FadeAnimationAuto
{
    float duration = self.Duration;
    if (duration == 0)
    {
        NSLog(@"%s Default Duration (0.3f)", __PRETTY_FUNCTION__);
        self.Duration = 0.3f;
        duration = 0.3f;
    }
    [self FadeOutCompletion:^(BOOL finished) {
        if (finished)
            [self FadeInCompletion:^(BOOL finished) {
               if (finished)
                   [self FadeAnimationAuto];
            }];
    }];
}

- (void) FadeAnimationAutoSetDuration:(float)duration
{
    self.Duration = duration;
    if (self.Duration == 0)
    {
        NSLog(@"%s Default Duration (0.3f)", __PRETTY_FUNCTION__);
        self.Duration = 0.3f;
        duration = 0.3f;
        return;
    }
    [self FadeOutCompletion:^(BOOL finished) {
        if (finished)
            [self FadeInCompletion:^(BOOL finished) {
                if (finished)
                    [self FadeAnimationAutoSetDuration:duration];
            }];
    }];
}

- (void) FadeInCompletion:(void (^ __nullable)(BOOL finished))completion
{
    [UIView animateWithDuration:self.Duration
                     animations:^{
                         [self setAlpha:1];
                     }
                     completion:completion];
}

- (void) FadeOutCompletion:(void (^ __nullable)(BOOL finished))completion
{
    [UIView animateWithDuration:self.Duration
                     animations:^{
                         [self setAlpha:0];
                     }
                     completion:completion];
}
//]

//[Data 17.12.21 Hugh
- (void) setData:(NSDictionary *)data
{
    objc_setAssociatedObject(self, @selector(data), data, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary*)data
{
    NSDictionary *data = objc_getAssociatedObject(self, @selector(data));
    if (data) {
        return data;
    }
    
    objc_setAssociatedObject(self, @selector(data), @{}, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return self.data;
}

- (void) setObject:(nonnull id)object forKey:(nonnull id<NSCopying>)key
{
    NSMutableDictionary* dicData = [self.data mutableCopy];
    [dicData setObject:object forKey:key];
    [dicData objectForKey:@""];
    self.data = dicData;
}
- (id) objectForKey:(nonnull NSString*)key
{
    return [self.data objectForKey:key];
}
//]

@end
