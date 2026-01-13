#import <UIKit/UIKit.h>

@interface MenuView : UIView
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation MenuView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Thiết lập nền tối và bo góc cực mạnh giống ảnh
        self.backgroundColor = [UIColor colorWithRed:0.05 green:0.05 blue:0.05 alpha:0.95];
        self.layer.cornerRadius = 30;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 0.8;
        self.layer.borderColor = [UIColor colorWithWhite:0.3 alpha:1.0].CGColor;
        
        // Tự động giãn khi xoay màn hình
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;

        // Header "Settings"
        UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 60)];
        header.text = @"Settings";
        header.textColor = [UIColor whiteColor];
        header.textAlignment = NSTextAlignmentCenter;
        header.font = [UIFont systemFontOfSize:22 weight:UIFontWeightBold];
        header.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:header];

        // ScrollView chứa các chức năng
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, frame.size.width, frame.size.height - 60)];
        self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.scrollView];

        [self setupAllFeatures];
    }
    return self;
}

- (void)setupAllFeatures {
    CGFloat y = 10;
    CGFloat width = self.frame.size.width;

    // Các mục đầu tiên
    [self addSwitch:@"Không Giật" atY:&y];
    [self addSwitch:@"Sensi" atY:&y];
    [self addSlider:@"JIT" value:69.0 atY:&y];
    [self addSwitch:@"Trick SHOT" atY:&y];
    [self addSlider:@"PRO TrickVIP" value:0.8 atY:&y];

    // Section BACKUP
    [self addSection:@"BACKUP" atY:&y];
    [self addSwitch:@"LegitAimAssist" atY:&y];
    [self addSwitch:@"AimJIT" atY:&y];
    [self addSwitch:@"Không Giật (Backup)" atY:&y];
    [self addSlider:@"JIT Speed" value:80.0 atY:&y];

    // Section VIP
    [self addSection:@"VIP" atY:&y];
    [self addSwitch:@"Rage Lock" atY:&y];
    [self addSwitch:@"Aim Core" atY:&y];
    [self addSwitch:@"AimTrack" atY:&y];
    [self addSwitch:@"RecoilFIX" atY:&y];
    [self addSwitch:@"DRAG Head" atY:&y];

    self.scrollView.contentSize = CGSizeMake(width, y + 30);
}

- (void)addSection:(NSString *)title atY:(CGFloat *)y {
    UIView *bar = [[UIView alloc] initWithFrame:CGRectMake(0, *y, self.frame.size.width, 40)];
    bar.backgroundColor = [UIColor colorWithWhite:0.12 alpha:1.0];
    bar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:bar.bounds];
    lbl.text = title;
    lbl.textColor = [UIColor whiteColor];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.font = [UIFont systemFontOfSize:15 weight:UIFontWeightHeavy];
    lbl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    [bar addSubview:lbl];
    [self.scrollView addSubview:bar];
    *y += 50;
}

- (void)addSwitch:(NSString *)name atY:(CGFloat *)y {
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(25, *y, 200, 30)];
    lbl.text = name;
    lbl.textColor = [UIColor whiteColor];
    lbl.font = [UIFont systemFontOfSize:17];
    
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(self.frame.size.width - 75, *y, 50, 30)];
    sw.onTintColor = [UIColor systemGreenColor];
    sw.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    
    [self.scrollView addSubview:lbl];
    [self.scrollView addSubview:sw];
    *y += 50;
}

- (void)addSlider:(NSString *)name value:(float)val atY:(CGFloat *)y {
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(25, *y, 200, 20)];
    lbl.text = [NSString stringWithFormat:@"%@: %.1f", name, val];
    lbl.textColor = [UIColor whiteColor];
    
    UISlider *sd = [[UISlider alloc] initWithFrame:CGRectMake(25, *y + 25, self.frame.size.width - 50, 30)];
    sd.value = val / 100.0; 
    sd.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    [self.scrollView addSubview:lbl];
    [self.scrollView addSubview:sd];
    *y += 70;
}
@end
