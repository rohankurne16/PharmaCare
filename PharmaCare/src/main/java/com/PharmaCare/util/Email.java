	package com.PharmaCare.util;
	
	import java.util.ArrayList;
	import java.util.Properties;
	
	import com.PharmaCare.bin.Cart;
	
	import jakarta.mail.Authenticator;
	import jakarta.mail.Message;
	import jakarta.mail.MessagingException;
	import jakarta.mail.PasswordAuthentication;
	import jakarta.mail.Session;
	import jakarta.mail.Transport;
	import jakarta.mail.internet.InternetAddress;
	import jakarta.mail.internet.MimeBodyPart;
	import jakarta.mail.internet.MimeMessage;
	import jakarta.mail.internet.MimeMultipart;
	
	public class Email {
		
		 final static String fromEmail = "rohankurne16@gmail.com";
	     final static String password = "cdgupigdeethuham";
		
		 public static String sendForgotPasswordOTP(String toEmail, String userName) {
	
		      
		        String otp = String.valueOf((int)(Math.random() * 900000) + 100000);
	
		        Properties props = new Properties();
		        props.put("mail.smtp.auth", "true");
		        props.put("mail.smtp.starttls.enable", "true");
		        props.put("mail.smtp.host", "smtp.gmail.com");
		        props.put("mail.smtp.port", "587");
		        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
		        Session session = Session.getInstance(props,
		            new Authenticator() {
		                protected PasswordAuthentication getPasswordAuthentication() {
		                    return new PasswordAuthentication(fromEmail, password);
		                }
		            });
	
		        try {
		            Message message = new MimeMessage(session);
		            message.setFrom(new InternetAddress(fromEmail, "PharmaCare"));
		            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
		            message.setSubject("OTP for Password Reset - PharmaCare");
	
		            String htmlContent =
		                "<!DOCTYPE html>" +
		                "<html><head><meta charset='UTF-8'>" +
		                "<style>" +
		                "body{font-family:Arial;background:#f5f5f5;padding:20px;}" +
		                ".box{max-width:500px;margin:auto;background:#fff;padding:30px;border-radius:10px;}" +
		                ".otp{font-size:32px;font-weight:bold;color:#4CAF50;text-align:center;letter-spacing:5px;}" +
		                ".footer{text-align:center;font-size:13px;color:#777;margin-top:20px;}" +
		                "</style></head>" +
		                "<body>" +
		                "<div class='box'>" +
		                "<h2>Password Reset Request</h2>" +
		                "<p>Hello <strong>" + userName + "</strong>,</p>" +
		                "<p>We received a request to reset your ShopEase account password.</p>" +
		                "<p>Your One-Time Password (OTP) is:</p>" +
		                "<div class='otp'>" + otp + "</div>" +
		                "<p>This OTP is valid for <strong>5 minutes</strong>. Please do not share it with anyone.</p>" +
		                "<p>If you did not request this, please ignore this email.</p>" +
		                "<div class='footer'>© 2024 PharmaCare | Cure is Care</div>" +
		                "</div></body></html>";
	
		            MimeMultipart multipart = new MimeMultipart();
		            MimeBodyPart htmlPart = new MimeBodyPart();
		            htmlPart.setContent(htmlContent, "text/html; charset=UTF-8");
		            multipart.addBodyPart(htmlPart);
	
		            message.setContent(multipart);
		            Transport.send(message);
	
		            System.out.println("OTP email sent successfully to: " + toEmail);
		            return otp; // IMPORTANT: return OTP
	
		        } catch (Exception e) {
		            e.printStackTrace();
		            return null;
		        }
		    }
	
		 public static void sendLowStockAlert(String toEmail,String userName, ArrayList<com.PharmaCare.bin.Medicine> lowStockList) {
	
			    if (lowStockList == null || lowStockList.isEmpty()) {
			        return; 
			    }
	
			    Properties props = new Properties();
			    props.put("mail.smtp.auth", "true");
			    props.put("mail.smtp.starttls.enable", "true");
			    props.put("mail.smtp.host", "smtp.gmail.com");
			    props.put("mail.smtp.port", "587");
			    props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
			    Session session = Session.getInstance(props,
			        new Authenticator() {
			            protected PasswordAuthentication getPasswordAuthentication() {
			                return new PasswordAuthentication(fromEmail, password);
			            }
			        });
	
			    try {
			        Message message = new MimeMessage(session);
			        message.setFrom(new InternetAddress(fromEmail, "PharmaCare"));
			        message.setRecipients(Message.RecipientType.TO,
			                InternetAddress.parse(toEmail));
			        message.setSubject("Low Stock Alert - PharmaCare");
	
			        
			        StringBuilder tableRows = new StringBuilder();
			        for (var m : lowStockList) {
			            tableRows.append("<tr>")
			                     .append("<td>").append(m.getMedicine_name()).append("</td>")
			                     .append("<td style='color:red;font-weight:bold;'>")
			                     .append(m.getQuantity())
			                     .append("</td>")
			                     .append("</tr>");
			        }
	
			        String htmlContent =
			            "<!DOCTYPE html>" +
			            "<html><head><meta charset='UTF-8'>" +
			            "<style>" +
			            "body{font-family:Arial;background:#f5f5f5;padding:20px;}" +
			            ".box{max-width:600px;margin:auto;background:#fff;padding:30px;border-radius:10px;}" +
			            "table{width:100%;border-collapse:collapse;margin-top:15px;}" +
			            "th,td{border:1px solid #ddd;padding:10px;text-align:left;}" +
			            "th{background:#f44336;color:#fff;}" +
			            ".footer{text-align:center;font-size:13px;color:#777;margin-top:20px;}" +
			            "</style></head>" +
			            "<body>" +
			            "<div class='box'>" +
			            "<h2>⚠️ Low Medicine Stock Alert</h2>" +
			            "<p>Hello <strong>" + userName + "</strong>,</p>" +
			            "<p>The following medicines are running low in stock:</p>" +
	
			            "<table>" +
			            "<tr><th>Medicine Name</th><th>Quantity Left</th></tr>" +
			            tableRows +
			            "</table>" +
	
			            "<p>Please restock them as soon as possible.</p>" +
			            "<div class='footer'>© 2024 PharmaCare | Cure is Care</div>" +
			            "</div></body></html>";
	
			        MimeMultipart multipart = new MimeMultipart();
			        MimeBodyPart htmlPart = new MimeBodyPart();
			        htmlPart.setContent(htmlContent, "text/html; charset=UTF-8");
			        multipart.addBodyPart(htmlPart);
	
			        message.setContent(multipart);
			        Transport.send(message);
	
			        System.out.println("Low stock alert email sent to: " + toEmail);
	
			    } catch (Exception e) {
			        e.printStackTrace();
			    }
			}
		 
		 public static void sendOutOfStockAlert( String toEmail, String userName, ArrayList<com.PharmaCare.bin.Medicine> outOfStockList) {
	
			    if (outOfStockList == null || outOfStockList.isEmpty()) {
			        return;
			    }
	
			    Properties props = new Properties();
			    props.put("mail.smtp.auth", "true");
			    props.put("mail.smtp.starttls.enable", "true");
			    props.put("mail.smtp.host", "smtp.gmail.com");
			    props.put("mail.smtp.port", "587");
			    props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
			    Session session = Session.getInstance(props,
			        new Authenticator() {
			            protected PasswordAuthentication getPasswordAuthentication() {
			                return new PasswordAuthentication(fromEmail, password);
			            }
			        });
	
			    try {
			        Message message = new MimeMessage(session);
			        message.setFrom(new InternetAddress(fromEmail, "PharmaCare"));
			        message.setRecipients(
			                Message.RecipientType.TO,
			                InternetAddress.parse(toEmail));
			        message.setSubject("OUT OF STOCK Alert - PharmaCare");
	
			      
			        StringBuilder tableRows = new StringBuilder();
			        for (var m : outOfStockList) {
			            tableRows.append("<tr>")
			                     .append("<td>").append(m.getMedicine_name()).append("</td>")
			                     .append("<td style='color:#d32f2f;font-weight:bold;'>")
			                     .append("OUT OF STOCK")
			                     .append("</td>")
			                     .append("</tr>");
			        }
	
			        String htmlContent =
			            "<!DOCTYPE html>" +
			            "<html><head><meta charset='UTF-8'>" +
			            "<style>" +
			            "body{font-family:Arial;background:#f5f5f5;padding:20px;}" +
			            ".box{max-width:600px;margin:auto;background:#fff;padding:30px;border-radius:10px;}" +
			            "table{width:100%;border-collapse:collapse;margin-top:15px;}" +
			            "th,td{border:1px solid #ddd;padding:10px;text-align:left;}" +
			            "th{background:#d32f2f;color:#fff;}" +
			            ".footer{text-align:center;font-size:13px;color:#777;margin-top:20px;}" +
			            "</style></head>" +
			            "<body>" +
			            "<div class='box'>" +
			            "<h2>🚨 Medicine Out of Stock Alert</h2>" +
			            "<p>Hello <strong>" + userName + "</strong>,</p>" +
			            "<p>The following medicines are currently <strong>OUT OF STOCK</strong>:</p>" +
	
			            "<table>" +
			            "<tr><th>Medicine Name</th><th>Status</th></tr>" +
			            tableRows +
			            "</table>" +
	
			            "<p style='color:#d32f2f;font-weight:bold;'>Immediate restocking is required.</p>" +
			            "<div class='footer'>© 2024 PharmaCare | Cure is Care</div>" +
			            "</div></body></html>";
	
			        MimeMultipart multipart = new MimeMultipart();
			        MimeBodyPart htmlPart = new MimeBodyPart();
			        htmlPart.setContent(htmlContent, "text/html; charset=UTF-8");
			        multipart.addBodyPart(htmlPart);
	
			        message.setContent(multipart);
			        Transport.send(message);
	
			        System.out.println("Out of stock alert email sent to: " + toEmail);
	
			    } catch (Exception e) {
			        e.printStackTrace();
			    }
			}
	
		 public static void sendOrderReceipt(String toEmail, String retailerName,
			        ArrayList<com.PharmaCare.bin.Cart> cartList) {
	
			    if (cartList == null || cartList.isEmpty()) return;
	
			    // ===== MEDICAL DETAILS =====
			    String medicalName = "PharmaCare Medico Store";
			    String medicalAddress = "Ambedare, Satara, Maharashtra";
			    String Medicalownername = " Rohan Kurne";
			    String medicalContact = "+91 7058094949";
			    String orderDate = java.time.LocalDate.now().toString();
			    String orderTime = java.time.LocalTime.now().withNano(0).toString();
	
			    // ===== BUILD TABLE ROWS =====
			    StringBuilder tableRows = new StringBuilder();
			    int totalQty = 0;
	
			    for (Cart c : cartList) {
			        tableRows.append("<tr>")
			                 .append("<td style='border:1px solid #ddd;padding:8px;'>")
			                 .append(c.getMedicineName()).append("</td>")
			                 .append("<td style='border:1px solid #ddd;padding:8px;'>")
			                 .append(c.getBrand()).append("</td>")
			                 .append("<td style='border:1px solid #ddd;padding:8px;text-align:center;'>")
			                 .append(c.getQuantity()).append("</td>")
			                 .append("</tr>");
			        totalQty += c.getQuantity();
			    }
	
			    // ===== HTML CONTENT (GMAIL SAFE) =====
			    String htmlContent = 
			    	    "<html>" +
			    	    "<head>" +
			    	    "    <meta charset='UTF-8'>" +
			    	    "    <style>" +
			    	    "        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');" +
			    	    "        body { font-family: 'Poppins', Arial, sans-serif; background: #f0f7ff; padding: 30px; margin: 0; line-height: 1.6; }" +
			    	    "        .receipt-container { max-width: 800px; margin: 0 auto; background: white; border-radius: 20px; overflow: hidden; box-shadow: 0 15px 40px rgba(26, 115, 232, 0.15); }" +
			    	    "        .header { background: linear-gradient(135deg, #1a73e8 0%, #0d47a1 100%); color: white; padding: 35px 40px; position: relative; }" +
			    	    "        .header::after { content: ''; position: absolute; bottom: -20px; left: 0; right: 0; height: 20px; background: linear-gradient(to bottom, rgba(26, 115, 232, 0.3), transparent); }" +
			    	    "        .medical-logo { display: flex; align-items: center; gap: 20px; margin-bottom: 20px; }" +
			    	    "        .logo-circle { width: 70px; height: 70px; background: rgba(255, 255, 255, 0.2); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 30px; }" +
			    	    "        .medical-info h1 { font-size: 32px; margin: 0; font-weight: 700; letter-spacing: -0.5px; }" +
			    	    "        .medical-info .tagline { font-size: 16px; opacity: 0.9; margin-top: 5px; }" +
			    	    "        .receipt-title { text-align: center; margin-top: 10px; }" +
			    	    "        .receipt-title h2 { font-size: 24px; margin: 0; font-weight: 600; }" +
			    	    "        .receipt-title .badge { display: inline-block; background: rgba(255, 255, 255, 0.2); padding: 5px 15px; border-radius: 20px; font-size: 14px; margin-top: 10px; }" +
			    	    "        .content { padding: 40px; }" +
			    	    "        .order-info { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 25px; background: #f8fbff; padding: 25px; border-radius: 15px; margin-bottom: 35px; border: 2px solid #e8f0fe; }" +
			    	    "        .info-box h3 { font-size: 13px; color: #5f6368; margin: 0 0 8px 0; text-transform: uppercase; letter-spacing: 1px; }" +
			    	    "        .info-box p { font-size: 18px; color: #202124; margin: 0; font-weight: 600; }" +
			    	    "        .retailer-box { background: #e8f0fe; border-left: 5px solid #1a73e8; padding: 20px; border-radius: 10px; margin-bottom: 30px; }" +
			    	    "        .retailer-box h3 { color: #1a73e8; margin: 0 0 10px 0; font-size: 18px; }" +
			    	    "        .retailer-box p { margin: 0; color: #202124; font-size: 20px; font-weight: 700; }" +
			    	    "        .medicines-table { width: 100%; border-collapse: collapse; margin: 30px 0; }" +
			    	    "        .medicines-table thead { background: linear-gradient(to right, #1a73e8, #0d47a1); color: white; }" +
			    	    "        .medicines-table th { padding: 18px 15px; text-align: left; font-weight: 600; font-size: 15px; border: none; }" +
			    	    "        .medicines-table tbody tr { border-bottom: 1px solid #e8f0fe; transition: background 0.3s; }" +
			    	    "        .medicines-table tbody tr:hover { background: #f8fbff; }" +
			    	    "        .medicines-table td { padding: 18px 15px; color: #202124; font-size: 15px; }" +
			    	    "        .medicines-table .medicine-name { font-weight: 600; color: #1a73e8; }" +
			    	    "        .medicines-table .quantity-cell { text-align: center; }" +
			    	    "        .medicines-table .quantity-badge { display: inline-block; background: #e8f0fe; color: #1a73e8; padding: 6px 15px; border-radius: 20px; font-weight: 700; font-size: 14px; }" +
			    	    "        .summary-box { background: linear-gradient(135deg, #f8fbff 0%, #e8f0fe 100%); padding: 25px; border-radius: 15px; margin: 30px 0; border: 2px solid #1a73e8; }" +
			    	    "        .summary-box h3 { color: #1a73e8; margin: 0 0 15px 0; font-size: 20px; display: flex; align-items: center; gap: 10px; }" +
			    	    "        .summary-box h3 i { font-size: 24px; }" +
			    	    "        .total-quantity { font-size: 48px; font-weight: 800; color: #0d47a1; margin: 0; text-align: center; }" +
			    	    "        .urgent-notice { background: #fff8e1; border-left: 5px solid #f9a825; padding: 20px; border-radius: 10px; margin: 25px 0; display: flex; align-items: center; gap: 15px; }" +
			    	    "        .urgent-notice i { color: #f9a825; font-size: 24px; }" +
			    	    "        .urgent-notice p { margin: 0; color: #5f6368; font-weight: 500; }" +
			    	    "        .footer { background: linear-gradient(135deg, #1a73e8 0%, #0d47a1 100%); color: white; padding: 40px; text-align: center; position: relative; }" +
			    	    "        .footer::before { content: ''; position: absolute; top: -20px; left: 0; right: 0; height: 20px; background: linear-gradient(to top, rgba(26, 115, 232, 0.3), transparent); }" +
			    	    "        .footer-content { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 30px; text-align: left; }" +
			    	    "        .footer-section h4 { font-size: 16px; margin: 0 0 15px 0; color: rgba(255, 255, 255, 0.9); font-weight: 600; text-transform: uppercase; letter-spacing: 1px; }" +
			    	    "        .footer-section p { margin: 8px 0; font-size: 15px; color: rgba(255, 255, 255, 0.8); }" +
			    	    "        .footer-section .icon-text { display: flex; align-items: center; gap: 10px; margin: 12px 0; }" +
			    	    "        .footer-section i { width: 20px; text-align: center; color: rgba(255, 255, 255, 0.9); }" +
			    	    "        .watermark { position: absolute; bottom: 20px; right: 20px; opacity: 0.1; font-size: 120px; font-weight: 900; color: white; }" +
			    	    "        .receipt-id { position: absolute; top: 20px; right: 20px; background: rgba(255, 255, 255, 0.2); padding: 8px 15px; border-radius: 20px; font-size: 13px; }" +
			    	    "        .print-date { text-align: center; margin-top: 20px; color: #5f6368; font-size: 14px; }" +
			    	    "         .print-date p { text-align: center; margin-top: 20px; color: white; font-size: 14px; }" +
			    	    "    </style>" +
			    	    "</head>" +
			    	    "<body>" +
			    	    "    <div class='receipt-container'>" +
			    	    
			    	    "        <!-- HEADER SECTION -->" +
			    	    "        <div class='header'>" +
			    	   
			    	    "            <div class='medical-logo'>" +
			    	    "                <div class='logo-circle'>" +
			    	    "                    <i class='fas fa-pills'></i>" +
			    	    "                </div>" +
			    	    "                <div class='medical-info'>" +
			    	    "                    <h1>" + medicalName + "</h1>" +
			    	    "                    <div class='tagline'>Professional Healthcare Services</div>" +
			    	    "                </div>" +
			    	    "            </div>" +
			    	    "            <div class='receipt-title'>" +
			    	    "                <h2>MEDICINE PURCHASE ORDER</h2>" +
			    	    "                <div class='badge'>Order Confirmation Receipt</div>" +
			    	    "            </div>" +
			    	    "        </div>" +
			    	    
			    	    "        <!-- CONTENT SECTION -->" +
			    	    "        <div class='content'>" +
			    	    
			    	    "            <!-- Order Information -->" +
			    	    "            <div class='order-info'>" +
			    	    "                <div class='info-box'>" +
			    	    "                    <h3>Order Date</h3>" +
			    	    "                    <p>" + orderDate + "</p>" +
			    	    "                </div>" +
			    	    "                <div class='info-box'>" +
			    	    "                    <h3>Order Time</h3>" +
			    	    "                    <p>" + orderTime + "</p>" +
			    	    "                </div>" +
			    	    "                <div class='info-box'>" +
			    	    "                    <h3>Delivery Type</h3>" +
			    	    "                    <p>Urgent Delivery</p>" +
			    	    "                </div>" +
			    	    "            </div>" +
			    	    
			    	    "            <!-- Retailer Information -->" +
			    	    "            <div class='retailer-box'>" +
			    	    "                <h3>TO BE DELIVERED TO</h3>" +
			    	    "                <p>" + retailerName + "</p>" +
			    	    "            </div>" +
			    	    
			    	    "            <!-- Medicines Table -->" +
			    	    "            <h3 style='color: #1a73e8; margin-bottom: 20px; font-size: 20px; display: flex; align-items: center; gap: 10px;'>" +
			    	    "                <i class='fas fa-prescription-bottle-alt'></i> Ordered Medicines" +
			    	    "            </h3>" +
			    	    "            <table class='medicines-table'>" +
			    	    "                <thead>" +
			    	    "                    <tr>" +
			    	    "                        <th style='width: 45%;'>Medicine Name</th>" +
			    	    "                        <th style='width: 35%;'>Brand</th>" +
			    	    "                        <th style='width: 20%;' class='quantity-cell'>Quantity</th>" +
			    	    "                    </tr>" +
			    	    "                </thead>" +
			    	    "                <tbody>" +
			    	    tableRows +
			    	    "                </tbody>" +
			    	    "            </table>" +
			    	    
			    	    "            <!-- Summary Box -->" +
			    	    "            <div class='summary-box'>" +
			    	    "                <h3><i class='fas fa-clipboard-check'></i> Order Summary</h3>" +
			    	    "                <p class='total-quantity'>" + totalQty + " Units</p>" +
			    	    "                <p style='text-align: center; color: #5f6368; margin-top: 10px;'>Total quantity of medicines ordered</p>" +
			    	    "            </div>" +
			    	    
			    	    "            <!-- Urgent Notice -->" +
			    	    "            <div class='urgent-notice'>" +
			    	    "                <i class='fas fa-exclamation-circle'></i>" +
			    	    "                <p><b>Important:</b> Please deliver all medicines at the earliest. Ensure medicines are properly packed and within expiry date. Contact us immediately if there are any supply issues.</p>" +
			    	    "            </div>" +
			    	    
			    	    "        </div>" +
			    	    
			    	    "        <!-- FOOTER SECTION (Medical Information) -->" +
			    	    "        <div class='footer'>" +
			    	    "            <div class='watermark'>" + medicalName + "</div>" +
			    	    "            <div class='footer-content'>" +
			    	    "                <div class='footer-section'>" +
			    	    "                    <h4>Medical Information</h4>" +
			    	    "                    <div class='icon-text'>" +
			    	    "                        <i class='fas fa-hospital'></i>" +
			    	    "                        <p><b>" + medicalName + "</b></p>" +
			    	    "                    </div>" +
			    	    "                    <div class='icon-text'>" +
			    	    "                        <i class='fas fa-user-md'></i>" +
			    	    "                        <p>Proprietor: " + Medicalownername + "</p>" +
			    	    "                    </div>" +
			    	    "                </div>" +
			    	    "                <div class='footer-section'>" +
			    	    "                    <h4>Contact Details</h4>" +
			    	    "                    <div class='icon-text'>" +
			    	    "                        <i class='fas fa-map-marker-alt'></i>" +
			    	    "                        <p>" + medicalAddress + "</p>" +
			    	    "                    </div>" +
			    	    "                    <div class='icon-text'>" +
			    	    "                        <i class='fas fa-phone'></i>" +
			    	    "                        <p>" + medicalContact + "</p>" +
			    	    "                    </div>" +
			    	    "                    <div class='icon-text'>" +
			    	    "                        <i class='fas fa-envelope'></i>" +
			    	    "                        <p>pharmacy@" + medicalName.toLowerCase().replaceAll("\\s+", "") + ".com</p>" +
			    	    "                    </div>" +
			    	    "                </div>" +
			    	    "                <div class='footer-section'>" +
			    	    "                    <h4>Business Hours</h4>" +
			    	    "                    <div class='icon-text'>" +
			    	    "                        <i class='fas fa-clock'></i>" +
			    	    "                        <p>Mon - Sat: 8:00 AM - 10:00 PM</p>" +
			    	    "                    </div>" +
			    	    "                    <div class='icon-text'>" +
			    	    "                        <i class='fas fa-clock'></i>" +
			    	    "                        <p>Sunday: 9:00 AM - 9:00 PM</p>" +
			    	    "                    </div>" +
			    	    "                    <p style='margin-top: 15px;'>24/7 Emergency Service Available</p>" +
			    	    "                </div>" +
			    	    "            </div>" +
			    	    "            <div class='print-date'>" +
			    	    "                <p>Receipt generated on " + new java.util.Date() + "</p>" +
			    	    "            </div>" +
			    	    "        </div>" +
			    	    
			    	    "    </div>" +
			    	    "    <script src='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js'></script>" +
			    	    "</body>" +
			    	    "</html>";
	
			    // ===== EMAIL CONFIG =====
			    Properties props = new Properties();
			    props.put("mail.smtp.auth", "true");
			    props.put("mail.smtp.starttls.enable", "true");
			    props.put("mail.smtp.host", "smtp.gmail.com");
			    props.put("mail.smtp.port", "587");
	
			    Session session = Session.getInstance(props, new Authenticator() {
			        protected PasswordAuthentication getPasswordAuthentication() {
			            return new PasswordAuthentication(fromEmail, password);
			        }
			    });
	
			    try {
			        Message message = new MimeMessage(session);
			        message.setFrom(new InternetAddress(fromEmail, "PharmaCare"));
			        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			        message.setSubject("Medicine Order from " + medicalName);
	
			        message.setContent(htmlContent, "text/html; charset=UTF-8");
			        Transport.send(message);
	
			        System.out.println("Order email sent successfully");
	
			    } catch (Exception e) {
			        e.printStackTrace();
			    }
			}
		 
		 public static void sendExpiryAlert(String to, String subject, String body) {

		       

		        Properties props = new Properties();
		        props.put("mail.smtp.auth", "true");
		        props.put("mail.smtp.starttls.enable", "true");
		        props.put("mail.smtp.host", "smtp.gmail.com");
		        props.put("mail.smtp.port", "587");

		        Session session = Session.getInstance(props,
		            new Authenticator() {
		                protected PasswordAuthentication getPasswordAuthentication() {
		                    return new PasswordAuthentication(fromEmail, password);
		                }
		            });

		        try {
		            Message message = new MimeMessage(session);
		            message.setFrom(new InternetAddress(fromEmail));
		            message.setRecipients(
		                Message.RecipientType.TO,
		                InternetAddress.parse(to)
		            );
		            message.setSubject(subject);
		            message.setText(body);

		            Transport.send(message);
		            System.out.println("Expiry mail sent!");

		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    }
	
	
	}
