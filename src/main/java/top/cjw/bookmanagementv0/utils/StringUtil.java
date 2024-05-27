package top.cjw.bookmanagementv0.utils;

public class StringUtil {
    public static String subUri(String uri) {
        int position = uri.lastIndexOf("/");
        return uri.substring(position + 1);
    }
}
