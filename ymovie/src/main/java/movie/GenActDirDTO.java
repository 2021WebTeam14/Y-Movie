package movie;

import java.util.ArrayList;

public class GenActDirDTO {
    private ArrayList<String> genre;
    private ArrayList<String> actor;
    private ArrayList<String> director;

	public GenActDirDTO() {
    }

	public GenActDirDTO(ArrayList<String> genre, ArrayList<String> actor, ArrayList<String> director) {
		super();
		this.genre = genre;
		this.actor = actor;
		this.director = director;
	}

	public ArrayList<String> getGenre() {
		return genre;
	}

	public ArrayList<String> getActor() {
		return actor;
	}

	public ArrayList<String> getDirector() {
		return director;
	}
}