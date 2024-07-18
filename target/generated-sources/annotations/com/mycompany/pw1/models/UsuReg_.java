package com.mycompany.pw1.models;

import java.util.Date;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2024-05-23T23:11:00", comments="EclipseLink-2.7.12.v20230209-rNA")
@StaticMetamodel(UsuReg.class)
public class UsuReg_ { 

    public static volatile SingularAttribute<UsuReg, String> apellidos;
    public static volatile SingularAttribute<UsuReg, String> urlImgPerfil;
    public static volatile SingularAttribute<UsuReg, Boolean> estatus;
    public static volatile SingularAttribute<UsuReg, String> pass;
    public static volatile SingularAttribute<UsuReg, Date> fechaNacimiento;
    public static volatile SingularAttribute<UsuReg, Integer> idUsuario;
    public static volatile SingularAttribute<UsuReg, Date> fechaCreacion;
    public static volatile SingularAttribute<UsuReg, String> nombreUsuario;
    public static volatile SingularAttribute<UsuReg, Date> fechaMovimiento;
    public static volatile SingularAttribute<UsuReg, String> nombres;

}