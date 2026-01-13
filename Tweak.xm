#import "MenuView.m"

%hook AppDelegate
- (BOOL)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2 {
    %orig;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *win = [UIApplication sharedApplication].keyWindow;
        
        // Khởi tạo Menu với khung linh hoạt
        CGFloat menuW = (win.frame.size.width > win.frame.size.height) ? 500 : 330;
        CGFloat menuH = (win.frame.size.width > win.frame.size.height) ? 300 : 550;
        
        MenuView *menu = [[MenuView alloc] initWithFrame:CGRectMake(0, 0, menuW, menuH)];
        menu.center = win.center;
        [win addSubview:menu];
        
        // Label Footer cố định phía dưới màn hình
        UILabel *footer = [[UILabel alloc] initWithFrame:CGRectMake(0, win.frame.size.height - 100, win.frame.size.width, 50)];
        footer.text = @"Bạn có thể thoát app bây giờ.\nESP sẽ hiển thị trên màn hình.";
        footer.numberOfLines = 2;
        footer.textColor = [UIColor lightGrayColor];
        footer.textAlignment = NSTextAlignmentCenter;
        footer.font = [UIFont systemFontOfSize:13];
        footer.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        [win addSubview:footer];
    });
    
    return YES;
}
%end
