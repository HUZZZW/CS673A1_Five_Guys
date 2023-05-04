package com.tulingxueyuan.mall.common.exception;


import com.tulingxueyuan.mall.common.api.IErrorCode;

/**
 *
 * Assertion processing class, used to throw various API exceptions
 */
public class Asserts {
    public static void fail(String message) {
        throw new ApiException(message);
    }

    public static void fail(IErrorCode errorCode) {
        throw new ApiException(errorCode);
    }
}
