package com.tulingxueyuan.mall.common.exception;


import com.tulingxueyuan.mall.common.api.IErrorCode;

/**
 * An assertion handling class that throws various API exceptions
 * Created by macro on 2020/2/27.
 */
public class Asserts {
    public static void fail(String message) {
        throw new ApiException(message);
    }

    public static void fail(IErrorCode errorCode) {
        throw new ApiException(errorCode);
    }
}
