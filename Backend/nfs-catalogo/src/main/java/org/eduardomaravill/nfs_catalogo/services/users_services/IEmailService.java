package org.eduardomaravill.nfs_catalogo.services.users_services;

import org.eduardomaravill.nfs_catalogo.dtos.auth.ContactFormRequest;
import org.eduardomaravill.nfs_catalogo.models.users_models.User;

public interface IEmailService {
    void sendEmailVerification(User user, String jwtToken);

    void sendEmailPasswordReset(User user, String jwtToken);

    void sendEmailWelcome(User user);

    void  sendEmailResetPasswordSuccess(User user);

    void sendContactEmail(ContactFormRequest contactFormRequest);
}