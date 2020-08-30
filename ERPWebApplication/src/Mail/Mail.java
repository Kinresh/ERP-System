package Mail;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author admin
 */
public class Mail {
     private static final String SMTP_HOST_NAME = "smtp.gmail.com";
    private static final int SMTP_HOST_PORT = 465;
    private static final String SMTP_AUTH_USER = "dreamsejal54@gmail.com";
    private static final String SMTP_AUTH_PWD = "siyasejal";

    public boolean mailstatus;

    public void sendmail(String to,String subject,String msg) throws javax.mail.NoSuchProviderException
    {
       
        Properties props = new Properties();

        props.put("mail.transport.protocol", "smtps");
        props.put("mail.smtps.host", SMTP_HOST_NAME);
        props.put("mail.smtps.auth", "true");
        // props.put("mail.smtps.quitwait", "false");

        Session mailSession = Session.getDefaultInstance(props);
        mailSession.setDebug(true);
        Transport transport;
        try {
            transport = mailSession.getTransport();

            MimeMessage message = new MimeMessage(mailSession);
            try {
                message.setSubject(subject);

                message.setContent(msg, "text/plain");
                
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                transport.connect(SMTP_HOST_NAME, SMTP_HOST_PORT, SMTP_AUTH_USER, SMTP_AUTH_PWD);

                transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
                transport.close();
                mailstatus=true;
            } catch (MessagingException ex) {
                Logger.getLogger(Mail.class.getName()).log(Level.SEVERE, null, ex);
                mailstatus=false;
            }
        } catch (NoSuchProviderException ex) {
            Logger.getLogger(Mail.class.getName()).log(Level.SEVERE, null, ex);
            mailstatus=false;
        }
    }

  
}


