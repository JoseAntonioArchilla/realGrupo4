/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.dao;

import grupo4app.entity.Evento;
import grupo4app.entity.EventoUsuario;
import grupo4app.entity.UsuarioEvento;
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
public class EventoUsuarioFacade extends AbstractFacade<EventoUsuario> {

    @PersistenceContext(unitName = "Grupo4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EventoUsuarioFacade() {
        super(EventoUsuario.class);
    }
    
    public List<EventoUsuario> findByEvento(Evento e)
    {
        Query q = em.createQuery("select e from EventoUsuario e where e.evento = :evento").setParameter("evento", e);
        
        return q.getResultList();
    }
    
    public EventoUsuario findById(int id)
    {
        Query q = em.createQuery("select e from EventoUsuario e where e.eventoUsuarioPK.ideventousuario = :id").setParameter("id", id);
        return (EventoUsuario)q.getResultList().get(0);
    }
    
    public List<EventoUsuario> findByUsuario(UsuarioEvento u)
    {
        Query q = em.createQuery("select e from EventoUsuario e where e.usuarioEvento = :usuario").setParameter("usuario", u);
        
        return q.getResultList();
    }
}
