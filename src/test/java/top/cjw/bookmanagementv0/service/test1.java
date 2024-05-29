package top.cjw.bookmanagementv0.service;

public class test1 {
    public static void main(String[] args) {
        int[] res = {1,2,3,4};
        String result = "";
        for (int i = 0;i< res.length;i++){
            if (i != res.length - 1) {
                int data = res[i];
                result = result.concat(String.valueOf(data));
            } else {
                result = result.concat(res[i] + "");
            }
        }
        System.out.println(result);
    }
}
