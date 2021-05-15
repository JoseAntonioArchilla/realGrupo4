/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.dao;

import grupo4app.entity.EventoUsuario;
import grupo4app.entity.Filtro;
import grupo4app.entity.Usuario;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
    
    public List<EventoUsuario> filtrosEventoUsuario(Filtro filtro) throws ParseException{
        
        int edadInf = filtro.getEdadLimInf(); //Usuario
        int edadSup = filtro.getEdadLimSup(); //Usuario
        String sexo = filtro.getSexo(); //Usuario
        String ciudad = filtro.getCiudad(); //Usuario  
        int idUsuario = 0;
        Usuario usuario = null;
        try{
            usuario = filtro.getUsuario1(); //Usuario
            idUsuario = usuario.getIdusuario();
        }catch (Exception e){
        
        }
        
        //////////////////////////////////////////////
        int anyo = filtro.getAnyo(); //Evento
        String anyoSup = "31/12/" + anyo;
        String anyoInf = "01/01/" + (anyo);
        
        Date inf = new SimpleDateFormat("dd/MM/yyyy").parse(anyoInf);
        Date sup = new SimpleDateFormat("dd/MM/yyyy").parse(anyoInf);
        
        int costeEntrada = filtro.getCosteEntrada(); //Evento
        String categoria = filtro.getCategoria(); //Evento
        
        String sentencia = "select eu from EventoUsuario eu where eu.usuarioEvento.edad >= :min";
        boolean filtrar = false;
        Query q;
        
        if(edadSup > 0 || !sexo.isEmpty() || !ciudad.isEmpty() || usuario != null || anyo > 0 || costeEntrada > 0 || !categoria.isEmpty()){
            
            filtrar = true;
            sentencia += (" and eu.usuarioEvento.edad <= " + (edadSup));
            sentencia += (" and eu.usuarioEvento.sexo like ('%"+ (sexo) +"%')");
            sentencia += (" and upper(eu.usuarioEvento.ciudad) like upper('" + ciudad + "')");
            sentencia += (" and eu.eventoUsuarioPK.usuario = '" + idUsuario + "'");
            /////////
            //sentencia += (" and eu.eventoUsuarioPK.idevento.fecha between :inf and :sup");
            //sentencia += (" and eu.eventoUsuarioPK.idevento.costeEntrada = " + costeEntrada);
            //sentencia += (" and eu.eventoUsuarioPK.idevento.categoria like '" + categoria + "'");                      
        }
             
        q = em.createQuery(sentencia);
        q.setParameter("min", edadInf); 
        /*if(filtrar){
           q.setParameter("inf", inf);
        q.setParameter("sup", sup); 
        } */
        
        
        return q.getResultList();       
    }
    
}
