package org.eduardomaravill.nfs_catalogo.services.users_services.implement;

import com.mailjet.client.MailjetClient;
import com.mailjet.client.transactional.SendContact;
import com.mailjet.client.transactional.SendEmailsRequest;
import com.mailjet.client.transactional.TrackOpens;
import com.mailjet.client.transactional.TransactionalEmail;
import com.mailjet.client.transactional.response.SendEmailsResponse;
import com.mailjet.client.transactional.response.SentMessageStatus;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.EmailResponse;
import org.eduardomaravill.nfs_catalogo.exceptions.InvalidEmailException;
import org.eduardomaravill.nfs_catalogo.models.users_models.User;
import org.eduardomaravill.nfs_catalogo.services.users_services.IEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class MailJetServiceImpl implements IEmailService {

    @Value("${mj.email.username}")
    private String username;

    private final TemplateEngine templateEngine;

    private final MailjetClient mailjetClient;

    @Autowired
    public MailJetServiceImpl(TemplateEngine templateEngine, MailjetClient mailjetClient) {
        this.templateEngine = templateEngine;
        this.mailjetClient = mailjetClient;
    }

    @Override
    public void sendEmailVerification(User user, String jwtToken) {
        EmailResponse emailResponse = new EmailResponse();
        List<SendContact> to = new ArrayList<>();
        to.add(new SendContact(user.getEmail(),user.getName()));
        emailResponse.setTo(to);
        emailResponse.setCc(Collections.emptyList());
        emailResponse.setBcc(Collections.emptyList());
        emailResponse.setFrom(new SendContact(username,"NFS-CATALOG"));
        emailResponse.setBody(loadHtmlBodyVerifyEmail(user.getUsername(),jwtToken));
        emailResponse.setSubject("Verification email");
        sendEmail(emailResponse);
    }

    @Override
    public void sendEmailPasswordReset(User user, String jwtToken) {
        EmailResponse emailResponse = new EmailResponse();
        List<SendContact> to = new ArrayList<>();
        to.add(new SendContact(user.getEmail(),user.getName()));
        emailResponse.setTo(to);
        emailResponse.setCc(Collections.emptyList());
        emailResponse.setBcc(Collections.emptyList());
        emailResponse.setFrom(new SendContact(username,"NFS-CATALOG"));
        emailResponse.setBody(loadHtmlBodyResetPassword(user.getUsername(),jwtToken));
        emailResponse.setSubject("Password reset email");
        sendEmail(emailResponse);

    }

    @Override
    public void sendEmailWelcome(User user) {
        EmailResponse emailResponse = new EmailResponse();
        List<SendContact> to = new ArrayList<>();
        to.add(new SendContact(user.getEmail(),user.getName()));
        emailResponse.setTo(to);
        emailResponse.setCc(Collections.emptyList());
        emailResponse.setBcc(Collections.emptyList());
        emailResponse.setFrom(new SendContact(username,"NFS-CATALOG"));
        emailResponse.setBody(loadHtmlBodyWelcome(user.getName()));
        emailResponse.setSubject("Welcome to NFS-CATALOG");
        sendEmail(emailResponse);
    }

    private void sendEmail(EmailResponse emailResponse) {
        TransactionalEmail message = TransactionalEmail
                .builder()
                .to(emailResponse.getTo())
                .from(emailResponse.getFrom())
                .htmlPart(emailResponse.getBody())
                .subject(emailResponse.getSubject())
                .cc(emailResponse.getCc())
                .bcc(emailResponse.getBcc())
                .trackOpens(TrackOpens.ENABLED)
                .build();

        SendEmailsRequest request = SendEmailsRequest
                .builder()
                .message(message)
                .build();
        try {
            SendEmailsResponse response = request.sendWith(mailjetClient);

            if (response.getMessages()[0].getStatus() != SentMessageStatus.SUCCESS) {
                throw new InvalidEmailException("Error sending email");
            }
        } catch (Exception e) {
            throw new InvalidEmailException(e.getLocalizedMessage());
        }
    }


    private String loadHtmlBodyVerifyEmail(String username, String token) {
        Context context = new Context();
        context.setVariable("username", username);
        context.setVariable("token", token);
        return templateEngine.process("emailVerification.html", context);
    }

    private String loadHtmlBodyWelcome(String username) {
        Context context = new Context();
        context.setVariable("username", username);
        return templateEngine.process("emailWelcome.html", context);
    }

    private String loadHtmlBodyResetPassword(String username, String token) {
        Context context = new Context();
        context.setVariable("username", username);
        context.setVariable("token", token);
        return templateEngine.process("emailResetPassword.html", context);
    }
}
