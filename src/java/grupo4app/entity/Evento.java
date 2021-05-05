/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grupo4app.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author josea
 */
@Entity
@Table(name = "EVENTO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Evento.findAll", query = "SELECT e FROM Evento e")
    , @NamedQuery(name = "Evento.findByIdevento", query = "SELECT e FROM Evento e WHERE e.idevento = :idevento")
    , @NamedQuery(name = "Evento.findByTitulo", query = "SELECT e FROM Evento e WHERE e.titulo = :titulo")
    , @NamedQuery(name = "Evento.findByDescripcion", query = "SELECT e FROM Evento e WHERE e.descripcion = :descripcion")
    , @NamedQuery(name = "Evento.findByFecha", query = "SELECT e FROM Evento e WHERE e.fecha = :fecha")
    , @NamedQuery(name = "Evento.findByFechaReserva", query = "SELECT e FROM Evento e WHERE e.fechaReserva = :fechaReserva")
    , @NamedQuery(name = "Evento.findByCosteEntrada", query = "SELECT e FROM Evento e WHERE e.costeEntrada = :costeEntrada")
    , @NamedQuery(name = "Evento.findByAforo", query = "SELECT e FROM Evento e WHERE e.aforo = :aforo")
    , @NamedQuery(name = "Evento.findByMaxNumEntradas", query = "SELECT e FROM Evento e WHERE e.maxNumEntradas = :maxNumEntradas")
    , @NamedQuery(name = "Evento.findByMusica", query = "SELECT e FROM Evento e WHERE e.musica = :musica")
    , @NamedQuery(name = "Evento.findByAireLibre", query = "SELECT e FROM Evento e WHERE e.aireLibre = :aireLibre")
    , @NamedQuery(name = "Evento.findByDeporte", query = "SELECT e FROM Evento e WHERE e.deporte = :deporte")
    , @NamedQuery(name = "Evento.findByTeatro", query = "SELECT e FROM Evento e WHERE e.teatro = :teatro")
    , @NamedQuery(name = "Evento.findByGaming", query = "SELECT e FROM Evento e WHERE e.gaming = :gaming")})
public class Evento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDEVENTO")
    private Integer idevento;
    @Basic(optional = false)
   // @NotNull
    //@Size(min = 1, max = 50)
    @Column(name = "TITULO", length = 50, nullable = false)
    private String titulo;
    @Basic(optional = false)
    //@NotNull
    //@Size(min = 1, max = 200,)
    @Column(name = "DESCRIPCION", length = 50, nullable = false)
    private String descripcion;
    @Basic(optional = false)
    //@NotNull
    @Column(name = "FECHA", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Basic(optional = false)
    //@NotNull
    @Column(name = "FECHA_RESERVA", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechaReserva;
    @Basic(optional = false)
    //@NotNull
    @Column(name = "COSTE_ENTRADA", nullable = false)
    private int costeEntrada;
    @Basic(optional = false)
    //@NotNull
    @Column(name = "AFORO", nullable = false)
    private int aforo;
    @Basic(optional = false)
   // @NotNull
    @Column(name = "MAX_NUM_ENTRADAS", nullable = false)
    private int maxNumEntradas;
    @Column(name = "MUSICA")
    private Integer musica;
    @Column(name = "AIRE_LIBRE")
    private Integer aireLibre;
    @Column(name = "DEPORTE")
    private Integer deporte;
    @Column(name = "TEATRO")
    private Integer teatro;
    @Column(name = "GAMING")
    private Integer gaming;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "evento")
    private List<EventoUsuario> eventoUsuarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "evento1")
    private List<Asientos> asientosList;
    @JoinColumn(name = "CREADOREVENTO", referencedColumnName = "IDUSUARIO")
    @ManyToOne(optional = false)
    private Usuario creadorevento;

    public Evento() {
    }

    public Evento(Integer idevento) {
        this.idevento = idevento;
    }

    public Evento(Integer idevento, String titulo, String descripcion, Date fecha, Date fechaReserva, int costeEntrada, int aforo, int maxNumEntradas) {
        this.idevento = idevento;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.fechaReserva = fechaReserva;
        this.costeEntrada = costeEntrada;
        this.aforo = aforo;
        this.maxNumEntradas = maxNumEntradas;
    }

    public Integer getIdevento() {
        return idevento;
    }

    public void setIdevento(Integer idevento) {
        this.idevento = idevento;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getFechaReserva() {
        return fechaReserva;
    }

    public void setFechaReserva(Date fechaReserva) {
        this.fechaReserva = fechaReserva;
    }

    public int getCosteEntrada() {
        return costeEntrada;
    }

    public void setCosteEntrada(int costeEntrada) {
        this.costeEntrada = costeEntrada;
    }

    public int getAforo() {
        return aforo;
    }

    public void setAforo(int aforo) {
        this.aforo = aforo;
    }

    public int getMaxNumEntradas() {
        return maxNumEntradas;
    }

    public void setMaxNumEntradas(int maxNumEntradas) {
        this.maxNumEntradas = maxNumEntradas;
    }

    public Integer getMusica() {
        return musica;
    }

    public void setMusica(Integer musica) {
        this.musica = musica;
    }

    public Integer getAireLibre() {
        return aireLibre;
    }

    public void setAireLibre(Integer aireLibre) {
        this.aireLibre = aireLibre;
    }

    public Integer getDeporte() {
        return deporte;
    }

    public void setDeporte(Integer deporte) {
        this.deporte = deporte;
    }

    public Integer getTeatro() {
        return teatro;
    }

    public void setTeatro(Integer teatro) {
        this.teatro = teatro;
    }

    public Integer getGaming() {
        return gaming;
    }

    public void setGaming(Integer gaming) {
        this.gaming = gaming;
    }

    @XmlTransient
    public List<EventoUsuario> getEventoUsuarioList() {
        return eventoUsuarioList;
    }

    public void setEventoUsuarioList(List<EventoUsuario> eventoUsuarioList) {
        this.eventoUsuarioList = eventoUsuarioList;
    }

    @XmlTransient
    public List<Asientos> getAsientosList() {
        return asientosList;
    }

    public void setAsientosList(List<Asientos> asientosList) {
        this.asientosList = asientosList;
    }

    public Usuario getCreadorevento() {
        return creadorevento;
    }

    public void setCreadorevento(Usuario creadorevento) {
        this.creadorevento = creadorevento;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idevento != null ? idevento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Evento)) {
            return false;
        }
        Evento other = (Evento) object;
        if ((this.idevento == null && other.idevento != null) || (this.idevento != null && !this.idevento.equals(other.idevento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "grupo4app.entity.Evento[ idevento=" + idevento + " ]";
    }
    
}
