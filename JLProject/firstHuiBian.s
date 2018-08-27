//
//  firstHuiBian.s
//  JLProject
//
//  Created by jiangliangwang on 2018/8/27.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

/*
 汇编语言--最重要的开发语言
 */

.text
.global _sum

_sum: 
    movq %rdi, %rax
    addq %rsi, %rax
    retq
