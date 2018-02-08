package com.xakj.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.lang.reflect.Array;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {
	/**
	 * 如果最后一个字符是逗号就要移除
	 * 
	 * @param str
	 * @return
	 */
	public static String removeStr(String str) {
		if (str.lastIndexOf(",") == str.length() - 1) {
			return str.substring(0, str.length() - 1);
		} else {
			return str;
		}
	}

	/**
	 * 随机生成六位数验证码
	 * 
	 * @return
	 */
	public static int getRandomNum() {
		Random r = new Random();
		return r.nextInt(900000) + 100000;// (Math.random()*(999999-100000)+100000)
	}

	/**
	 * 检测字符串是否不为空(null,"","null")
	 * 
	 * @param s
	 * @return 不为空则返回true，否则返回false
	 */
	public static boolean notEmpty(String s) {
		return s != null && !"".equals(s) && !"null".equals(s);
	}

	/**
	 * 检测字符串是否为空(null,"","null")
	 * 
	 * @param s
	 * @return 为空则返回true，不否则返回false
	 */
	public static boolean isEmpty(Object pInput) {
		// 判断参数是否为空或者''
		if (pInput == null || "".equals(pInput)) {
			return true;
		} else if ("java.lang.String".equals(pInput.getClass().getName())) {
			// 判断传入的参数的String类型的

			// 替换各种空格
			String tmpInput = Pattern.compile("//r|//n|//u3000")
					.matcher((String) pInput).replaceAll("");
			// 匹配空
			return Pattern.compile("^(//s)*$").matcher(tmpInput).matches();
		} else {
			// 方法类
			Method method = null;
			String newInput = "";
			try {
				// 访问传入参数的size方法
				method = pInput.getClass().getMethod("size");
				// 判断size大小

				// 转换为String类型
				newInput = String.valueOf(method.invoke(pInput));
				// size为0的场合
				if (Integer.parseInt(newInput) == 0) {

					return true;
				} else {

					return false;
				}
			} catch (Exception e) {
				// 访问失败
				try {
					// 访问传入参数的getItemCount方法
					method = pInput.getClass().getMethod("getItemCount");
					// 判断size大小

					// 转换为String类型
					newInput = String.valueOf(method.invoke(pInput));

					// getItemCount为0的场合
					if (Integer.parseInt(newInput) == 0) {

						return true;
					} else {

						return false;
					}
				} catch (Exception ex) {
					// 访问失败
					try {
						// 判断传入参数的长度

						// 长度为0的场合
						if (Array.getLength(pInput) == 0) {

							return true;
						} else {

							return false;
						}
					} catch (Exception exx) {
						// 访问失败
						try {
							// 访问传入参数的hasNext方法
							method = Iterator.class.getMethod("hasNext");
							// 转换String类型
							newInput = String.valueOf(method.invoke(pInput));

							// 转换hasNext的值
							if (!Boolean.valueOf(newInput)) {
								return true;
							} else {
								return false;
							}

						} catch (Exception exxx) {
							// 以上场合不满足

							return false;
						}
					}
				}
			}
		}
	}

	/**
	 * 字符串转换为字符串数组
	 * 
	 * @param str
	 *            字符串
	 * @param splitRegex
	 *            分隔符
	 * @return
	 */
	public static String[] str2StrArray(String str, String splitRegex) {
		if (isEmpty(str)) {
			return null;
		}
		return str.split(splitRegex);
	}

	/**
	 * 用默认的分隔符(,)将字符串转换为字符串数组
	 * 
	 * @param str
	 *            字符串
	 * @return
	 */
	public static String[] str2StrArray(String str) {
		return str2StrArray(str, ",\\s*");
	}

	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，日期转字符串
	 * 
	 * @param date
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static String date2Str(Date date) {
		return date2Str(date, "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 按照yyyy-MM-dd HH:mm:ss的格式，字符串转日期
	 * 
	 * @param date
	 * @return
	 */
	public static Date str2Date(String date) {
		if (notEmpty(date)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				return sdf.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return new Date();
		} else {
			return null;
		}
	}

	/**
	 * 恢复相关标签
	 * 
	 * @param value
	 * @return
	 */

	public static String replaceBq(String value) {
		// 恢复相关标签
		value = value.replaceAll("& lt;", "<").replaceAll("& gt;", ">");
		value = value.replaceAll("& #40;", "\\(").replaceAll("& #41;", "\\)");
		value = value.replaceAll("& #39;", "'");

		return value;
	}

	/**
	 * 按照参数format的格式，日期转字符串
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static String date2Str(Date date, String format) {
		if (date != null) {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return sdf.format(date);
		} else {
			return "";
		}
	}

	/**
	 * 把时间根据时、分、秒转换为时间段
	 * 
	 * @param StrDate
	 */
	public static String getTimes(String StrDate) {
		String resultTimes = "";

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date now;

		try {
			now = new Date();
			java.util.Date date = df.parse(StrDate);
			long times = now.getTime() - date.getTime();
			long day = times / (24 * 60 * 60 * 1000);
			long hour = (times / (60 * 60 * 1000) - day * 24);
			long min = ((times / (60 * 1000)) - day * 24 * 60 - hour * 60);
			long sec = (times / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);

			StringBuffer sb = new StringBuffer();
			// sb.append("发表于：");
			if (hour > 0) {
				sb.append(hour + "小时前");
			} else if (min > 0) {
				sb.append(min + "分钟前");
			} else {
				sb.append(sec + "秒前");
			}

			resultTimes = sb.toString();
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return resultTimes;
	}

	/**
	 * 写txt里的单行内容
	 * 
	 * @param filePath
	 *            文件路径
	 * @param content
	 *            写入的内容
	 */
	public static void writeFile(String fileP, String content) {
		String filePath = String.valueOf(Thread.currentThread()
				.getContextClassLoader().getResource(""))
				+ "../../"; // 项目路径
		filePath = (filePath.trim() + fileP.trim()).substring(6).trim();
		if (filePath.indexOf(":") != 1) {
			filePath = File.separator + filePath;
		}
		try {
			OutputStreamWriter write = new OutputStreamWriter(
					new FileOutputStream(filePath), "utf-8");
			BufferedWriter writer = new BufferedWriter(write);
			writer.write(content);
			writer.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 验证邮箱
	 * 
	 * @param email
	 * @return
	 */
	public static boolean checkEmail(String email) {
		boolean flag = false;
		try {
			String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
			Pattern regex = Pattern.compile(check);
			Matcher matcher = regex.matcher(email);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	/**
	 * 验证手机号码
	 * 
	 * @param mobiles
	 * @return
	 */
	public static boolean checkMobileNumber(String mobileNumber) {
		boolean flag = false;
		try {
			Pattern regex = Pattern
					.compile("^(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$");
			Matcher matcher = regex.matcher(mobileNumber);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	/**
	 * 返回两个字符串中按特殊字符分隔的长度
	 * 
	 * @param str1
	 *            :字符串1
	 * @param str2
	 *            :字符串2
	 * @param key
	 *            :分隔字符
	 * @return
	 */
	public static int getStrLength(String str1, String str2, String key) {
		int len = 0;

		if (str1 != null && !"".equals(str1)) {
			try {
				String[] strArr = str1.split(key);

				if (strArr != null) {
					len = strArr.length;
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		if (str2 != null && !"".equals(str2)) {
			try {
				String[] strArr = str2.split(key);

				if (strArr != null) {
					len += strArr.length;
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		return len;
	}
}
