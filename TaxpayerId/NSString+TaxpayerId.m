//
//  NSString+TaxpayerId.m
//  TaxpayerId
//
//  Created by MaxWellPro on 2017/7/27.
//  Copyright © 2017年 QuanYanTech. All rights reserved.
//

#import "NSString+TaxpayerId.h"

@implementation NSString (TaxpayerId)

- (BOOL)checkTaxpayerId {
    // 位数校验
    NSSet *set = [NSSet setWithObjects:@"15", @"18", @"20",[NSString stringWithFormat:@"%ld",self.length],nil];

    if (set.count == 4) {
        return NO;
    }
    
    // 数字&字母
    NSString * regex = @"^[0-9a-zA-Z]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![predicate evaluateWithObject:self]) {
        return NO;
    }
    
    // 获取地址码
    NSString *addressCode;
    if (self.length > 17) {
        addressCode = [self substringWithRange:NSMakeRange(2, 6)];
    }
    else
        addressCode = [self substringWithRange:NSMakeRange(0, 6)];
    
    // 校验地址码
    if (![addressCode checkAddressCode]) {
        NSLog(@"请输入正确的纳税人识别号-地址码错误");
        return NO;
    }
    
    // 获取组织机构代码
    NSString *orgCode;
    if (self.length > 17) {
        orgCode = [self substringWithRange:NSMakeRange(8, 9)];
    }
    else
        orgCode = [self substringWithRange:NSMakeRange(6, 9)];
    
    // 校验组织机构代码
    if (![orgCode checkOrganizationCode]) {
        NSLog(@"请输入正确的纳税人识别号-组织机构代码");
        return NO;
    }
    
    return YES;
}

- (BOOL)checkOrganizationCode {
    NSString *part1 = [self substringWithRange:NSMakeRange(0, 8)];
    
    NSString *regex1 = @"(^([0-9A-Z]){8}$)";
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex1];
    if (![predicate1 evaluateWithObject:part1])
        return NO;
    
    NSString *part2 = [self substringWithRange:NSMakeRange(self.length - 1, 1)];

    NSString *regex2 = @"(^([0-9A-Z]){1}$)";
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
    if (![predicate2 evaluateWithObject:part2])
        return NO;
    
    return YES;
}

- (BOOL)checkAddressCode {
    NSDictionary *provinceAndCitys = @{
                                       @11:@"北京",
                                       @12:@"天津",
                                       @13:@"河北",
                                       @14:@"山西",
                                       @15:@"内蒙古",
                                       @21:@"辽宁",
                                       @22:@"吉林",
                                       @23:@"黑龙江",
                                       @31:@"上海",
                                       @32:@"江苏",
                                       @33:@"浙江",
                                       @34:@"安徽",
                                       @35:@"福建",
                                       @36:@"江西",
                                       @37:@"山东",
                                       @41:@"河南",
                                       @42:@"湖北",
                                       @43:@"湖南",
                                       @44:@"广东",
                                       @45:@"广西",
                                       @46:@"海南",
                                       @50:@"重庆",
                                       @51:@"四川",
                                       @52:@"贵州",
                                       @53:@"云南",
                                       @54:@"西藏",
                                       @61:@"陕西",
                                       @62:@"甘肃",
                                       @63:@"青海",
                                       @64:@"宁夏",
                                       @65:@"新疆",
                                       @71:@"台湾",
                                       @81:@"香港",
                                       @82:@"澳门",
                                       @91:@"国外"
                                       };
    // 十位1-9 个位0-5
    NSString *regex = @"(^[1-9]\\d{5}$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![predicate evaluateWithObject:self])
        return NO;
    
    // 校验地区编码
    NSString *addressCode = [self substringWithRange:NSMakeRange(0, 2)];
    if (![provinceAndCitys.allKeys containsObject:[NSNumber numberWithInteger:[addressCode integerValue]]]) {
        return NO;
    }
    
    return YES;
}

@end
