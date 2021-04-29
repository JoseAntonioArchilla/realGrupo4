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
 * @author josea
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
    
}
