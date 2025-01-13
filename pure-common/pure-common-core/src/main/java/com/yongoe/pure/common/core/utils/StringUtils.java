package com.yongoe.pure.common.core.utils;

/**
 * 字符串工具
 *
 * @author yongoe
 * @since 2024/7/5
 */
public class StringUtils {
    /**
     * 首字母大写
     */
    public static String firstLetterUpperCase(String s) {
        if (s == null || s.isEmpty()) {
            return s;
        }
        return s.substring(0, 1).toUpperCase() + s.substring(1);
    }

    /**
     * 首字母小写
     */
    public static String firstLetterLowerCase(String s) {
        if (s == null || s.isEmpty()) {
            return s;
        }
        return s.substring(0, 1).toLowerCase() + s.substring(1);
    }

    /**
     * 将下划线分隔的字符串转换为大写开头的驼峰命名（PascalCase）
     *
     * @param input 下划线分隔的字符串
     * @return 大写开头的驼峰命名字符串
     */
    public static String toUpperCase(String input) {
        if (input == null || input.isEmpty()) {
            return input;
        }

        // 使用StringBuilder来提高字符串拼接的效率
        StringBuilder camelCaseString = new StringBuilder();

        // 标记是否已经开始转换（即是否遇到了第一个字符）
        boolean convertNext = false;

        for (char c : input.toCharArray()) {
            // 如果是下划线，则标记下一个字符需要转换为大写
            if (c == '_') {
                convertNext = true;
            } else if (convertNext) {
                // 如果需要转换且当前字符不是第一个字符，则转换为大写
                camelCaseString.append(Character.toUpperCase(c));
                convertNext = false; // 重置标记
            } else {
                // 否则，直接添加字符（注意：这里第一个字符会被直接添加，稍后转换为大写）
                camelCaseString.append(c);
            }
        }

        // 如果字符串不为空，且第一个字符不是大写，则将其转换为大写
        if (!camelCaseString.toString().isEmpty() && !Character.isUpperCase(camelCaseString.charAt(0))) {
            camelCaseString.setCharAt(0, Character.toUpperCase(camelCaseString.charAt(0)));
        }

        return camelCaseString.toString();
    }

    /**
     * 将下划线分隔的字符串转换为小写开头的驼峰命名（pascalCase）
     *
     * @param input 下划线分隔的字符串
     * @return 大写开头的驼峰命名字符串
     */
    public static String toLowerCase(String input) {
        if (input == null || input.isEmpty()) {
            return input;
        }
        // 处理首字母
        StringBuilder camelCase = new StringBuilder();
        char firstChar = input.charAt(0);
        if (!Character.isLowerCase(firstChar) && !Character.isUpperCase(firstChar)) {
            // 如果第一个字符不是字母，直接加上
            camelCase.append(firstChar);
        } else {
            // 将第一个字母转换为小写
            camelCase.append(Character.toLowerCase(firstChar));
        }

        // 处理剩余部分
        for (int i = 1; i < input.length(); i++) {
            char currentChar = input.charAt(i);
            if (currentChar == '_') {
                // 跳过下划线，将下一个字符转换为大写
                if (i + 1 < input.length()) {
                    camelCase.append(Character.toUpperCase(input.charAt(i + 1)));
                }
                i++; // 跳过已处理的字符
            } else {
                // 直接添加字符
                camelCase.append(currentChar);
            }
        }

        return camelCase.toString();
    }

    /**
     * 是空格、空字符串
     */
    public static boolean isBlank(String str) {
        return str == null || str.trim().isEmpty();
    }

    /**
     * 不是是空格、空字符串
     */
    public static boolean isNotBlank(String str) {
        return !isBlank(str);
    }

    /**
     * 是空字符串
     */
    public static boolean isEmpty(String str) {
        return str == null || str.isEmpty();
    }

    /**
     * 不用是空字符串
     */
    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

    /**
     * 替换指定字符串的指定区间内字符为"*"
     *
     * @param str          字符串
     * @param startInclude 开始位置（包含）
     * @param endExclude   结束位置（不包含）
     * @return 替换后的字符串
     */
    public static String hide(CharSequence str, int startInclude, int endExclude) {
        return hide(str, startInclude, endExclude, '*');
    }

    /**
     * 替换指定字符串的指定区间内字符
     *
     * @param str          字符串
     * @param startInclude 开始位置（包含）
     * @param endExclude   结束位置（不包含）
     * @param replaceChar  替换字符
     * @return 替换后的字符串
     */
    public static String hide(CharSequence str, int startInclude, int endExclude, char replaceChar) {
        if (str == null || str.isEmpty()) {
            return "";
        }
        final int strLength = str.length();
        if (startInclude > strLength) {
            return "";
        }
        if (endExclude > strLength) {
            endExclude = strLength;
        }
        if (startInclude > endExclude) {
            // 如果起始位置大于结束位置，不替换
            return "";
        }
        final char[] chars = new char[strLength];
        for (int i = 0; i < strLength; i++) {
            if (i >= startInclude && i < endExclude) {
                chars[i] = replaceChar;
            } else {
                chars[i] = str.charAt(i);
            }
        }
        return new String(chars);
    }
}