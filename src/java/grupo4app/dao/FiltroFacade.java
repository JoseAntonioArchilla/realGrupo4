/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.dao;

import grupo4app.entity.Filtro;
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
public class FiltroFacade extends AbstractFacade<Filtro> {

    @PersistenceContext(unitName = "Grupo4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FiltroFacade() {
        super(Filtro.class);
    }
    
     public List<Filtro> filtrosCreador(int idCreador){
        Query q;
        q = this.em.createNamedQuery("Filtro.findByAnalistaeventos");
        q.setParameter("analistaeventos", idCreador);
        
        List<Filtro> filtros = q.getResultList();
        
        return filtros;
    } 
    
}
