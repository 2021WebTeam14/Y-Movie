package api_DB;

import java.util.ArrayList;

import director.directorDTO;
import movie.movieDTO;

public class Pair {
    private ArrayList<movieDTO> movie;
    private ArrayList<ArrayList<directorDTO>> director;

    public Pair() {
    }

	public Pair(ArrayList<movieDTO> movie, ArrayList<ArrayList<directorDTO>> director) {
		super();
		this.movie = movie;
		this.director = director;
	}

	public ArrayList<movieDTO> getMovie() {
		return movie;
	}
	public ArrayList<ArrayList<directorDTO>> getDirector() {
		return director;
	}
    
}