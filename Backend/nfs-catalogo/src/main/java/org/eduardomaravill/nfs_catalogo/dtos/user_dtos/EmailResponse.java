package org.eduardomaravill.nfs_catalogo.dtos.user_dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmailResponse {
    private String name;
    private List<String> to;
    private String from;
    private String subject;
    private String body;
    private List<String> cc;
    private List<String> bcc;
}