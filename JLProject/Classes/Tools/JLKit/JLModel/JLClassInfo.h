//
//  JLClassInfo.h
//  JLProject
//
//  Created by jiangliang on 2018/9/28.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 主体分层
 JLClassInfo主要分为以下几部分：
 typedef NS_OPTIONS(NSUInteger, JLEncodingType)与JLEncodingType JLEncodingGetType(const char *typeEncoding);
 方法
 @interface JLClassIvarInfo : NSObject
 @interface JLClassMethodInfo : NSObject
 @interface JLClassPropertyInfo : NSObject
 @interface JLClassInfo : NSObject
 */


/*
 先定义了一个NS_OPTIONS：
 */
typedef NS_OPTIONS(NSUInteger, JLEncodingType) {
    
    /*
     主要定义了3个大类encode type:
     * YYEncodingTypeMask:
     变量类型，因为类型只会有一种，所以就用数字站位
     * YYEncodingTypeQualifierMask:
     方法中的参数变量修饰符，理论上只有解析Method的参数才能解析到
     * YYEncodingTypePropertyMask
     property修饰符类型
     
     这边对于YYEncodingTypeQualifierMask和YYEncodingTypePropertyMask因为存在多种可能的情况，使用了位移(<<)的方式，通过与(&)YYEncodingTypeQualifierMask和YYEncodingTypePropertyMask的方式，判断是否包含某个值。
     */
    
    //0~8位：变量类型
    JLEncodingTypeMask       = 0xFF, ///< mask of type value
    JLEncodingTypeUnknown    = 0, ///< unknown
    JLEncodingTypeVoid       = 1, ///< void
    JLEncodingTypeBool       = 2, ///< bool
    JLEncodingTypeInt8       = 3, ///< char / BOOL
    JLEncodingTypeUInt8      = 4, ///< unsigned char
    JLEncodingTypeInt16      = 5, ///< short
    JLEncodingTypeUInt16     = 6, ///< unsigned short
    JLEncodingTypeInt32      = 7, ///< int
    JLEncodingTypeUInt32     = 8, ///< unsigned int
    JLEncodingTypeInt64      = 9, ///< long long
    JLEncodingTypeUInt64     = 10, ///< unsigned long long
    JLEncodingTypeFloat      = 11, ///< float
    JLEncodingTypeDouble     = 12, ///< double
    JLEncodingTypeLongDouble = 13, ///< long double
    JLEncodingTypeObject     = 14, ///< id
    JLEncodingTypeClass      = 15, ///< Class
    JLEncodingTypeSEL        = 16, ///< SEL
    JLEncodingTypeBlock      = 17, ///< block
    JLEncodingTypePointer    = 18, ///< void*
    JLEncodingTypeStruct     = 19, ///< struct
    JLEncodingTypeUnion      = 20, ///< union
    JLEncodingTypeCString    = 21, ///< char*
    JLEncodingTypeCArray     = 22, ///< char[10] (for example)
    
    //8~16位：方法类型
    JLEncodingTypeQualifierMask   = 0xFF00,   ///< mask of qualifier
    JLEncodingTypeQualifierConst  = 1 << 8,  ///< const
    JLEncodingTypeQualifierIn     = 1 << 9,  ///< in
    JLEncodingTypeQualifierInout  = 1 << 10, ///< inout
    JLEncodingTypeQualifierOut    = 1 << 11, ///< out
    JLEncodingTypeQualifierBycopy = 1 << 12, ///< bycopy
    JLEncodingTypeQualifierByref  = 1 << 13, ///< byref
    JLEncodingTypeQualifierOneway = 1 << 14, ///< oneway
    
    //16~24位：property修饰类型
    JLEncodingTypePropertyMask         = 0xFF0000, ///< mask of property
    JLEncodingTypePropertyReadonly     = 1 << 16, ///< readonly
    JLEncodingTypePropertyCopy         = 1 << 17, ///< copy
    JLEncodingTypePropertyRetain       = 1 << 18, ///< retain
    JLEncodingTypePropertyNonatomic    = 1 << 19, ///< nonatomic
    JLEncodingTypePropertyWeak         = 1 << 20, ///< weak
    JLEncodingTypePropertyCustomGetter = 1 << 21, ///< getter=
    JLEncodingTypePropertyCustomSetter = 1 << 22, ///< setter=
    JLEncodingTypePropertyDynamic      = 1 << 23, ///< @dynamic
    
};

/**
 
 @discussion See also:
 https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
 https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html
 
 @param typeEncoding  A Type-Encoding string.
 @return The encoding type.
 */
JLEncodingType JLEncodingGetType(const char *typeEncoding);


@interface JLClassInfo : NSObject



@end
