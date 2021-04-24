/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.dao;

import grupo4app.entity.Chat;
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
    
    public List<Chat> findByUsuario(int id){
        List<Chat> chatsUsr;
        Query q = em.createQuery("SELECT c FROM CHAT WHERE c.USUARIO2 = :idU");
        q.setParameter("idU", id);
        chatsUsr = q.getResultList();
        
        return chatsUsr;
    }
}
