/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.dao;

import grupo4app.entity.Usuario;
import java.util.List;
import java.util.Random;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author carlo
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> {

    @PersistenceContext(unitName = "Grupo4PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }
    
    public Usuario findRandomTeleoperador(Usuario user){
        List<Usuario> teleop;
        Query q = em.createQuery("SELECT u FROM Usuario u WHERE u.rol = 2 AND u.idusuario NOT IN (SELECT c.usuario1.idusuario FROM Chat c WHERE c.usuario2.idusuario = :us)");
        q.setParameter("us", user.getIdusuario());
        teleop = q.getResultList();
        
        if(teleop.isEmpty()){
            return null;
        } else {
            Random rnd = new Random();
            int ind = rnd.nextInt(teleop.size());
        
            return teleop.get(ind);
}
       
    }
    
    public Usuario findByNicknameAndPassword(String nickname, String password){
        Usuario usr;
        Query q = em.createQuery("SELECT u FROM Usuario u WHERE u.nickname LIKE :username AND u.password LIKE :pass");
        q.setParameter("username", nickname);
        q.setParameter("pass", password);
        List<Usuario> resultados = q.getResultList();
        
        if(resultados.isEmpty()){
            return null;
        }
        
        usr = resultados.get(0);
        
        return usr;
    }
    
    public List<Usuario> findAllTeleoperadores(){
        Query q = em.createQuery("SELECT u FROM Usuario u WHERE u.rol = 2");
        List<Usuario> resultados = q.getResultList();
        
        return resultados;
    }
    
    public List<Usuario> findAllCreadoresUsuariosEventos(){
        Query q = em.createQuery("SELECT u FROM Usuario u WHERE u.rol = 0 or u.rol = 4");
        List<Usuario> resultados = q.getResultList();
        
        return resultados;
    }
    
}
