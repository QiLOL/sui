// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

module examples::strings {
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;

    // 使用以下依赖可以使用针对UTF-8的包装函数
    // Use this dependency to get a type wrapper for UTF-8 strings
    use std::string::{Self, String};

    /// 一个包含字符串类型的模拟对象
    /// A dummy Object that holds a String type
    struct Name has key, store {
        id: UID,

        /// Here it is - the String type
        name: String
    }

    /// 用输入的字节数据创建一个`Name`对象
    /// Create a name Object by passing raw bytes
    public fun issue_name_nft(
        name_bytes: vector<u8>, ctx: &mut TxContext
    ): Name {
        Name {
            id: object::new(ctx),
            name: string::utf8(name_bytes)
        }
    }
}
