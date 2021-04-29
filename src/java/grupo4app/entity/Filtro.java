/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author josea
 */
@Entity
@Table(name = "FILTRO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Filtro.findAll", query = "SELECT f FROM Filtro f")
    , @NamedQuery(name = "Filtro.findByIdfiltro", query = "SELECT f FROM Filtro f WHERE f.filtroPK.idfiltro = :idfiltro")
    , @NamedQuery(name = "Filtro.findByAnalistaeventos", query = "SELECT f FROM Filtro f WHERE f.filtroPK.analistaeventos = :analistaeventos")
    , @NamedQuery(name = "Filtro.findByEdadLimInf", query = "SELECT f FROM Filtro f WHERE f.edadLimInf = :edadLimInf")
    , @NamedQuery(name = "Filtro.findByEdadLimSup", query = "SELECT f FROM Filtro f WHERE f.edadLimSup = :edadLimSup")
    , @NamedQuery(name = "Filtro.findBySexo", query = "SELECT f FROM Filtro f WHERE f.sexo = :sexo")
    , @NamedQuery(name = "Filtro.findByCiudad", query = "SELECT f FROM Filtro f WHERE f.ciudad = :ciudad")
    , @NamedQuery(name = "Filtro.findByAnyo", query = "SELECT f FROM Filtro f WHERE f.anyo = :anyo")
    , @NamedQuery(name = "Filtro.findByCosteEntrada", query = "SELECT f FROM Filtro f WHERE f.costeEntrada = :costeEntrada")
    , @NamedQuery(name = "Filtro.findByCategoria", query = "SELECT f FROM Filtro f WHERE f.categoria = :categoria")})
public class Filtro implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected FiltroPK filtroPK;
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
    @JoinColumn(name = "ANALISTAEVENTOS", referencedColumnName = "IDUSUARIO", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Usuario usuario;
    @JoinColumn(name = "USUARIO", referencedColumnName = "IDUSUARIO")
    @ManyToOne
    private Usuario usuario1;

    public Filtro() {
    }

    public Filtro(FiltroPK filtroPK) {
        this.filtroPK = filtroPK;
    }

    public Filtro(int idfiltro, int analistaeventos) {
        this.filtroPK = new FiltroPK(idfiltro, analistaeventos);
    }

    public FiltroPK getFiltroPK() {
        return filtroPK;
    }

    public void setFiltroPK(FiltroPK filtroPK) {
        this.filtroPK = filtroPK;
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

    public Usuario getUsuario1() {
        return usuario1;
    }

    public void setUsuario1(Usuario usuario1) {
        this.usuario1 = usuario1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (filtroPK != null ? filtroPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Filtro)) {
            return false;
        }
        Filtro other = (Filtro) object;
        if ((this.filtroPK == null && other.filtroPK != null) || (this.filtroPK != null && !this.filtroPK.equals(other.filtroPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "grupo4app.entity.Filtro[ filtroPK=" + filtroPK + " ]";
    }
    
}
