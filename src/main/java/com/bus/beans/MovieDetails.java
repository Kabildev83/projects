package com.bus.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "movies_details")
public class MovieDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="movie_id")
	private long movieId;
	
	@Column(nullable = false)
	private String movieName;
	
	@Column(nullable = false)
	private String image;
	
	
	@Column(columnDefinition = "varchar(1000) ", nullable = false)
	private String movieDetails;
	
	@Column(name="screen")
	private String screen;

	public String getScreen() {
		return screen;
	}

	public void setScreen(String screen) {
		this.screen = screen;
	}

	public long getMovieId() {
		return movieId;
	}

	public void setMovieId(long movieId) {
		this.movieId = movieId;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getMovieDetails() {
		return movieDetails;
	}

	public void setMovieDescription(String movieDetails) {
		this.movieDetails = movieDetails;
	}
	
	public MovieDetails(String movieName, String image, String movieDescription, String screen) {
		super();
		this.movieName = movieName;
		this.image = image;
		this.movieDetails = movieDetails;
		this.screen=screen;
	}

	public MovieDetails(long movieId, String movieName, String image, String movieDescription, String screen) {
		super();
		this.movieId = movieId;
		this.movieName = movieName;
		this.image = image;
		this.movieDetails = movieDetails;
		this.screen=screen;
	}

	public MovieDetails() {
		super();
	}

	@Override
	public String toString() {
		return "MovieDetails [movieId=" + movieId + ", movieName=" + movieName + ", image=" + image + ", movieDetails="
				+ movieDetails + "screen = "+screen +"]";
	}
	
	
	


}

