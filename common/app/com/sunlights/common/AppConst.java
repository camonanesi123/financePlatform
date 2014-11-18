package com.sunlights.common;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by Administrator on 2014/9/10.
 */
public final class AppConst {

    private AppConst(){}

    //---- core ---
    public static String VERIFY_CODE_REGISTER = "REGISTER";
    public static String VERIFY_CODE_RESETPWD = "RESETPWD";
    public static String VERIFY_CODE_RESET_ACCOUNT = "RESETACCOUNT";

    public static Set<String> VALID_VERIFY_CODES = new HashSet<>();
    static{
        VALID_VERIFY_CODES.add(VERIFY_CODE_REGISTER);
        VALID_VERIFY_CODES.add(VERIFY_CODE_RESETPWD);
        VALID_VERIFY_CODES.add(VERIFY_CODE_RESET_ACCOUNT);
    }

    //-------account------
    public static String SUBJECT_PURCHASE = "100001";
    public static String SUBJECT_REDEEM = "100002";


    // ----- customer ---
    public static String STATUS_VALID = "Y";
    public static String STATUS_INVALID = "N";


    public static String INVALID_CERTIFY = "0";
    public static String VALID_CERTIFY = "1";

    // --- all ---

    public static String STATUS_FLAG = "status";

    public static long ONE_MINUTE = 60 * 1000;
    public static String TOKEN = "token";
}
