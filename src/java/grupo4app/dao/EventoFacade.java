/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.dao;

import grupo4app.entity.Evento;
import grupo4app.entity.Usuario;
import java.util.Date;
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
    
    public List<Evento> filtrarEventos(int minimo, int maximo, boolean disponible, 
            String nombre, String musica, String aire_libre, String deporte, String teatro, 
            String gaming, String lectura, String formacion, String conferencia, String benefico, 
            String arte, String turismo, Usuario creador){
        Date fecha;
        String s = "select e from Evento e where e.costeEntrada>= :min and e.costeEntrada<= :max and e.titulo like '%" +nombre +"%' ";
        Query q;
        
        if (creador != null)
        {
            s += " and e.creadorevento = :creador";
        }
        
        if(musica != null || aire_libre!=null || deporte!=null || teatro!=null || gaming!=null || lectura!=null
                || formacion!=null || conferencia!=null || benefico!=null || arte!=null || turismo!=null)
        {
            s+=" and (2 = 2 ";
            if(musica != null){
                s += (" and e.musica = 1" );
            }
            if(aire_libre!=null){
                s += (" and e.aireLibre = 1" );
                 
            }
            if(deporte!=null){
                s += (" and e.deporte = 1" );
            }
            if(teatro!=null){
                s += (" and e.teatro = 1" );
            }
            if(gaming!=null){
                s += (" and e.gaming = 1" );
            }
            if(lectura!=null){
                s += (" and e.lectura = 1" );
            }
            if(formacion!=null){
                s += (" and e.formacion = 1" );
            }
            if(conferencia!=null){
                s += (" and e.conferencia = 1" );
            }
            if(benefico!=null){
                s += (" and e.benefico = 1" );
            }
            if(arte!=null){
                s += (" and e.arte = 1" );
            }
            if(turismo!=null){
                s += (" and e.turismo = 1" );
            }          
            s += ")";
        }
                
        if(disponible){
            fecha = new Date();
            q = em.createQuery(s + " and e.fechaReserva >= :fecha ");            
            q.setParameter("fecha", fecha);
        }
        else{
            q = em.createQuery(s);
        }
        if (creador != null) q.setParameter("creador", creador);
        q.setParameter("min", minimo);
        q.setParameter("max", maximo);
        return q.getResultList();  
    }

    
}
