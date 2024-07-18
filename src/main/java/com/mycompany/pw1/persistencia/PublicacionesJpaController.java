/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.pw1.persistencia;

import com.mycompany.pw1.models.Publicaciones;
import com.mycompany.pw1.persistencia.exceptions.NonexistentEntityException;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 *
 * @author sadam
 */
public class PublicacionesJpaController implements Serializable {

    public PublicacionesJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Publicaciones publicaciones) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(publicaciones);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }
    
    public List<Publicaciones> findPublicacionesActivasPaginadas(int offset, int limit) {
    EntityManager em = getEntityManager();
    try {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Publicaciones> cq = builder.createQuery(Publicaciones.class);
        Root<Publicaciones> root = cq.from(Publicaciones.class);
        cq.select(root)
            .where(builder.equal(root.get("estatus"), true)) // Filtrar por estatus activo
            .orderBy(builder.desc(root.get("fechaCreacion"))); // Ordenar por fecha de creación descendente
        
        TypedQuery<Publicaciones> query = em.createQuery(cq);
        query.setFirstResult(offset);
        query.setMaxResults(limit);
        
        return query.getResultList();
    } finally {
        em.close();
    }
}
 
    
    public List<Publicaciones> findPublicacionesAvanzadas(String palabraBuscar, String categoria, Date fechaInicial, Date fechaFinal) {
    EntityManager em = getEntityManager();
    try {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Publicaciones> cq = cb.createQuery(Publicaciones.class);
        Root<Publicaciones> root = cq.from(Publicaciones.class);
        
        Predicate predicate = cb.conjunction();
        
        if (palabraBuscar != null && !palabraBuscar.isEmpty()) {
            Predicate keywordPredicate = cb.or(
                cb.like(root.get("titulo"), "%" + palabraBuscar + "%"),
                cb.like(root.get("descripcion"), "%" + palabraBuscar + "%")
            );
            predicate = cb.and(predicate, keywordPredicate);
        }
        
        if (categoria != null && !categoria.isEmpty()) {
            predicate = cb.and(predicate, cb.equal(root.get("categoria"), categoria));
        }
        
        if (fechaInicial != null && fechaFinal != null) {
            predicate = cb.and(predicate, cb.between(root.get("fechaCreacion"), fechaInicial, fechaFinal));
        }
        
        cq.where(predicate);
        
        TypedQuery<Publicaciones> query = em.createQuery(cq);
        return query.getResultList();
    } finally {
        em.close();
    }
}



    
    public void editEstatus(int id, boolean estatus) throws NonexistentEntityException {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            Publicaciones publicacion = em.find(Publicaciones.class, id);
            if (publicacion == null) {
                throw new NonexistentEntityException("The publication with id " + id + " no longer exists.");
            }
            publicacion.setEstatus(estatus);
            em.merge(publicacion);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }
    
public List<Publicaciones> findPublicacionesActivas() {
    EntityManager em = getEntityManager();
    try {
        CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Publicaciones> cq = builder.createQuery(Publicaciones.class);
        Root<Publicaciones> root = cq.from(Publicaciones.class);
        cq.select(root).where(builder.equal(root.get("estatus"), true)); // Filtrar por estatus activo
        TypedQuery<Publicaciones> query = em.createQuery(cq);
        return query.getResultList();
    } finally {
        em.close();
    }
}

    
    
    public void edit(Publicaciones publicaciones) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            publicaciones = em.merge(publicaciones);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = publicaciones.getIdPublicacion();
                if (findPublicaciones(id) == null) {
                    throw new NonexistentEntityException("The publicaciones with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public Publicaciones findPublicacion(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Publicaciones.class, id);
        } finally {
            em.close();
        }
    }
    
    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Publicaciones publicaciones;
            try {
                publicaciones = em.getReference(Publicaciones.class, id);
                publicaciones.getIdPublicacion();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The publicaciones with id " + id + " no longer exists.", enfe);
            }
            em.remove(publicaciones);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Publicaciones> findPublicacionesEntities() {
        return findPublicacionesEntities(true, -1, -1);
    }

    public List<Publicaciones> findPublicacionesEntities(int maxResults, int firstResult) {
        return findPublicacionesEntities(false, maxResults, firstResult);
    }

    private List<Publicaciones> findPublicacionesEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Publicaciones.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Publicaciones findPublicaciones(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Publicaciones.class, id);
        } finally {
            em.close();
        }
    }
    
    public List<Publicaciones> findPublicaciones(String texto) {
        EntityManager em = getEntityManager();
        try {
            CriteriaBuilder builder = em.getCriteriaBuilder();
            
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            
            Root <Publicaciones> root = cq.from(Publicaciones.class); 
            
            cq.select(root);
            
            Predicate predicateLikeTitulo
              = builder.like(root.get("titulo"),"%"+texto+"%");
            Predicate predicateLikeDescripcion
              = builder.like(root.get("descripcion"),"%"+texto+"%");
            Predicate predicateOr
              = builder.or(predicateLikeTitulo,predicateLikeDescripcion);
            Predicate predicateEstatus
              = builder.equal(root.get("estatus"),true);
            Predicate predicateFinal
              = builder.and(predicateOr,predicateEstatus);
            
            cq.where(predicateFinal);
            Query q = em.createQuery(cq);
            
            return q.getResultList();
        } finally {
            em.close();
        }

  
}
     

        
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    public int getPublicacionesCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Publicaciones> rt = cq.from(Publicaciones.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
