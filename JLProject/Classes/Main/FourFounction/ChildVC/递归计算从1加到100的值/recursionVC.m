//
//  recursionVC.m
//  JLProject
//
//  Created by jiangliang on 2020/4/13.
//  Copyright © 2020 wangjiangliang. All rights reserved.
//

#import "recursionVC.h"

@interface recursionVC ()

@end

@implementation recursionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    int index = [self.class recursionOneToHundred:1];
    NSLog(@"%d", index);
    
    // 搜索指定类型的文件
    NSMutableArray *fileArray = [NSMutableArray array];
    NSString *historyMessage = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    [self.class sameTypeFileName:historyMessage suffix:@".png" addFile:fileArray];
    NSLog(@"设计一个递归搜索指定类型文件的函数, 要求写清返回值, 函数名, 参数列表");
//    NSLog(@"%@", fileArray);
    
//    //递归实现阶乘, 大数阶乘的实现方案, 估算下64位操作系统阶乘 可计算的最大数值
//    NSLog(@"递归实现阶乘, 大数阶乘的实现方案, 估算下64位操作系统阶乘 可计算的最大数值");
    NSLog(@"%d", [self maxinumWithSystem64:1 systemNum:2^64]);
    
    
}
/*
 1. 使用递归, 计算从1加到100的值.
 2. 设计一个递归搜索指定类型文件的函数, 要求写清返回值, 函数名, 参数列表
 3. 合并两个个有序链表
 4. 递归实现阶乘, 大数阶乘的实现方案, 估算下64位操作系统阶乘 可计算的最大数值.
 5. 在字符串中找出第一个只出现一次的字符。如输 入"abaccdeff"，则输出
 6. 盛最多水的容器
 7. K 个一组翻转链表
 */


+ (int)recursionOneToHundred: (int)num{
    
    if (num > 100) {
        return 0;
    }else{
        return num + [self.class recursionOneToHundred:num + 1] ;
    }
}


/// 搜索指定类型的文件
/// @param fileName 文件名
/// @param suffix 指定类型的后缀名
/// @param allFileArray 指定类型的所有的文件
+ (void)sameTypeFileName: (NSString *)fileName suffix:(NSString *)suffix addFile: (NSMutableArray *)allFileArray{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir;
    if ([fileManager fileExistsAtPath:fileName isDirectory:&isDir]) {
        if (isDir) {
            NSArray *dirArray = [fileManager contentsOfDirectoryAtPath:fileName error:nil];
            for (NSString *string in dirArray) {
                NSString *subPath = [fileName stringByAppendingPathComponent: string];
                [self.class sameTypeFileName:subPath suffix:suffix addFile:allFileArray];
            }
        }else{
            if ([fileName hasSuffix:suffix]) {
                [allFileArray addObject:fileName];
            }
        }
    }
}


///递归实现阶乘, 大数阶乘的实现方案, 估算下64位操作系统阶乘可计算的最大数值
- (int)maxinumWithSystem64: (int)num systemNum: (int64_t)systemNum{
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    int a[20001];//储存每一位所得到的数
    int temp,digit,n,i,j=0;//temp每次的得数   digit每次得数的位数
    
    mutableArray[0] = [NSNumber numberWithInt:1];//从1开始乘
    digit=1;//位数从第一位开始
    n = 50;
    
    for(i=2;i<=n;i++)
    {
        int num=0;
        for(j=0;j<digit;j++)
        {
            temp= [mutableArray[j] intValue]*i+num;//将一个数的每一位数都分别乘以i，
            mutableArray[j]= [NSNumber numberWithInt:temp%10];//将一个数的每一位数利用数组进行储存
            num=temp/10;
        }
        
        while(num)//判断退出循环后，num的值是否为0
        {
            mutableArray[digit]=[NSNumber numberWithInt:num%10];//继续储存
            num=num/10;
            digit++;
        }
    }
    for(i=digit-1;i>=0;i--){//倒序输出每一位
        printf("%d",a[i]);
    }
    printf("\n");
    return 0;
}

//在字符串中找出第一个只出现一次的字符。如输 入"abaccdeff"，则输出
- (NSMutableArray *)gainOneShowString: (NSString *)string{
    
    if (string.length == 0) {
        return nil;
    }
    
    NSMutableArray *dataArray = [NSMutableArray array];
    
    
    
    return dataArray;
}





@end
