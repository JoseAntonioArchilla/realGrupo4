/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.dao;

import grupo4app.entity.Chat;
import grupo4app.entity.Usuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author carlo
 */
@Stateless
public class ChatFacade extends AbstractFacade<Chat> {

    @PersistenceContext(unitName = "Grupo4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ChatFacade() {
        super(Chat.class);
    }
    
    public List<Chat> findByUsuario(Usuario u){
        List<Chat> chatsUsr;
        Query q = em.createQuery("SELECT c FROM Chat c WHERE c.usuario2.idusuario = :us");
        q.setParameter("us", u.getIdusuario());
        chatsUsr = q.getResultList();
        
        return chatsUsr;
    }
    
    public List<Chat> findByTeleoperador(Usuario u){
        List<Chat> chatsUsr;
        Query q = em.createQuery("SELECT c FROM Chat c WHERE c.usuario1.idusuario = :us");
        q.setParameter("us", u.getIdusuario());
        chatsUsr = q.getResultList();
        
        return chatsUsr;
    }
    
    public List<Chat> findByTeleoperadorNot(Usuario u){
        List<Chat> chatsUsr;
        Query q = em.createQuery("SELECT c FROM Chat c WHERE c.usuario1.idusuario != :us");
        q.setParameter("us", u.getIdusuario());
        chatsUsr = q.getResultList();
        
        return chatsUsr;
    }
    
    public List<Chat> filtrarMisChatsTeleoperador(String cadena, Usuario usuario){
        List<Chat> chatsUsr;
        Query q = em.createQuery("SELECT c FROM Chat c WHERE c.usuario1.idusuario = :us and (upper(c.usuario1.nickname) LIKE :name OR upper(c.usuario2.nickname) LIKE :name)");
        q.setParameter("name", "%" + cadena.toUpperCase() + "%");
        q.setParameter("us", usuario.getIdusuario());
        chatsUsr = q.getResultList();
        
        return chatsUsr;
    }
    
    public List<Chat> filtrarOtrosChatsTeleoperador(String cadena, Usuario usuario){
        List<Chat> chatsUsr;
        Query q = em.createQuery("SELECT c FROM Chat c WHERE c.usuario1.idusuario != :us and (upper(c.usuario1.nickname) LIKE :name OR upper(c.usuario2.nickname) LIKE :name)");
        q.setParameter("name", "%" + cadena.toUpperCase() + "%");
        q.setParameter("us", usuario.getIdusuario());
        chatsUsr = q.getResultList();
        
        return chatsUsr;
    }
    
    public List<Chat> filtrarUsuario(String cadena, Usuario us){
        List<Chat> chatsUsr;
        Query q = em.createQuery("SELECT c FROM Chat c WHERE c.usuario2.idusuario = :us AND (upper(c.usuario1.nickname) LIKE :name OR upper(c.usuario2.nickname) LIKE :name)");
        q.setParameter("us", us.getIdusuario());
        q.setParameter("name", "%" + cadena.toUpperCase() + "%");
        chatsUsr = q.getResultList();
        
        return chatsUsr;
    }
    
    public Chat findByTeleoperadorAndUsuario(Usuario tele, Usuario usr){
        List<Chat> chatsUsr;
        Query q = em.createQuery("SELECT c FROM Chat c WHERE c.usuario1.idusuario = :teleid and  c.usuario2.idusuario = :usrid");
        q.setParameter("teleid", tele.getIdusuario());
        q.setParameter("usrid", usr.getIdusuario());
        chatsUsr = q.getResultList();
        
        if(chatsUsr.isEmpty()){
            return null;
        }
        
        return chatsUsr.get(0);
    }
    
}
