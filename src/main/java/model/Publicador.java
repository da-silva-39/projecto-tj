package model;

import java.util.Date;

public class Publicador {
	private int id;
	private String nome;
	private TipoPublicador tipoPublicador;
	private int horasMes;
	private int estudosBiblicos;
	private boolean participou;
	private Date dataRegistro;

	public enum TipoPublicador {
		NORMAL, AUXILIAR, REGULAR, ESPECIAL
	}
  
	// Construtores
	public Publicador() {
	}

	public Publicador(String nome, TipoPublicador tipoPublicador, int horasMes, int estudosBiblicos,
			boolean participou) {
		this.nome = nome;
		this.tipoPublicador = tipoPublicador;
		this.horasMes = horasMes;
		this.estudosBiblicos = estudosBiblicos;
		this.participou = participou;
		this.dataRegistro = new Date();
	}

	// Getters e Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public TipoPublicador getTipoPublicador() {
		return tipoPublicador;
	}

	public void setTipoPublicador(TipoPublicador tipoPublicador) {
		this.tipoPublicador = tipoPublicador;
	}

	public int getHorasMes() {
		return horasMes;
	}

	public void setHorasMes(int horasMes) {
		this.horasMes = horasMes;
	}

	public int getEstudosBiblicos() {
		return estudosBiblicos;
	}

	public void setEstudosBiblicos(int estudosBiblicos) {
		this.estudosBiblicos = estudosBiblicos;
	}

	public boolean isParticipou() {
		return participou;
	}

	public void setParticipou(boolean participou) {
		this.participou = participou;
	}

	public Date getDataRegistro() {
		return dataRegistro;
	}

	public void setDataRegistro(Date dataRegistro) {
		this.dataRegistro = dataRegistro;
	}
}