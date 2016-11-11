//
//  NetworkingCountTool.m
//  cellToFit
//
//  Created by 邓西亮 on 16/9/12.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "NetworkingCountTool.h"
#include <ifaddrs.h>
#include <sys/socket.h>
#include <net/if.h>
//#include <stdio.h>

@implementation NetworkingCountTool

//jian
+(int)get3GFlowIOBytes{
    struct ifaddrs *ifa_list= 0, *ifa;
    if (getifaddrs(&ifa_list)== -1) {
        return 0;
    }
    uint32_t iBytes = 0;
    uint32_t oBytes = 0;
    for (ifa = ifa_list; ifa; ifa = ifa->ifa_next) {
        if (AF_LINK != ifa->ifa_addr->sa_family)
            continue;
        if (!(ifa->ifa_flags& IFF_UP) &&!(ifa->ifa_flags & IFF_RUNNING))
            continue;
        if (ifa->ifa_data == 0)
            continue;
        if (!strcmp(ifa->ifa_name,"pdp_ip0")) {
            struct if_data *if_data = (struct if_data*)ifa->ifa_data;
            iBytes += if_data->ifi_ibytes;
            oBytes += if_data->ifi_obytes;
            NSLog(@"%s :iBytes is %d, oBytes is %d",ifa->ifa_name, iBytes, oBytes);
        }
    }
    freeifaddrs(ifa_list);
    return iBytes + oBytes;
}
+(long)getWifiInterfaceBytes{
    struct ifaddrs *ifa_list = 0, *ifa;
    if (getifaddrs(&ifa_list) == -1) {
        NSLog(@"__打印_%d",getifaddrs(&ifa_list));
        return 0;
    }
    uint32_t iBytes = 0;
    uint32_t oBytes = 0;
    for (ifa = ifa_list; ifa; ifa = ifa->ifa_next) {
        if (AF_LINK != ifa->ifa_addr->sa_family)
            continue;
        if (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))
            continue;
        if (ifa->ifa_data == 0)
            continue;
        if (strncmp(ifa->ifa_name, "lo", 2)) {
            struct if_data *if_data = (struct if_data *)ifa->ifa_data;
            iBytes += if_data->ifi_ibytes;
            oBytes += if_data->ifi_obytes;
            NSLog(@"%s :iBytes is %d, oBytes is %d", ifa->ifa_name, iBytes, oBytes);
        }
    }
    freeifaddrs(ifa_list);
    return iBytes+oBytes;
}


//#include <ifaddrs.h>
//
//#include <arpa/inet.h>
////这里同样替换下  发布后是网页 所以<> 这种特殊符号会被和谐掉 哎
//- (NSString *)getIPAddress {
//    NSString *address = @"error";
//    struct ifaddrs *interfaces = NULL;
//    struct ifaddrs *temp_addr = NULL;
//    int success = 0;
//    // retrieve the current interfaces - returns 0 on success
//    success = getifaddrs(&interfaces);
//    if (success == 0) {
//        // Loop through linked list of interfaces
//        temp_addr = interfaces;
//        while(temp_addr != NULL) {
//            if(temp_addr->ifa_addr->sa_family == AF_INET) {
//                // Check if interface is en0 which is the wifi connection on the iPhone
//                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
//                    // Get NSString from C String
//                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
//                }
//            }
//            temp_addr = temp_addr->ifa_next;
//        }
//    }
//    // Free memory
//    freeifaddrs(interfaces);
//    return address;
//    
//}
//
@end
