//
//  JLClassInfo.m
//  JLProject
//
//  Created by jiangliang on 2018/9/28.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "JLClassInfo.h"

/*
 获取Ivar类型的函数如下
 解析Ivar的type encode string
 
 该函数也是通过获得的type encode的string，对照着表进行解析，因为是解析Ivar,所以也只包含了YYEncodingTypeMask和YYEncodingTypeQualifierMask。而YYEncodingTypePropertyMask会包含在property的解析中。
 */

JLEncodingType JLEncodingGetType(const char *typeEncoding) {
    //判空处理
    char *type = (char *)typeEncoding;
    if (!typeEncoding) return JLEncodingTypeUnknown;
    size_t len = strlen(type);
    if (len == 0) return JLEncodingTypeUnknown;
    
    JLEncodingType qualifier = 0;
    bool prefix = true;
    while (prefix) {
        //方法参数Ivar中的解析，理论上解析不到该类参数
        switch (*type) {
            case 'r':{
                qualifier |= JLEncodingTypeQualifierConst;
                type++;
            }   break;
            case 'n': {
                qualifier |= JLEncodingTypeQualifierIn;
                type++;
            } break;
            case 'N': {
                qualifier |= JLEncodingTypeQualifierInout;
                type++;
            } break;
            case 'o': {
                qualifier |= JLEncodingTypeQualifierOut;
                type++;
            } break;
            case 'O': {
                qualifier |= JLEncodingTypeQualifierBycopy;
                type++;
            } break;
            case 'R': {
                qualifier |= JLEncodingTypeQualifierByref;
                type++;
            } break;
            case 'V': {
                qualifier |= JLEncodingTypeQualifierOneway;
                type++;
            } break;
            default:{ prefix = false; } break;
        }
    }
    
    len = strlen(type);
    if (len == 0) return JLEncodingTypeUnknown | qualifier;
    
    //返回值类型解析
    switch (*type) {
        case 'v': return JLEncodingTypeVoid | qualifier;
        case 'B': return JLEncodingTypeBool | qualifier;
        case 'c': return JLEncodingTypeInt8 | qualifier;
        case 'C': return JLEncodingTypeUInt8 | qualifier;
        case 's': return JLEncodingTypeInt16 | qualifier;
        case 'S': return JLEncodingTypeUInt16 | qualifier;
        case 'i': return JLEncodingTypeInt32 | qualifier;
        case 'I': return JLEncodingTypeUInt32 | qualifier;
        case 'l': return JLEncodingTypeInt32 | qualifier;
        case 'L': return JLEncodingTypeUInt32 | qualifier;
        case 'q': return JLEncodingTypeInt64 | qualifier;
        case 'Q': return JLEncodingTypeUInt64 | qualifier;
        case 'f': return JLEncodingTypeFloat | qualifier;
        case 'd': return JLEncodingTypeDouble | qualifier;
        case 'D': return JLEncodingTypeLongDouble | qualifier;
        case '#': return JLEncodingTypeClass | qualifier;
        case ':': return JLEncodingTypeSEL | qualifier;
        case '*': return JLEncodingTypeCString | qualifier;
        case '^': return JLEncodingTypePointer | qualifier;
        case '[': return JLEncodingTypeCArray | qualifier;
        case '(': return JLEncodingTypeUnion | qualifier;
        case '{': return JLEncodingTypeStruct | qualifier;
        case '@': {
            if (len == 2 && *(type + 1) == '?')
                return JLEncodingTypeBlock | qualifier;//OC Block
            else
                return JLEncodingTypeObject | qualifier;//OC对象
        }
        default: return JLEncodingTypeUnknown | qualifier;
    }
}

@implementation JLClassInfo




@end
