package com.mycompany.pw1.models;

import com.mycompany.pw1.models.Usuarios;
import java.util.Date;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2024-07-18T01:32:33", comments="EclipseLink-2.7.12.v20230209-rNA")
@StaticMetamodel(Publicaciones.class)
public class Publicaciones_ { 

    public static volatile SingularAttribute<Publicaciones, String> descripcion;
    public static volatile SingularAttribute<Publicaciones, Boolean> estatus;
    public static volatile SingularAttribute<Publicaciones, String> categoria;
    public static volatile SingularAttribute<Publicaciones, String> titulo;
    public static volatile SingularAttribute<Publicaciones, Date> fechaCreacion;
    public static volatile SingularAttribute<Publicaciones, Usuarios> usuario;
    public static volatile SingularAttribute<Publicaciones, Date> fechaMovimiento;
    public static volatile SingularAttribute<Publicaciones, Integer> idPublicacion;

}