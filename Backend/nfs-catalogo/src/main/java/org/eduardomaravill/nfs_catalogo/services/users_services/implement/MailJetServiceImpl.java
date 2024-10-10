package org.eduardomaravill.nfs_catalogo.services.users_services.implement;

import org.eduardomaravill.nfs_catalogo.models.users_models.User;
import org.eduardomaravill.nfs_catalogo.services.users_services.IEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

@Service
public class MailJetServiceImpl implements IEmailService {


    private final String mjApiPublicKey;

    private  final String mjApiPrivateKey;

    private final TemplateEngine templateEngine;



    @Autowired
    public MailJetServiceImpl(@Value("${mj.api.public.key}") String mjApiPublicKey, @Value("${mj.api.private.key}") String mjApiPrivateKey, TemplateEngine templateEngine) {
        this.mjApiPublicKey = mjApiPublicKey;
        this.mjApiPrivateKey = mjApiPrivateKey;
        this.templateEngine = templateEngine;
    }

    @Override
    public void sendEmailVerification(User user) {

    }

    @Override
    public void sendEmailPasswordReset(User user) {

    }

    @Override
    public void sendEmailWelcome(User user) {

    }


    private String loadHtmlBodyVerifyEmail(User user,String token){
        Context context = new Context();
        context.setVariable("username", user.getUsername());
        context.setVariable("token", token);
        return templateEngine.process("emailVerification.html",context);
    }

    private String loadHtmlBodyWelcome(User user) {
        Context context = new Context();
        context.setVariable("username", user.getUsername());
        return templateEngine.process("emailWelcome.html", context);
    }
}
