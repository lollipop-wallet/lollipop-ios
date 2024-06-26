//
//  Screen+Extension.swift
//  PhoneCleaner
//
//  Created by Eduard Shahnazaryan on 15.03.24.
//

#if os(iOS)
import UIKit
#endif

public struct Screen {
    #if os(iOS)
    init(width: Double, height: Double, scale: Double) {
        self.width = width
        self.height = height
        self.scale = scale
    }

    public let width: Double
    public let height: Double
    public let scale: Double

    public var adjustedScale: Double {
        return 1.0 / scale
    }
    #elseif os(watchOS)
    init(identifier: Identifier) {
        self.identifier = identifier
    }
    
    let identifier: Identifier
    #endif
}

#if os(iOS)
// MARK: - Detecting Screen size in Inches

extension Screen {
    public var sizeInches: Double? {
        switch (height, scale) {
        case (480, _): return 3.5
        case (568, _): return 4.0
        case (667, 3.0), (736, _): return 5.5
        case (667, 1.0), (667, 2.0): return 4.7
        case (812, 3.0): return 5.8
        case (896, 2.0): return 6.1
        case (896, 3.0): return 6.5
        case (1024, _): return ipadSize1024()
        case (1080, _): return 10.2
        case (1112, _): return 10.5
        case (1133, _): return 8.3
        case (1180, _): return 10.9
        case (1194, _): return 11.0
        case (1366, _): return 12.9
        default: return nil
        }
    }

    func ipadSize1024() -> Double {
        let deviceModel = UIDevice().dc.deviceModel
        switch deviceModel {
        case .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadMini5: return 7.9
        case .iPadPro10_5Inch: return 10.5
        default: return 9.7
        }
    }
}

// MARK: - Detecting Screen aspect ratio

extension Screen {
    
    public var aspectRatio: String? {
        switch (height, scale) {
        case (480, _): return "3:2"
        case (568, _), (667, 3.0), (736, _), (667, 1.0), (667, 2.0): return "16:9"
        case (812, 3.0), (896, 2.0), (896, 3.0): return "19.5:9"
        case (1024, _), (1112, _), (1366, _), (1080, _): return "4:3"
        // 3rd Gen iPad Pro aspect ratios still unknown
        default: return nil
        }
    }
    
}
#endif

#if os(watchOS)
extension Screen {
    public var caseSize: Int? {
        guard let major = identifier.version.major,
              let minor = identifier.version.minor
        else { return nil }
        
        switch (major, minor) {
        case (1, 1), (2, 3), (2, 6), (3, 1), (3, 3):        return 38
        case (1, 2), (2, 4), (2, 7), (3, 2), (3, 4):        return 42
            
        case (4, 1), (4, 3), (5, 1), (5, 3), (5, 9),
             (5, 11), (6, 1), (6, 3), (6, 10), (6, 12):     return 40
        case (4, 2), (4, 4), (5, 2), (5, 4), (5, 10),
             (5, 12), (6, 2), (6, 4), (6, 11), (6, 13):     return 44
            
        case (6, 6), (6, 8), (6, 14), (6, 16),
             (7, 1), (7, 3):                                return 41
        case (6, 7), (6, 9), (6, 15), (6, 17),
             (7, 2), (7, 4):                                return 45
            
        case (6, 18), (7, 5):                               return 49
            
        default:                                            return nil
        }
    }
}
#endif

