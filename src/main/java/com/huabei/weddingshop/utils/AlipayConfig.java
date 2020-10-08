package com.huabei.weddingshop.utils;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2021000120605370";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCNM7wAYMmi5FkXaUYxpRF56C+CuB6rh1iaDIS5/4B/Tx2r6TiyTe1zsfdfhEMJtUEJ1Vl3+usHMJl1SM5p+3IlxGcFq315xorJjQ3nFnjpKUc37IZtl5B0krn8eIl35nQTjpJn5MLHqZaxMYB8dvdt2wg7elnXzy6mQ1CP2fEIK3KR1siNM8Tcu/wgKlQ+dFQqIz7gM2EyQVz5mrQ2P9cYl+KEvV5OeRDXQzOOeIiUMEiFFmko8jqiK6oiLEnT+XDVpiNnE7CSXZpo5U5wGhwZ0+DFOwOY+JXlni6trINZITdgzwtt2YdR3SBeVxtGEFJaKPf+sQ4gbDtO68PlomEVAgMBAAECggEAUJ7oSeL5Xcs5XxeZn4DbMJq0fdN4l4FowlRBeB19FbNrgptf5tZ9rGBBmMTgretSnjW1pr6acPl7tS6DxJlvvEaed+tJcj09QwUJmhcHpEEQS8r9mhc+wICCNrfv7YikYAI4b5964xteUf+sl+QpNA0qbyNVptXBkea/WdMbPwkORbRcmMS3vpzZiWKLvkZA19ZIC6ayOmFO7rXCeUUm9x6CsoaqU2FSuHZ1f2qtUne+wObBBhG3fAe8943LQABgbU0wlDKNbF7UovM15KJ2LSE0+XJ3hlBmYo5vG4hzxXoB1uKNIjQfufE4ojCk4AmuWjtUbrAnpNVrG5g5Mv86ZQKBgQDG3Q2RkTTDn8F00YuuEJKpojHrBQM8AvkaCu3NHvAo1aufC8r5MOYKZhqP1urkWTSGK4JTr6TDz8l+RwfWmmBdeUP9g8Ith180IbS8Jwfzo2BZkLULZebnESZnpQD49NOXMfa4b/Tm8hvv44qI+tdI4YUZkWqUiUg9NFTowrZjKwKBgQC1xYeOLXwm4Kf3CHsNXrV7uKOkzfxgep3YhTd2Efh8Id5erj09zCScQ6ey96nLvR709yBoxQaFfBkAiLRhudmn6w63p+1LTmTX3/sSiUTD+LWyqFUPa7y92qPdtOZMt3gmZHAvACfkW2WiGz4lVRPYH9/iYY8IddmGHJdwXgksvwKBgQCZ0wfZ395Wq86zFBvdywgHm2TNjJUR6KLTWDzV++Z9T7pvTmn1E7P9uzk0pmQPukj8t88Z+LWUmbgcq8kOYV/FLjY/dZnQKfSkmKX7HJ30Ah5Xaa4BYROZDRUN+v6jlI3PWGCmDkP8GK8vgmz4xD+fKoMQYgF1YDO21DIR0fvO/QKBgHNz5SefKE4hP04eqtnRIABXREl3NCerefp+kr2BqIxfjrggf3Fy6oX+StPXjpeDpdf95y3khsHeEptOORQhUWfgWta36HZ+cnrTHsulOHIo1G+Hj49d5OHJr28waV6s4bmw7bhMpwnaK3GNUCmyIgqSJEfLo2fCQsl1+5I5iCZNAoGBAIVkC7BwYuUIojbKQv5gueNH/tDss9rYPFm/SH5/V9u8Kf6zCfpVkMI9az+OABy5fAPR9bVWoSQ+r9gm0kkmocioSiQnC/7stmqttY8RoUzC4zMhlhwDVgk09jLMMcmF/as/98MAtCmEd2bRipn7IGM8fX/15kvjVp979oiZyUCK";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzfTZAMG9D+IxAnLVfmZ+QseiSuVwJQNNwR1DVmbJoOzEWQ+MTi1uRDQaFCTWY4V4Ypti9zAsRAIvGbg8GjH8omPKN1+AWZo7XMvJqSUoojFLtXu8lSF+gdyBKJQ7HcArI6YrEP7aWZb9Sx0vz0mX0VMADCeHrD1fTEMXyhV9oBDf5sbO6nl+iWpNrIcY71yP2kNrsaLJRKQMaWhIkx74JtD35Ge3kewQkkf5WTzZ8cc8M9TC3eDxZp7obQLC6WklrXEoa6jJmhUg37N39pHN8xdCr8G6ybeq041fNFUNajFzkyxHUfsG2xuAR1jaGTryhe+T9QaeyFIT2ItljHrYFwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://easyin.free.idcfengye.com/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://easyin.free.idcfengye.com/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

