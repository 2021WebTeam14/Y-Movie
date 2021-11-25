package director;

public class directorDTO {
	private String mov_code;
	private String dir_director;
	public directorDTO(String mov_code, String dir_director) {
		super();
		this.mov_code = mov_code;
		this.dir_director = dir_director;
	}
	public String getMov_code() {
		return mov_code;
	}
	public String getDir_director() {
		return dir_director;
	}
	
}