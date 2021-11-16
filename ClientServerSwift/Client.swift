//
//  Client.swift
//  ClientServerSwift
//
//  Created by Vlad Gershun on 11/16/21.
//

import Foundation
import AppKit

func runClient(address: String, port: String) throws -> String {
    enum Errors: Error, LocalizedError {
        case getAddressInfo(String)
        case getSocketStat(String)
        case getConnectionStat(String)
        case getReadStat(String)
        case getReturnStat(String)
        
        var failureReason: String? {
            switch self {
            case .getAddressInfo(let string):
                return "getAddressInfo(\(string))"
            case .getSocketStat(let string):
                return "getSocketStat(\(string))"
            case .getConnectionStat(let string):
                return "getConnectionStat(\(string))"
            case .getReadStat(let string):
                return "getReadStat(\(string))"
            case .getReturnStat(let string):
                return "getReturnStat(\(string))"
            }
        }
    }
    let buf = UnsafeMutableRawPointer.allocate(byteCount: 100, alignment: 2)
    defer { buf.deallocate() }
    
    var hints = addrinfo()
    hints.ai_socktype = SOCK_STREAM
    hints.ai_family = AF_INET
    var addressRef: UnsafeMutablePointer<addrinfo>?
    
    let err = getaddrinfo(address, port, &hints, &addressRef)
    guard err == 0 else {
        throw Errors.getAddressInfo(String(cString: gai_strerror(err)))
    }
    guard let address = addressRef?.pointee else {
        throw Errors.getAddressInfo("No address found")
    }
    
    let socketfd = socket(address.ai_family, address.ai_socktype, 0)
    guard socketfd >= 0 else {
        throw Errors.getSocketStat(String(cString: strerror(errno)))
    }
    defer { close(socketfd) }

    guard connect(socketfd, address.ai_addr, address.ai_addrlen) >= 0 else {
        throw Errors.getConnectionStat(String(cString: strerror(errno)))
    }
   
    let numberRead = read(socketfd, buf, 100)
    guard numberRead > 0 else {
        throw Errors.getReadStat("No Bytes Read!")
    }
    
    guard let s = String(bytesNoCopy: buf, length: numberRead, encoding: .utf8, freeWhenDone: false) else {
        throw Errors.getReturnStat("Return Failed!")
    }
    return s
}



//struct Socket {
//    init(host: String, port: String) throws {
//        fatalError()
//    }
//
//    func read(bytes: Int) throws -> String {
//        fatalError()
//    }
//}
//
//func foo() throws {
//    let socket = try Socket(host: "localhost", port: "49999")
//    try socket.read(bytes: 100)
//}

