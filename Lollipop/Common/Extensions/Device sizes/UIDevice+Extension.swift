//
//  UIDevice+Extension.swift
//  PhoneCleaner
//
//  Created by Eduard Shahnazaryan on 15.03.24.
//

#if os(iOS)
import UIKit
public typealias DCDevice = UIDevice
#elseif os(watchOS)
import WatchKit
public typealias DCDevice = WKInterfaceDevice
#endif

public extension UIDeviceComplete where Base == DCDevice {

    private var identifier: Identifier? {
        return System.name.flatMap {
            return Identifier($0)
        }
    }

    /// Device family i.e iPhone, iPod, iPad
    var deviceFamily: DeviceFamily {
        return identifier.flatMap { $0.type } ?? .unknown
    }

    /// Get specific model name i.e `iPhone 15 Pro`
    var deviceModel: DeviceModel {
        return identifier.flatMap { DeviceModel(identifier: $0) } ?? .unknown
    }

    /// Common name for device i.e "iPhone 7 Plus"
    var commonDeviceName: String {
        return identifier?.description ?? "unknown"
    }
    
    #if os(iOS)
    /// Device family iPhone
    var isIphone: Bool {
        return deviceFamily == .iPhone
    }

    /// Device family iPad
    var isIpad: Bool {
        return deviceFamily == .iPad
    }

    /// Deivce family iPod
    var isIpod: Bool {
        return deviceFamily == .iPod
    }
    #endif
    
}

#if os(iOS)
// MARK: - Screen Size Detection

public extension UIDeviceComplete where Base == DCDevice {
    var screenSize: Screen {
        let scale: Double = Double(UIScreen.main.scale)
        let width: Double = Double(UIScreen.main.bounds.width)
        let height: Double = Double(UIScreen.main.bounds.height)

        return Screen(width: width, height: height, scale: scale)
    }
}
#endif

#if os(watchOS)
// MARK: - Case Size Detection
public extension UIDeviceComplete where Base == DCDevice {
    var caseSize: Int {
        if let identifier = identifier {
            return Screen(identifier: identifier).caseSize ?? 0
        }
        return 0
    }
    
    var callPadButtonHeight: CGFloat {
        var buttonHeight: CGFloat = 37
        
        switch caseSize {
        case 40:
            buttonHeight = 30
        case 41:
            buttonHeight = 31
        case 44:
            buttonHeight = 35
        default:
            buttonHeight = 37
        }
        
        return buttonHeight
    }
    
    var plusTextPosition: (x: CGFloat, y: CGFloat) {
        var xPosition: CGFloat = 25
        var yPosition: CGFloat = 13
        
        switch caseSize {
        case 40:
            xPosition = 17
            yPosition = 8
        case 41:
            xPosition = 20
            yPosition = 10
        case 44:
            xPosition = 20
            yPosition = 11
        case 45:
            xPosition = 24
            yPosition = 12
        default:
            xPosition = 25
            yPosition = 13
        }
        
        return (x: xPosition, y: yPosition)
    }
}
#endif

extension UIDevice {
    
    func MBFormatter(_ bytes: Int64) -> String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = ByteCountFormatter.Units.useMB
        formatter.countStyle = ByteCountFormatter.CountStyle.decimal
        formatter.includesUnit = false
        return formatter.string(fromByteCount: bytes) as String
    }
    
    //MARK: Get String Value
    var totalDiskSpaceInGB:String {
       return ByteCountFormatter.string(fromByteCount: totalDiskSpaceInBytes, countStyle: ByteCountFormatter.CountStyle.decimal)
    }
    
    var freeDiskSpaceInGB:String {
        return ByteCountFormatter.string(fromByteCount: freeDiskSpaceInBytes, countStyle: ByteCountFormatter.CountStyle.decimal)
    }
    
    var usedDiskSpaceInGB:String {
        return ByteCountFormatter.string(fromByteCount: usedDiskSpaceInBytes, countStyle: ByteCountFormatter.CountStyle.decimal)
    }
    
    var totalDiskSpaceInMB:String {
        return MBFormatter(totalDiskSpaceInBytes)
    }
    
    var freeDiskSpaceInMB:String {
        return MBFormatter(freeDiskSpaceInBytes)
    }
    
    var usedDiskSpaceInMB:String {
        return MBFormatter(usedDiskSpaceInBytes)
    }
    
    
    //MARK: Get raw value
    var totalDiskSpaceInBytes:Int64 {
        guard let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
            let space = (systemAttributes[FileAttributeKey.systemSize] as? NSNumber)?.int64Value else { return 0 }
        return space
    }
    
    /*
     Total available capacity in bytes for "Important" resources, including space expected to be cleared by purging non-essential and cached resources. "Important" means something that the user or application clearly expects to be present on the local system, but is ultimately replaceable. This would include items that the user has explicitly requested via the UI, and resources that an application requires in order to provide functionality.
     Examples: A video that the user has explicitly requested to watch but has not yet finished watching or an audio file that the user has requested to download.
     This value should not be used in determining if there is room for an irreplaceable resource. In the case of irreplaceable resources, always attempt to save the resource regardless of available capacity and handle failure as gracefully as possible.
     */
    var freeDiskSpaceInBytes:Int64 {
        if #available(iOS 11.0, *) {
            if let space = try? URL(fileURLWithPath: NSHomeDirectory() as String).resourceValues(forKeys: [URLResourceKey.volumeAvailableCapacityForImportantUsageKey]).volumeAvailableCapacityForImportantUsage {
                return space
            } else {
                return 0
            }
        } else {
            if let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
            let freeSpace = (systemAttributes[FileAttributeKey.systemFreeSize] as? NSNumber)?.int64Value {
                return freeSpace
            } else {
                return 0
            }
        }
    }
    
    var usedDiskSpaceInBytes:Int64 {
       return totalDiskSpaceInBytes - freeDiskSpaceInBytes
    }

    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        switch identifier {
        case "iPhone1,1":    return "iPhone 2G"
        case "iPhone1,2":    return "iPhone 3G"
        case "iPhone2,1":    return "iPhone 3GS"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":    return "iPhone 4"
        case "iPhone4,1":    return "iPhone 4S"
        case "iPhone5,1", "iPhone5,2":    return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":    return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":    return "iPhone 5s"
        case "iPhone7,2":    return "iPhone 6"
        case "iPhone7,1":    return "iPhone 6 Plus"
        case "iPhone8,1":    return "iPhone 6s"
        case "iPhone8,2":    return "iPhone 6s Plus"
        case "iPhone8,4":    return "iPhone SE (1st generation)"
        case "iPhone9,1", "iPhone9,3":    return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":    return "iPhone 7 Plus"
        case "iPhone10,1", "iPhone10,4":    return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":    return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":    return "iPhone X"
        case "iPhone11,2":    return "iPhone XS"
        case "iPhone11,4", "iPhone11,6":    return "iPhone XS Max"
        case "iPhone11,8":    return "iPhone XR"
        case "iPhone12,1":    return "iPhone 11"
        case "iPhone12,3":    return "iPhone 11 Pro"
        case "iPhone12,5":    return "iPhone 11 Pro Max"
        case "iPhone12,8":    return "iPhone SE (2nd generation)"
        case "iPhone13,1":    return "iPhone 12 Mini"
        case "iPhone13,2":    return "iPhone 12"
        case "iPhone13,3":    return "iPhone 12 Pro"
        case "iPhone13,4":    return "iPhone 12 Pro Max"
        case "iPhone14,4":    return "iPhone 13 Mini"
        case "iPhone14,5":    return "iPhone 13"
        case "iPhone14,2":    return "iPhone 13 Pro"
        case "iPhone14,3":    return "iPhone 13 Pro Max"
        case "iPhone14,7":    return "iPhone 14"
        case "iPhone14,8":    return "iPhone 14 Pro"
        case "iPhone14,9":    return "iPhone 14 Pro Max"
        case "iPhone15,1", "iPhone15,2":    return "iPhone 15"
        case "iPhone15,3", "iPhone15,4":    return "iPhone 15 Pro"
        case "iPhone15,5", "iPhone15,6":    return "iPhone 15 Pro Max"
        default: return identifier
        }
    }
}
