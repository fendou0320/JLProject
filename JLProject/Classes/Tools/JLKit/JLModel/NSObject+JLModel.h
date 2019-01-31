//
//  NSObject+JLModel.h
//  JLProject
//
//  Created by jiangliang on 2018/9/12.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 苹果在 Xcode 6.3 引入了一个 Objective-C 的新特性： Nullability Annotations ，这一新特性的核心是两个新的类型修饰： __nullable 和 __nonnull 。从字面上我们可知， __nullable 表示对象可以是 NULL 或 nil，而__nonnull 表示对象不应该为空。当我们不遵循这一规则时，编译器就会给出警告。在 Xcode 7 中，为了避免与第三方库潜在的冲突，苹果把 __nonnull/__nullable改成 _Nonnull/_Nullable 。再加上苹果同样支持了没有下划线的写法 nonnull/nullable
 */

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JLModel)

/**
 json转model
 返回model
 */
+ (nullable instancetype)modelWithJson: (id)json;

@end

NS_ASSUME_NONNULL_END
