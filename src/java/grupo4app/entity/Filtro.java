/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author carlo
 */
@Entity
@Table(name = "FILTRO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Filtro.findAll", query = "SELECT f FROM Filtro f")
    , @NamedQuery(name = "Filtro.findByIdfiltro", query = "SELECT f FROM Filtro f WHERE f.idfiltro = :idfiltro")
    , @NamedQuery(name = "Filtro.findByEdadLimInf", query = "SELECT f FROM Filtro f WHERE f.edadLimInf = :edadLimInf")
    , @NamedQuery(name = "Filtro.findByEdadLimSup", query = "SELECT f FROM Filtro f WHERE f.edadLimSup = :edadLimSup")
    , @NamedQuery(name = "Filtro.findBySexo", query = "SELECT f FROM Filtro f WHERE f.sexo = :sexo")
    , @NamedQuery(name = "Filtro.findByCiudad", query = "SELECT f FROM Filtro f WHERE f.ciudad = :ciudad")
    , @NamedQuery(name = "Filtro.findByAnyo", query = "SELECT f FROM Filtro f WHERE f.anyo = :anyo")
    , @NamedQuery(name = "Filtro.findByCosteEntrada", query = "SELECT f FROM Filtro f WHERE f.costeEntrada = :costeEntrada")
    , @NamedQuery(name = "Filtro.findByCategoria", query = "SELECT f FROM Filtro f WHERE f.categoria = :categoria")})
public class Filtro implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDFILTRO")
    private Integer idfiltro;
    @Column(name = "EDAD_LIM_INF")
    private Integer edadLimInf;
    @Column(name = "EDAD_LIM_SUP")
    private Integer edadLimSup;
    @Size(max = 50)
    @Column(name = "SEXO")
    private String sexo;
    @Size(max = 50)
    @Column(name = "CIUDAD")
    private String ciudad;
    @Column(name = "ANYO")
    private Integer anyo;
    @Column(name = "COSTE_ENTRADA")
    private Integer costeEntrada;
    @Size(max = 50)
    @Column(name = "CATEGORIA")
    private String categoria;
    @JoinColumn(name = "USUARIO", referencedColumnName = "IDUSUARIO")
    @ManyToOne
    private Usuario usuario;

    public Filtro() {
    }

    public Filtro(Integer idfiltro) {
        this.idfiltro = idfiltro;
    }

    public Integer getIdfiltro() {
        return idfiltro;
    }

    public void setIdfiltro(Integer idfiltro) {
        this.idfiltro = idfiltro;
    }

    public Integer getEdadLimInf() {
        return edadLimInf;
    }

    public void setEdadLimInf(Integer edadLimInf) {
        this.edadLimInf = edadLimInf;
    }

    public Integer getEdadLimSup() {
        return edadLimSup;
    }

    public void setEdadLimSup(Integer edadLimSup) {
        this.edadLimSup = edadLimSup;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public Integer getAnyo() {
        return anyo;
    }

    public void setAnyo(Integer anyo) {
        this.anyo = anyo;
    }

    public Integer getCosteEntrada() {
        return costeEntrada;
    }

    public void setCosteEntrada(Integer costeEntrada) {
        this.costeEntrada = costeEntrada;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idfiltro != null ? idfiltro.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Filtro)) {
            return false;
        }
        Filtro other = (Filtro) object;
        if ((this.idfiltro == null && other.idfiltro != null) || (this.idfiltro != null && !this.idfiltro.equals(other.idfiltro))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "grupo4app.entity.Filtro[ idfiltro=" + idfiltro + " ]";
    }
    
}
