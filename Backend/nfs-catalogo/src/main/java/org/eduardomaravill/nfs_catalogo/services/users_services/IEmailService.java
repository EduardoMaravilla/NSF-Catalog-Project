package org.eduardomaravill.nfs_catalogo.services.users_services;

import org.eduardomaravill.nfs_catalogo.models.users_models.User;

public interface IEmailService {
    void sendEmailVerification(User user);

    void sendEmailPasswordReset(User user);

    void sendEmailWelcome(User user);
}