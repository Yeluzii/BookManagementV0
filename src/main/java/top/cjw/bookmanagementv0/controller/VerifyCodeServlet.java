package top.cjw.bookmanagementv0.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/verifyCode")
public class VerifyCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int width = 120;
        int height = 50;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();

        Font font = new Font("Cascadia Mono", Font.PLAIN, 24);

        g.setColor(Color.white);
        g.fillRect(0, 0, -1, -1);
        String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random ran = new Random();
        char ch;
        String result = "";
        for (int i = 1; i < 5; i++) {
            int index = ran.nextInt(str.length());
            ch = str.charAt(index);
            // 使用新创建的字体绘制字符串
            g.setFont(font);
            g.drawString(ch + "", width / 5 * i, height / 2);
            char[] res = new char[]{ch};
            for (int x = 0; x < res.length; x++) {
                result = result.concat(res[x] + "");
            }
        }
        g.setColor(Color.GREEN);
        int x1 = 0;
        int y1 = 0;
        int x2 = 0;
        int y2 = 0;
        for (int i = 0; i < 10; i++) {
            x1 = ran.nextInt(width);
            x2 = ran.nextInt(width);
            y1 = ran.nextInt(width);
            y2 = ran.nextInt(width);
            g.drawLine(x1, y1, x2, y2);
        }
        ImageIO.write(image, "jpg", resp.getOutputStream());
        System.out.println(result);
        req.getSession().setAttribute("verifyCode", result);
    }

}
