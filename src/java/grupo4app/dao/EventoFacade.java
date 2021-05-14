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
    
    public List<Evento> filtrarEventos(int minimo, int maximo, boolean disponible, String nombre, String musica, String aire_libre, String deporte, String teatro, String gaming, String lectura, String formacion, String conferencia, String benefico, String arte, String turismo){
        Date fecha;
        String s = "select e from Evento e where e.costeEntrada>= :min and e.costeEntrada<= :max and e.titulo like '%" +nombre +"%' ";
        Query q;
        
        if(musica != null || aire_libre!=null || deporte!=null || teatro!=null || gaming!=null || lectura!=null
                || formacion!=null || conferencia!=null || benefico!=null || arte!=null || turismo!=null)
        {
            s += " and e.musica = " + musica!=null ? "1 " : "0 ";
            s += " and e.aire_libre = " + aire_libre!=null ? "1 " : "0 ";
            s += " and e.deporte = " + deporte!=null ? "1 " : "0 ";
            s += " and e.teatro = " + teatro!=null ? "1 " : "0 ";
            s += " and e.gaming = " + gaming!=null ? "1 " : "0 ";
            s += " and e.lectura = " + lectura!=null ? "1 " : "0 ";
            s += " and e.formacion = " + formacion!=null ? "1 " : "0 ";
            s += " and e.conferencia = " + conferencia!=null ? "1 " : "0 ";           
            s += " and e.benefico = " + benefico!=null ? "1 " : "0 ";           
            s += " and e.arte = " + arte!=null ? "1 " : "0 ";           
            s += " and e.turismo = " + turismo!=null ? "1 " : "0 ";                    
        }
                
        if(disponible){
            fecha = new Date();
            q = em.createQuery(s + " and e.fechaReserva >= :fecha ");            
            q.setParameter("fecha", fecha);
        }
        else{
            q = em.createQuery(s);
        }
        q.setParameter("min", minimo);
        q.setParameter("max", maximo);
        return q.getResultList();  
    }

    
}
