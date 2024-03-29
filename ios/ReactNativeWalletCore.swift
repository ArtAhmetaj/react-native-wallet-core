import WalletCore

@objc(ReactNativeWalletCore)
class ReactNativeWalletCore: NSObject {

    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }

    @objc(createWallet:withPassphrase:withResolver:withRejecter:)
    func createWallet(strength: Int32, passphrase: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        let wallet = HDWallet(strength: 128, passphrase: passphrase)
        resolve(wallet!.mnemonic)
    }
    
    @objc(sha512:withResolver:withRejecter:)
    func sha512(string: String, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(Hash.sha512(data: string.data(using: .utf8)!).hexString)
    }
}
