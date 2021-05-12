/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.dao;

import grupo4app.entity.Evento;
import java.util.Date;
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
public class EventoFacade extends AbstractFacade<Evento> {

    @PersistenceContext(unitName = "Grupo4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EventoFacade() {
        super(Evento.class);
    }
    
    public List<Evento> filtrarEventos(int min, int max, boolean dis, String nombre){
        Date fecha;
        String s = "select e from Evento e where e.costeEntrada>= :min and e.costeEntrada<= :max and e.titulo like :nombre ";
        Query q;
        if(dis){
            fecha = new Date();
            q = em.createQuery(s + " and e.fechaReserva >= :fecha ");            
            q.setParameter("fecha", fecha);
        }
        else{
            q = em.createQuery(s);
        }
        q.setParameter("min", min);
        q.setParameter("max", max);
        q.setParameter("nombre", "'%" + nombre +"%'");
        return q.getResultList();
        
    }
}
