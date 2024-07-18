package com.mycompany.pw1.models;

import java.util.Date;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2024-07-18T01:32:33", comments="EclipseLink-2.7.12.v20230209-rNA")
@StaticMetamodel(Usuarios.class)
public class Usuarios_ { 

    public static volatile SingularAttribute<Usuarios, String> apellidos;
    public static volatile SingularAttribute<Usuarios, String> urlImgPerfil;
    public static volatile SingularAttribute<Usuarios, Boolean> estatus;
    public static volatile SingularAttribute<Usuarios, String> pass;
    public static volatile SingularAttribute<Usuarios, Date> fechaNacimiento;
    public static volatile SingularAttribute<Usuarios, Integer> idUsuario;
    public static volatile SingularAttribute<Usuarios, String> correo;
    public static volatile SingularAttribute<Usuarios, Date> fechaCreacion;
    public static volatile SingularAttribute<Usuarios, String> nombreUsuario;
    public static volatile SingularAttribute<Usuarios, Date> fechaMovimiento;
    public static volatile SingularAttribute<Usuarios, String> nombres;

}