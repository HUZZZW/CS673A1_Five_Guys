package com.tulingxueyuan.mall.common.api;

/**
 * Some common API opcodes are enumerated
 * Created by macro on 2019/4/19.
 */
public enum ResultCode implements IErrorCode {
    SUCCESS(200, "operate successfully"),
    FAILED(500, "operation failure"),
    VALIDATE_FAILED(404, "Failed parameter test"),
    UNAUTHORIZED(401, "Not logged in or session has expired"),
    FORBIDDEN(403, "No permissions");
    private long code;
    private String message;

    private ResultCode(long code, String message) {
        this.code = code;
        this.message = message;
    }

    public long getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
