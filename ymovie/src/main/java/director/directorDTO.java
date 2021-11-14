package director;

public class directorDTO {
	private String mov_name;
	private String dir_director;
	public directorDTO(String mov_name, String dir_director) {
		super();
		this.mov_name = mov_name;
		this.dir_director = dir_director;
	}
	public String getMov_name() {
		return mov_name;
	}
	public String getDir_director() {
		return dir_director;
	}
	
}