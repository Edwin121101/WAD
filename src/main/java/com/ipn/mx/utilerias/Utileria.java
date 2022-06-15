package com.ipn.mx.utilerias;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Edwin VD
 */
public class Utileria {

    public void enviarMail(String correoDestinatario, String asunto, String textoCorreo) {
        try {
            // Propiedades de la conexión
            Properties props = new Properties();
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.port", "587");

            // Inicializar la Sesion  la sesion
            Session session = Session.getDefaultInstance(props);
            // el mensaje
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(
                    Message.RecipientType.TO,
                    new InternetAddress(correoDestinatario)
            );
            message.addRecipient(
                    Message.RecipientType.BCC,
                    new InternetAddress(correoDestinatario)
            );
            //CC A quien s ele envia una copia 
            //BCC A quien s ele envia una copia Oculta
            message.setSubject(asunto);
            message.setText(textoCorreo);
            // envio MEnsaje.
            Transport trasporte = session.getTransport("smtp");
            trasporte.connect("edwinvd11@gmail.com", "v1ll3g4s.12");
            trasporte.sendMessage(message, message.getAllRecipients());
            // Cierre.
            trasporte.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Utileria u = new Utileria();
        u.enviarMail("edwinvillegas489@gmail.com", "¿A poco sí?", "Prueba, de envío de correo");
    }
}
