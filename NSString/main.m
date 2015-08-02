//
//  main.m
//  NSString
//
//  Created by Douaty on 15/8/1.
//  Copyright (c) 2015年 Douaty. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 常用结构体
#pragma mark NSRange
void test1()
{
    //NSRange
    NSRange range = NSMakeRange(3, 7);
    NSLog(@"location: %zi, length: %zi", range.location, range.length);
    
    NSString *str = NSStringFromRange(range);
    NSLog(@"%@", str);
}

#pragma mark CGPoint
void test2()
{
    CGPoint point = CGPointMake(2.0f, 3.0f);
    NSString *str = NSStringFromPoint(point);
    NSLog(@"%@", str);
}

#pragma mark CGSize
void test3()
{
    CGSize size = CGSizeMake(80.0f, 100.0f);
    NSString *str = NSStringFromSize(size);
    NSLog(@"%@", str);
}

#pragma mark CGRect
void test4()
{
    CGRect rect = CGRectMake(5.0f, 5.0f, 80.0f, 100.0f);
    NSString *str = NSStringFromRect(rect);
    NSLog(@"%@", str);
}

#pragma mark - NSString类

#pragma mark NSString创建
void test5()
{
    NSString *str = @"abcdefg";
    NSLog(@"%@", str);
    
//    str = [NSString stringWithString:@"0123456789"];
//    NSLog(@"%@", str);
    
    const char* text = "一二三四五六七八九十";
    str = [NSString stringWithUTF8String:text];
    NSLog(@"%@", str);
    
    str = [NSString stringWithFormat:@"%i, %c %@", 1, 0x1D, @"你好"];
    NSLog(@"%@", str);
    
    
    //NSError *error;
    NSString *path = @"/Users/Douaty/Desktop/text.txt";
    NSString *strText = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", strText);
/*    
    if (error == nil)
    {
        NSLog(@"读取成功%@", strText);

    }
    else
    {
        NSLog(@"读取失败%@", error);
    }
*/
    NSURL *url = [NSURL URLWithString:@"flie:///Users/Douaty/Desktop/text.txt"];
    NSString *strText2 = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", strText2);
/*
    http://www.weather.com.cn/adat/sk/101010100.html
    http://www.weather.com.cn/data/sk/101010100.html
    http://www.weather.com.cn/data/cityinfo/101010100.html
*/
    NSURL *url2 = [NSURL URLWithString:@"http://www.weather.com.cn/adat/sk/101010100.html"];
    NSString *strText3 = [NSString stringWithContentsOfURL:url2 encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", strText3);
    
    NSURL *url3 = [NSURL URLWithString:@"http://www.weather.com.cn/data/sk/101010100.html"];
    NSString *strText4 = [NSString stringWithContentsOfURL:url3 encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", strText4);
    
    NSURL *url4 = [NSURL URLWithString:@"http://www.weather.com.cn/data/cityinfo/101010100.html"];
    NSString *strText5 = [NSString stringWithContentsOfURL:url4 encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", strText5);
}

#pragma mark 文件导出
void test6()
{
    NSError *error;
    
    NSString *str = @"123abc一二三";
    
    NSString *path = @"/Users/Douaty/Desktop/text.txt";
    
    [str writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (error)
    {
        NSLog(@"写入失败 %@", [error localizedDescription]);
    }
    else
    {
        NSLog(@"写入成功");

    }
}

#pragma mark 字符串处理
void test7()
{
    NSString *str = @"ShangHai";
    
    //转换成大写
    NSLog(@"大写: %@", [str uppercaseString]);
    
    //转换成小写
    NSLog(@"小写: %@", [str lowercaseString]);
    
    //转换成首字母大写
    NSLog(@"首字母大写: %@", [str capitalizedString]);
    
    //判断是否相同
    BOOL result = [@"abc" isEqualToString:@"ABC"];
    NSLog(@"%i", result);
    
    //大小比较
    NSComparisonResult result2 = [@"abc" compare:@"ABC"];
    NSLog(@"%i", result);
    
    if (result2 == NSOrderedAscending)
    {
        NSLog(@"右边>左边");
    }
    else if (result2 == NSOrderedDescending)
    {
        NSLog(@"右边<左边");
    }
    else if (result2 == NSOrderedSame)
    {
        NSLog(@"右边=左边");
    }
}

#pragma mark 字符串搜索
void test8()
{
    NSString *str = @"ShangHai123456";
    
    NSLog(@"是否已Sh开头%i", [str hasPrefix:@"Sh"]);
    NSLog(@"是否已56结尾%i", [str hasSuffix:@"56"]);
    
    //查找字符串所在位置
    NSRange range = [str rangeOfString:@"0i12"];
    
    if (range.location == NSNotFound)
    {
        NSLog(@"不能找到");
    }
    else
    {
         NSLog(@"找到的范围: %@", NSStringFromRange(range));
    }
    
    //向后搜索
    range = [str rangeOfString:@"12" options:NSBackwardsSearch];
    NSLog(@"找到的范围: %@", NSStringFromRange(range));
}

#pragma mark 截串
void test9()
{
    NSString *str = @"123456789";
    
    NSLog(@"%@", [str substringFromIndex:3]);
    
    NSLog(@"%@", [str substringToIndex:3]);
    
    NSRange range = NSMakeRange(4, 5);
    NSLog(@"%@", [str substringWithRange:range]);

    NSString *str2 = @"1,2,3-4-5-6,7,8,9";
    NSArray *array = [str2 componentsSeparatedByString:@"-"];
    NSLog(@"%@", array);
    
    NSString *str3 = [array objectAtIndex:0];
    NSLog(@"%@", str3);
}

#pragma mark 与路径相关
void test10()
{
    NSMutableArray *array  = [NSMutableArray array];
    [array addObject:@"users"];
    [array addObject:@"Desktop"];
    [array addObject:@"Douaty"];
    [array addObject:@"Lib"];
    
    //拼接路径
    NSString *path = [NSString pathWithComponents:array];
    NSLog(@"%@", path);
    
    //拆分路径
    NSArray *cpms = [path pathComponents];
    NSLog(@"%@", cpms);
    
    //判断是否为绝对路径
    NSLog(@"%i", [path isAbsolutePath]);

    //返回路径中最后面的文件路径
    NSLog(@"%@", [path lastPathComponent]);
    
    //删除路径中后面的文件夹
    NSLog(@"%@", [path stringByDeletingLastPathComponent]);
    
    //尾部增加一个路径
    NSLog(@"%@", [path stringByAppendingPathComponent:@"oc"]);
 

}

#pragma mark 拓展名处理
void test11()
{
    NSMutableArray *array  = [NSMutableArray array];
    [array addObject:@"users"];
    [array addObject:@"Desktop"];
    [array addObject:@"Douaty"];
    [array addObject:@"Lib"];
    [array addObject:@"123.txt"];
    
    //拼接路径
    NSString *path = [NSString pathWithComponents:array];
    NSLog(@"%@", path);
    
    //返回文件的拓展名
    NSLog(@"%@", [path pathExtension]);
    
    //删除文件的拓展名
    NSLog(@"%@", [path stringByDeletingPathExtension]);
    
    //增加拓展名
    NSLog(@"%@", [path stringByAppendingPathExtension:@"doc"]);
}

#pragma mark 类型转换
void test12()
{
    NSString *str = @"123";
    
    int a = [str intValue];
    NSLog(@"%i", a);
    
    float b = [str floatValue];
    NSLog(@"%.2f", b);
    
    //返回字符串的个数
    NSString *str1 = @"我是字符串!";
    NSLog(@"%zi", [str1 length]);
    
    //取出对应的字符串
    unichar temp = [@"abcdefg" characterAtIndex:3];
    NSLog(@"%c", temp);
    
    const char *s = [@"uvwxyz" UTF8String];
    NSLog(@"%s", s);
}

#pragma mark 可变字符串
void test13()
{
    NSMutableString *str = [NSMutableString stringWithString:@"string"];
    NSLog(@"%@", str);
    
    //设置字符串内容
    [str setString:@"1234"];
    NSLog(@"%@", str);
    
    //拼接字符串
    [str appendString:@"abcdefg"];
    NSLog(@"%@", str);
    
    [str  appendFormat:@"one:%i,two:%.2f,three:%@", 12, 23.0, @"abc"];
    NSLog(@"%@", str);
    
    //替换字符串
    NSRange range = [str rangeOfString:@"abcdefg"];
    //[str replaceCharactersInRange:NSMakeRange(3, 8) withString:@"X_X_X_X_X_X"];
    [str replaceCharactersInRange:range withString:@"X_X_X_X_X_X"];
    NSLog(@"%@", str);
    
    //插入字符串
    range = [str rangeOfString:@"4"];
    [str insertString:@"98776543210" atIndex:range.location+range.length];
    NSLog(@"%@", str);
    
    //删除字符串
    range = [str rangeOfString:@"X_X_X_X_X_X"];
    [str deleteCharactersInRange:range];
    NSLog(@"%@", str);
}

#pragma mark - main
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        test1();
//        test2();
//        test3();
//        test4();
//        test5();
//        test6();
        test7();
//        test8();
//        test9();
//        test10();
//        test11();
//        test12();
//        test13();

    }
    return 0;
}
