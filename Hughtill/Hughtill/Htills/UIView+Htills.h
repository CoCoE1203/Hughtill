//
//  UIView+Htills.h
//  Hughtill
//
//  Created by Burn on 2017. 12. 21..
//  Copyright © 2017년 Hugh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface UIView(Htills)

/**
 2017.12.21 Hugh
 1 - NSMutableDictionary 처럼 사용하시면 됩니다
 개발할때에 Button에 String형식의 값을 저장해야할때가 많았는데 그점을 해소하기위해서 만들었습니다.
 */
- (void) setObject:(nonnull id)object forKey:(nonnull id<NSCopying>)key;
@property (nonatomic, strong) NSDictionary* _Nullable data;

//[
/**
 2017.12.21 Hugh
 필요 - Duration ex) Duration = 0.3f < 이 시간이 중점으로 사용됩니다
 종종 쓰이는 애니메이션 입니다.
 */
@property (nonatomic) float Duration;
- (void) setDuration:(float)Duration;
- (float) Duration;

/**
 2017.12.21 Hugh
 필요 - self.Duration
 종종 쓰이는 애니메이션 입니다. 서서히 사라진뒤 서서히 나타납니다. (빠르면 깜빡깜빡 빠른속도)
 */
- (void) FadeAnimationAuto;

/**
 2017.12.21 Hugh
 필요 - Duration ex) Duration = 0.3f < 이 시간이 중점으로 사용됩니다
 종종 쓰이는 애니메이션 입니다.
 */
- (void) FadeAnimationAutoSetDuration:(float)duration;

/**
 2017.12.21 Hugh
 필요 - self.Duration
 종종 쓰이는 애니메이션 입니다. 서서히 나타납니다.
 */
- (void) FadeInCompletion:(void (^ __nullable)(BOOL finished))completion;

/**
 2017.12.21 Hugh
 필요 - self.Duration
 종종 쓰이는 애니메이션 입니다. 서서히 사라집니다.
 */
- (void) FadeOutCompletion:(void (^ __nullable)(BOOL finished))completion;
//]
@end
