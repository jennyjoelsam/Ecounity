package com.ecounity.ecounity.utils;

import java.util.Base64;

public class Base64Utils {
    public static String encode(byte[] data) {
        return Base64.getEncoder().encodeToString(data);
    }
}