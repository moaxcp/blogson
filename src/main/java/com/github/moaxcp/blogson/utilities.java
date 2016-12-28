package com.github.moaxcp.blogson;

import java.awt.*;
import java.util.*;
import java.awt.image.*;
import java.sql.*;

public class utilities {

    public static String filterForSQL(String input) {
        StringBuffer filtered = new StringBuffer(input.length());
        char c;

        for (int i = 0; i < input.length(); i++) {

            c = input.charAt(i);

            if (c == '\'') {
                filtered.append("\'\'");
            } else if (c == '\\') {
                filtered.append("\\\\");
            } else {
                filtered.append(c);
            }
        }
        return filtered.toString();
    }

    public static String filterHTML(String input) {
        StringBuffer filtered = new StringBuffer(input.length());
        char c;

        for (int i = 0; i < input.length(); i++) {

            c = input.charAt(i);

            if (c == '<') {
                filtered.append("&lt;");
            } else if (c == '>') {
                filtered.append("&gt;");
            } else if (c == '=') {
                filtered.append("&#61;");
            } else if (c == '&') {
                filtered.append("&amp;");
            } else {
                filtered.append(c);
            }
        }
        return filterForSQL(filtered.toString());
    }

    public static String addWhitespaceForHTML(String input) {
        StringBuffer filtered = new StringBuffer(input.length());
        char c;

        for (int i = 0; i < input.length(); i++) {

            c = input.charAt(i);

            if (c == '\n') {
                if (i + 1 < input.length()) {
                    if (input.charAt(i + 1) == '\r') {
                        i++;
                    }
                }
                filtered.append("<br>");
            } else if (c == '\r') {
                if (i + 1 < input.length()) {
                    if (input.charAt(i + 1) == '\n') {
                        i++;
                    }
                }
                filtered.append("<br>");
            } else {
                filtered.append(c);
            }
        }
        return filtered.toString();
    }

    public static String makeRightSize(String input, int sz) {

        return input.substring(0, sz);
    }

    public static String getDayOfWeek(int d) {
        if (d == 0) {
            return "Sun";
        } else if (d == 1) {
            return "Mon";
        } else if (d == 2) {
            return "Tue";
        } else if (d == 3) {
            return "Wed";
        } else if (d == 4) {
            return "Thu";
        } else if (d == 5) {
            return "Fri";
        } else if (d == 6) {
            return "Sat";
        } else {
            return "asdf";
        }
    }

    public static String getZeros(int d) {
        if (d < 10) {
            return "0" + d;
        } else {
            return "" + d;
        }
    }

    public static String getMonthOfYear(int m) {
        if (m == 0) {
            return "Jan";
        } else if (m == 1) {
            return "Feb";
        } else if (m == 2) {
            return "Mar";
        } else if (m == 3) {
            return "Apr";
        } else if (m == 4) {
            return "May";
        } else if (m == 5) {
            return "Jun";
        } else if (m == 6) {
            return "Jul";
        } else if (m == 7) {
            return "Aug";
        } else if (m == 8) {
            return "Sep";
        } else if (m == 9) {
            return "Oct";
        } else if (m == 10) {
            return "Nov";
        } else if (m == 11) {
            return "Dec";
        } else {
            return "asdf";
        }
    }
    /*
    public static String filter(boolean html = true, boolean sql = true, boolean addWS = false, int size = 250000, String input)  {
    if(html)
    input = filterHTML(input);
    if(sql)
    input = filterForSQL(input);
    if(addWS)
    input = addWhitespaceForHTML(input);
    if(size > 0)
    input = makeRightSize(input, size);
    
    return input;
    }
     */

    public static BufferedImage getEmailPic(String uname) throws Exception {

        System.setProperty("java.awt.headless", "true");

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        String driver = "org.postgresql.Driver";
        String url = "jdbc:postgresql://localhost/blogson";
        String username = "john";
        String password = "lemonhead8849";
        String dbPrefix = "blogson_";

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, username, password);
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery("select email from " + dbPrefix + "member where uname = '" + uname + "'");
            System.out.println("email " + uname);
        } catch (Exception ex) {
            throw ex;
        }

        String emailAddress = new String();

        if (rs.first()) {
            emailAddress = rs.getString("email");
        } else {
            throw new Exception("Could not find email for uname: " + uname);
        }

        int width = 255;
        int height = 60;

        Random random = new Random();
        Font emailFont = new Font("SansSerif", Font.PLAIN, 12);
        BufferedImage emailImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D emailGraphics = emailImage.createGraphics();
        emailGraphics.setFont(emailFont);

        FontMetrics emailMetrics = emailGraphics.getFontMetrics();
        width = emailMetrics.stringWidth(emailAddress);
        height = emailMetrics.getHeight();

        emailImage = new BufferedImage(width + 6, height + 6, BufferedImage.TYPE_INT_RGB);
        emailGraphics = emailImage.createGraphics();

        Color color1 = new Color(random.nextInt(127), random.nextInt(127), random.nextInt(127));
        Color color2 = color1.darker();

        emailGraphics.setColor(color2);
        emailGraphics.fillRect(0, 0, emailImage.getWidth(), emailImage.getHeight());
        emailGraphics.setColor(Color.white);
        emailGraphics.drawString(emailAddress, 3, height);

        return emailImage;
    }
}
