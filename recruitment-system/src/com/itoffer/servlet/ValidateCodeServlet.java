package com.itoffer.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 验证码图像生成
 * 
 * @author TianYanan
 *
 */
@WebServlet("/ValidateCodeServlet")
public class ValidateCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ValidateCodeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 设置响应头 Content-type类型,图形写给浏览器
		response.setContentType("image/jpeg");
		// 获取二进制数据输出流对象
		ServletOutputStream out = response.getOutputStream();
		// 创建缓冲图象
		int width = 60;
		int height = 20;
		// 创建一个不带透明色的BufferedImage对象
		BufferedImage imgbuf = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		// 在image对象上获得了绘图对象
		Graphics2D g = imgbuf.createGraphics();
		// 设定背景色
		g.setColor(getRandColor(200, 250));
		// 设定图像形状及宽高
		g.fillRect(0, 0, width, height); 
		// 随机产生100条干扰线，使图象中的认证码不易被其它程序探测到
		Random r = new Random();
		// 设置线条的颜色
		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 100; i++) {
			int x = r.nextInt(width);
			int y = r.nextInt(height);
			int xl = r.nextInt(12);
			int yl = r.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}
		// 随机产生100个干扰点，使图像中的验证码不易被其他分析程序探测到
		// 设置线条的颜色
		g.setColor(getRandColor(120, 240));
		for (int i = 0; i < 100; i++) {
			int x = r.nextInt(width);
			int y = r.nextInt(height);
			g.drawOval(x, y, 0, 0);
		}
		// 随机产生0-9之间的4位数字验证码
		g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		String code = "";
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(r.nextInt(10));
			code += rand;
			g.setColor(new Color(20 + r.nextInt(110), 20 + r.nextInt(110),
					20 + r.nextInt(110)));
			g.drawString(rand, 13 * i + 6, 16);
		}
		// 将验证码保存到session中
		request.getSession().setAttribute("SESSION_VALIDATECODE", code);
		// 输出图像
		ImageIO.write(imgbuf, "JPEG", out);
		out.close();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	// 获取指定范围的随机颜色
	private Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (fc < 0)
			fc = 0;
		if (bc > 255)
			bc = 255;
		if (bc < 0)
			bc = 0;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
}
